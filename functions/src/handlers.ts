import admin = require("firebase-admin");
import { Collections, Intervals, Paths } from "./constants";
import { HostResult, JsonObject, LocationResult, PingStats, Session, ValueResults } from "./types";

export async function updateDailyCount(session: Session) {
  const dailyCountsDoc = admin
    .firestore()
    .collection(Collections.countsDaily)
    .doc(Paths.all);
  const dailyCounts =
    ((await dailyCountsDoc.get()).data() as JsonObject<JsonObject<number>>) ??
    {};
  const todayKey = _getTodayDateKey();
  const todayCounts = dailyCounts[todayKey] ?? {};
  todayCounts[session.host] = (todayCounts[session.host] ?? 0) + 1;
  dailyCounts[todayKey] = todayCounts;
  await dailyCountsDoc.set(dailyCounts);
}

export async function updateDailyResult(session: Session) {
  const dailyResultsDoc = admin
    .firestore()
    .collection(Collections.resultsDaily)
    .doc(session.host);
  const dailyResults =
    ((await dailyResultsDoc.get()).data() as JsonObject<HostResult>) ?? {};
  const todayKey = _getTodayDateKey();
  const todayResults = dailyResults[todayKey] ?? {
    count: 0,
    values: { min: {}, mean: {}, max: {} },
    locations: {},
  };
  _addSessionToTodayResults(session, todayResults);
  dailyResults[todayKey] = todayResults;
  await dailyResultsDoc.set(dailyResults);
}

function _addSessionToTodayResults(session: Session, todayResults: HostResult) {
  todayResults.count += session.count;
  _addStatsToValuesResults(todayResults.values, session.count, session.stats);
  if (session.location) {
    const locationKey =
      session.location.latitude.toFixed(0) +
      "," +
      session.location.longitude.toFixed(0);
    _addStatsToLocationResults(todayResults.locations, locationKey, {
      count: session.count,
      stats: session.stats,
    });
  }
}

function _addStatsToValuesResults(
  values: ValueResults,
  count: number,
  stats: PingStats
) {
  values.min[stats.min] = (values.min[stats.min] ?? 0) + count;
  values.mean[stats.mean] = (values.mean[stats.mean] ?? 0) + count;
  values.max[stats.max] = (values.max[stats.max] ?? 0) + count;
}

function _addStatsToLocationResults(
  locations: JsonObject<LocationResult>,
  locationKey: string,
  result: LocationResult
) {
  const locationResults = locations[locationKey] ?? {
    count: 0,
    stats: { min: 0, mean: 0, max: 0 },
  };
  const totalCount = locationResults.count + result.count;
  locationResults.stats.min =
    (locationResults.stats.min * locationResults.count +
      result.stats.min * result.count) /
    totalCount;
  locationResults.stats.mean =
    (locationResults.stats.mean * locationResults.count +
      result.stats.mean * result.count) /
    totalCount;
  locationResults.stats.max =
    (locationResults.stats.max * locationResults.count +
      result.stats.max * result.count) /
    totalCount;
  locationResults.count = totalCount;
  locations[locationKey] = locationResults;
}

export async function refreshMonthlyCounts() {
  const monthlyCountsDoc = admin
    .firestore()
    .collection(Collections.countsMonthly)
    .doc(Paths.all);
  const dailyCountsDoc = admin
    .firestore()
    .collection(Collections.countsDaily)
    .doc(Paths.all);
  const dailyCounts =
    ((await dailyCountsDoc.get()).data() as JsonObject<JsonObject<number>>) ??
    {};
  const monthlyCounts = await _createCountsData(dailyCounts);
  await dailyCountsDoc.set(dailyCounts);
  await monthlyCountsDoc.set(monthlyCounts);
}

