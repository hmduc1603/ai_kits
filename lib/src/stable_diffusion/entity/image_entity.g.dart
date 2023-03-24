// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_entity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ImageInputCWProxy {
  ImageInput prompt(String prompt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ImageInput(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ImageInput(...).copyWith(id: 12, name: "My name")
  /// ````
  ImageInput call({
    String? prompt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfImageInput.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfImageInput.copyWith.fieldName(...)`
class _$ImageInputCWProxyImpl implements _$ImageInputCWProxy {
  final ImageInput _value;

  const _$ImageInputCWProxyImpl(this._value);

  @override
  ImageInput prompt(String prompt) => this(prompt: prompt);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ImageInput(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ImageInput(...).copyWith(id: 12, name: "My name")
  /// ````
  ImageInput call({
    Object? prompt = const $CopyWithPlaceholder(),
  }) {
    return ImageInput(
      prompt: prompt == const $CopyWithPlaceholder() || prompt == null
          ? _value.prompt
          // ignore: cast_nullable_to_non_nullable
          : prompt as String,
    );
  }
}

extension $ImageInputCopyWith on ImageInput {
  /// Returns a callable class that can be used as follows: `instanceOfImageInput.copyWith(...)` or like so:`instanceOfImageInput.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ImageInputCWProxy get copyWith => _$ImageInputCWProxyImpl(this);
}

abstract class _$ImageEntityCWProxy {
  ImageEntity completedAt(String? completedAt);

  ImageEntity createdAt(String? createdAt);

  ImageEntity error(String? error);

  ImageEntity id(String? id);

  ImageEntity input(ImageInput input);

  ImageEntity logs(String? logs);

  ImageEntity output(List<String>? output);

  ImageEntity startedAt(String? startedAt);

  ImageEntity status(String? status);

  ImageEntity urls(Map<String, dynamic>? urls);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ImageEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ImageEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  ImageEntity call({
    String? completedAt,
    String? createdAt,
    String? error,
    String? id,
    ImageInput? input,
    String? logs,
    List<String>? output,
    String? startedAt,
    String? status,
    Map<String, dynamic>? urls,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfImageEntity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfImageEntity.copyWith.fieldName(...)`
class _$ImageEntityCWProxyImpl implements _$ImageEntityCWProxy {
  final ImageEntity _value;

  const _$ImageEntityCWProxyImpl(this._value);

  @override
  ImageEntity completedAt(String? completedAt) =>
      this(completedAt: completedAt);

  @override
  ImageEntity createdAt(String? createdAt) => this(createdAt: createdAt);

  @override
  ImageEntity error(String? error) => this(error: error);

  @override
  ImageEntity id(String? id) => this(id: id);

  @override
  ImageEntity input(ImageInput input) => this(input: input);

  @override
  ImageEntity logs(String? logs) => this(logs: logs);

  @override
  ImageEntity output(List<String>? output) => this(output: output);

  @override
  ImageEntity startedAt(String? startedAt) => this(startedAt: startedAt);

  @override
  ImageEntity status(String? status) => this(status: status);

  @override
  ImageEntity urls(Map<String, dynamic>? urls) => this(urls: urls);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ImageEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ImageEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  ImageEntity call({
    Object? completedAt = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? input = const $CopyWithPlaceholder(),
    Object? logs = const $CopyWithPlaceholder(),
    Object? output = const $CopyWithPlaceholder(),
    Object? startedAt = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? urls = const $CopyWithPlaceholder(),
  }) {
    return ImageEntity(
      completedAt: completedAt == const $CopyWithPlaceholder()
          ? _value.completedAt
          // ignore: cast_nullable_to_non_nullable
          : completedAt as String?,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as String?,
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as String?,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      input: input == const $CopyWithPlaceholder() || input == null
          ? _value.input
          // ignore: cast_nullable_to_non_nullable
          : input as ImageInput,
      logs: logs == const $CopyWithPlaceholder()
          ? _value.logs
          // ignore: cast_nullable_to_non_nullable
          : logs as String?,
      output: output == const $CopyWithPlaceholder()
          ? _value.output
          // ignore: cast_nullable_to_non_nullable
          : output as List<String>?,
      startedAt: startedAt == const $CopyWithPlaceholder()
          ? _value.startedAt
          // ignore: cast_nullable_to_non_nullable
          : startedAt as String?,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as String?,
      urls: urls == const $CopyWithPlaceholder()
          ? _value.urls
          // ignore: cast_nullable_to_non_nullable
          : urls as Map<String, dynamic>?,
    );
  }
}

extension $ImageEntityCopyWith on ImageEntity {
  /// Returns a callable class that can be used as follows: `instanceOfImageEntity.copyWith(...)` or like so:`instanceOfImageEntity.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ImageEntityCWProxy get copyWith => _$ImageEntityCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageInput _$ImageInputFromJson(Map<String, dynamic> json) => ImageInput(
      prompt: json['prompt'] as String,
    );

Map<String, dynamic> _$ImageInputToJson(ImageInput instance) =>
    <String, dynamic>{
      'prompt': instance.prompt,
    };

ImageEntity _$ImageEntityFromJson(Map<String, dynamic> json) => ImageEntity(
      completedAt: json['completed_at'] as String?,
      createdAt: json['created_at'] as String?,
      id: json['id'] as String?,
      error: json['error'] as String?,
      input: ImageInput.fromJson(json['input'] as Map<String, dynamic>),
      logs: json['logs'] as String?,
      output:
          (json['output'] as List<dynamic>?)?.map((e) => e as String).toList(),
      startedAt: json['started_at'] as String?,
      status: json['status'] as String?,
      urls: json['urls'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ImageEntityToJson(ImageEntity instance) =>
    <String, dynamic>{
      'completed_at': instance.completedAt,
      'created_at': instance.createdAt,
      'error': instance.error,
      'id': instance.id,
      'input': instance.input,
      'logs': instance.logs,
      'output': instance.output,
      'started_at': instance.startedAt,
      'status': instance.status,
      'urls': instance.urls,
    };
