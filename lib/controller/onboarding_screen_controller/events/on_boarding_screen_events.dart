import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tcsgoalnest/data/models/goal_model.dart';
import 'package:tcsgoalnest/data/models/goal_type_model.dart';

part 'on_boarding_screen_events.freezed.dart';

///flutter pub run build_runner build --delete-conflicting-outputs
@freezed
sealed class OnBoardingScreenEvents with _$OnBoardingScreenEvents{
  const factory OnBoardingScreenEvents.initOnBoardingEvent() = InitOnBoardingEvent;
  const factory OnBoardingScreenEvents.onGoogleSigninEvent() = GoogleSigninInOnBoardingEvent;
  const factory OnBoardingScreenEvents.skipSignInEvent() = SkipSigninInOnBoardingEvent;
  const factory OnBoardingScreenEvents.signInSuccessEvent() = SigninInSuccessEvent;
  const factory OnBoardingScreenEvents.signInErrorEvent(String errorMessage) = SigninInErrorEvent;

}