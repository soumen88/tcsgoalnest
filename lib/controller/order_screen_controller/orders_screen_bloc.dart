import 'dart:math';
import 'package:emailjs/emailjs.dart' as emailjs;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nominatim_flutter/model/request/reverse_request.dart';
import 'package:nominatim_flutter/nominatim_flutter.dart';
import 'package:tcsgoalnest/controller/order_screen_controller/events/orders_screen_events.dart';
import 'package:tcsgoalnest/controller/order_screen_controller/states/orders_screen_states.dart';
import 'package:tcsgoalnest/core/dependency/injectable_setup.dart';
import 'package:tcsgoalnest/core/repository/api_repository.dart';
import 'package:tcsgoalnest/core/schema/cart_tracker_data.dart';
import 'package:tcsgoalnest/core/table/cart_store_manager.dart';
import 'package:tcsgoalnest/core/table/key_value_store_manager.dart';
import 'package:tcsgoalnest/core/utils/pretty_logger_util.dart';
import 'package:tcsgoalnest/core/utils/location_utils.dart';
import 'package:tcsgoalnest/data/ecommercemodels/location_marker.dart';
import 'package:tcsgoalnest/data/ecommercemodels/order_item_model.dart';
import 'package:tcsgoalnest/data/ecommercemodels/put_order_request_model.dart';

import '../../core/constants/app_constants.dart';
import '../../core/constants/environment_variables_generator.dart';
import '../../data/ecommercemodels/order_response_model.dart';

class OrdersScreenBloc extends Bloc<OrdersScreenEvents, OrdersScreenStates> {
  final _logger = locator<PrettyLoggerUtil>();
  final _TAG = "OrdersScreenBloc";
  final LocationUtils _locationUtils = LocationUtils();
  final ApiRepository _apiRepository = ApiRepository();
  final _cartManager = locator<CartStoreManager>();
  final _keyValueStore = locator<KeyValueStoreManager>();

  OrdersScreenBloc() : super(const OrdersScreenStates.loadingView()){
    on<OrdersScreenEvents>((event, emit) async{
      await event.map(
        loadCurrentLocation: (event) async => await _loadCurrentLocation(event, emit),
        changeLocation: (event) async => await _changeLocation(event, emit),
        placeOrderOnServer: (event) async => await _placeOrderOnServer(event, emit),
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

  Future<void> _placeOrderOnServer(PlaceOrderOnServerEvent event, Emitter<OrdersScreenStates> emit) async {
    emit(const OrdersScreenStates.loadingView());
    var listOfCartItems = await _cartManager.getCartItems();
    List<OrderItemModel> orderItems = listOfCartItems.map((e) => OrderItemModel(productId: e.productId, quantity: e.quantity)).toList();
    String orderNamesCsv = orderItems.map((e) => e.quantity).join(",");
    String? userId = _keyValueStore.getValue(AppConstants.kStringUserIdFromApi);
    String? userEmail = _keyValueStore.getValue(AppConstants.kStringUserEmail);
    String? userName = _keyValueStore.getValue(AppConstants.kStringUserName);
    _logger.log(TAG: _TAG, message: "User id $userId");
    PutOrderRequestModel putOrderRequestModel = PutOrderRequestModel(userId: userId != null ? int.parse(userId) : 0, items: orderItems);
    await _apiRepository.hitServerToPlaceOrder(putOrderRequestModel).then((OrderResponseModel orderResponseModel) async{
      await _cartManager.clearCart();
      Map<String, dynamic> templateParams = {
        'name': userName,
        'title': 'Purchase confirmed for $orderNamesCsv',
        'email': userEmail,
      };

      try {
        await emailjs.send(
          EnvironmentVariablesGenerator.emailJsServiceKey,
          EnvironmentVariablesGenerator.emailJsTemplateKey,
          templateParams,
          const emailjs.Options(
            publicKey: EnvironmentVariablesGenerator.emailJsPublicKey,
            privateKey: EnvironmentVariablesGenerator.emailJsPrivateKey,
          ),
        );
        _logger.log(TAG: _TAG, message: 'Email sending SUCCESS!');
      } catch (error) {
        _logger.log(TAG: _TAG, message: 'Email sending error! $error');
      }
      emit(OrdersScreenStates.orderPlacedView(orderResponseModel));
    }).onError((error, stackTrace) {
      emit(OrdersScreenStates.errorView(error.toString()));
    });
  }
}