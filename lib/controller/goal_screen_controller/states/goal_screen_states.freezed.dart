// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'goal_screen_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GoalScreenStates {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoalScreenStates);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GoalScreenStates()';
}


}

/// @nodoc
class $GoalScreenStatesCopyWith<$Res>  {
$GoalScreenStatesCopyWith(GoalScreenStates _, $Res Function(GoalScreenStates) __);
}


/// Adds pattern-matching-related methods to [GoalScreenStates].
extension GoalScreenStatesPatterns on GoalScreenStates {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DisplayLoadingView value)?  loadingView,TResult Function( DisplayErrorView value)?  errorView,TResult Function( DisplayAllGoalsView value)?  displayAllGoals,TResult Function( FillGoalDetailsView value)?  fillGoalDetailsView,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DisplayLoadingView() when loadingView != null:
return loadingView(_that);case DisplayErrorView() when errorView != null:
return errorView(_that);case DisplayAllGoalsView() when displayAllGoals != null:
return displayAllGoals(_that);case FillGoalDetailsView() when fillGoalDetailsView != null:
return fillGoalDetailsView(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DisplayLoadingView value)  loadingView,required TResult Function( DisplayErrorView value)  errorView,required TResult Function( DisplayAllGoalsView value)  displayAllGoals,required TResult Function( FillGoalDetailsView value)  fillGoalDetailsView,}){
final _that = this;
switch (_that) {
case DisplayLoadingView():
return loadingView(_that);case DisplayErrorView():
return errorView(_that);case DisplayAllGoalsView():
return displayAllGoals(_that);case FillGoalDetailsView():
return fillGoalDetailsView(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DisplayLoadingView value)?  loadingView,TResult? Function( DisplayErrorView value)?  errorView,TResult? Function( DisplayAllGoalsView value)?  displayAllGoals,TResult? Function( FillGoalDetailsView value)?  fillGoalDetailsView,}){
final _that = this;
switch (_that) {
case DisplayLoadingView() when loadingView != null:
return loadingView(_that);case DisplayErrorView() when errorView != null:
return errorView(_that);case DisplayAllGoalsView() when displayAllGoals != null:
return displayAllGoals(_that);case FillGoalDetailsView() when fillGoalDetailsView != null:
return fillGoalDetailsView(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadingView,TResult Function( String errorMessage)?  errorView,TResult Function( GoalCategoriesModel goalCategories)?  displayAllGoals,TResult Function( GoalTypeModel userSelectedGoal)?  fillGoalDetailsView,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DisplayLoadingView() when loadingView != null:
return loadingView();case DisplayErrorView() when errorView != null:
return errorView(_that.errorMessage);case DisplayAllGoalsView() when displayAllGoals != null:
return displayAllGoals(_that.goalCategories);case FillGoalDetailsView() when fillGoalDetailsView != null:
return fillGoalDetailsView(_that.userSelectedGoal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadingView,required TResult Function( String errorMessage)  errorView,required TResult Function( GoalCategoriesModel goalCategories)  displayAllGoals,required TResult Function( GoalTypeModel userSelectedGoal)  fillGoalDetailsView,}) {final _that = this;
switch (_that) {
case DisplayLoadingView():
return loadingView();case DisplayErrorView():
return errorView(_that.errorMessage);case DisplayAllGoalsView():
return displayAllGoals(_that.goalCategories);case FillGoalDetailsView():
return fillGoalDetailsView(_that.userSelectedGoal);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadingView,TResult? Function( String errorMessage)?  errorView,TResult? Function( GoalCategoriesModel goalCategories)?  displayAllGoals,TResult? Function( GoalTypeModel userSelectedGoal)?  fillGoalDetailsView,}) {final _that = this;
switch (_that) {
case DisplayLoadingView() when loadingView != null:
return loadingView();case DisplayErrorView() when errorView != null:
return errorView(_that.errorMessage);case DisplayAllGoalsView() when displayAllGoals != null:
return displayAllGoals(_that.goalCategories);case FillGoalDetailsView() when fillGoalDetailsView != null:
return fillGoalDetailsView(_that.userSelectedGoal);case _:
  return null;

}
}

}

/// @nodoc


class DisplayLoadingView implements GoalScreenStates {
  const DisplayLoadingView();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DisplayLoadingView);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GoalScreenStates.loadingView()';
}


}




/// @nodoc


