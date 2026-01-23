// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'goal_categories_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GoalCategoriesModel {

@JsonKey(name: "categories") List<GoalTypeModel> get goalCategories;
/// Create a copy of GoalCategoriesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoalCategoriesModelCopyWith<GoalCategoriesModel> get copyWith => _$GoalCategoriesModelCopyWithImpl<GoalCategoriesModel>(this as GoalCategoriesModel, _$identity);

  /// Serializes this GoalCategoriesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoalCategoriesModel&&const DeepCollectionEquality().equals(other.goalCategories, goalCategories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(goalCategories));

@override
String toString() {
  return 'GoalCategoriesModel(goalCategories: $goalCategories)';
}


}

/// @nodoc
abstract mixin class $GoalCategoriesModelCopyWith<$Res>  {
  factory $GoalCategoriesModelCopyWith(GoalCategoriesModel value, $Res Function(GoalCategoriesModel) _then) = _$GoalCategoriesModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "categories") List<GoalTypeModel> goalCategories
});




}
/// @nodoc
class _$GoalCategoriesModelCopyWithImpl<$Res>
    implements $GoalCategoriesModelCopyWith<$Res> {
  _$GoalCategoriesModelCopyWithImpl(this._self, this._then);

  final GoalCategoriesModel _self;
  final $Res Function(GoalCategoriesModel) _then;

/// Create a copy of GoalCategoriesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? goalCategories = null,}) {
  return _then(_self.copyWith(
goalCategories: null == goalCategories ? _self.goalCategories : goalCategories // ignore: cast_nullable_to_non_nullable
as List<GoalTypeModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [GoalCategoriesModel].
extension GoalCategoriesModelPatterns on GoalCategoriesModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GoalCategoriesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GoalCategoriesModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GoalCategoriesModel value)  $default,){
final _that = this;
switch (_that) {
case _GoalCategoriesModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GoalCategoriesModel value)?  $default,){
final _that = this;
switch (_that) {
case _GoalCategoriesModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "categories")  List<GoalTypeModel> goalCategories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GoalCategoriesModel() when $default != null:
return $default(_that.goalCategories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "categories")  List<GoalTypeModel> goalCategories)  $default,) {final _that = this;
switch (_that) {
case _GoalCategoriesModel():
return $default(_that.goalCategories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "categories")  List<GoalTypeModel> goalCategories)?  $default,) {final _that = this;
switch (_that) {
case _GoalCategoriesModel() when $default != null:
return $default(_that.goalCategories);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _GoalCategoriesModel implements GoalCategoriesModel {
  const _GoalCategoriesModel({@JsonKey(name: "categories") required final  List<GoalTypeModel> goalCategories}): _goalCategories = goalCategories;
  factory _GoalCategoriesModel.fromJson(Map<String, dynamic> json) => _$GoalCategoriesModelFromJson(json);

 final  List<GoalTypeModel> _goalCategories;
@override@JsonKey(name: "categories") List<GoalTypeModel> get goalCategories {
  if (_goalCategories is EqualUnmodifiableListView) return _goalCategories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_goalCategories);
}


/// Create a copy of GoalCategoriesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoalCategoriesModelCopyWith<_GoalCategoriesModel> get copyWith => __$GoalCategoriesModelCopyWithImpl<_GoalCategoriesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GoalCategoriesModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoalCategoriesModel&&const DeepCollectionEquality().equals(other._goalCategories, _goalCategories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_goalCategories));

@override
String toString() {
  return 'GoalCategoriesModel(goalCategories: $goalCategories)';
}


}

/// @nodoc
abstract mixin class _$GoalCategoriesModelCopyWith<$Res> implements $GoalCategoriesModelCopyWith<$Res> {
  factory _$GoalCategoriesModelCopyWith(_GoalCategoriesModel value, $Res Function(_GoalCategoriesModel) _then) = __$GoalCategoriesModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "categories") List<GoalTypeModel> goalCategories
});




}
/// @nodoc
class __$GoalCategoriesModelCopyWithImpl<$Res>
    implements _$GoalCategoriesModelCopyWith<$Res> {
  __$GoalCategoriesModelCopyWithImpl(this._self, this._then);

  final _GoalCategoriesModel _self;
  final $Res Function(_GoalCategoriesModel) _then;

/// Create a copy of GoalCategoriesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? goalCategories = null,}) {
  return _then(_GoalCategoriesModel(
goalCategories: null == goalCategories ? _self._goalCategories : goalCategories // ignore: cast_nullable_to_non_nullable
as List<GoalTypeModel>,
  ));
}


}

// dart format on
