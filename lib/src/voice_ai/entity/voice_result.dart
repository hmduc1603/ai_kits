import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'voice_result.g.dart';

@JsonSerializable()
@Entity()
@CopyWith()
class VoiceResult {
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
  final String? instrumentalUrl;
  final String? convertedUrl;

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
