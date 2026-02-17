import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/ecommercemodels/offer_details_model.dart';

part 'ecommerce_splash_screen_events.freezed.dart';

///flutter pub run build_runner build --delete-conflicting-outputs
@freezed
sealed class EcommerceSplashScreenEvents with _$EcommerceSplashScreenEvents{
    const factory EcommerceSplashScreenEvents.loadOffersFromFirebase() = LoadOffersFromFirebaseEvent;
    const factory EcommerceSplashScreenEvents.showSplashScreen(List<OfferDetailsModel> offerList) = ShowSplashScreenEvent;
    const factory EcommerceSplashScreenEvents.startNextScreen() = StartNextScreenEvent;
}