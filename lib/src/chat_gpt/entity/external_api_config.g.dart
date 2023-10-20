// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'external_api_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExternalApiConfig _$ExternalApiConfigFromJson(Map<String, dynamic> json) =>
    ExternalApiConfig(
      hostUrl: json['hostUrl'] as String,
      headers: json['headers'] as Map<String, dynamic>,
      params: json['params'] as Map<String, dynamic>,
      resultJsonKey: json['resultJsonKey'] as String?,
    );

Map<String, dynamic> _$ExternalApiConfigToJson(ExternalApiConfig instance) =>
    <String, dynamic>{
      'hostUrl': instance.hostUrl,
      'headers': instance.headers,
      'params': instance.params,
      'resultJsonKey': instance.resultJsonKey,
    };
