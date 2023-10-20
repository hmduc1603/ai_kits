import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'voice_result.g.dart';

@JsonSerializable()
@Entity()
@CopyWith()
class VoiceResult {
  @Id()
  int? id;
  @JsonKey(name: "result_url")
  final String? resultUrl;
  String? modelAvatar;
  String? modelArtist;
  String? youtubeTitle;
  String? youtubeAuthor;
  @Property(type: PropertyType.date)
  DateTime? updatedDate;
  @JsonKey(name: "request_id")
  final String requestId;
  final bool isConverted;
  final bool hasError;
  final bool isCompleted;
  final String? shortid;

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
  });

  VoiceResultStatus? get resultStatus {
    if (hasError) {
      return VoiceResultStatus.failed;
    } else if (isCompleted) {
      return VoiceResultStatus.success;
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
