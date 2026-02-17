// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ecommerce_splash_screen_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EcommerceSplashScreenStates {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EcommerceSplashScreenStates);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EcommerceSplashScreenStates()';
}


}

/// @nodoc
class $EcommerceSplashScreenStatesCopyWith<$Res>  {
$EcommerceSplashScreenStatesCopyWith(EcommerceSplashScreenStates _, $Res Function(EcommerceSplashScreenStates) __);
}


/// Adds pattern-matching-related methods to [EcommerceSplashScreenStates].
extension EcommerceSplashScreenStatesPatterns on EcommerceSplashScreenStates {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SplashLoadingView value)?  loadingView,TResult Function( SplashErrorView value)?  errorView,TResult Function( DisplayEcommerceSplashScreen value)?  displaySplashScreen,TResult Function( ShowNextScreen value)?  showNextScreen,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SplashLoadingView() when loadingView != null:
return loadingView(_that);case SplashErrorView() when errorView != null:
return errorView(_that);case DisplayEcommerceSplashScreen() when displaySplashScreen != null:
return displaySplashScreen(_that);case ShowNextScreen() when showNextScreen != null:
return showNextScreen(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SplashLoadingView value)  loadingView,required TResult Function( SplashErrorView value)  errorView,required TResult Function( DisplayEcommerceSplashScreen value)  displaySplashScreen,required TResult Function( ShowNextScreen value)  showNextScreen,}){
final _that = this;
switch (_that) {
case SplashLoadingView():
return loadingView(_that);case SplashErrorView():
return errorView(_that);case DisplayEcommerceSplashScreen():
return displaySplashScreen(_that);case ShowNextScreen():
return showNextScreen(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SplashLoadingView value)?  loadingView,TResult? Function( SplashErrorView value)?  errorView,TResult? Function( DisplayEcommerceSplashScreen value)?  displaySplashScreen,TResult? Function( ShowNextScreen value)?  showNextScreen,}){
final _that = this;
switch (_that) {
case SplashLoadingView() when loadingView != null:
return loadingView(_that);case SplashErrorView() when errorView != null:
return errorView(_that);case DisplayEcommerceSplashScreen() when displaySplashScreen != null:
return displaySplashScreen(_that);case ShowNextScreen() when showNextScreen != null:
return showNextScreen(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadingView,TResult Function( String errorMessage)?  errorView,TResult Function( List<OfferDetailsModel> offerList)?  displaySplashScreen,TResult Function( bool hasUserSignedIn)?  showNextScreen,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SplashLoadingView() when loadingView != null:
return loadingView();case SplashErrorView() when errorView != null:
return errorView(_that.errorMessage);case DisplayEcommerceSplashScreen() when displaySplashScreen != null:
return displaySplashScreen(_that.offerList);case ShowNextScreen() when showNextScreen != null:
return showNextScreen(_that.hasUserSignedIn);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadingView,required TResult Function( String errorMessage)  errorView,required TResult Function( List<OfferDetailsModel> offerList)  displaySplashScreen,required TResult Function( bool hasUserSignedIn)  showNextScreen,}) {final _that = this;
switch (_that) {
case SplashLoadingView():
return loadingView();case SplashErrorView():
return errorView(_that.errorMessage);case DisplayEcommerceSplashScreen():
return displaySplashScreen(_that.offerList);case ShowNextScreen():
return showNextScreen(_that.hasUserSignedIn);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadingView,TResult? Function( String errorMessage)?  errorView,TResult? Function( List<OfferDetailsModel> offerList)?  displaySplashScreen,TResult? Function( bool hasUserSignedIn)?  showNextScreen,}) {final _that = this;
switch (_that) {
case SplashLoadingView() when loadingView != null:
return loadingView();case SplashErrorView() when errorView != null:
return errorView(_that.errorMessage);case DisplayEcommerceSplashScreen() when displaySplashScreen != null:
return displaySplashScreen(_that.offerList);case ShowNextScreen() when showNextScreen != null:
return showNextScreen(_that.hasUserSignedIn);case _:
  return null;

}
}

}

/// @nodoc


class SplashLoadingView implements EcommerceSplashScreenStates {
  const SplashLoadingView();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashLoadingView);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EcommerceSplashScreenStates.loadingView()';
}


}




/// @nodoc


