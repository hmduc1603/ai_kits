// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imagination_counting_manager.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImaginatingLimitation _$ImaginatingLimitationFromJson(
        Map<String, dynamic> json) =>
    ImaginatingLimitation(
      dailyImaginatingLimitation:
          json['dailyImaginatingLimitation'] as int? ?? 1,
      lifetimeLimitation: json['lifetimeLimitation'] as int? ?? 1,
      enableLifetimeLimitation:
          json['enableLifetimeLimitation'] as bool? ?? false,
    );

Map<String, dynamic> _$ImaginatingLimitationToJson(
        ImaginatingLimitation instance) =>
    <String, dynamic>{
      'dailyImaginatingLimitation': instance.dailyImaginatingLimitation,
      'lifetimeLimitation': instance.lifetimeLimitation,
      'enableLifetimeLimitation': instance.enableLifetimeLimitation,
    };
