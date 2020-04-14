import { Intervals } from "./constants";
import { PingerStore } from "./pinger_store";
import { DailyCounts, DailyResults, HostCounts, HostResults, LocationResults, MonthlyCounts, MonthlyResults, Session } from "./types";

const pingerStore = new PingerStore();

export async function updateDailyCounts(session: Session) {
  const dailyCounts = await pingerStore.getDailyCounts();
  _updateTodayDailyCounts(dailyCounts, session);
  await pingerStore.setDailyCounts(dailyCounts);
}

function _updateTodayDailyCounts(dailyCounts: DailyCounts, session: Session) {
  const todayKey = _getTodayDateKey();
  const todayCounts = dailyCounts[todayKey] ?? {
    totalCount: 0,
    pingCounts: {},
  };
  const pingCount = todayCounts.pingCounts[session.host] ?? {
    host: session.host,
    count: 0,
  };
  pingCount.count += session.count;
  todayCounts.totalCount += session.count;
  todayCounts.pingCounts[session.host] = pingCount;
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
    totalCount: 0,
    valueResults: { min: {}, mean: {}, max: {} },
    locationResults: {},
  };
  _addSessionToTodayValuesResults(session, todayResults);
  if (session.location) {
    const locationKey =
      session.location.lat.toFixed(0) + "," + session.location.lon.toFixed(0);
    _addDayToMonthlyLocationResults(locationKey, session, todayResults);
  }
  dailyResults[todayKey] = todayResults;
}

function _addSessionToTodayValuesResults(
  session: Session,
  todayResults: HostResults
) {
  const results = todayResults.valueResults;
  const stats = session.stats;
  const count = session.count;
  todayResults.totalCount += count;
  results.min[stats.min] = (results.min[stats.min] ?? 0) + count;
  results.mean[stats.mean] = (results.mean[stats.mean] ?? 0) + count;
  results.max[stats.max] = (results.max[stats.max] ?? 0) + count;
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
  const monthlyCounts: HostCounts = { totalCount: 0, pingCounts: {} };
  Object.entries(dailyCounts).forEach(([dateKey, dayCounts]) => {
    if (dateKey <= monthAgoKey) {
      delete dailyCounts[dateKey];
    } else {
      Object.entries(dayCounts.pingCounts).forEach(([host, dayCount]) => {
        const monthlyCount = monthlyCounts.pingCounts[host] ?? {
          host: host,
          count: 0,
        };
        monthlyCount.count += dayCount.count;
        monthlyCounts.totalCount += dayCount.count;
        monthlyCounts.pingCounts[host] = monthlyCount;
      });
    }
  });
  return {
    totalCount: monthlyCounts.totalCount,
    pingCounts: Object.values(monthlyCounts.pingCounts),
  };
}

export async function refreshMonthlyResults() {
  const monthAgoKey = _getTodayDateKey(-Intervals.monthlyDataDaysSpan);
  const dailyResultsEntries = Object.entries(
    await pingerStore.getAllDailyResults()
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
): MonthlyResults {
  const monthlyResults: HostResults = {
    totalCount: 0,
    valueResults: { min: {}, mean: {}, max: {} },
    locationResults: {},
  };
  Object.entries(dailyResults).forEach(([dateKey, dayResults]) => {
    if (dateKey <= monthAgoKey) {
      delete dailyResults[dateKey];
    } else {
      _addDayToMonthlyResults(monthlyResults, dayResults);
    }
  });
  return {
    totalCount: monthlyResults.totalCount,
    valueResults: monthlyResults.valueResults,
    locationResults: Object.values(monthlyResults.locationResults),
  };
}

function _addDayToMonthlyResults(
  monthlyResults: HostResults,
  dayResults: HostResults
) {
  const dayValues = dayResults.valueResults;
  const monthlyValues = monthlyResults.valueResults;
  monthlyResults.totalCount += dayResults.totalCount;
  Object.entries(dayValues.min).forEach(([ping, count]) => {
    monthlyValues.min[ping] = (monthlyValues.min[ping] ?? 0) + count;
  });
  Object.entries(dayValues.mean).forEach(([ping, count]) => {
    monthlyValues.mean[ping] = (monthlyValues.mean[ping] ?? 0) + count;
  });
  Object.entries(dayValues.max).forEach(([ping, count]) => {
    monthlyValues.max[ping] = (monthlyValues.max[ping] ?? 0) + count;
  });
  Object.entries(dayResults.locationResults).forEach(
    ([locationKey, locationResults]) => {
      _addDayToMonthlyLocationResults(
        locationKey,
        locationResults,
        monthlyResults
      );
    }
  );
}

function _addDayToMonthlyLocationResults(
  locationKey: string,
  dayResults: LocationResults,
  monthlyResults: HostResults
) {
  const monthResults = monthlyResults.locationResults[locationKey] ?? {
    count: 0,
    stats: { min: 0, mean: 0, max: 0 },
    location: dayResults.location,
  };
  const dayCount = dayResults.count;
  const dayStats = dayResults.stats;
  const monthCount = monthResults.count;
  const monthStats = monthResults.stats;
  const totalCount = monthCount + dayCount;
  monthStats.min =
    (monthStats.min * monthCount + dayStats.min * dayCount) / totalCount;
  monthStats.mean =
    (monthStats.mean * monthCount + dayStats.mean * dayCount) / totalCount;
  monthStats.max =
    (monthStats.max * monthCount + dayStats.max * dayCount) / totalCount;
  monthResults.count = totalCount;
  monthlyResults.locationResults[locationKey] = monthResults;
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
