// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'external_api_config.g.dart';

@JsonSerializable()
class ExternalApiConfig {
  final String hostUrl;
  final Map<String, dynamic> headers;
  final Map<String, dynamic> params;
  final String? resultJsonKey;
  ExternalApiConfig({
    required this.hostUrl,
    required this.headers,
    required this.params,
    this.resultJsonKey,
  });

  factory ExternalApiConfig.fromJson(Map<String, dynamic> json) =>
      _$ExternalApiConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ExternalApiConfigToJson(this);
}
