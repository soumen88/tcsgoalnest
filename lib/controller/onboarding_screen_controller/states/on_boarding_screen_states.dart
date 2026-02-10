import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tcsgoalnest/core/schema/goal_store_data.dart';
import 'package:google_sign_in/google_sign_in.dart';
part 'on_boarding_screen_states.freezed.dart';

///flutter pub run build_runner build --delete-conflicting-outputs
@freezed
sealed class OnBoardingScreenStates with _$OnBoardingScreenStates{
  const factory OnBoardingScreenStates.displayLoadingView() = DisplayOnBoardingLoading;
  const factory OnBoardingScreenStates.error(String errorMessage) = DisplayOnBoardingError;
  const factory OnBoardingScreenStates.displayUserDetails(GoogleSignInAccount? currentUserDetails ) = DisplayGoogleUserDetails;
  const factory OnBoardingScreenStates.displayOnBoardingView() = DisplayOnBoardingView;
}