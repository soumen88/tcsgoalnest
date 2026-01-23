// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'goal_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GoalModel {

 String get name; String get description;@JsonKey(name: "typicalTimeFrame") String get timeFrame; ExampleTargetAmountModel get exampleTargetAmount;
/// Create a copy of GoalModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoalModelCopyWith<GoalModel> get copyWith => _$GoalModelCopyWithImpl<GoalModel>(this as GoalModel, _$identity);

  /// Serializes this GoalModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoalModel&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.timeFrame, timeFrame) || other.timeFrame == timeFrame)&&(identical(other.exampleTargetAmount, exampleTargetAmount) || other.exampleTargetAmount == exampleTargetAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,timeFrame,exampleTargetAmount);

@override
String toString() {
  return 'GoalModel(name: $name, description: $description, timeFrame: $timeFrame, exampleTargetAmount: $exampleTargetAmount)';
}


}

/// @nodoc
abstract mixin class $GoalModelCopyWith<$Res>  {
  factory $GoalModelCopyWith(GoalModel value, $Res Function(GoalModel) _then) = _$GoalModelCopyWithImpl;
@useResult
$Res call({
 String name, String description,@JsonKey(name: "typicalTimeFrame") String timeFrame, ExampleTargetAmountModel exampleTargetAmount
});


$ExampleTargetAmountModelCopyWith<$Res> get exampleTargetAmount;

}
/// @nodoc
class _$GoalModelCopyWithImpl<$Res>
    implements $GoalModelCopyWith<$Res> {
  _$GoalModelCopyWithImpl(this._self, this._then);

  final GoalModel _self;
  final $Res Function(GoalModel) _then;

/// Create a copy of GoalModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = null,Object? timeFrame = null,Object? exampleTargetAmount = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,timeFrame: null == timeFrame ? _self.timeFrame : timeFrame // ignore: cast_nullable_to_non_nullable
as String,exampleTargetAmount: null == exampleTargetAmount ? _self.exampleTargetAmount : exampleTargetAmount // ignore: cast_nullable_to_non_nullable
as ExampleTargetAmountModel,
  ));
}
/// Create a copy of GoalModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExampleTargetAmountModelCopyWith<$Res> get exampleTargetAmount {
  
  return $ExampleTargetAmountModelCopyWith<$Res>(_self.exampleTargetAmount, (value) {
    return _then(_self.copyWith(exampleTargetAmount: value));
  });
}
}


/// Adds pattern-matching-related methods to [GoalModel].
extension GoalModelPatterns on GoalModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GoalModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GoalModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GoalModel value)  $default,){
final _that = this;
switch (_that) {
case _GoalModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GoalModel value)?  $default,){
final _that = this;
switch (_that) {
case _GoalModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String description, @JsonKey(name: "typicalTimeFrame")  String timeFrame,  ExampleTargetAmountModel exampleTargetAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GoalModel() when $default != null:
return $default(_that.name,_that.description,_that.timeFrame,_that.exampleTargetAmount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String description, @JsonKey(name: "typicalTimeFrame")  String timeFrame,  ExampleTargetAmountModel exampleTargetAmount)  $default,) {final _that = this;
switch (_that) {
case _GoalModel():
return $default(_that.name,_that.description,_that.timeFrame,_that.exampleTargetAmount);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String description, @JsonKey(name: "typicalTimeFrame")  String timeFrame,  ExampleTargetAmountModel exampleTargetAmount)?  $default,) {final _that = this;
switch (_that) {
case _GoalModel() when $default != null:
return $default(_that.name,_that.description,_that.timeFrame,_that.exampleTargetAmount);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _GoalModel implements GoalModel {
  const _GoalModel({required this.name, required this.description, @JsonKey(name: "typicalTimeFrame") required this.timeFrame, required this.exampleTargetAmount});
  factory _GoalModel.fromJson(Map<String, dynamic> json) => _$GoalModelFromJson(json);

@override final  String name;
@override final  String description;
@override@JsonKey(name: "typicalTimeFrame") final  String timeFrame;
@override final  ExampleTargetAmountModel exampleTargetAmount;

/// Create a copy of GoalModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoalModelCopyWith<_GoalModel> get copyWith => __$GoalModelCopyWithImpl<_GoalModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GoalModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoalModel&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.timeFrame, timeFrame) || other.timeFrame == timeFrame)&&(identical(other.exampleTargetAmount, exampleTargetAmount) || other.exampleTargetAmount == exampleTargetAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,timeFrame,exampleTargetAmount);

@override
String toString() {
  return 'GoalModel(name: $name, description: $description, timeFrame: $timeFrame, exampleTargetAmount: $exampleTargetAmount)';
}


}

/// @nodoc
abstract mixin class _$GoalModelCopyWith<$Res> implements $GoalModelCopyWith<$Res> {
  factory _$GoalModelCopyWith(_GoalModel value, $Res Function(_GoalModel) _then) = __$GoalModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String description,@JsonKey(name: "typicalTimeFrame") String timeFrame, ExampleTargetAmountModel exampleTargetAmount
});


@override $ExampleTargetAmountModelCopyWith<$Res> get exampleTargetAmount;

}
/// @nodoc
class __$GoalModelCopyWithImpl<$Res>
    implements _$GoalModelCopyWith<$Res> {
  __$GoalModelCopyWithImpl(this._self, this._then);

  final _GoalModel _self;
  final $Res Function(_GoalModel) _then;

/// Create a copy of GoalModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = null,Object? timeFrame = null,Object? exampleTargetAmount = null,}) {
  return _then(_GoalModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,timeFrame: null == timeFrame ? _self.timeFrame : timeFrame // ignore: cast_nullable_to_non_nullable
as String,exampleTargetAmount: null == exampleTargetAmount ? _self.exampleTargetAmount : exampleTargetAmount // ignore: cast_nullable_to_non_nullable
as ExampleTargetAmountModel,
  ));
}

/// Create a copy of GoalModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExampleTargetAmountModelCopyWith<$Res> get exampleTargetAmount {
  
  return $ExampleTargetAmountModelCopyWith<$Res>(_self.exampleTargetAmount, (value) {
    return _then(_self.copyWith(exampleTargetAmount: value));
  });
}
}

// dart format on
