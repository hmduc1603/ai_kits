// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'image_entity.g.dart';

@Entity()
class ImageResult {
  int? id;
  final String input;
  final String result;
  @Property(type: PropertyType.date)
  final DateTime createdDate;
  bool isSavedToGallery = false;

  setIsSavedToGallery() {
    isSavedToGallery = true;
  }

  ImageResult({
    required this.input,
    required this.result,
    required this.createdDate,
  });
}

@CopyWith()
@JsonSerializable(fieldRename: FieldRename.snake)
class ImageInput {
  final String prompt;
  ImageInput({
    required this.prompt,
  });

  factory ImageInput.fromJson(Map<String, dynamic> json) =>
      _$ImageInputFromJson(json);

  Map<String, dynamic> toJson() => _$ImageInputToJson(this);
}

@CopyWith()
@JsonSerializable(fieldRename: FieldRename.snake)
class ImageEntity {
  final String? completedAt;
  final String? createdAt;
  final String? error;
  final String? id;
  final ImageInput input;
  final String? logs;
  final List<String>? output;
  final String? startedAt;
  final String? status;
  final Map<String, dynamic>? urls;
  // Number of result getting request (max = 3)
  @JsonKey(ignore: true)
  int gettingAttempts = 0;
  bool get reachMiximumAttempt => gettingAttempts == 5;

  String? get getUrl => urls?["get"];
  String? get canceltUrl => urls?["cancel"];

  ImageStatus get statusType {
    if (status == ImageStatus.starting.name) {
      return ImageStatus.starting;
    } else if (status == ImageStatus.succeeded.name) {
      return ImageStatus.succeeded;
    }
    return ImageStatus.failed;
  }

  void increaseGettingAttempts() {
    if (!reachMiximumAttempt) {
      gettingAttempts += 1;
    }
  }

  ImageEntity({
    this.completedAt,
    this.createdAt,
    this.id,
    this.error,
    required this.input,
    this.logs,
    this.output,
    this.startedAt,
    this.status,
    this.urls,
  });

  factory ImageEntity.fromJson(Map<String, dynamic> json) =>
      _$ImageEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ImageEntityToJson(this);
}

enum ImageStatus {
  starting,
  processing,
  succeeded,
  failed,
}
