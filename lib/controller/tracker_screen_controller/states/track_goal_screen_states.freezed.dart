// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'track_goal_screen_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrackGoalScreenStates {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrackGoalScreenStates);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrackGoalScreenStates()';
}


}

/// @nodoc
class $TrackGoalScreenStatesCopyWith<$Res>  {
$TrackGoalScreenStatesCopyWith(TrackGoalScreenStates _, $Res Function(TrackGoalScreenStates) __);
}


/// Adds pattern-matching-related methods to [TrackGoalScreenStates].
extension TrackGoalScreenStatesPatterns on TrackGoalScreenStates {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DisplayTrackerLoading value)?  displayLoadingView,TResult Function( DisplayTrackerError value)?  error,TResult Function( DisplaySingleGoal value)?  displaySingleGoal,TResult Function( DisplayAllGoals value)?  displayGoals,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DisplayTrackerLoading() when displayLoadingView != null:
return displayLoadingView(_that);case DisplayTrackerError() when error != null:
return error(_that);case DisplaySingleGoal() when displaySingleGoal != null:
return displaySingleGoal(_that);case DisplayAllGoals() when displayGoals != null:
return displayGoals(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DisplayTrackerLoading value)  displayLoadingView,required TResult Function( DisplayTrackerError value)  error,required TResult Function( DisplaySingleGoal value)  displaySingleGoal,required TResult Function( DisplayAllGoals value)  displayGoals,}){
final _that = this;
switch (_that) {
case DisplayTrackerLoading():
return displayLoadingView(_that);case DisplayTrackerError():
return error(_that);case DisplaySingleGoal():
return displaySingleGoal(_that);case DisplayAllGoals():
return displayGoals(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DisplayTrackerLoading value)?  displayLoadingView,TResult? Function( DisplayTrackerError value)?  error,TResult? Function( DisplaySingleGoal value)?  displaySingleGoal,TResult? Function( DisplayAllGoals value)?  displayGoals,}){
final _that = this;
switch (_that) {
case DisplayTrackerLoading() when displayLoadingView != null:
return displayLoadingView(_that);case DisplayTrackerError() when error != null:
return error(_that);case DisplaySingleGoal() when displaySingleGoal != null:
return displaySingleGoal(_that);case DisplayAllGoals() when displayGoals != null:
return displayGoals(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  displayLoadingView,TResult Function( String errorMessage)?  error,TResult Function( GoalStoreData singleGoalDetails)?  displaySingleGoal,TResult Function()?  displayGoals,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DisplayTrackerLoading() when displayLoadingView != null:
return displayLoadingView();case DisplayTrackerError() when error != null:
return error(_that.errorMessage);case DisplaySingleGoal() when displaySingleGoal != null:
return displaySingleGoal(_that.singleGoalDetails);case DisplayAllGoals() when displayGoals != null:
return displayGoals();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  displayLoadingView,required TResult Function( String errorMessage)  error,required TResult Function( GoalStoreData singleGoalDetails)  displaySingleGoal,required TResult Function()  displayGoals,}) {final _that = this;
switch (_that) {
case DisplayTrackerLoading():
return displayLoadingView();case DisplayTrackerError():
return error(_that.errorMessage);case DisplaySingleGoal():
return displaySingleGoal(_that.singleGoalDetails);case DisplayAllGoals():
return displayGoals();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  displayLoadingView,TResult? Function( String errorMessage)?  error,TResult? Function( GoalStoreData singleGoalDetails)?  displaySingleGoal,TResult? Function()?  displayGoals,}) {final _that = this;
switch (_that) {
case DisplayTrackerLoading() when displayLoadingView != null:
return displayLoadingView();case DisplayTrackerError() when error != null:
return error(_that.errorMessage);case DisplaySingleGoal() when displaySingleGoal != null:
return displaySingleGoal(_that.singleGoalDetails);case DisplayAllGoals() when displayGoals != null:
return displayGoals();case _:
  return null;

}
}

}

/// @nodoc


class DisplayTrackerLoading implements TrackGoalScreenStates {
  const DisplayTrackerLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DisplayTrackerLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrackGoalScreenStates.displayLoadingView()';
}


}




/// @nodoc


class DisplayTrackerError implements TrackGoalScreenStates {
  const DisplayTrackerError(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of TrackGoalScreenStates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DisplayTrackerErrorCopyWith<DisplayTrackerError> get copyWith => _$DisplayTrackerErrorCopyWithImpl<DisplayTrackerError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DisplayTrackerError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'TrackGoalScreenStates.error(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $DisplayTrackerErrorCopyWith<$Res> implements $TrackGoalScreenStatesCopyWith<$Res> {
  factory $DisplayTrackerErrorCopyWith(DisplayTrackerError value, $Res Function(DisplayTrackerError) _then) = _$DisplayTrackerErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$DisplayTrackerErrorCopyWithImpl<$Res>
    implements $DisplayTrackerErrorCopyWith<$Res> {
  _$DisplayTrackerErrorCopyWithImpl(this._self, this._then);

  final DisplayTrackerError _self;
  final $Res Function(DisplayTrackerError) _then;

/// Create a copy of TrackGoalScreenStates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(DisplayTrackerError(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DisplaySingleGoal implements TrackGoalScreenStates {
  const DisplaySingleGoal(this.singleGoalDetails);
  

 final  GoalStoreData singleGoalDetails;

/// Create a copy of TrackGoalScreenStates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DisplaySingleGoalCopyWith<DisplaySingleGoal> get copyWith => _$DisplaySingleGoalCopyWithImpl<DisplaySingleGoal>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DisplaySingleGoal&&(identical(other.singleGoalDetails, singleGoalDetails) || other.singleGoalDetails == singleGoalDetails));
}


@override
int get hashCode => Object.hash(runtimeType,singleGoalDetails);

@override
String toString() {
  return 'TrackGoalScreenStates.displaySingleGoal(singleGoalDetails: $singleGoalDetails)';
}


}

/// @nodoc
abstract mixin class $DisplaySingleGoalCopyWith<$Res> implements $TrackGoalScreenStatesCopyWith<$Res> {
  factory $DisplaySingleGoalCopyWith(DisplaySingleGoal value, $Res Function(DisplaySingleGoal) _then) = _$DisplaySingleGoalCopyWithImpl;
@useResult
$Res call({
 GoalStoreData singleGoalDetails
});




}
/// @nodoc
class _$DisplaySingleGoalCopyWithImpl<$Res>
    implements $DisplaySingleGoalCopyWith<$Res> {
  _$DisplaySingleGoalCopyWithImpl(this._self, this._then);

  final DisplaySingleGoal _self;
  final $Res Function(DisplaySingleGoal) _then;

/// Create a copy of TrackGoalScreenStates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? singleGoalDetails = null,}) {
  return _then(DisplaySingleGoal(
null == singleGoalDetails ? _self.singleGoalDetails : singleGoalDetails // ignore: cast_nullable_to_non_nullable
as GoalStoreData,
  ));
}


}

/// @nodoc


class DisplayAllGoals implements TrackGoalScreenStates {
  const DisplayAllGoals();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DisplayAllGoals);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrackGoalScreenStates.displayGoals()';
}


}




// dart format on
