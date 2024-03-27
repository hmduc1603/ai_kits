// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'upload_config.g.dart';

@JsonSerializable()
class UploadConfig {
  final Map<String, dynamic> headers;
  final String hostUrl;

  UploadConfig({
    required this.headers,
    required this.hostUrl,
  });

  factory UploadConfig.fromJson(Map<String, dynamic> json) =>
      _$UploadConfigFromJson(json);

  Map<String, dynamic> toJson() => _$UploadConfigToJson(this);
}
