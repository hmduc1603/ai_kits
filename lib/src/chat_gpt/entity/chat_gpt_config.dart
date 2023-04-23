import 'dart:convert';

import 'package:ai_kits/ai_kits.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_gpt_config.g.dart';

@JsonSerializable()
class ChatGPTConfig {
  final bool enableTurbo;
  final String chatGPTKey;
  final String model;
  final bool shouldUseDirectApi;
  final bool shouldUseDirectApiOnChat;
  final PromptingLimitation promptingLimitation;
  final ChatGPTCustomHost customHost;

  String get key => chatGPTKey.substring(0, chatGPTKey.length - 1);

  ChatGPTConfig({
    required this.enableTurbo,
    required this.chatGPTKey,
    required this.model,
    required this.shouldUseDirectApi,
    this.customHost = const ChatGPTCustomHost(),
    this.shouldUseDirectApiOnChat = true,
    required this.promptingLimitation,
  });

  factory ChatGPTConfig.fromJson(Map<String, dynamic> json) =>
      _$ChatGPTConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ChatGPTConfigToJson(this);
}

@JsonSerializable()
class ChatGPTCustomHost {
  final String url;
  final String dataJsonAsString;
  final Map<String, dynamic>? headers;

  Map<String, dynamic> getData(String prompt) {
    final data = dataJsonAsString.replaceAll("~~prompt~~", prompt).toString();
    return jsonDecode(data);
  }

  const ChatGPTCustomHost({
    this.url = "https://ai.dataplazma.com/api/v1/completions",
    this.dataJsonAsString = '{"prompt":"~~prompt~~"}',
    this.headers = const {
      "Authorization": "Bearer j1n1k98n349v839nv839nvs86bvs4aasd0"
    },
  });

  factory ChatGPTCustomHost.fromJson(Map<String, dynamic> json) =>
      _$ChatGPTCustomHostFromJson(json);

  Map<String, dynamic> toJson() => _$ChatGPTCustomHostToJson(this);
}
