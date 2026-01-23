
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:tcsgoalnest/core/dependency/injectable_setup.dart';
import 'package:tcsgoalnest/core/utils/pretty_logger_util.dart';

class FirebaseRemoteConfigService {
  final _logger = PrettyLoggerUtil();
  final _TAG = "FirebaseRemoteConfigService";
  FirebaseRemoteConfigService._() : _remoteConfig = FirebaseRemoteConfig.instance;

  static FirebaseRemoteConfigService? _instance;
  factory FirebaseRemoteConfigService() => _instance ??= FirebaseRemoteConfigService._();

  final FirebaseRemoteConfig _remoteConfig;

  Future<String> getString(String remoteConfigKey){
    var stringFromFirebase = _remoteConfig.getString(remoteConfigKey);
    //_logger.log(TAG: _TAG, message: "String fetched $stringFromFirebase");
    return Future.value(stringFromFirebase);
  }

  int getInt(String remoteConfigKey){
    var intFromFirebase = _remoteConfig.getInt(remoteConfigKey);
    //_logger.log(TAG: _TAG, message: "integer fetched $intFromFirebase");
    return intFromFirebase;
  }

  double getDouble(String remoteConfigKey){
    var doubleFromFirebase = _remoteConfig.getDouble(remoteConfigKey);
    //_logger.log(TAG: _TAG, message: "double number fetched $doubleFromFirebase");
    return doubleFromFirebase;
  }

  bool getBoolean(String remoteConfigKey){
    var boolFromFirebase = _remoteConfig.getBool(remoteConfigKey);
    //_logger.log(TAG: _TAG, message: "bool value fetched $boolFromFirebase");
    return boolFromFirebase;
  }

  Future<void> _setConfigSettings() async{
    var settings = _remoteConfig.setConfigSettings(
        RemoteConfigSettings(
            fetchTimeout: const Duration(minutes: 1),
            minimumFetchInterval: const Duration(minutes: 1),
        )
    );
  }

  Future<void> fetchAndActivate() async{
    bool isRemoteConfigUpdated = await _remoteConfig.fetchAndActivate();
    _logger.log(TAG: _TAG, message: "Was remote config updated $isRemoteConfigUpdated");
    if(isRemoteConfigUpdated){
      _logger.log(TAG: _TAG, message: "Yes the config has been updated");
    }
    else{
      _logger.log(TAG: _TAG, message: "No changes have been found in config");
    }
  }

  Future<void> initialize() async{
    await _setConfigSettings();
    await fetchAndActivate();
  }
}