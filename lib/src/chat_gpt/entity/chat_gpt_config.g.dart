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
      customHost: json['customHost'] == null
          ? const ChatGPTCustomHost()
          : ChatGPTCustomHost.fromJson(
              json['customHost'] as Map<String, dynamic>),
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
      'customHost': instance.customHost,
    };

ChatGPTCustomHost _$ChatGPTCustomHostFromJson(Map<String, dynamic> json) =>
    ChatGPTCustomHost(
      url: json['url'] as String? ??
          "https://ai.dataplazma.com/api/v1/completions",
      dataJsonAsString:
          json['dataJsonAsString'] as String? ?? '{"prompt":"~~prompt~~"}',
      headers: json['headers'] as Map<String, dynamic>? ??
          const {"Authorization": "Bearer j1n1k98n349v839nv839nvs86bvs4aasd0"},
    );

Map<String, dynamic> _$ChatGPTCustomHostToJson(ChatGPTCustomHost instance) =>
    <String, dynamic>{
      'url': instance.url,
      'dataJsonAsString': instance.dataJsonAsString,
      'headers': instance.headers,
    };
