import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'gemini_prompting_entity.g.dart';

enum GeminiRole {
  user,
  system,
  assistant,
}

abstract class GeminiPromptPart {
  GeminiPromptHistory get history;
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GeminiTextPromptPart extends GeminiPromptPart {
  final String text;

  GeminiTextPromptPart({required this.text});

  factory GeminiTextPromptPart.fromJson(Map<String, dynamic> json) =>
      _$GeminiTextPromptPartFromJson(json);

  Map<String, dynamic> toJson() => _$GeminiTextPromptPartToJson(this);

  @override
  GeminiPromptHistory get history => GeminiPromptHistory(
        role: "user",
        parts: [
          {"text": text}
        ],
      );
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GeminiFilePromptPart extends GeminiPromptPart {
  final String mimeType;
  final String fileUri;

  GeminiFilePromptPart({required this.mimeType, required this.fileUri});

  factory GeminiFilePromptPart.fromJson(Map<String, dynamic> json) =>
      _$GeminiFilePromptPartFromJson(json);

  Map<String, dynamic> toJson() => _$GeminiFilePromptPartToJson(this);

  @override
  GeminiPromptHistory get history => GeminiPromptHistory(
        role: "user",
        parts: [
          {
            "fileData": {
              "mimeType": mimeType,
              "fileUri": fileUri,
            }
          }
        ],
      );
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GeminiPromptHistory {
  final String role;
  final List<Map<String, dynamic>> parts;

  GeminiPromptHistory({required this.role, required this.parts});

  GeminiRole get geminiRole =>
      GeminiRole.values.firstWhere((e) => e.name == role);

  factory GeminiPromptHistory.fromJson(Map<String, dynamic> json) =>
      _$GeminiPromptHistoryFromJson(json);

  Map<String, dynamic> toJson() => _$GeminiPromptHistoryToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
@Entity()
@CopyWith()
class GeminiPromptingEntity {
  int? id;
  final List<GeminiPromptHistory>? history;
  final String prompt;
  final String? result;
  @Property(type: PropertyType.date)
  final DateTime createdDate;

  GeminiPromptingEntity({
    this.history,
    required this.prompt,
    this.id,
    this.result,
    required this.createdDate,
  });

  factory GeminiPromptingEntity.fromJson(Map<String, dynamic> json) =>
      _$GeminiPromptingEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GeminiPromptingEntityToJson(this);
}
