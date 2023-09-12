// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'render_api_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RenderApiConfig _$RenderApiConfigFromJson(Map<String, dynamic> json) =>
    RenderApiConfig(
      hostUrl: json['hostUrl'] as String,
      headers: json['headers'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$RenderApiConfigToJson(RenderApiConfig instance) =>
    <String, dynamic>{
      'hostUrl': instance.hostUrl,
      'headers': instance.headers,
    };
