// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gemini_file_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeminiFileResult _$GeminiFileResultFromJson(Map<String, dynamic> json) =>
    GeminiFileResult(
      uri: json['uri'] as String,
      mimeType: json['mime_type'] as String,
    );

Map<String, dynamic> _$GeminiFileResultToJson(GeminiFileResult instance) =>
    <String, dynamic>{
      'uri': instance.uri,
      'mime_type': instance.mimeType,
    };
