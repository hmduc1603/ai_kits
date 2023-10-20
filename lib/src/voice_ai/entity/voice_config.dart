// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ai_kits/src/chat_gpt/entity/render_api_config.dart';
import 'package:ai_kits/src/chat_gpt/manager/daily_counting_manager/daily_counting_manager.dart';
import 'package:json_annotation/json_annotation.dart';

part 'voice_config.g.dart';

@JsonSerializable()
class VoiceConfig {
  final RenderApiConfig renderApiConfig;
  final DailyLimitation dailyLimitation;
  final List<String> artistBlackList;
  final int maximumLoadMorePage;

  VoiceConfig({
    required this.renderApiConfig,
    required this.dailyLimitation,
    this.artistBlackList = const [],
    this.maximumLoadMorePage = 3,
  });

  factory VoiceConfig.fromJson(Map<String, dynamic> json) =>
      _$VoiceConfigFromJson(json);

  Map<String, dynamic> toJson() => _$VoiceConfigToJson(this);
}
