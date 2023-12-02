// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subtitle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subtitle _$SubtitleFromJson(Map<String, dynamic> json) => Subtitle(
      chunks: (json['chunks'] as List<dynamic>)
          .map((e) => SubtitleChunk.fromJson(e as Map<String, dynamic>))
          .toList(),
      text: json['text'] as String,
    );

Map<String, dynamic> _$SubtitleToJson(Subtitle instance) => <String, dynamic>{
      'chunks': instance.chunks,
      'text': instance.text,
    };

SubtitleChunk _$SubtitleChunkFromJson(Map<String, dynamic> json) =>
    SubtitleChunk(
      text: json['text'] as String,
      timestamp: (json['timestamp'] as List<dynamic>)
          .map((e) => (e as num?)?.toDouble())
          .toList(),
    );

Map<String, dynamic> _$SubtitleChunkToJson(SubtitleChunk instance) =>
    <String, dynamic>{
      'text': instance.text,
      'timestamp': instance.timestamp,
    };
