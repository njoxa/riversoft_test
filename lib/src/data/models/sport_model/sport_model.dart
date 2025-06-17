import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'sport_model.freezed.dart';
part 'sport_model.g.dart';

enum SportType { football, basketball, mma, esports }

extension SportTypeExtension on SportType {
  IconData get icon {
    return switch (this) {
      SportType.football => Icons.sports_soccer,
      SportType.basketball => Icons.sports_basketball,
      SportType.mma => Icons.sports_mma,
      SportType.esports => Icons.sports_esports,
    };
  }
}

@freezed
sealed class SportModel with _$SportModel {
  const factory SportModel({required String name, required SportType type}) = _SportModel;

  factory SportModel.fromJson(Map<String, dynamic> json) => _$SportModelFromJson(json);
}
