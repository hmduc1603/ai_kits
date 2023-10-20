import 'dart:typed_data';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:objectbox/objectbox.dart';
import 'package:random_string/random_string.dart';

part 'image_result.g.dart';

@Entity()
@CopyWith()
class ImageResult {
  int? id;
  final String cacheImageId;
  final String input;
  Uint8List? result;
  String? resultUrl;
  @Property(type: PropertyType.date)
  final DateTime createdDate;
  final bool isSavedToGallery;
  final bool hasError;

  ImageResult({
    this.id,
    required this.cacheImageId,
    required this.input,
    this.result,
    this.resultUrl,
    required this.createdDate,
    this.isSavedToGallery = false,
    this.hasError = false,
  });

  factory ImageResult.create(String input) {
    return ImageResult(
        input: input,
        createdDate: DateTime.now(),
        cacheImageId: randomString(10));
  }

  bool get hasResult => result != null || resultUrl != null;
}
