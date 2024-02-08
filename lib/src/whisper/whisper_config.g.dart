// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'whisper_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WhisperConfig _$WhisperConfigFromJson(Map<String, dynamic> json) =>
    WhisperConfig(
      renderApiConfig: RenderApiConfig.fromJson(
          json['renderApiConfig'] as Map<String, dynamic>),
      dailyLimitation: json['dailyLimitation'] == null
          ? const DailyLimitation()
          : DailyLimitation.fromJson(
              json['dailyLimitation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WhisperConfigToJson(WhisperConfig instance) =>
    <String, dynamic>{
      'dailyLimitation': instance.dailyLimitation,
      'renderApiConfig': instance.renderApiConfig,
    };
