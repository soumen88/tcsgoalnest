// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ecommerce_splash_screen_events.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EcommerceSplashScreenEvents {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EcommerceSplashScreenEvents);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EcommerceSplashScreenEvents()';
}


}

/// @nodoc
class $EcommerceSplashScreenEventsCopyWith<$Res>  {
$EcommerceSplashScreenEventsCopyWith(EcommerceSplashScreenEvents _, $Res Function(EcommerceSplashScreenEvents) __);
}


/// Adds pattern-matching-related methods to [EcommerceSplashScreenEvents].
extension EcommerceSplashScreenEventsPatterns on EcommerceSplashScreenEvents {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadOffersFromFirebaseEvent value)?  loadOffersFromFirebase,TResult Function( ShowSplashScreenEvent value)?  showSplashScreen,TResult Function( StartNextScreenEvent value)?  startNextScreen,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadOffersFromFirebaseEvent() when loadOffersFromFirebase != null:
return loadOffersFromFirebase(_that);case ShowSplashScreenEvent() when showSplashScreen != null:
return showSplashScreen(_that);case StartNextScreenEvent() when startNextScreen != null:
return startNextScreen(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadOffersFromFirebaseEvent value)  loadOffersFromFirebase,required TResult Function( ShowSplashScreenEvent value)  showSplashScreen,required TResult Function( StartNextScreenEvent value)  startNextScreen,}){
final _that = this;
switch (_that) {
case LoadOffersFromFirebaseEvent():
return loadOffersFromFirebase(_that);case ShowSplashScreenEvent():
return showSplashScreen(_that);case StartNextScreenEvent():
return startNextScreen(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadOffersFromFirebaseEvent value)?  loadOffersFromFirebase,TResult? Function( ShowSplashScreenEvent value)?  showSplashScreen,TResult? Function( StartNextScreenEvent value)?  startNextScreen,}){
final _that = this;
switch (_that) {
case LoadOffersFromFirebaseEvent() when loadOffersFromFirebase != null:
return loadOffersFromFirebase(_that);case ShowSplashScreenEvent() when showSplashScreen != null:
return showSplashScreen(_that);case StartNextScreenEvent() when startNextScreen != null:
return startNextScreen(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadOffersFromFirebase,TResult Function( List<OfferDetailsModel> offerList)?  showSplashScreen,TResult Function()?  startNextScreen,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadOffersFromFirebaseEvent() when loadOffersFromFirebase != null:
return loadOffersFromFirebase();case ShowSplashScreenEvent() when showSplashScreen != null:
return showSplashScreen(_that.offerList);case StartNextScreenEvent() when startNextScreen != null:
return startNextScreen();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadOffersFromFirebase,required TResult Function( List<OfferDetailsModel> offerList)  showSplashScreen,required TResult Function()  startNextScreen,}) {final _that = this;
switch (_that) {
case LoadOffersFromFirebaseEvent():
return loadOffersFromFirebase();case ShowSplashScreenEvent():
return showSplashScreen(_that.offerList);case StartNextScreenEvent():
return startNextScreen();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadOffersFromFirebase,TResult? Function( List<OfferDetailsModel> offerList)?  showSplashScreen,TResult? Function()?  startNextScreen,}) {final _that = this;
switch (_that) {
case LoadOffersFromFirebaseEvent() when loadOffersFromFirebase != null:
return loadOffersFromFirebase();case ShowSplashScreenEvent() when showSplashScreen != null:
return showSplashScreen(_that.offerList);case StartNextScreenEvent() when startNextScreen != null:
return startNextScreen();case _:
  return null;

}
}

}

/// @nodoc


class LoadOffersFromFirebaseEvent implements EcommerceSplashScreenEvents {
  const LoadOffersFromFirebaseEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadOffersFromFirebaseEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EcommerceSplashScreenEvents.loadOffersFromFirebase()';
}


}




/// @nodoc


class ShowSplashScreenEvent implements EcommerceSplashScreenEvents {
  const ShowSplashScreenEvent(final  List<OfferDetailsModel> offerList): _offerList = offerList;
  

 final  List<OfferDetailsModel> _offerList;
 List<OfferDetailsModel> get offerList {
  if (_offerList is EqualUnmodifiableListView) return _offerList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_offerList);
}


/// Create a copy of EcommerceSplashScreenEvents
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShowSplashScreenEventCopyWith<ShowSplashScreenEvent> get copyWith => _$ShowSplashScreenEventCopyWithImpl<ShowSplashScreenEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShowSplashScreenEvent&&const DeepCollectionEquality().equals(other._offerList, _offerList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_offerList));

@override
String toString() {
  return 'EcommerceSplashScreenEvents.showSplashScreen(offerList: $offerList)';
}


}

/// @nodoc
abstract mixin class $ShowSplashScreenEventCopyWith<$Res> implements $EcommerceSplashScreenEventsCopyWith<$Res> {
  factory $ShowSplashScreenEventCopyWith(ShowSplashScreenEvent value, $Res Function(ShowSplashScreenEvent) _then) = _$ShowSplashScreenEventCopyWithImpl;
@useResult
$Res call({
 List<OfferDetailsModel> offerList
});




}
/// @nodoc
class _$ShowSplashScreenEventCopyWithImpl<$Res>
    implements $ShowSplashScreenEventCopyWith<$Res> {
  _$ShowSplashScreenEventCopyWithImpl(this._self, this._then);

  final ShowSplashScreenEvent _self;
  final $Res Function(ShowSplashScreenEvent) _then;

/// Create a copy of EcommerceSplashScreenEvents
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? offerList = null,}) {
  return _then(ShowSplashScreenEvent(
null == offerList ? _self._offerList : offerList // ignore: cast_nullable_to_non_nullable
as List<OfferDetailsModel>,
  ));
}


}

/// @nodoc


class StartNextScreenEvent implements EcommerceSplashScreenEvents {
  const StartNextScreenEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StartNextScreenEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EcommerceSplashScreenEvents.startNextScreen()';
}


}




// dart format on
