// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prompting_entity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PromptingEntityCWProxy {
  PromptingEntity mood(String? mood);

  PromptingEntity prompt(String prompt);

  PromptingEntity id(int? id);

  PromptingEntity input(String input);

  PromptingEntity rawType(String rawType);

  PromptingEntity result(String? result);

  PromptingEntity createdDate(DateTime createdDate);

  PromptingEntity hasError(bool hasError);

  PromptingEntity hashtags(List<String> hashtags);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PromptingEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PromptingEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  PromptingEntity call({
    String? mood,
    String? prompt,
    int? id,
    String? input,
    String? rawType,
    String? result,
    DateTime? createdDate,
    bool? hasError,
    List<String>? hashtags,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPromptingEntity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPromptingEntity.copyWith.fieldName(...)`
class _$PromptingEntityCWProxyImpl implements _$PromptingEntityCWProxy {
  const _$PromptingEntityCWProxyImpl(this._value);

  final PromptingEntity _value;

  @override
  PromptingEntity mood(String? mood) => this(mood: mood);

  @override
  PromptingEntity prompt(String prompt) => this(prompt: prompt);

  @override
  PromptingEntity id(int? id) => this(id: id);

  @override
  PromptingEntity input(String input) => this(input: input);

  @override
  PromptingEntity rawType(String rawType) => this(rawType: rawType);

  @override
  PromptingEntity result(String? result) => this(result: result);

  @override
  PromptingEntity createdDate(DateTime createdDate) =>
      this(createdDate: createdDate);

  @override
  PromptingEntity hasError(bool hasError) => this(hasError: hasError);

  @override
  PromptingEntity hashtags(List<String> hashtags) => this(hashtags: hashtags);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PromptingEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PromptingEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  PromptingEntity call({
    Object? mood = const $CopyWithPlaceholder(),
    Object? prompt = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? input = const $CopyWithPlaceholder(),
    Object? rawType = const $CopyWithPlaceholder(),
    Object? result = const $CopyWithPlaceholder(),
    Object? createdDate = const $CopyWithPlaceholder(),
    Object? hasError = const $CopyWithPlaceholder(),
    Object? hashtags = const $CopyWithPlaceholder(),
  }) {
    return PromptingEntity(
      mood: mood == const $CopyWithPlaceholder()
          ? _value.mood
          // ignore: cast_nullable_to_non_nullable
          : mood as String?,
      prompt: prompt == const $CopyWithPlaceholder() || prompt == null
          ? _value.prompt
          // ignore: cast_nullable_to_non_nullable
          : prompt as String,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      input: input == const $CopyWithPlaceholder() || input == null
          ? _value.input
          // ignore: cast_nullable_to_non_nullable
          : input as String,
      rawType: rawType == const $CopyWithPlaceholder() || rawType == null
          ? _value.rawType
          // ignore: cast_nullable_to_non_nullable
          : rawType as String,
      result: result == const $CopyWithPlaceholder()
          ? _value.result
          // ignore: cast_nullable_to_non_nullable
          : result as String?,
      createdDate:
          createdDate == const $CopyWithPlaceholder() || createdDate == null
              ? _value.createdDate
              // ignore: cast_nullable_to_non_nullable
              : createdDate as DateTime,
      hasError: hasError == const $CopyWithPlaceholder() || hasError == null
          ? _value.hasError
          // ignore: cast_nullable_to_non_nullable
          : hasError as bool,
      hashtags: hashtags == const $CopyWithPlaceholder() || hashtags == null
          ? _value.hashtags
          // ignore: cast_nullable_to_non_nullable
          : hashtags as List<String>,
    );
  }
}

extension $PromptingEntityCopyWith on PromptingEntity {
  /// Returns a callable class that can be used as follows: `instanceOfPromptingEntity.copyWith(...)` or like so:`instanceOfPromptingEntity.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PromptingEntityCWProxy get copyWith => _$PromptingEntityCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PromptingEntity _$PromptingEntityFromJson(Map<String, dynamic> json) =>
    PromptingEntity(
      mood: json['mood'] as String?,
      prompt: json['prompt'] as String,
      id: json['id'] as int?,
      input: json['input'] as String,
      rawType: json['rawType'] as String,
      result: json['result'] as String?,
      createdDate: DateTime.parse(json['createdDate'] as String),
      hasError: json['hasError'] as bool? ?? false,
      hashtags: (json['hashtags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PromptingEntityToJson(PromptingEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rawType': instance.rawType,
      'prompt': instance.prompt,
      'input': instance.input,
      'hashtags': instance.hashtags,
      'mood': instance.mood,
      'result': instance.result,
      'createdDate': instance.createdDate.toIso8601String(),
      'hasError': instance.hasError,
    };
