import 'package:json_annotation/json_annotation.dart';

part 'gemini_file_result.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GeminiFileResult {
  final String uri;
  final String mimeType;

  GeminiFileResult({required this.uri, required this.mimeType});

  factory GeminiFileResult.fromJson(Map<String, dynamic> json) =>
      _$GeminiFileResultFromJson(json);

  Map<String, dynamic> toJson() => _$GeminiFileResultToJson(this);
}
