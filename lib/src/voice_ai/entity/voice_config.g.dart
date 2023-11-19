// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voice_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VoiceConfig _$VoiceConfigFromJson(Map<String, dynamic> json) => VoiceConfig(
      renderApiConfig: RenderApiConfig.fromJson(
          json['renderApiConfig'] as Map<String, dynamic>),
      dailyLimitation: DailyLimitation.fromJson(
          json['dailyLimitation'] as Map<String, dynamic>),
      artistBlackList: (json['artistBlackList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      maximumLoadMorePage: json['maximumLoadMorePage'] as int? ?? 3,
      requestRateLimitTick: json['requestRateLimitTick'] as int? ?? 3,
      requestRateLimitDuration: json['requestRateLimitDuration'] as int? ?? 5,
    );

Map<String, dynamic> _$VoiceConfigToJson(VoiceConfig instance) =>
    <String, dynamic>{
      'renderApiConfig': instance.renderApiConfig,
      'dailyLimitation': instance.dailyLimitation,
      'artistBlackList': instance.artistBlackList,
      'maximumLoadMorePage': instance.maximumLoadMorePage,
      'requestRateLimitTick': instance.requestRateLimitTick,
      'requestRateLimitDuration': instance.requestRateLimitDuration,
    };