async function _createCountsData(dailyCounts: JsonObject<JsonObject<number>>) {
  const monthAgoKey = _getTodayDateKey(-30);
  const monthlyCounts = {} as JsonObject<number>;
  Object.entries(dailyCounts).forEach(([dateKey, dayCounts]) => {
    if (dateKey <= monthAgoKey) {
      delete dailyCounts[dateKey];
    } else {
      Object.entries(dayCounts).forEach(([host, count]) => {
        monthlyCounts[host] = (monthlyCounts[host] ?? 0) + count;
      });
    }
  });
  return { dailyCounts, monthlyCounts };
}

export async function refreshMonthlyResults() {
  const monthAgoKey = _getTodayDateKey(-Intervals.monthlyDataDaysSpan);
  const dailyResultsQuerySnap = await admin
    .firestore()
    .collection(Collections.resultsDaily)
    .get();
  await Promise.all(
    dailyResultsQuerySnap.docs.map(async (dailyResultsSnap) => {
      const dailyResults = dailyResultsSnap.data() as JsonObject<HostResult>;
      const monthlyResults = _createMonthlyResults(dailyResults, monthAgoKey);
      await _updateMonthlyResultsDocs(
        dailyResultsSnap,
        dailyResults,
        monthlyResults
      );
    })
  );
}

function _createMonthlyResults(
  dailyResults: JsonObject<HostResult>,
  monthAgoKey: string
) {
  const monthlyResults = {
    count: 0,
    values: { min: {}, mean: {}, max: {} },
    locations: {},
  } as HostResult;
  Object.entries(dailyResults).forEach(([dateKey, dayResults]) => {
    if (dateKey <= monthAgoKey) {
      delete dailyResults[dateKey];
    } else {
      monthlyResults.count += dayResults.count;
      _addDayToMonthlyValueResults(dayResults, monthlyResults.values);
      Object.entries(dayResults.locations).forEach(([locationKey, result]) => {
        _addStatsToLocationResults(
          monthlyResults.locations,
          locationKey,
          result
        );
      });
    }
  });
  return monthlyResults;
}

function _addDayToMonthlyValueResults(
  dayResults: HostResult,
  valueResults: ValueResults
) {
  Object.entries(dayResults.values.min).forEach(([ping, count]) => {
    valueResults.min[ping] = (valueResults.min[ping] ?? 0) + count;
  });
  Object.entries(dayResults.values.mean).forEach(([ping, count]) => {
    valueResults.mean[ping] = (valueResults.mean[ping] ?? 0) + count;
  });
  Object.entries(dayResults.values.max).forEach(([ping, count]) => {
    valueResults.max[ping] = (valueResults.max[ping] ?? 0) + count;
  });
}

async function _updateMonthlyResultsDocs(
  dailyResultsSnap: FirebaseFirestore.QueryDocumentSnapshot,
  dailyResults: JsonObject<HostResult>,
  monthlyResults: HostResult
) {
  const hostPath = dailyResultsSnap.ref.path.split("/").pop();
  if (!hostPath)
    throw Error("Host path missing in daily results document reference.");
  const dailyResultsDoc = admin
    .firestore()
    .collection(Collections.resultsDaily)
    .doc(hostPath);
  const monthlyResultsDoc = admin
    .firestore()
    .collection(Collections.resultsMonthly)
    .doc(hostPath);
  if (Object.keys(dailyResults).length === 0) {
    await dailyResultsDoc.delete();
    await monthlyResultsDoc.delete();
  } else {
    await dailyResultsDoc.set(dailyResults);
    await monthlyResultsDoc.set(monthlyResults);
  }
}

function _getTodayDateKey(daysDelta: number = 0) {
  let date = admin.firestore.Timestamp.now().toDate();
  if (daysDelta !== 0) {
    date = new Date(date.getTime() + daysDelta * Intervals.secondsPerDay);
  }
  return (
    date.getMonth().toString().padStart(2, "0") +
    "." +
    date.getDate().toString().padStart(2, "0")
  );
}
