import 'package:ai_kits/ai_kits.dart';
import 'package:ai_kits/src/chat_gpt/entity/render_api_config.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gemini_config.g.dart';

@JsonSerializable()
class GeminiConfig {
  final PromptingLimitation promptingLimitation;
  final RenderApiConfig renderApiConfig;

  GeminiConfig({
    required this.renderApiConfig,
    this.promptingLimitation = const PromptingLimitation(),
  });

  factory GeminiConfig.fromJson(Map<String, dynamic> json) =>
      _$GeminiConfigFromJson(json);

  Map<String, dynamic> toJson() => _$GeminiConfigToJson(this);
}
