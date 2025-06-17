// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MatchModel {

 String get id; SportModel get sport; String get competitor1; String get competitor2; int get score1; int get score2; DateTime get startTime; Map<String, double> get odds;
/// Create a copy of MatchModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchModelCopyWith<MatchModel> get copyWith => _$MatchModelCopyWithImpl<MatchModel>(this as MatchModel, _$identity);

  /// Serializes this MatchModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchModel&&(identical(other.id, id) || other.id == id)&&(identical(other.sport, sport) || other.sport == sport)&&(identical(other.competitor1, competitor1) || other.competitor1 == competitor1)&&(identical(other.competitor2, competitor2) || other.competitor2 == competitor2)&&(identical(other.score1, score1) || other.score1 == score1)&&(identical(other.score2, score2) || other.score2 == score2)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&const DeepCollectionEquality().equals(other.odds, odds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sport,competitor1,competitor2,score1,score2,startTime,const DeepCollectionEquality().hash(odds));

@override
String toString() {
  return 'MatchModel(id: $id, sport: $sport, competitor1: $competitor1, competitor2: $competitor2, score1: $score1, score2: $score2, startTime: $startTime, odds: $odds)';
}


}

/// @nodoc
abstract mixin class $MatchModelCopyWith<$Res>  {
  factory $MatchModelCopyWith(MatchModel value, $Res Function(MatchModel) _then) = _$MatchModelCopyWithImpl;
@useResult
$Res call({
 String id, SportModel sport, String competitor1, String competitor2, int score1, int score2, DateTime startTime, Map<String, double> odds
});


$SportModelCopyWith<$Res> get sport;

}
/// @nodoc
class _$MatchModelCopyWithImpl<$Res>
    implements $MatchModelCopyWith<$Res> {
  _$MatchModelCopyWithImpl(this._self, this._then);

  final MatchModel _self;
  final $Res Function(MatchModel) _then;

/// Create a copy of MatchModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sport = null,Object? competitor1 = null,Object? competitor2 = null,Object? score1 = null,Object? score2 = null,Object? startTime = null,Object? odds = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sport: null == sport ? _self.sport : sport // ignore: cast_nullable_to_non_nullable
as SportModel,competitor1: null == competitor1 ? _self.competitor1 : competitor1 // ignore: cast_nullable_to_non_nullable
as String,competitor2: null == competitor2 ? _self.competitor2 : competitor2 // ignore: cast_nullable_to_non_nullable
as String,score1: null == score1 ? _self.score1 : score1 // ignore: cast_nullable_to_non_nullable
as int,score2: null == score2 ? _self.score2 : score2 // ignore: cast_nullable_to_non_nullable
as int,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,odds: null == odds ? _self.odds : odds // ignore: cast_nullable_to_non_nullable
as Map<String, double>,
  ));
}
/// Create a copy of MatchModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SportModelCopyWith<$Res> get sport {
  
  return $SportModelCopyWith<$Res>(_self.sport, (value) {
    return _then(_self.copyWith(sport: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _MatchModel extends MatchModel {
  const _MatchModel({required this.id, required this.sport, required this.competitor1, required this.competitor2, required this.score1, required this.score2, required this.startTime, required final  Map<String, double> odds}): _odds = odds,super._();
  factory _MatchModel.fromJson(Map<String, dynamic> json) => _$MatchModelFromJson(json);

@override final  String id;
@override final  SportModel sport;
@override final  String competitor1;
@override final  String competitor2;
@override final  int score1;
@override final  int score2;
@override final  DateTime startTime;
 final  Map<String, double> _odds;
@override Map<String, double> get odds {
  if (_odds is EqualUnmodifiableMapView) return _odds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_odds);
}


/// Create a copy of MatchModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchModelCopyWith<_MatchModel> get copyWith => __$MatchModelCopyWithImpl<_MatchModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchModel&&(identical(other.id, id) || other.id == id)&&(identical(other.sport, sport) || other.sport == sport)&&(identical(other.competitor1, competitor1) || other.competitor1 == competitor1)&&(identical(other.competitor2, competitor2) || other.competitor2 == competitor2)&&(identical(other.score1, score1) || other.score1 == score1)&&(identical(other.score2, score2) || other.score2 == score2)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&const DeepCollectionEquality().equals(other._odds, _odds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sport,competitor1,competitor2,score1,score2,startTime,const DeepCollectionEquality().hash(_odds));

@override
String toString() {
  return 'MatchModel(id: $id, sport: $sport, competitor1: $competitor1, competitor2: $competitor2, score1: $score1, score2: $score2, startTime: $startTime, odds: $odds)';
}


}

/// @nodoc
abstract mixin class _$MatchModelCopyWith<$Res> implements $MatchModelCopyWith<$Res> {
  factory _$MatchModelCopyWith(_MatchModel value, $Res Function(_MatchModel) _then) = __$MatchModelCopyWithImpl;
@override @useResult
$Res call({
 String id, SportModel sport, String competitor1, String competitor2, int score1, int score2, DateTime startTime, Map<String, double> odds
});


@override $SportModelCopyWith<$Res> get sport;

}
/// @nodoc
class __$MatchModelCopyWithImpl<$Res>
    implements _$MatchModelCopyWith<$Res> {
  __$MatchModelCopyWithImpl(this._self, this._then);

  final _MatchModel _self;
  final $Res Function(_MatchModel) _then;

/// Create a copy of MatchModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sport = null,Object? competitor1 = null,Object? competitor2 = null,Object? score1 = null,Object? score2 = null,Object? startTime = null,Object? odds = null,}) {
  return _then(_MatchModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sport: null == sport ? _self.sport : sport // ignore: cast_nullable_to_non_nullable
as SportModel,competitor1: null == competitor1 ? _self.competitor1 : competitor1 // ignore: cast_nullable_to_non_nullable
as String,competitor2: null == competitor2 ? _self.competitor2 : competitor2 // ignore: cast_nullable_to_non_nullable
as String,score1: null == score1 ? _self.score1 : score1 // ignore: cast_nullable_to_non_nullable
as int,score2: null == score2 ? _self.score2 : score2 // ignore: cast_nullable_to_non_nullable
as int,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,odds: null == odds ? _self._odds : odds // ignore: cast_nullable_to_non_nullable
as Map<String, double>,
  ));
}

/// Create a copy of MatchModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SportModelCopyWith<$Res> get sport {
  
  return $SportModelCopyWith<$Res>(_self.sport, (value) {
    return _then(_self.copyWith(sport: value));
  });
}
}

// dart format on
