import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcsgoalnest/controller/ecommerce_splash_screen_controller/events/ecommerce_splash_screen_events.dart';
import 'package:tcsgoalnest/controller/ecommerce_splash_screen_controller/states/ecommerce_splash_screen_states.dart';
import 'package:tcsgoalnest/core/dependency/injectable_setup.dart';
import 'package:tcsgoalnest/core/utils/pretty_logger_util.dart';
import 'package:tcsgoalnest/core/utils/firebase_remote_config_service.dart';
import 'package:tcsgoalnest/data/ecommercemodels/offer_details_model.dart';

import '../../core/constants/app_constants.dart';
import '../../data/ecommercemodels/offer_list_model.dart';

class EcommerceSplashBloc extends Bloc<EcommerceSplashScreenEvents, EcommerceSplashScreenStates> {
  final _logger = locator<PrettyLoggerUtil>();
  final _TAG = "EcommerceSplashBloc";
  final FirebaseRemoteConfigService _remoteConfigService = FirebaseRemoteConfigService();
  
  EcommerceSplashBloc() : super(EcommerceSplashScreenStates.loadingView()) {
    on<EcommerceSplashScreenEvents>((event, emit) async {
      await event.map(
        loadOffersFromFirebase: (event) async => await _onLoadOffersFromFirebase(event, emit),
        showSplashScreen: (event) async => await _onShowSplashScreen(event, emit),
      );
    });
  }

  Future<void> _onLoadOffersFromFirebase(LoadOffersFromFirebaseEvent event, Emitter<EcommerceSplashScreenStates> emit) async {
    emit(EcommerceSplashScreenStates.loadingView());
    try {
      String offerJson = await _remoteConfigService.getString(AppConstants.kOfferJsonKey);
      _logger.log(TAG: _TAG, message: "Offer JSON: $offerJson");
      OfferListModel offerListModel = OfferListModel.fromJson(jsonDecode(offerJson));
      List<OfferDetailsModel> offerList = offerListModel.offerList;
      _logger.log(TAG: _TAG, message: "Length of offer list: ${offerList.length}");
      emit(EcommerceSplashScreenStates.displaySplashScreen(offerList));
    } catch (exception, stackTrace) {
      _logger.log(TAG: _TAG, message: "Exception occurred $exception and stackTrace $stackTrace");
      emit(EcommerceSplashScreenStates.errorView("Exception occurred $exception and stackTrace $stackTrace"));
    }
  }

  Future<void> _onShowSplashScreen(ShowSplashScreenEvent event, Emitter<EcommerceSplashScreenStates> emit) async {
    emit(EcommerceSplashScreenStates.displaySplashScreen(event.offerList));
  }
}