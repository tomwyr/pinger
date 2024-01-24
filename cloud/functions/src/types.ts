export type JsonObject<T> = { [key: string]: T };

export type Session = {
  host: string;
  count: number;
  location: GeoPoint;
  stats: PingStats;
};

export type DailyCounts = JsonObject<HostCounts>;

export type DailyResults = JsonObject<HostResults>;

export type MonthlyCounts = {
  totalCount: number;
  pingCounts: Array<PingCount>;
};

export type MonthlyResults = {
  totalCount: number;
  valueResults: ValueResults;
  locationResults: Array<LocationResults>;
};

export type HostCounts = {
  totalCount: number;
  pingCounts: JsonObject<PingCount>;
};

export type HostResults = {
  totalCount: number;
  valueResults: ValueResults;
  locationResults: JsonObject<LocationResults>;
};

export type PingCount = {
  host: string;
  count: number;
};

export type ValueResults = {
  min: JsonObject<number>;
  mean: JsonObject<number>;
  max: JsonObject<number>;
};

export type LocationResults = {
  location: GeoPoint;
  count: number;
  stats: PingStats;
};

export type PingStats = {
  min: number;
  mean: number;
  max: number;
};

export type GeoPoint = {
  lat: number;
  lon: number;
};
