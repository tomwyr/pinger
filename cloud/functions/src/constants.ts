export class Collections {
  static readonly countsDaily = "counts-daily";
  static readonly countsMonthly = "counts-monthly";
  static readonly resultsDaily = "results-daily";
  static readonly resultsMonthly = "results-monthly";
  static readonly sessions = "sessions";
}

export class Paths {
  static readonly all = "all";
  static readonly session = "sessions/{id}";
}

export class Regions {
  static readonly euWest3 = "europe-west3";
}

export class Intervals {
  static readonly secondsPerDay = 24 * 60 * 60 * 1000;
  static readonly monthlyDataDaysSpan = 30;
  static readonly refreshDataInterval = "every 24 hours";
}
