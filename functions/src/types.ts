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
  records: Array<HostRecord>;
};

export type MonthlyResults = {
  totalCount: number;
  values: ValueResults;
  locations: Array<LocationResults>;
};

export type HostCounts = {
  totalCount: number;
  records: JsonObject<HostRecord>;
};

export type HostResults = {
  totalCount: number;
  values: ValueResults;
  locations: JsonObject<LocationResults>;
};

export type HostRecord = {
  name: string;
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
