// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'subtitle.g.dart';

@JsonSerializable()
class Subtitle {
  final List<SubtitleChunk> chunks;
  final String text;

  Subtitle({
    required this.chunks,
    required this.text,
  });

  factory Subtitle.fromJson(Map<String, dynamic> json) =>
      _$SubtitleFromJson(json);

  Map<String, dynamic> toJson() => _$SubtitleToJson(this);
}

@JsonSerializable()
class SubtitleChunk {
  final String text;
  final List<double?> timestamp;
  SubtitleChunk({
    required this.text,
    required this.timestamp,
  });

  Duration? get startDuration {
    if (timestamp.length == 2 && timestamp.first != null) {
      return Duration(seconds: timestamp.first!.toInt());
    }
    return null;
  }

  Duration? get endDuration {
    if (timestamp.length == 2 && timestamp.last != null) {
      return Duration(seconds: timestamp.last!.toInt());
    }
    return null;
  }

  bool shouldShowSubtitle(Duration position) {
    if (startDuration != null && endDuration != null) {
      return position.inSeconds > startDuration!.inSeconds &&
          position.inSeconds < endDuration!.inSeconds;
    }
    return false;
  }

  factory SubtitleChunk.fromJson(Map<String, dynamic> json) =>
      _$SubtitleChunkFromJson(json);

  Map<String, dynamic> toJson() => _$SubtitleChunkToJson(this);
}
