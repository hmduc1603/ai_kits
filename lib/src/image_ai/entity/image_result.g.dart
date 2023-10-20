// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_result.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ImageResultCWProxy {
  ImageResult id(int? id);

  ImageResult cacheImageId(String cacheImageId);

  ImageResult input(String input);

  ImageResult result(Uint8List? result);

  ImageResult resultUrl(String? resultUrl);

  ImageResult createdDate(DateTime createdDate);

  ImageResult isSavedToGallery(bool isSavedToGallery);

  ImageResult hasError(bool hasError);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ImageResult(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ImageResult(...).copyWith(id: 12, name: "My name")
  /// ````
  ImageResult call({
    int? id,
    String? cacheImageId,
    String? input,
    Uint8List? result,
    String? resultUrl,
    DateTime? createdDate,
    bool? isSavedToGallery,
    bool? hasError,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfImageResult.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfImageResult.copyWith.fieldName(...)`
class _$ImageResultCWProxyImpl implements _$ImageResultCWProxy {
  const _$ImageResultCWProxyImpl(this._value);

  final ImageResult _value;

  @override
  ImageResult id(int? id) => this(id: id);

  @override
  ImageResult cacheImageId(String cacheImageId) =>
      this(cacheImageId: cacheImageId);

  @override
  ImageResult input(String input) => this(input: input);

  @override
  ImageResult result(Uint8List? result) => this(result: result);

  @override
  ImageResult resultUrl(String? resultUrl) => this(resultUrl: resultUrl);

  @override
  ImageResult createdDate(DateTime createdDate) =>
      this(createdDate: createdDate);

  @override
  ImageResult isSavedToGallery(bool isSavedToGallery) =>
      this(isSavedToGallery: isSavedToGallery);

  @override
  ImageResult hasError(bool hasError) => this(hasError: hasError);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ImageResult(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ImageResult(...).copyWith(id: 12, name: "My name")
  /// ````
  ImageResult call({
    Object? id = const $CopyWithPlaceholder(),
    Object? cacheImageId = const $CopyWithPlaceholder(),
    Object? input = const $CopyWithPlaceholder(),
    Object? result = const $CopyWithPlaceholder(),
    Object? resultUrl = const $CopyWithPlaceholder(),
    Object? createdDate = const $CopyWithPlaceholder(),
    Object? isSavedToGallery = const $CopyWithPlaceholder(),
    Object? hasError = const $CopyWithPlaceholder(),
  }) {
    return ImageResult(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      cacheImageId:
          cacheImageId == const $CopyWithPlaceholder() || cacheImageId == null
              ? _value.cacheImageId
              // ignore: cast_nullable_to_non_nullable
              : cacheImageId as String,
      input: input == const $CopyWithPlaceholder() || input == null
          ? _value.input
          // ignore: cast_nullable_to_non_nullable
          : input as String,
      result: result == const $CopyWithPlaceholder()
          ? _value.result
          // ignore: cast_nullable_to_non_nullable
          : result as Uint8List?,
      resultUrl: resultUrl == const $CopyWithPlaceholder()
          ? _value.resultUrl
          // ignore: cast_nullable_to_non_nullable
          : resultUrl as String?,
      createdDate:
          createdDate == const $CopyWithPlaceholder() || createdDate == null
              ? _value.createdDate
              // ignore: cast_nullable_to_non_nullable
              : createdDate as DateTime,
      isSavedToGallery: isSavedToGallery == const $CopyWithPlaceholder() ||
              isSavedToGallery == null
          ? _value.isSavedToGallery
          // ignore: cast_nullable_to_non_nullable
          : isSavedToGallery as bool,
      hasError: hasError == const $CopyWithPlaceholder() || hasError == null
          ? _value.hasError
          // ignore: cast_nullable_to_non_nullable
          : hasError as bool,
    );
  }
}

extension $ImageResultCopyWith on ImageResult {
  /// Returns a callable class that can be used as follows: `instanceOfImageResult.copyWith(...)` or like so:`instanceOfImageResult.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ImageResultCWProxy get copyWith => _$ImageResultCWProxyImpl(this);
}
