// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gemini_prompting_entity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GeminiPromptingEntityCWProxy {
  GeminiPromptingEntity history(List<GeminiPromptHistory>? history);

  GeminiPromptingEntity prompt(String prompt);

  GeminiPromptingEntity id(int? id);

  GeminiPromptingEntity result(String? result);

  GeminiPromptingEntity createdDate(DateTime createdDate);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GeminiPromptingEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GeminiPromptingEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  GeminiPromptingEntity call({
    List<GeminiPromptHistory>? history,
    String? prompt,
    int? id,
    String? result,
    DateTime? createdDate,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGeminiPromptingEntity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGeminiPromptingEntity.copyWith.fieldName(...)`
class _$GeminiPromptingEntityCWProxyImpl
    implements _$GeminiPromptingEntityCWProxy {
  const _$GeminiPromptingEntityCWProxyImpl(this._value);

  final GeminiPromptingEntity _value;

  @override
  GeminiPromptingEntity history(List<GeminiPromptHistory>? history) =>
      this(history: history);

  @override
  GeminiPromptingEntity prompt(String prompt) => this(prompt: prompt);

  @override
  GeminiPromptingEntity id(int? id) => this(id: id);

  @override
  GeminiPromptingEntity result(String? result) => this(result: result);

  @override
  GeminiPromptingEntity createdDate(DateTime createdDate) =>
      this(createdDate: createdDate);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GeminiPromptingEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GeminiPromptingEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  GeminiPromptingEntity call({
    Object? history = const $CopyWithPlaceholder(),
    Object? prompt = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? result = const $CopyWithPlaceholder(),
    Object? createdDate = const $CopyWithPlaceholder(),
  }) {
    return GeminiPromptingEntity(
      history: history == const $CopyWithPlaceholder()
          ? _value.history
          // ignore: cast_nullable_to_non_nullable
          : history as List<GeminiPromptHistory>?,
      prompt: prompt == const $CopyWithPlaceholder() || prompt == null
          ? _value.prompt
          // ignore: cast_nullable_to_non_nullable
          : prompt as String,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      result: result == const $CopyWithPlaceholder()
          ? _value.result
          // ignore: cast_nullable_to_non_nullable
          : result as String?,
      createdDate:
          createdDate == const $CopyWithPlaceholder() || createdDate == null
              ? _value.createdDate
              // ignore: cast_nullable_to_non_nullable
              : createdDate as DateTime,
    );
  }
}

extension $GeminiPromptingEntityCopyWith on GeminiPromptingEntity {
  /// Returns a callable class that can be used as follows: `instanceOfGeminiPromptingEntity.copyWith(...)` or like so:`instanceOfGeminiPromptingEntity.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GeminiPromptingEntityCWProxy get copyWith =>
      _$GeminiPromptingEntityCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeminiTextPromptPart _$GeminiTextPromptPartFromJson(
        Map<String, dynamic> json) =>
    GeminiTextPromptPart(
      text: json['text'] as String,
    );

Map<String, dynamic> _$GeminiTextPromptPartToJson(
        GeminiTextPromptPart instance) =>
    <String, dynamic>{
      'text': instance.text,
    };

GeminiFilePromptPart _$GeminiFilePromptPartFromJson(
        Map<String, dynamic> json) =>
    GeminiFilePromptPart(
      mimeType: json['mime_type'] as String,
      fileUri: json['file_uri'] as String,
    );

Map<String, dynamic> _$GeminiFilePromptPartToJson(
        GeminiFilePromptPart instance) =>
    <String, dynamic>{
      'mime_type': instance.mimeType,
      'file_uri': instance.fileUri,
    };

GeminiPromptHistory _$GeminiPromptHistoryFromJson(Map<String, dynamic> json) =>
    GeminiPromptHistory(
      role: json['role'] as String,
      parts: (json['parts'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$GeminiPromptHistoryToJson(
        GeminiPromptHistory instance) =>
    <String, dynamic>{
      'role': instance.role,
      'parts': instance.parts,
    };

GeminiPromptingEntity _$GeminiPromptingEntityFromJson(
        Map<String, dynamic> json) =>
    GeminiPromptingEntity(
      history: (json['history'] as List<dynamic>?)
          ?.map((e) => GeminiPromptHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      prompt: json['prompt'] as String,
      id: json['id'] as int?,
      result: json['result'] as String?,
      createdDate: DateTime.parse(json['created_date'] as String),
    );

Map<String, dynamic> _$GeminiPromptingEntityToJson(
        GeminiPromptingEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'history': instance.history,
      'prompt': instance.prompt,
      'result': instance.result,
      'created_date': instance.createdDate.toIso8601String(),
    };
