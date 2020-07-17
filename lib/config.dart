import 'package:injectable/injectable.dart';
import 'package:pinger/assets.dart';

abstract class AppConfig {
  String get iconPath;
}

@test
@Injectable(as: AppConfig)
class TestConfig extends AppConfig {
  @override
  String get iconPath => Images.appIconTst.assetName;
}

@dev
@Injectable(as: AppConfig)
class DevConfig extends AppConfig {
  @override
  String get iconPath => Images.appIconDev.assetName;
}

@prod
@Injectable(as: AppConfig)
class ProdConfig extends AppConfig {
  @override
  String get iconPath => Images.appIconProd.assetName;
}
