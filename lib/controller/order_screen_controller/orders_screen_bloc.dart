import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nominatim_flutter/model/request/reverse_request.dart';
import 'package:nominatim_flutter/nominatim_flutter.dart';
import 'package:tcsgoalnest/controller/order_screen_controller/events/orders_screen_events.dart';
import 'package:tcsgoalnest/controller/order_screen_controller/states/orders_screen_states.dart';
import 'package:tcsgoalnest/core/dependency/injectable_setup.dart';
import 'package:tcsgoalnest/core/utils/pretty_logger_util.dart';
import 'package:tcsgoalnest/core/utils/location_utils.dart';
import 'package:tcsgoalnest/data/ecommercemodels/location_marker.dart';

class OrdersScreenBloc extends Bloc<OrdersScreenEvents, OrdersScreenStates> {
  final _logger = locator<PrettyLoggerUtil>();
  final _TAG = "OrdersScreenBloc";
  final LocationUtils _locationUtils = LocationUtils();
  
  OrdersScreenBloc() : super(const OrdersScreenStates.loadingView()){
    on<OrdersScreenEvents>((event, emit) async{
      await event.map(
        loadCurrentLocation: (event) async => await _loadCurrentLocation(event, emit),
        changeLocation: (event) async => await _changeLocation(event, emit),
      );
    });
  }

  Future<void> _loadCurrentLocation(LoadCurrentLocationEvent event, Emitter<OrdersScreenStates> emit) async {
    emit(const OrdersScreenStates.loadingView());
    await _locationUtils.getCurrentLocation().then((value) async{
      final reverseRequest = ReverseRequest(
        lat: value.latitude,
        lon: value.longitude,
        addressDetails: true,
        extraTags: true,
        nameDetails: true,
      );
      final reverseResult = await NominatimFlutter.instance.reverse(
        reverseRequest: reverseRequest,
        language: 'en-US,en;q=0.5', // Specify the desired language(s) here
      );

      List<double> boundingBox = reverseResult.boundingbox?.map(double.parse).toList() ?? [];

      _logger.log(TAG: _TAG, message: "Reverse geo code value $reverseResult");
      LocationMarker locationMarker = LocationMarker(
        latitude: value.latitude,
        longitude: value.longitude,
        boundingBoxes: boundingBox,
        displayLocationName: reverseResult.displayName ?? ""
      );
      emit(OrdersScreenStates.displayMarkerView(locationMarker, null));
    }).onError((error, stackTrace) {
      emit(OrdersScreenStates.errorView(error.toString()));
    });
  }

  Future<void> _changeLocation(ChangeLocationEvent event, Emitter<OrdersScreenStates> emit) async {
    
  }
}