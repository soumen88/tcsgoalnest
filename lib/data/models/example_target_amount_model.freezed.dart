// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'example_target_amount_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExampleTargetAmountModel {

@JsonKey(name: "min") int? get minAmount;@JsonKey(name: "max") int? get maxAmount; String get currency;
/// Create a copy of ExampleTargetAmountModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExampleTargetAmountModelCopyWith<ExampleTargetAmountModel> get copyWith => _$ExampleTargetAmountModelCopyWithImpl<ExampleTargetAmountModel>(this as ExampleTargetAmountModel, _$identity);

  /// Serializes this ExampleTargetAmountModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExampleTargetAmountModel&&(identical(other.minAmount, minAmount) || other.minAmount == minAmount)&&(identical(other.maxAmount, maxAmount) || other.maxAmount == maxAmount)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minAmount,maxAmount,currency);

@override
String toString() {
  return 'ExampleTargetAmountModel(minAmount: $minAmount, maxAmount: $maxAmount, currency: $currency)';
}


}

/// @nodoc
abstract mixin class $ExampleTargetAmountModelCopyWith<$Res>  {
  factory $ExampleTargetAmountModelCopyWith(ExampleTargetAmountModel value, $Res Function(ExampleTargetAmountModel) _then) = _$ExampleTargetAmountModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "min") int? minAmount,@JsonKey(name: "max") int? maxAmount, String currency
});




}
/// @nodoc
class _$ExampleTargetAmountModelCopyWithImpl<$Res>
    implements $ExampleTargetAmountModelCopyWith<$Res> {
  _$ExampleTargetAmountModelCopyWithImpl(this._self, this._then);

  final ExampleTargetAmountModel _self;
  final $Res Function(ExampleTargetAmountModel) _then;

/// Create a copy of ExampleTargetAmountModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? minAmount = freezed,Object? maxAmount = freezed,Object? currency = null,}) {
  return _then(_self.copyWith(
minAmount: freezed == minAmount ? _self.minAmount : minAmount // ignore: cast_nullable_to_non_nullable
as int?,maxAmount: freezed == maxAmount ? _self.maxAmount : maxAmount // ignore: cast_nullable_to_non_nullable
as int?,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ExampleTargetAmountModel].
extension ExampleTargetAmountModelPatterns on ExampleTargetAmountModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExampleTargetAmountModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExampleTargetAmountModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExampleTargetAmountModel value)  $default,){
final _that = this;
switch (_that) {
case _ExampleTargetAmountModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExampleTargetAmountModel value)?  $default,){
final _that = this;
switch (_that) {
case _ExampleTargetAmountModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "min")  int? minAmount, @JsonKey(name: "max")  int? maxAmount,  String currency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExampleTargetAmountModel() when $default != null:
return $default(_that.minAmount,_that.maxAmount,_that.currency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "min")  int? minAmount, @JsonKey(name: "max")  int? maxAmount,  String currency)  $default,) {final _that = this;
switch (_that) {
case _ExampleTargetAmountModel():
return $default(_that.minAmount,_that.maxAmount,_that.currency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "min")  int? minAmount, @JsonKey(name: "max")  int? maxAmount,  String currency)?  $default,) {final _that = this;
switch (_that) {
case _ExampleTargetAmountModel() when $default != null:
return $default(_that.minAmount,_that.maxAmount,_that.currency);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _ExampleTargetAmountModel implements ExampleTargetAmountModel {
  const _ExampleTargetAmountModel({@JsonKey(name: "min") this.minAmount, @JsonKey(name: "max") this.maxAmount, required this.currency});
  factory _ExampleTargetAmountModel.fromJson(Map<String, dynamic> json) => _$ExampleTargetAmountModelFromJson(json);

@override@JsonKey(name: "min") final  int? minAmount;
@override@JsonKey(name: "max") final  int? maxAmount;
@override final  String currency;

/// Create a copy of ExampleTargetAmountModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExampleTargetAmountModelCopyWith<_ExampleTargetAmountModel> get copyWith => __$ExampleTargetAmountModelCopyWithImpl<_ExampleTargetAmountModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExampleTargetAmountModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExampleTargetAmountModel&&(identical(other.minAmount, minAmount) || other.minAmount == minAmount)&&(identical(other.maxAmount, maxAmount) || other.maxAmount == maxAmount)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minAmount,maxAmount,currency);

@override
String toString() {
  return 'ExampleTargetAmountModel(minAmount: $minAmount, maxAmount: $maxAmount, currency: $currency)';
}


}

/// @nodoc
abstract mixin class _$ExampleTargetAmountModelCopyWith<$Res> implements $ExampleTargetAmountModelCopyWith<$Res> {
  factory _$ExampleTargetAmountModelCopyWith(_ExampleTargetAmountModel value, $Res Function(_ExampleTargetAmountModel) _then) = __$ExampleTargetAmountModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "min") int? minAmount,@JsonKey(name: "max") int? maxAmount, String currency
});




}
/// @nodoc
class __$ExampleTargetAmountModelCopyWithImpl<$Res>
    implements _$ExampleTargetAmountModelCopyWith<$Res> {
  __$ExampleTargetAmountModelCopyWithImpl(this._self, this._then);

  final _ExampleTargetAmountModel _self;
  final $Res Function(_ExampleTargetAmountModel) _then;

/// Create a copy of ExampleTargetAmountModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? minAmount = freezed,Object? maxAmount = freezed,Object? currency = null,}) {
  return _then(_ExampleTargetAmountModel(
minAmount: freezed == minAmount ? _self.minAmount : minAmount // ignore: cast_nullable_to_non_nullable
as int?,maxAmount: freezed == maxAmount ? _self.maxAmount : maxAmount // ignore: cast_nullable_to_non_nullable
as int?,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
