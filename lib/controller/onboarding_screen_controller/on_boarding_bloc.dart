import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tcsgoalnest/controller/onboarding_screen_controller/events/on_boarding_screen_events.dart';
import 'package:tcsgoalnest/controller/onboarding_screen_controller/states/on_boarding_screen_states.dart';
import 'package:tcsgoalnest/core/constants/app_constants.dart';
import 'package:tcsgoalnest/core/dependency/injectable_setup.dart';
import 'package:tcsgoalnest/core/table/key_value_store_manager.dart';
import 'package:tcsgoalnest/core/utils/pretty_logger_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OnBoardingBloc extends Bloc<OnBoardingScreenEvents, OnBoardingScreenStates>{

  final _logger = locator<PrettyLoggerUtil>();
  final _TAG = "OnBoardingBloc";

  ///Fetch the nonce clientid and serverclientid
  String? clientId;
  String? serverClientId;
  GoogleSignInAccount? _currentUser;

  ///Reading parameters like name, email , gmail id only and not allowing users to create account
  List<String> scopes = <String>[
    'https://www.googleapis.com/auth/contacts.readonly',
  ];

  ///If google signin fails getting the reason behind them
  String _errorMessage = '';
  String _serverAuthCode = '';
  bool _isAuthorized = false;
  final _keyValueStore = locator<KeyValueStoreManager>();

  OnBoardingBloc() : super(const OnBoardingScreenStates.displayOnBoardingView()){
    on<OnBoardingScreenEvents>((event, emit) async{
      await event.map(
          initOnBoardingEvent: (event) async => await _initOnBoarding(event, emit),
          onGoogleSigninEvent: (event) async => await _startGoogleSignInUsingFirebase(event, emit),
          skipSignInEvent: (event) async => await _skipSignIn(event, emit),
          signInSuccessEvent : (event) async => await _signInSuccess(event, emit),
          signInErrorEvent : (event) async => await _signInFailed(event, emit),

      );
    });
  }

  Future<void> _initOnBoarding(InitOnBoardingEvent event, Emitter<OnBoardingScreenStates> emit) async{

  }

  Future<void> _startGoogleSignInUsingFirebase(GoogleSigninInOnBoardingEvent event, Emitter<OnBoardingScreenStates> emit) async{
    await startGoogleSignIn();
  }

  Future<void> _skipSignIn(SkipSigninInOnBoardingEvent event, Emitter<OnBoardingScreenStates> emit) async{

  }

  ///Step - 1
  ///If the user has already logged in...get its details without showing login popup
  Future<User?> initializeFirebase() async {
    try {
      _logger.log(TAG: _TAG, message: "Starting with firebase initialisation");
      FirebaseApp firebaseApp = await Firebase.initializeApp();
      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        // this is for us to remember
        // user has already logged in, don't irritate by showing log in again :)
        return Future.value(currentUser);
      } else {
        return null;
      }
    } catch (exception) {
      _logger.log(TAG:  _TAG, message:  "Failed to initialize Firebase: $exception");
      return null;
    }
  }

  ///Step - 2
  ///Below function would start gmail sign in and report back for any error or report back with a success
  Future<void> startGoogleSignIn() async{
    _logger.log(TAG:  _TAG, message:  "starting with signing in");
    User? currentUser;


    final GoogleSignIn signIn = GoogleSignIn.instance;
    await signIn.signOut();
    signIn
        .initialize(clientId: clientId, serverClientId: serverClientId)
        .then((_) {
      signIn.authenticationEvents
          .listen(_handleAuthenticationEvent)
          .onError(_handleAuthenticationError);

      /// This example always uses the stream-based approach to determining
      /// which UI state to show, rather than using the future returned here,
      /// if any, to conditionally skip directly to the signed-in state.
      signIn.attemptLightweightAuthentication();
    });
  }

  ///Below function is when authentication is succesfull
  Future<void> _handleAuthenticationEvent(GoogleSignInAuthenticationEvent event) async {
    // #docregion CheckAuthorization
    final GoogleSignInAccount? user = // ...
    // #enddocregion CheckAuthorization
    switch (event) {
      GoogleSignInAuthenticationEventSignIn() => event.user,
      GoogleSignInAuthenticationEventSignOut() => null,
    };

    // Check for existing authorization.
    // #docregion CheckAuthorization
    final GoogleSignInClientAuthorization? authorization =
    await user?.authorizationClient.authorizationForScopes(scopes);
    // #enddocregion CheckAuthorization

    _currentUser = user;
    _isAuthorized = authorization != null;
    _errorMessage = '';

    if(_currentUser != null){

      ///Fetch only the google data
      _logger.log(TAG:  _TAG, message:  "Storing user details $_currentUser");
      _keyValueStore.insertKey(keyName: AppConstants.kUserName, value: _currentUser?.displayName ?? '');
      _keyValueStore.insertKey(keyName: AppConstants.kUserEmail, value: _currentUser?.email ?? '');
      _keyValueStore.insertKey(keyName: AppConstants.kUserId, value: _currentUser?.id ?? '');
      _keyValueStore.insertKey(keyName: AppConstants.kHasUserSignedIn, value: "yes");
      add(OnBoardingScreenEvents.signInSuccessEvent());
    }
  }

  ///Below function is when authentication has failed
  Future<void> _handleAuthenticationError(Object e) async {
    _currentUser = null;
    _isAuthorized = false;
    _errorMessage = e is GoogleSignInException
        ? _errorMessageFromSignInException(e)
        : 'Unknown error: $e';
  }

  String _errorMessageFromSignInException(GoogleSignInException e) {
    // In practice, an application should likely have specific handling for most
    // or all of the, but for simplicity this just handles cancel, and reports
    // the rest as generic errors.
    return switch (e.code) {
      GoogleSignInExceptionCode.canceled => 'Sign in canceled',
      _ => 'GoogleSignInException ${e.code}: ${e.description}',
    };
  }

  Future<void> _signInSuccess(SigninInSuccessEvent event, Emitter<OnBoardingScreenStates> emit) async{
    if(_currentUser != null){
      //emit(OnBoardingScreenStates.displayUserDetails(_currentUser));
      emit(OnBoardingScreenStates.showHomeScreen());
    }

  }

  Future<void> _signInFailed(SigninInErrorEvent event, Emitter<OnBoardingScreenStates> emit) async{
    emit(OnBoardingScreenStates.error(event.errorMessage));
  }


}