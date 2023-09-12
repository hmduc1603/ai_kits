// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'render_api_config.g.dart';

@JsonSerializable()
class RenderApiConfig {
  final String hostUrl;
  final Map<String, dynamic> headers;
  RenderApiConfig({
    required this.hostUrl,
    required this.headers,
  });

  factory RenderApiConfig.fromJson(Map<String, dynamic> json) =>
      _$RenderApiConfigFromJson(json);

  Map<String, dynamic> toJson() => _$RenderApiConfigToJson(this);
}
