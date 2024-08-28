import 'package:package_info_plus/package_info_plus.dart';

class AppInfo {
  static late final PackageInfo _packageInfo;

  static Future<void> init() async {
    _packageInfo = await PackageInfo.fromPlatform();
  }

  static String get version => _packageInfo.version;
  static String get buildNumber => _packageInfo.buildNumber;
}
