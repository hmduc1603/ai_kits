// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadConfig _$UploadConfigFromJson(Map<String, dynamic> json) => UploadConfig(
      headers: json['headers'] as Map<String, dynamic>,
      hostUrl: json['hostUrl'] as String,
    );

Map<String, dynamic> _$UploadConfigToJson(UploadConfig instance) =>
    <String, dynamic>{
      'headers': instance.headers,
      'hostUrl': instance.hostUrl,
    };
