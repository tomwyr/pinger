import 'package:pinger/model/ping_session.dart';

class FakeData {
  static final hosts = FakeHosts();
}

class FakeHosts {
  final dropbox = PingHost(
    name: "dropbox.com",
    avatarUrl: "https://www.dropbox.com/static/30168/images/favicon.ico",
  );

  final youtube = PingHost(
    name: "youtube.com",
    avatarUrl: "https://s.ytimg.com/yts/img/favicon-vfl8qSV2F.ico",
  );
}
