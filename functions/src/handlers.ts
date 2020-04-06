import admin = require("firebase-admin");
import { Collections, Intervals, Paths } from "./constants";
import { HostResult, JsonObject, Session } from "./types";

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
    values: { min: {}, mean: {}, max: {} },
    locations: {},
  };
  const valuesResults = todayResults.values;
  const min = (valuesResults.min[session.stats.min] ?? 0) + session.count;
  valuesResults.min[session.stats.min] = min;
  const mean = (valuesResults.mean[session.stats.mean] ?? 0) + session.count;
  valuesResults.mean[session.stats.mean] = mean;
  const max = (valuesResults.max[session.stats.max] ?? 0) + session.count;
  valuesResults.max[session.stats.max] = max;
  if (session.location) {
    const locationKey =
      session.location.latitude.toFixed(0) +
      "," +
      session.location.longitude.toFixed(0);
    const locationResults = todayResults.locations[locationKey] ?? {
      count: 0,
      stats: { min: 0, mean: 0, max: 0 },
    };
    const totalCount = locationResults.count + session.count;
    locationResults.stats.min =
      (locationResults.stats.min * locationResults.count +
        session.stats.min * session.count) /
      totalCount;
    locationResults.stats.mean =
      (locationResults.stats.mean * locationResults.count +
        session.stats.mean * session.count) /
      totalCount;
    locationResults.stats.max =
      (locationResults.stats.max * locationResults.count +
        session.stats.max * session.count) /
      totalCount;
    locationResults.count = totalCount;
    todayResults.locations[locationKey] = locationResults;
  }
  dailyResults[todayKey] = todayResults;
  await dailyResultsDoc.set(dailyResults);
}

export async function refreshMonthlyCounts() {
  const firestore = admin.firestore();
  const monthlyCountsDoc = firestore
    .collection(Collections.countsMonthly)
    .doc(Paths.all);
  const dailyCountsDoc = firestore
    .collection(Collections.countsDaily)
    .doc(Paths.all);
  const dailyCounts =
    ((await dailyCountsDoc.get()).data() as JsonObject<JsonObject<number>>) ??
    {};
  const monthlyCounts = {} as JsonObject<number>;
  const monthAgoKey = _getTodayDateKey(-30);
  Object.entries(dailyCounts).forEach(([dateKey, dayCounts]) => {
    if (dateKey <= monthAgoKey) {
      delete dailyCounts[dateKey];
    } else {
      Object.entries(dayCounts).forEach(([host, count]) => {
        monthlyCounts[host] = (monthlyCounts[host] ?? 0) + count;
      });
    }
  });
  await dailyCountsDoc.set(dailyCounts);
  await monthlyCountsDoc.set(monthlyCounts);
}

export async function refreshMonthlyResults() {
  const firestore = admin.firestore();
  const dailyResultsDocs = await firestore
    .collection(Collections.resultsDaily)
    .get();
  const monthAgoKey = _getTodayDateKey(-Intervals.monthlyDataDaysSpan);
  await Promise.all(
    dailyResultsDocs.docs.map(async (dailyResultsSnap) => {
      const monthlyResults = {
        values: { min: {}, mean: {}, max: {} },
        locations: {},
      } as HostResult;
      const valuesResults = monthlyResults.values;
      const dailyResults = dailyResultsSnap.data() as JsonObject<HostResult>;
      Object.entries(dailyResults).forEach(([dateKey, dayResults]) => {
        if (dateKey <= monthAgoKey) {
          delete dailyResults[dateKey];
        } else {
          Object.entries(dayResults.values.min).forEach(([ping, count]) => {
            valuesResults.min[ping] = (valuesResults.min[ping] ?? 0) + count;
          });
          Object.entries(dayResults.values.mean).forEach(([ping, count]) => {
            valuesResults.mean[ping] = (valuesResults.mean[ping] ?? 0) + count;
          });
          Object.entries(dayResults.values.max).forEach(([ping, count]) => {
            valuesResults.max[ping] = (valuesResults.max[ping] ?? 0) + count;
          });
          Object.entries(dayResults.locations).forEach(([location, result]) => {
            const locationResults = monthlyResults.locations[location] ?? {
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
            monthlyResults.locations[location] = locationResults;
          });
        }
      });
      const hostPath = dailyResultsSnap.ref.path.split("/").pop();
      if (!hostPath)
        throw Error("Host path missing in daily results document reference.");
      const dailyResultsDoc = firestore
        .collection(Collections.resultsDaily)
        .doc(hostPath);
      const monthlyResultsDoc = firestore
        .collection(Collections.resultsMonthly)
        .doc(hostPath);
      if (Object.keys(dailyResults).length === 0) {
        await dailyResultsDoc.delete();
        await monthlyResultsDoc.delete();
      } else {
        await dailyResultsDoc.set(dailyResults);
        await monthlyResultsDoc.set(monthlyResults);
      }
    })
  );
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
