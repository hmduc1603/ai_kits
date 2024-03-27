import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
class ImageModel {
  final String title;
  final String modelId;
  final String thumbnailUrl;

  ImageModel(
      {required this.title, required this.modelId, required this.thumbnailUrl});

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}
