// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prompting_entity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PromptingEntityCWProxy {
  PromptingEntity createdDate(DateTime createdDate);

  PromptingEntity hasError(bool hasError);

  PromptingEntity hashtags(List<String> hashtags);

  PromptingEntity id(int? id);

  PromptingEntity input(String input);

  PromptingEntity mood(String? mood);

  PromptingEntity prompt(String prompt);

  PromptingEntity rawType(String rawType);

  PromptingEntity result(String? result);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PromptingEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PromptingEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  PromptingEntity call({
    DateTime? createdDate,
    bool? hasError,
    List<String>? hashtags,
    int? id,
    String? input,
    String? mood,
    String? prompt,
    String? rawType,
    String? result,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPromptingEntity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPromptingEntity.copyWith.fieldName(...)`
class _$PromptingEntityCWProxyImpl implements _$PromptingEntityCWProxy {
  final PromptingEntity _value;

  const _$PromptingEntityCWProxyImpl(this._value);

  @override
  PromptingEntity createdDate(DateTime createdDate) =>
      this(createdDate: createdDate);

  @override
  PromptingEntity hasError(bool hasError) => this(hasError: hasError);

  @override
  PromptingEntity hashtags(List<String> hashtags) => this(hashtags: hashtags);

  @override
  PromptingEntity id(int? id) => this(id: id);

  @override
  PromptingEntity input(String input) => this(input: input);

  @override
  PromptingEntity mood(String? mood) => this(mood: mood);

  @override
  PromptingEntity prompt(String prompt) => this(prompt: prompt);

  @override
  PromptingEntity rawType(String rawType) => this(rawType: rawType);

  @override
  PromptingEntity result(String? result) => this(result: result);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PromptingEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PromptingEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  PromptingEntity call({
    Object? createdDate = const $CopyWithPlaceholder(),
    Object? hasError = const $CopyWithPlaceholder(),
    Object? hashtags = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? input = const $CopyWithPlaceholder(),
    Object? mood = const $CopyWithPlaceholder(),
    Object? prompt = const $CopyWithPlaceholder(),
    Object? rawType = const $CopyWithPlaceholder(),
    Object? result = const $CopyWithPlaceholder(),
  }) {
    return PromptingEntity(
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
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      input: input == const $CopyWithPlaceholder() || input == null
          ? _value.input
          // ignore: cast_nullable_to_non_nullable
          : input as String,
      mood: mood == const $CopyWithPlaceholder()
          ? _value.mood
          // ignore: cast_nullable_to_non_nullable
          : mood as String?,
      prompt: prompt == const $CopyWithPlaceholder() || prompt == null
          ? _value.prompt
          // ignore: cast_nullable_to_non_nullable
          : prompt as String,
      rawType: rawType == const $CopyWithPlaceholder() || rawType == null
          ? _value.rawType
          // ignore: cast_nullable_to_non_nullable
          : rawType as String,
      result: result == const $CopyWithPlaceholder()
          ? _value.result
          // ignore: cast_nullable_to_non_nullable
          : result as String?,
    );
  }
}

extension $PromptingEntityCopyWith on PromptingEntity {
  /// Returns a callable class that can be used as follows: `instanceOfPromptingEntity.copyWith(...)` or like so:`instanceOfPromptingEntity.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PromptingEntityCWProxy get copyWith => _$PromptingEntityCWProxyImpl(this);
}
