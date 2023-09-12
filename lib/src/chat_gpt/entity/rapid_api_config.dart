// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'rapid_api_config.g.dart';

@JsonSerializable()
class RapidApiConfig {
  final String hostUrl;
  final Map<String, dynamic> headers;
  final Map<String, dynamic> params;
  final String? resultJsonKey;
  RapidApiConfig({
    required this.hostUrl,
    required this.headers,
    required this.params,
    this.resultJsonKey,
  });

  factory RapidApiConfig.fromJson(Map<String, dynamic> json) =>
      _$RapidApiConfigFromJson(json);

  Map<String, dynamic> toJson() => _$RapidApiConfigToJson(this);
}
