import 'package:ai_kits/ai_kits.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stability_config.g.dart';

@JsonSerializable()
class StabilityConfig {
  final String stabilityKey;
  final int? imageHeight;
  final int? imageWidth;
  final String? stabilityEngine;
  final ImaginatingLimitation imaginatingLimitation;
  StabilityConfig({
    required this.stabilityKey,
    this.imageHeight,
    this.imageWidth,
    this.stabilityEngine,
    required this.imaginatingLimitation,
  });

  factory StabilityConfig.fromJson(Map<String, dynamic> json) =>
      _$StabilityConfigFromJson(json);

  Map<String, dynamic> toJson() => _$StabilityConfigToJson(this);

  String get key => stabilityKey.substring(0, stabilityKey.length - 1);
}
