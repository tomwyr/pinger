import 'package:pinger/model/ping_global.dart';
import 'package:pinger/model/ping_session.dart';

class FakeData {
  static final hosts = FakeHosts();

  static final globalResults = PingGlobalResults(
    geoStats: [
      PingGeoStats(
        position: GeoPosition(lat: 17.0, lon: 48.0),
        stats: PingStats(min: 30.0, mean: 34.0, max: 60.0),
      ),
      PingGeoStats(
        position: GeoPosition(lat: -37.0, lon: 68.0),
        stats: PingStats(min: 20.0, mean: 58.0, max: 199.0),
      ),
      PingGeoStats(
        position: GeoPosition(lat: 2.0, lon: -80.0),
        stats: PingStats(min: 50.0, mean: 87.0, max: 205.0),
      ),
      PingGeoStats(
        position: GeoPosition(lat: 10.0, lon: 14.0),
        stats: PingStats(min: 30.0, mean: 73.0, max: 109.0),
      ),
      PingGeoStats(
        position: GeoPosition(lat: -5.0, lon: -68.0),
        stats: PingStats(min: 20.0, mean: 41.0, max: 77.0),
      ),
      PingGeoStats(
        position: GeoPosition(lat: -21.0, lon: 9.0),
        stats: PingStats(min: 61.0, mean: 234.0, max: 560.0),
      ),
      PingGeoStats(
        position: GeoPosition(lat: 70.0, lon: -68.0),
        stats: PingStats(min: 25.0, mean: 61.0, max: 200.0),
      ),
      PingGeoStats(
        position: GeoPosition(lat: -43.0, lon: 71.0),
        stats: PingStats(min: 50.0, mean: 144.0, max: 370.0),
      ),
    ],
    groupStats: PingGroupStats(
      min: [
        PingGroup(ping: 18.0, percentage: 5.0),
        PingGroup(ping: 25.0, percentage: 35.0),
        PingGroup(ping: 32.0, percentage: 50.0),
        PingGroup(ping: 48.0, percentage: 10.0),
      ],
      mean: [
        PingGroup(ping: 68.0, percentage: 20.0),
        PingGroup(ping: 82.0, percentage: 45.0),
        PingGroup(ping: 125.0, percentage: 25.0),
        PingGroup(ping: 152.0, percentage: 10.0),
      ],
      max: [
        PingGroup(ping: 118.0, percentage: 5.0),
        PingGroup(ping: 225.0, percentage: 35.0),
        PingGroup(ping: 348.0, percentage: 35.0),
        PingGroup(ping: 532.0, percentage: 5.0),
      ],
    ),
  );
}

class FakeHosts {
  final dropbox = PingHost(name: "dropbox.com", ip: "204.123.44.21");
  final youtube = PingHost(name: "youtube.com", ip: "10.94.1.107");
}
