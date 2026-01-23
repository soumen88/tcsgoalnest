// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'goal_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GoalTypeModel {

 String get id; String get name; String get image; List<GoalModel> get goals;
/// Create a copy of GoalTypeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoalTypeModelCopyWith<GoalTypeModel> get copyWith => _$GoalTypeModelCopyWithImpl<GoalTypeModel>(this as GoalTypeModel, _$identity);

  /// Serializes this GoalTypeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoalTypeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&const DeepCollectionEquality().equals(other.goals, goals));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,image,const DeepCollectionEquality().hash(goals));

@override
String toString() {
  return 'GoalTypeModel(id: $id, name: $name, image: $image, goals: $goals)';
}


}

/// @nodoc
abstract mixin class $GoalTypeModelCopyWith<$Res>  {
  factory $GoalTypeModelCopyWith(GoalTypeModel value, $Res Function(GoalTypeModel) _then) = _$GoalTypeModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String image, List<GoalModel> goals
});




}
/// @nodoc
class _$GoalTypeModelCopyWithImpl<$Res>
    implements $GoalTypeModelCopyWith<$Res> {
  _$GoalTypeModelCopyWithImpl(this._self, this._then);

  final GoalTypeModel _self;
  final $Res Function(GoalTypeModel) _then;

/// Create a copy of GoalTypeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? image = null,Object? goals = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,goals: null == goals ? _self.goals : goals // ignore: cast_nullable_to_non_nullable
as List<GoalModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [GoalTypeModel].
extension GoalTypeModelPatterns on GoalTypeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GoalTypeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GoalTypeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GoalTypeModel value)  $default,){
final _that = this;
switch (_that) {
case _GoalTypeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GoalTypeModel value)?  $default,){
final _that = this;
switch (_that) {
case _GoalTypeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String image,  List<GoalModel> goals)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GoalTypeModel() when $default != null:
return $default(_that.id,_that.name,_that.image,_that.goals);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String image,  List<GoalModel> goals)  $default,) {final _that = this;
switch (_that) {
case _GoalTypeModel():
return $default(_that.id,_that.name,_that.image,_that.goals);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String image,  List<GoalModel> goals)?  $default,) {final _that = this;
switch (_that) {
case _GoalTypeModel() when $default != null:
return $default(_that.id,_that.name,_that.image,_that.goals);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _GoalTypeModel implements GoalTypeModel {
  const _GoalTypeModel({required this.id, required this.name, required this.image, required final  List<GoalModel> goals}): _goals = goals;
  factory _GoalTypeModel.fromJson(Map<String, dynamic> json) => _$GoalTypeModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String image;
 final  List<GoalModel> _goals;
@override List<GoalModel> get goals {
  if (_goals is EqualUnmodifiableListView) return _goals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_goals);
}


/// Create a copy of GoalTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoalTypeModelCopyWith<_GoalTypeModel> get copyWith => __$GoalTypeModelCopyWithImpl<_GoalTypeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GoalTypeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoalTypeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&const DeepCollectionEquality().equals(other._goals, _goals));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,image,const DeepCollectionEquality().hash(_goals));

@override
String toString() {
  return 'GoalTypeModel(id: $id, name: $name, image: $image, goals: $goals)';
}


}

/// @nodoc
abstract mixin class _$GoalTypeModelCopyWith<$Res> implements $GoalTypeModelCopyWith<$Res> {
  factory _$GoalTypeModelCopyWith(_GoalTypeModel value, $Res Function(_GoalTypeModel) _then) = __$GoalTypeModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String image, List<GoalModel> goals
});




}
/// @nodoc
class __$GoalTypeModelCopyWithImpl<$Res>
    implements _$GoalTypeModelCopyWith<$Res> {
  __$GoalTypeModelCopyWithImpl(this._self, this._then);

  final _GoalTypeModel _self;
  final $Res Function(_GoalTypeModel) _then;

/// Create a copy of GoalTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? image = null,Object? goals = null,}) {
  return _then(_GoalTypeModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,goals: null == goals ? _self._goals : goals // ignore: cast_nullable_to_non_nullable
as List<GoalModel>,
  ));
}


}

// dart format on
