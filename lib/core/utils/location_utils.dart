import 'package:geolocator/geolocator.dart';
import 'package:tcsgoalnest/core/utils/logger_util.dart';

import '../dependency/injectable_setup.dart';

class LocationUtils {

  final _logger = locator<LoggerUtil>();
  final _TAG = "LocationUtils";

  Future<Position> getCurrentLocation() async{
    bool isGpsServiceEnabled = false;
    LocationPermission permission;

    isGpsServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!isGpsServiceEnabled){
      return Future.error("GPS is not enabled in this device. Go to settings and enable GPS");
    }

    permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied || permission == LocationPermission.deniedForever){
        return Future.error("GPS is not enabled in this device. Go to settings and enable GPS");
      }
    }

    var position = await Geolocator.getCurrentPosition();
    _logger.log(TAG: _TAG, message: "Position $position");
    return Future.value(position);
  }
}