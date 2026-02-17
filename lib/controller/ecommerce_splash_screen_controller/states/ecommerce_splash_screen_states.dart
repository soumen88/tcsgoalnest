import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tcsgoalnest/data/ecommercemodels/offer_details_model.dart';

part 'ecommerce_splash_screen_states.freezed.dart';

///flutter pub run build_runner build --delete-conflicting-outputs
@freezed
sealed class EcommerceSplashScreenStates with _$EcommerceSplashScreenStates {
    const factory EcommerceSplashScreenStates.loadingView() = SplashLoadingView;
    const factory EcommerceSplashScreenStates.errorView(String errorMessage) = SplashErrorView;
    const factory EcommerceSplashScreenStates.displaySplashScreen(List<OfferDetailsModel> offerList) = DisplayEcommerceSplashScreen;
    const factory EcommerceSplashScreenStates.showNextScreen(bool hasUserSignedIn) = ShowNextScreen;
}