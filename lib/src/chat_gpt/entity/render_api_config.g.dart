// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'render_api_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RenderApiConfig _$RenderApiConfigFromJson(Map<String, dynamic> json) =>
    RenderApiConfig(
      hostUrl: json['hostUrl'] as String,
      headers: json['headers'] as Map<String, dynamic>,
      body: json['body'] as Map<String, dynamic>? ?? const {},
      stream: json['stream'] as bool? ?? true,
    );

Map<String, dynamic> _$RenderApiConfigToJson(RenderApiConfig instance) =>
    <String, dynamic>{
      'hostUrl': instance.hostUrl,
      'headers': instance.headers,
      'body': instance.body,
      'stream': instance.stream,
    };
