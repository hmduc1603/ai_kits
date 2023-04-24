import 'dart:typed_data';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:objectbox/objectbox.dart';
import 'package:random_string/random_string.dart';

part 'stability_result.g.dart';

@Entity()
@CopyWith()
class StabilityResult {
  int? id;
  final String cacheImageId;
  final String input;
  Uint8List? result;
  @Property(type: PropertyType.date)
  final DateTime createdDate;
  final bool isSavedToGallery;
  final bool hasError;

  StabilityResult({
    this.id,
    required this.cacheImageId,
    required this.input,
    this.result,
    required this.createdDate,
    this.isSavedToGallery = false,
    this.hasError = false,
  });

  factory StabilityResult.create(String input) {
    return StabilityResult(
        input: input,
        createdDate: DateTime.now(),
        cacheImageId: randomString(10));
  }
}
