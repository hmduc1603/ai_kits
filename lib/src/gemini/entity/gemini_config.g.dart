// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gemini_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeminiConfig _$GeminiConfigFromJson(Map<String, dynamic> json) => GeminiConfig(
      renderApiConfig: RenderApiConfig.fromJson(
          json['renderApiConfig'] as Map<String, dynamic>),
      promptingLimitation: json['promptingLimitation'] == null
          ? const PromptingLimitation()
          : PromptingLimitation.fromJson(
              json['promptingLimitation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GeminiConfigToJson(GeminiConfig instance) =>
    <String, dynamic>{
      'promptingLimitation': instance.promptingLimitation,
      'renderApiConfig': instance.renderApiConfig,
    };
