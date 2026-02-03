// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'goal_screen_events.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GoalScreenEvents {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoalScreenEvents);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GoalScreenEvents()';
}


}

/// @nodoc
class $GoalScreenEventsCopyWith<$Res>  {
$GoalScreenEventsCopyWith(GoalScreenEvents _, $Res Function(GoalScreenEvents) __);
}


/// Adds pattern-matching-related methods to [GoalScreenEvents].
extension GoalScreenEventsPatterns on GoalScreenEvents {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadGoalsFromFirebaseEvent value)?  loadGoalsFromFirebase,TResult Function( GoalSelectedEvent value)?  goalSelected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadGoalsFromFirebaseEvent() when loadGoalsFromFirebase != null:
return loadGoalsFromFirebase(_that);case GoalSelectedEvent() when goalSelected != null:
return goalSelected(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadGoalsFromFirebaseEvent value)  loadGoalsFromFirebase,required TResult Function( GoalSelectedEvent value)  goalSelected,}){
final _that = this;
switch (_that) {
case LoadGoalsFromFirebaseEvent():
return loadGoalsFromFirebase(_that);case GoalSelectedEvent():
return goalSelected(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadGoalsFromFirebaseEvent value)?  loadGoalsFromFirebase,TResult? Function( GoalSelectedEvent value)?  goalSelected,}){
final _that = this;
switch (_that) {
case LoadGoalsFromFirebaseEvent() when loadGoalsFromFirebase != null:
return loadGoalsFromFirebase(_that);case GoalSelectedEvent() when goalSelected != null:
return goalSelected(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadGoalsFromFirebase,TResult Function( GoalTypeModel goalSelected)?  goalSelected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadGoalsFromFirebaseEvent() when loadGoalsFromFirebase != null:
return loadGoalsFromFirebase();case GoalSelectedEvent() when goalSelected != null:
return goalSelected(_that.goalSelected);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadGoalsFromFirebase,required TResult Function( GoalTypeModel goalSelected)  goalSelected,}) {final _that = this;
switch (_that) {
case LoadGoalsFromFirebaseEvent():
return loadGoalsFromFirebase();case GoalSelectedEvent():
return goalSelected(_that.goalSelected);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadGoalsFromFirebase,TResult? Function( GoalTypeModel goalSelected)?  goalSelected,}) {final _that = this;
switch (_that) {
case LoadGoalsFromFirebaseEvent() when loadGoalsFromFirebase != null:
return loadGoalsFromFirebase();case GoalSelectedEvent() when goalSelected != null:
return goalSelected(_that.goalSelected);case _:
  return null;

}
}

}

/// @nodoc


class LoadGoalsFromFirebaseEvent implements GoalScreenEvents {
  const LoadGoalsFromFirebaseEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadGoalsFromFirebaseEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GoalScreenEvents.loadGoalsFromFirebase()';
}


}




/// @nodoc


class GoalSelectedEvent implements GoalScreenEvents {
  const GoalSelectedEvent(this.goalSelected);
  

 final  GoalTypeModel goalSelected;

/// Create a copy of GoalScreenEvents
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoalSelectedEventCopyWith<GoalSelectedEvent> get copyWith => _$GoalSelectedEventCopyWithImpl<GoalSelectedEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoalSelectedEvent&&(identical(other.goalSelected, goalSelected) || other.goalSelected == goalSelected));
}


@override
int get hashCode => Object.hash(runtimeType,goalSelected);

@override
String toString() {
  return 'GoalScreenEvents.goalSelected(goalSelected: $goalSelected)';
}


}

/// @nodoc
abstract mixin class $GoalSelectedEventCopyWith<$Res> implements $GoalScreenEventsCopyWith<$Res> {
  factory $GoalSelectedEventCopyWith(GoalSelectedEvent value, $Res Function(GoalSelectedEvent) _then) = _$GoalSelectedEventCopyWithImpl;
@useResult
$Res call({
 GoalTypeModel goalSelected
});


$GoalTypeModelCopyWith<$Res> get goalSelected;

}
/// @nodoc
class _$GoalSelectedEventCopyWithImpl<$Res>
    implements $GoalSelectedEventCopyWith<$Res> {
  _$GoalSelectedEventCopyWithImpl(this._self, this._then);

  final GoalSelectedEvent _self;
  final $Res Function(GoalSelectedEvent) _then;

/// Create a copy of GoalScreenEvents
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? goalSelected = null,}) {
  return _then(GoalSelectedEvent(
null == goalSelected ? _self.goalSelected : goalSelected // ignore: cast_nullable_to_non_nullable
as GoalTypeModel,
  ));
}

/// Create a copy of GoalScreenEvents
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GoalTypeModelCopyWith<$Res> get goalSelected {
  
  return $GoalTypeModelCopyWith<$Res>(_self.goalSelected, (value) {
    return _then(_self.copyWith(goalSelected: value));
  });
}
}

// dart format on
