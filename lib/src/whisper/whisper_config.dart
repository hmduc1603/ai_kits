import 'package:ai_kits/ai_kits.dart';
import 'package:ai_kits/src/chat_gpt/entity/render_api_config.dart';
import 'package:json_annotation/json_annotation.dart';

part 'whisper_config.g.dart';

@JsonSerializable()
class WhisperConfig {
  final DailyLimitation dailyLimitation;
  final RenderApiConfig renderApiConfig;

  WhisperConfig({
    required this.renderApiConfig,
    this.dailyLimitation = const DailyLimitation(),
  });

  factory WhisperConfig.fromJson(Map<String, dynamic> json) =>
      _$WhisperConfigFromJson(json);

  Map<String, dynamic> toJson() => _$WhisperConfigToJson(this);
}
