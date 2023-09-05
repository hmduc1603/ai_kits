import 'dart:developer';
import 'dart:math' as m;

import 'package:ai_kits/ai_kits.dart';
import 'package:ai_kits/src/chat_gpt/entity/rapid_api_config.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_gpt_config.g.dart';

@JsonSerializable()
class ChatGPTConfig {
  final bool enableTurbo;
  final List<String> chatGPTKeys;
  final String model;
  final bool shouldUseDirectApi;
  final bool shouldUseDirectApiOnChat;
  final PromptingLimitation promptingLimitation;
  final RapidApiConfig rapidApiConfig;

  String get key {
    log("Got ChatGPT keys: ${chatGPTKeys.toString()}");
    var element = chatGPTKeys[m.Random().nextInt(chatGPTKeys.length)];
    return element.substring(0, element.length - 1);
  }

  ChatGPTConfig({
    required this.enableTurbo,
    required this.chatGPTKeys,
    required this.model,
    required this.shouldUseDirectApi,
    required this.rapidApiConfig,
    this.shouldUseDirectApiOnChat = true,
    this.promptingLimitation = const PromptingLimitation(),
  });

  factory ChatGPTConfig.fromJson(Map<String, dynamic> json) =>
      _$ChatGPTConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ChatGPTConfigToJson(this);
}
