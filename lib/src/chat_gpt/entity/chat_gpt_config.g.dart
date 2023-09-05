// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_gpt_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatGPTConfig _$ChatGPTConfigFromJson(Map<String, dynamic> json) =>
    ChatGPTConfig(
      enableTurbo: json['enableTurbo'] as bool,
      chatGPTKeys: (json['chatGPTKeys'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      model: json['model'] as String,
      shouldUseDirectApi: json['shouldUseDirectApi'] as bool,
      rapidApiConfig: RapidApiConfig.fromJson(
          json['rapidApiConfig'] as Map<String, dynamic>),
      shouldUseDirectApiOnChat:
          json['shouldUseDirectApiOnChat'] as bool? ?? true,
      promptingLimitation: json['promptingLimitation'] == null
          ? const PromptingLimitation()
          : PromptingLimitation.fromJson(
              json['promptingLimitation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatGPTConfigToJson(ChatGPTConfig instance) =>
    <String, dynamic>{
      'enableTurbo': instance.enableTurbo,
      'chatGPTKeys': instance.chatGPTKeys,
      'model': instance.model,
      'shouldUseDirectApi': instance.shouldUseDirectApi,
      'shouldUseDirectApiOnChat': instance.shouldUseDirectApiOnChat,
      'promptingLimitation': instance.promptingLimitation,
      'rapidApiConfig': instance.rapidApiConfig,
    };
