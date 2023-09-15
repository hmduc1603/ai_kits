// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_gpt_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatGPTConfig _$ChatGPTConfigFromJson(Map<String, dynamic> json) =>
    ChatGPTConfig(
      renderApiConfig: RenderApiConfig.fromJson(
          json['renderApiConfig'] as Map<String, dynamic>),
      rapidApiConfig: RapidApiConfig.fromJson(
          json['rapidApiConfig'] as Map<String, dynamic>),
      shouldUseRenderApi: json['shouldUseRenderApi'] as bool? ?? true,
      promptingLimitation: json['promptingLimitation'] == null
          ? const PromptingLimitation()
          : PromptingLimitation.fromJson(
              json['promptingLimitation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatGPTConfigToJson(ChatGPTConfig instance) =>
    <String, dynamic>{
      'promptingLimitation': instance.promptingLimitation,
      'renderApiConfig': instance.renderApiConfig,
      'rapidApiConfig': instance.rapidApiConfig,
      'shouldUseRenderApi': instance.shouldUseRenderApi,
    };
