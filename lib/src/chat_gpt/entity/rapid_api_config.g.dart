// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rapid_api_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RapidApiConfig _$RapidApiConfigFromJson(Map<String, dynamic> json) =>
    RapidApiConfig(
      hostUrl: json['hostUrl'] as String,
      headers: json['headers'] as Map<String, dynamic>,
      params: json['params'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$RapidApiConfigToJson(RapidApiConfig instance) =>
    <String, dynamic>{
      'hostUrl': instance.hostUrl,
      'headers': instance.headers,
      'params': instance.params,
    };
