import 'package:ai_kits/ai_kits.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stability_config.g.dart';

@JsonSerializable()
class StabilityConfig {
  final String stabilityKey;
  final int? imageHeight;
  final int? imageWidth;
  final int? steps;
  final String? stabilityEngine;
  final String? stylePreset;
  final ImaginatingLimitation imaginatingLimitation;
  StabilityConfig({
    required this.stabilityKey,
    this.imageHeight,
    this.imageWidth,
    this.stabilityEngine,
    this.steps,
    this.stylePreset,
    required this.imaginatingLimitation,
  });

  factory StabilityConfig.fromJson(Map<String, dynamic> json) =>
      _$StabilityConfigFromJson(json);

  Map<String, dynamic> toJson() => _$StabilityConfigToJson(this);

  String get key => stabilityKey.substring(0, stabilityKey.length - 1);
}