class SplashErrorView implements EcommerceSplashScreenStates {
  const SplashErrorView(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of EcommerceSplashScreenStates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SplashErrorViewCopyWith<SplashErrorView> get copyWith => _$SplashErrorViewCopyWithImpl<SplashErrorView>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashErrorView&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'EcommerceSplashScreenStates.errorView(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $SplashErrorViewCopyWith<$Res> implements $EcommerceSplashScreenStatesCopyWith<$Res> {
  factory $SplashErrorViewCopyWith(SplashErrorView value, $Res Function(SplashErrorView) _then) = _$SplashErrorViewCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$SplashErrorViewCopyWithImpl<$Res>
    implements $SplashErrorViewCopyWith<$Res> {
  _$SplashErrorViewCopyWithImpl(this._self, this._then);

  final SplashErrorView _self;
  final $Res Function(SplashErrorView) _then;

/// Create a copy of EcommerceSplashScreenStates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(SplashErrorView(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DisplayEcommerceSplashScreen implements EcommerceSplashScreenStates {
  const DisplayEcommerceSplashScreen(final  List<OfferDetailsModel> offerList): _offerList = offerList;
  

 final  List<OfferDetailsModel> _offerList;
 List<OfferDetailsModel> get offerList {
  if (_offerList is EqualUnmodifiableListView) return _offerList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_offerList);
}


/// Create a copy of EcommerceSplashScreenStates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DisplayEcommerceSplashScreenCopyWith<DisplayEcommerceSplashScreen> get copyWith => _$DisplayEcommerceSplashScreenCopyWithImpl<DisplayEcommerceSplashScreen>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DisplayEcommerceSplashScreen&&const DeepCollectionEquality().equals(other._offerList, _offerList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_offerList));

@override
String toString() {
  return 'EcommerceSplashScreenStates.displaySplashScreen(offerList: $offerList)';
}


}

/// @nodoc
abstract mixin class $DisplayEcommerceSplashScreenCopyWith<$Res> implements $EcommerceSplashScreenStatesCopyWith<$Res> {
  factory $DisplayEcommerceSplashScreenCopyWith(DisplayEcommerceSplashScreen value, $Res Function(DisplayEcommerceSplashScreen) _then) = _$DisplayEcommerceSplashScreenCopyWithImpl;
@useResult
$Res call({
 List<OfferDetailsModel> offerList
});




}
/// @nodoc
class _$DisplayEcommerceSplashScreenCopyWithImpl<$Res>
    implements $DisplayEcommerceSplashScreenCopyWith<$Res> {
  _$DisplayEcommerceSplashScreenCopyWithImpl(this._self, this._then);

  final DisplayEcommerceSplashScreen _self;
  final $Res Function(DisplayEcommerceSplashScreen) _then;

/// Create a copy of EcommerceSplashScreenStates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? offerList = null,}) {
  return _then(DisplayEcommerceSplashScreen(
null == offerList ? _self._offerList : offerList // ignore: cast_nullable_to_non_nullable
as List<OfferDetailsModel>,
  ));
}


}

/// @nodoc


class ShowNextScreen implements EcommerceSplashScreenStates {
  const ShowNextScreen(this.hasUserSignedIn);
  

 final  bool hasUserSignedIn;

/// Create a copy of EcommerceSplashScreenStates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShowNextScreenCopyWith<ShowNextScreen> get copyWith => _$ShowNextScreenCopyWithImpl<ShowNextScreen>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShowNextScreen&&(identical(other.hasUserSignedIn, hasUserSignedIn) || other.hasUserSignedIn == hasUserSignedIn));
}


@override
int get hashCode => Object.hash(runtimeType,hasUserSignedIn);

@override
String toString() {
  return 'EcommerceSplashScreenStates.showNextScreen(hasUserSignedIn: $hasUserSignedIn)';
}


}

/// @nodoc
abstract mixin class $ShowNextScreenCopyWith<$Res> implements $EcommerceSplashScreenStatesCopyWith<$Res> {
  factory $ShowNextScreenCopyWith(ShowNextScreen value, $Res Function(ShowNextScreen) _then) = _$ShowNextScreenCopyWithImpl;
@useResult
$Res call({
 bool hasUserSignedIn
});




}
/// @nodoc
class _$ShowNextScreenCopyWithImpl<$Res>
    implements $ShowNextScreenCopyWith<$Res> {
  _$ShowNextScreenCopyWithImpl(this._self, this._then);

  final ShowNextScreen _self;
  final $Res Function(ShowNextScreen) _then;

/// Create a copy of EcommerceSplashScreenStates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? hasUserSignedIn = null,}) {
  return _then(ShowNextScreen(
null == hasUserSignedIn ? _self.hasUserSignedIn : hasUserSignedIn // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
