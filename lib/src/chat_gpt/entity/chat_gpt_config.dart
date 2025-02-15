import 'package:ai_kits/ai_kits.dart';
import 'package:ai_kits/src/chat_gpt/entity/render_api_config.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_gpt_config.g.dart';

@JsonSerializable()
class ChatGPTConfig {
  final PromptingLimitation promptingLimitation;
  final RenderApiConfig renderApiConfig;

  ChatGPTConfig({
    required this.renderApiConfig,
    this.promptingLimitation = const PromptingLimitation(),
  });

  factory ChatGPTConfig.fromJson(Map<String, dynamic> json) =>
      _$ChatGPTConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ChatGPTConfigToJson(this);
}
