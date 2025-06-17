// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatchModel _$MatchModelFromJson(Map<String, dynamic> json) => _MatchModel(
  id: json['id'] as String,
  sport: SportModel.fromJson(json['sport'] as Map<String, dynamic>),
  competitor1: json['competitor1'] as String,
  competitor2: json['competitor2'] as String,
  score1: (json['score1'] as num).toInt(),
  score2: (json['score2'] as num).toInt(),
  startTime: DateTime.parse(json['startTime'] as String),
  odds: (json['odds'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, (e as num).toDouble()),
  ),
);

Map<String, dynamic> _$MatchModelToJson(_MatchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sport': instance.sport,
      'competitor1': instance.competitor1,
      'competitor2': instance.competitor2,
      'score1': instance.score1,
      'score2': instance.score2,
      'startTime': instance.startTime.toIso8601String(),
      'odds': instance.odds,
    };
