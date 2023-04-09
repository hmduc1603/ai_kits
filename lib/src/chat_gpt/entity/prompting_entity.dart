import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'prompting_entity.g.dart';

@JsonSerializable()
@Entity()
@CopyWith()
class PromptingEntity {
  int? id;
  final String rawType;
  final String prompt;
  final String input;
  final List<String> hashtags;
  final String? mood;
  final String? result;
  @Property(type: PropertyType.date)
  final DateTime createdDate;
  bool hasError;

  PromptingEntity({
    this.mood,
    required this.prompt,
    this.id,
    required this.input,
    required this.rawType,
    this.result,
    required this.createdDate,
    this.hasError = false,
    this.hashtags = const [],
  });

  factory PromptingEntity.fromJson(Map<String, dynamic> json) =>
      _$PromptingEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PromptingEntityToJson(this);
}
