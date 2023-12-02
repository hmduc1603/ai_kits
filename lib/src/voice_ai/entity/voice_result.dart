import 'dart:convert';

import 'package:ai_kits/src/voice_ai/entity/subtitle.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'voice_result.g.dart';

@Entity()
@CopyWith()
@JsonSerializable()
class VoiceResult {
  // For Voice
  @JsonKey(includeFromJson: false)
  @Id()
  int? id;
  @JsonKey(name: "result_url")
  final String? resultUrl;
  @JsonKey(name: "model_avatar")
  String? modelAvatar;
  @JsonKey(name: "model")
  String? modelArtist;
  @JsonKey(name: "youtube_title")
  String? youtubeTitle;
  @JsonKey(name: "youtube_author")
  String? youtubeAuthor;
  @Property(type: PropertyType.date)
  DateTime? updatedDate;
  @JsonKey(name: "request_id")
  final String requestId;
  final bool isConverted;
  final bool hasError;
  final bool isCompleted;
  final String? shortid;
  final String? youtubeUrl;
  @JsonKey(name: "youtube_thumbnail")
  final String? youtubeThumbnail;
  final String? instrumentalUrl;
  final String? convertedUrl;
  final int likeCount;
  // For Acapella
  final String? subtitle;
  final String? lyric;
  final bool hasErrorGeneratingSubtitle;

  VoiceResult({
    this.id,
    this.resultUrl,
    required this.requestId,
    this.modelAvatar,
    this.youtubeAuthor,
    this.youtubeTitle,
    this.modelArtist,
    this.updatedDate,
    this.hasError = false,
    this.isConverted = false,
    this.isCompleted = false,
    this.shortid,
    this.youtubeUrl,
    this.instrumentalUrl,
    this.convertedUrl,
    this.subtitle,
    this.lyric,
    this.youtubeThumbnail,
    this.likeCount = 0,
    this.hasErrorGeneratingSubtitle = false,
  });

  VoiceResultStatus get resultStatus {
    if (resultUrl?.isNotEmpty == true) {
      return VoiceResultStatus.success;
    } else if (hasError) {
      return VoiceResultStatus.failed;
    }
    return VoiceResultStatus.pending;
  }

  factory VoiceResult.fromJson(Map<String, dynamic> json) =>
      _$VoiceResultFromJson(json);

  Map<String, dynamic> toJson() => _$VoiceResultToJson(this);

  Subtitle? get subtitleModel {
    if (subtitle != null) {
      Subtitle.fromJson(jsonDecode(subtitle!));
    }
    return null;
  }
}

enum VoiceResultStatus {
  pending,
  failed,
  success,
}

extension VoiceResultStatusExt on VoiceResultStatus {
  String get msg {
    switch (this) {
      case VoiceResultStatus.pending:
        return "The song is being converting, please wait!";
      case VoiceResultStatus.failed:
        return "There is an error when converting this song, please try another song instead";
      case VoiceResultStatus.success:
        return "The song has been successfully converted";
    }
  }
}
