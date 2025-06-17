// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sport_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SportModel _$SportModelFromJson(Map<String, dynamic> json) => _SportModel(
  name: json['name'] as String,
  type: $enumDecode(_$SportTypeEnumMap, json['type']),
);

Map<String, dynamic> _$SportModelToJson(_SportModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': _$SportTypeEnumMap[instance.type]!,
    };

const _$SportTypeEnumMap = {
  SportType.football: 'football',
  SportType.basketball: 'basketball',
  SportType.mma: 'mma',
  SportType.esports: 'esports',
};
