export type JsonObject<V = any> = { [key: string]: V };

export type Session = {
  host: string;
  count: number;
  location: FirebaseFirestore.GeoPoint;
  stats: PingStats;
};

export type HostResult = {
  count: number;
  values: ValueResults;
  locations: JsonObject<LocationResult>;
};

export type ValueResults = {
  min: JsonObject<number>;
  mean: JsonObject<number>;
  max: JsonObject<number>;
};

export type LocationResult = {
  count: number;
  stats: PingStats;
};

export type PingStats = {
  min: number;
  mean: number;
  max: number;
};

export type DailyResultsMap = JsonObject<DailyResults>;

export type DailyCounts = JsonObject<JsonObject<number>>;

export type DailyResults = JsonObject<HostResult>;

export type MonthlyCounts = JsonObject<number>;

export type MonthlyResults = HostResult;
