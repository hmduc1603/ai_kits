// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stability_result.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$StabilityResultCWProxy {
  StabilityResult cacheImageId(String cacheImageId);

  StabilityResult createdDate(DateTime createdDate);

  StabilityResult hasError(bool hasError);

  StabilityResult id(int? id);

  StabilityResult input(String input);

  StabilityResult isSavedToGallery(bool isSavedToGallery);

  StabilityResult result(Uint8List? result);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StabilityResult(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StabilityResult(...).copyWith(id: 12, name: "My name")
  /// ````
  StabilityResult call({
    String? cacheImageId,
    DateTime? createdDate,
    bool? hasError,
    int? id,
    String? input,
    bool? isSavedToGallery,
    Uint8List? result,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfStabilityResult.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfStabilityResult.copyWith.fieldName(...)`
class _$StabilityResultCWProxyImpl implements _$StabilityResultCWProxy {
  final StabilityResult _value;

  const _$StabilityResultCWProxyImpl(this._value);

  @override
  StabilityResult cacheImageId(String cacheImageId) =>
      this(cacheImageId: cacheImageId);

  @override
  StabilityResult createdDate(DateTime createdDate) =>
      this(createdDate: createdDate);

  @override
  StabilityResult hasError(bool hasError) => this(hasError: hasError);

  @override
  StabilityResult id(int? id) => this(id: id);

  @override
  StabilityResult input(String input) => this(input: input);

  @override
  StabilityResult isSavedToGallery(bool isSavedToGallery) =>
      this(isSavedToGallery: isSavedToGallery);

  @override
  StabilityResult result(Uint8List? result) => this(result: result);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StabilityResult(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StabilityResult(...).copyWith(id: 12, name: "My name")
  /// ````
  StabilityResult call({
    Object? cacheImageId = const $CopyWithPlaceholder(),
    Object? createdDate = const $CopyWithPlaceholder(),
    Object? hasError = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? input = const $CopyWithPlaceholder(),
    Object? isSavedToGallery = const $CopyWithPlaceholder(),
    Object? result = const $CopyWithPlaceholder(),
  }) {
    return StabilityResult(
      cacheImageId:
          cacheImageId == const $CopyWithPlaceholder() || cacheImageId == null
              ? _value.cacheImageId
              // ignore: cast_nullable_to_non_nullable
              : cacheImageId as String,
      createdDate:
          createdDate == const $CopyWithPlaceholder() || createdDate == null
              ? _value.createdDate
              // ignore: cast_nullable_to_non_nullable
              : createdDate as DateTime,
      hasError: hasError == const $CopyWithPlaceholder() || hasError == null
          ? _value.hasError
          // ignore: cast_nullable_to_non_nullable
          : hasError as bool,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      input: input == const $CopyWithPlaceholder() || input == null
          ? _value.input
          // ignore: cast_nullable_to_non_nullable
          : input as String,
      isSavedToGallery: isSavedToGallery == const $CopyWithPlaceholder() ||
              isSavedToGallery == null
          ? _value.isSavedToGallery
          // ignore: cast_nullable_to_non_nullable
          : isSavedToGallery as bool,
      result: result == const $CopyWithPlaceholder()
          ? _value.result
          // ignore: cast_nullable_to_non_nullable
          : result as Uint8List?,
    );
  }
}

extension $StabilityResultCopyWith on StabilityResult {
  /// Returns a callable class that can be used as follows: `instanceOfStabilityResult.copyWith(...)` or like so:`instanceOfStabilityResult.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$StabilityResultCWProxy get copyWith => _$StabilityResultCWProxyImpl(this);
}
