// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import '../../../ai_kits.dart';

part 'image_config.g.dart';

@JsonSerializable()
class ImageConfig {
  final Map<String, dynamic> headers;
  final Map<String, dynamic> body;
  final String hostUrl;
  final ImaginatingLimitation imaginatingLimitation;
  final List<ImageModel>? imageModels;

  ImageConfig({
    required this.headers,
    required this.body,
    required this.hostUrl,
    required this.imaginatingLimitation,
    this.imageModels,
  });

  factory ImageConfig.fromJson(Map<String, dynamic> json) =>
      _$ImageConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ImageConfigToJson(this);
}
