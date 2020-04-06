export type JsonObject<V = any> = { [key: string]: V };

export type Session = {
  host: string;
  count: number;
  location: FirebaseFirestore.GeoPoint;
  stats: PingStats;
};

export type PingStats = {
  min: number;
  mean: number;
  max: number;
};

export type HostResult = {
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
