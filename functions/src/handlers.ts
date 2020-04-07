import { Intervals } from "./constants";
import { PingerStore } from "./pinger_store";
import { DailyCounts, DailyResults, HostResult, LocationResult, MonthlyCounts, Session } from "./types";

const pingerStore = new PingerStore();

export async function updateDailyCounts(session: Session) {
  const dailyCounts = await pingerStore.getDailyCounts();
  _updateTodayDailyCounts(dailyCounts, session);
  await pingerStore.setDailyCounts(dailyCounts);
}

function _updateTodayDailyCounts(dailyCounts: DailyCounts, session: Session) {
  const todayKey = _getTodayDateKey();
  const todayCounts = dailyCounts[todayKey] ?? {};
  todayCounts[session.host] = (todayCounts[session.host] ?? 0) + 1;
  dailyCounts[todayKey] = todayCounts;
}

export async function updateDailyResults(session: Session) {
  const dailyResults = await pingerStore.getDailyResults(session.host);
  _updateTodayDailyResults(dailyResults, session);
  await pingerStore.setDailyResults(session.host, dailyResults);
}

function _updateTodayDailyResults(
  dailyResults: DailyResults,
  session: Session
) {
  const todayKey = _getTodayDateKey();
  const todayResults = dailyResults[todayKey] ?? {
    count: 0,
    values: { min: {}, mean: {}, max: {} },
    locations: {},
  };
  _addSessionToTodayValuesResults(session, todayResults);
  if (session.location) {
    const locationKey =
      session.location.latitude.toFixed(0) +
      "," +
      session.location.longitude.toFixed(0);
    _addDayToMonthlyLocationResults(locationKey, session, todayResults);
  }
  dailyResults[todayKey] = todayResults;
}

function _addSessionToTodayValuesResults(
  session: Session,
  todayResults: HostResult
) {
  const values = todayResults.values;
  const stats = session.stats;
  const count = session.count;
  todayResults.count += count;
  values.min[stats.min] = (values.min[stats.min] ?? 0) + count;
  values.mean[stats.mean] = (values.mean[stats.mean] ?? 0) + count;
  values.max[stats.max] = (values.max[stats.max] ?? 0) + count;
}

export async function refreshMonthlyCounts() {
  const dailyCounts = await pingerStore.getDailyCounts();
  const monthlyCounts = await _createMonthlyCounts(dailyCounts);
  await pingerStore.setDailyCounts(dailyCounts);
  await pingerStore.setMonthlyCounts(monthlyCounts);
}

async function _createMonthlyCounts(
  dailyCounts: DailyCounts
): Promise<MonthlyCounts> {
  const monthAgoKey = _getTodayDateKey(-30);
  const monthlyCounts: MonthlyCounts = {};
  Object.entries(dailyCounts).forEach(([dateKey, dayCounts]) => {
    if (dateKey <= monthAgoKey) {
      delete dailyCounts[dateKey];
    } else {
      Object.entries(dayCounts).forEach(([host, count]) => {
        monthlyCounts[host] = (monthlyCounts[host] ?? 0) + count;
      });
    }
  });
  return monthlyCounts;
}

export async function refreshMonthlyResults() {
  const monthAgoKey = _getTodayDateKey(-Intervals.monthlyDataDaysSpan);
  const dailyResultsEntries = Object.entries(
    await pingerStore.getDailyResultsMap()
  );
  await Promise.all(
    dailyResultsEntries.map(async ([host, dailyResults]) => {
      if (Object.keys(dailyResults).length === 0) {
        await pingerStore.deleteDailyResults(host);
        await pingerStore.deleteMonthlyResults(host);
      } else {
        const monthlyResults = _createMonthlyResults(dailyResults, monthAgoKey);
        await pingerStore.setDailyResults(host, dailyResults);
        await pingerStore.setMonthlyResults(host, monthlyResults);
      }
    })
  );
}

function _createMonthlyResults(
  dailyResults: DailyResults,
  monthAgoKey: string
): HostResult {
  const monthlyResults: HostResult = {
    count: 0,
    values: { min: {}, mean: {}, max: {} },
    locations: {},
  };
  Object.entries(dailyResults).forEach(([dateKey, dayResults]) => {
    if (dateKey <= monthAgoKey) {
      delete dailyResults[dateKey];
    } else {
      _addDayToMonthlyResults(monthlyResults, dayResults);
    }
  });
  return monthlyResults;
}

function _addDayToMonthlyResults(
  monthlyResults: HostResult,
  dayResults: HostResult
) {
  const dayValues = dayResults.values;
  const monthlyValues = monthlyResults.values;
  monthlyResults.count += dayResults.count;
  Object.entries(dayValues.min).forEach(([ping, count]) => {
    monthlyValues.min[ping] = (monthlyValues.min[ping] ?? 0) + count;
  });
  Object.entries(dayValues.mean).forEach(([ping, count]) => {
    monthlyValues.mean[ping] = (monthlyValues.mean[ping] ?? 0) + count;
  });
  Object.entries(dayValues.max).forEach(([ping, count]) => {
    monthlyValues.max[ping] = (monthlyValues.max[ping] ?? 0) + count;
  });
  Object.entries(dayResults.locations).forEach(
    ([locationKey, locationResult]) => {
      _addDayToMonthlyLocationResults(
        locationKey,
        locationResult,
        monthlyResults
      );
    }
  );
}

function _addDayToMonthlyLocationResults(
  locationKey: string,
  dayResults: LocationResult,
  monthlyResults: HostResult
) {
  const locationResults = monthlyResults.locations[locationKey] ?? {
    count: 0,
    stats: { min: 0, mean: 0, max: 0 },
  };
  const dayCount = dayResults.count;
  const dayStats = dayResults.stats;
  const locationCount = locationResults.count;
  const locationStats = locationResults.stats;
  const totalCount = locationCount + dayCount;
  locationStats.min =
    (locationStats.min * locationCount + dayStats.min * dayCount) / totalCount;
  locationStats.mean =
    (locationStats.mean * locationCount + dayStats.mean * dayCount) /
    totalCount;
  locationStats.max =
    (locationStats.max * locationCount + dayStats.max * dayCount) / totalCount;
  locationResults.count = totalCount;
  monthlyResults.locations[locationKey] = locationResults;
}

function _getTodayDateKey(daysDelta: number = 0): string {
  let date = pingerStore.currentDate;
  if (daysDelta !== 0) {
    date = new Date(date.getTime() + daysDelta * Intervals.secondsPerDay);
  }
  return (
    date.getMonth().toString().padStart(2, "0") +
    "." +
    date.getDate().toString().padStart(2, "0")
  );
}