class DisplayErrorView implements GoalScreenStates {
  const DisplayErrorView(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of GoalScreenStates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DisplayErrorViewCopyWith<DisplayErrorView> get copyWith => _$DisplayErrorViewCopyWithImpl<DisplayErrorView>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DisplayErrorView&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'GoalScreenStates.errorView(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $DisplayErrorViewCopyWith<$Res> implements $GoalScreenStatesCopyWith<$Res> {
  factory $DisplayErrorViewCopyWith(DisplayErrorView value, $Res Function(DisplayErrorView) _then) = _$DisplayErrorViewCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$DisplayErrorViewCopyWithImpl<$Res>
    implements $DisplayErrorViewCopyWith<$Res> {
  _$DisplayErrorViewCopyWithImpl(this._self, this._then);

  final DisplayErrorView _self;
  final $Res Function(DisplayErrorView) _then;

/// Create a copy of GoalScreenStates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(DisplayErrorView(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DisplayAllGoalsView implements GoalScreenStates {
  const DisplayAllGoalsView(this.goalCategories);
  

 final  GoalCategoriesModel goalCategories;

/// Create a copy of GoalScreenStates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DisplayAllGoalsViewCopyWith<DisplayAllGoalsView> get copyWith => _$DisplayAllGoalsViewCopyWithImpl<DisplayAllGoalsView>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DisplayAllGoalsView&&(identical(other.goalCategories, goalCategories) || other.goalCategories == goalCategories));
}


@override
int get hashCode => Object.hash(runtimeType,goalCategories);

@override
String toString() {
  return 'GoalScreenStates.displayAllGoals(goalCategories: $goalCategories)';
}


}

/// @nodoc
abstract mixin class $DisplayAllGoalsViewCopyWith<$Res> implements $GoalScreenStatesCopyWith<$Res> {
  factory $DisplayAllGoalsViewCopyWith(DisplayAllGoalsView value, $Res Function(DisplayAllGoalsView) _then) = _$DisplayAllGoalsViewCopyWithImpl;
@useResult
$Res call({
 GoalCategoriesModel goalCategories
});


$GoalCategoriesModelCopyWith<$Res> get goalCategories;

}
/// @nodoc
class _$DisplayAllGoalsViewCopyWithImpl<$Res>
    implements $DisplayAllGoalsViewCopyWith<$Res> {
  _$DisplayAllGoalsViewCopyWithImpl(this._self, this._then);

  final DisplayAllGoalsView _self;
  final $Res Function(DisplayAllGoalsView) _then;

/// Create a copy of GoalScreenStates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? goalCategories = null,}) {
  return _then(DisplayAllGoalsView(
null == goalCategories ? _self.goalCategories : goalCategories // ignore: cast_nullable_to_non_nullable
as GoalCategoriesModel,
  ));
}

/// Create a copy of GoalScreenStates
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GoalCategoriesModelCopyWith<$Res> get goalCategories {
  
  return $GoalCategoriesModelCopyWith<$Res>(_self.goalCategories, (value) {
    return _then(_self.copyWith(goalCategories: value));
  });
}
}

/// @nodoc


class FillGoalDetailsView implements GoalScreenStates {
  const FillGoalDetailsView(this.userSelectedGoal);
  

 final  GoalTypeModel userSelectedGoal;

/// Create a copy of GoalScreenStates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FillGoalDetailsViewCopyWith<FillGoalDetailsView> get copyWith => _$FillGoalDetailsViewCopyWithImpl<FillGoalDetailsView>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FillGoalDetailsView&&(identical(other.userSelectedGoal, userSelectedGoal) || other.userSelectedGoal == userSelectedGoal));
}


@override
int get hashCode => Object.hash(runtimeType,userSelectedGoal);

@override
String toString() {
  return 'GoalScreenStates.fillGoalDetailsView(userSelectedGoal: $userSelectedGoal)';
}


}

/// @nodoc
abstract mixin class $FillGoalDetailsViewCopyWith<$Res> implements $GoalScreenStatesCopyWith<$Res> {
  factory $FillGoalDetailsViewCopyWith(FillGoalDetailsView value, $Res Function(FillGoalDetailsView) _then) = _$FillGoalDetailsViewCopyWithImpl;
@useResult
$Res call({
 GoalTypeModel userSelectedGoal
});


$GoalTypeModelCopyWith<$Res> get userSelectedGoal;

}
/// @nodoc
class _$FillGoalDetailsViewCopyWithImpl<$Res>
    implements $FillGoalDetailsViewCopyWith<$Res> {
  _$FillGoalDetailsViewCopyWithImpl(this._self, this._then);

  final FillGoalDetailsView _self;
  final $Res Function(FillGoalDetailsView) _then;

/// Create a copy of GoalScreenStates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userSelectedGoal = null,}) {
  return _then(FillGoalDetailsView(
null == userSelectedGoal ? _self.userSelectedGoal : userSelectedGoal // ignore: cast_nullable_to_non_nullable
as GoalTypeModel,
  ));
}

/// Create a copy of GoalScreenStates
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GoalTypeModelCopyWith<$Res> get userSelectedGoal {
  
  return $GoalTypeModelCopyWith<$Res>(_self.userSelectedGoal, (value) {
    return _then(_self.copyWith(userSelectedGoal: value));
  });
}
}

// dart format on
