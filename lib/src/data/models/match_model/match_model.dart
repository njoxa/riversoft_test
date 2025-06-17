import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riversoft_test/src/data/models/sport_model/sport_model.dart';

part 'match_model.freezed.dart';
part 'match_model.g.dart';

@freezed
sealed class MatchModel with _$MatchModel {
  const MatchModel._();

  const factory MatchModel({
    required String id,
    required SportModel sport,
    required String competitor1,
    required String competitor2,
    required int score1,
    required int score2,
    required DateTime startTime,
    required Map<String, double> odds,
  }) = _MatchModel;

  factory MatchModel.fromJson(Map<String, dynamic> json) => _$MatchModelFromJson(json);

  String get scoreDisplay => '$score1 - $score2';
}
