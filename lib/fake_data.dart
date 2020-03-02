import 'package:pinger/model/ping_session.dart';

class FakeData {
  static final hosts = FakeHosts();
}

class FakeHosts {
  final dropbox = PingHost(
    name: "dropbox.com",
    ip: "204.123.44.21",
    avatarUrl: "https://www.dropbox.com/static/30168/images/favicon.ico",
  );

  final youtube = PingHost(
    name: "youtube.com",
    ip: "10.94.1.107",
    avatarUrl: "https://s.ytimg.com/yts/img/favicon-vfl8qSV2F.ico",
  );
}
