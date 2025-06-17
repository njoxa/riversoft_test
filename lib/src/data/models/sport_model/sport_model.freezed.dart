// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sport_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SportModel {

 String get name; SportType get type;
/// Create a copy of SportModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SportModelCopyWith<SportModel> get copyWith => _$SportModelCopyWithImpl<SportModel>(this as SportModel, _$identity);

  /// Serializes this SportModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SportModel&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,type);

@override
String toString() {
  return 'SportModel(name: $name, type: $type)';
}


}

/// @nodoc
abstract mixin class $SportModelCopyWith<$Res>  {
  factory $SportModelCopyWith(SportModel value, $Res Function(SportModel) _then) = _$SportModelCopyWithImpl;
@useResult
$Res call({
 String name, SportType type
});




}
/// @nodoc
class _$SportModelCopyWithImpl<$Res>
    implements $SportModelCopyWith<$Res> {
  _$SportModelCopyWithImpl(this._self, this._then);

  final SportModel _self;
  final $Res Function(SportModel) _then;

/// Create a copy of SportModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? type = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SportType,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SportModel implements SportModel {
  const _SportModel({required this.name, required this.type});
  factory _SportModel.fromJson(Map<String, dynamic> json) => _$SportModelFromJson(json);

@override final  String name;
@override final  SportType type;

/// Create a copy of SportModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SportModelCopyWith<_SportModel> get copyWith => __$SportModelCopyWithImpl<_SportModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SportModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SportModel&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,type);

@override
String toString() {
  return 'SportModel(name: $name, type: $type)';
}


}

/// @nodoc
abstract mixin class _$SportModelCopyWith<$Res> implements $SportModelCopyWith<$Res> {
  factory _$SportModelCopyWith(_SportModel value, $Res Function(_SportModel) _then) = __$SportModelCopyWithImpl;
@override @useResult
$Res call({
 String name, SportType type
});




}
/// @nodoc
class __$SportModelCopyWithImpl<$Res>
    implements _$SportModelCopyWith<$Res> {
  __$SportModelCopyWithImpl(this._self, this._then);

  final _SportModel _self;
  final $Res Function(_SportModel) _then;

/// Create a copy of SportModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? type = null,}) {
  return _then(_SportModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SportType,
  ));
}


}

// dart format on
