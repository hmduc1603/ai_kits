// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'voice_model.g.dart';

@JsonSerializable()
class VoiceModelList {
  final List<VoiceModel> models;
  VoiceModelList({
    required this.models,
  });

  factory VoiceModelList.fromJson(Map<String, dynamic> json) =>
      _$VoiceModelListFromJson(json);

  Map<String, dynamic> toJson() => _$VoiceModelListToJson(this);
}

@JsonSerializable()
class VoiceModel {
  @JsonKey(name: "_id")
  final String id;
  @JsonKey(name: "artistname")
  final String artistName;
  final int uses;
  final ArtistImage image;
  final bool? isLive;
  final bool? isPublic;
  final String? urlParam;
  final DateTime? createdAt;
  final int? likes;
  final String? customDisplayName;

  VoiceModel({
    required this.id,
    required this.artistName,
    required this.uses,
    required this.image,
    required this.isLive,
    required this.isPublic,
    required this.urlParam,
    required this.createdAt,
    required this.likes,
    this.customDisplayName,
  });

  factory VoiceModel.fromJson(Map<String, dynamic> json) =>
      _$VoiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$VoiceModelToJson(this);
}

@JsonSerializable()
class ArtistImage {
  final String url;
  final String blurhash;

  ArtistImage({
    required this.url,
    required this.blurhash,
  });

  factory ArtistImage.fromJson(Map<String, dynamic> json) =>
      _$ArtistImageFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistImageToJson(this);
}

@JsonSerializable()
class ArtistInfo {
  final String trainedBy;
  final String uploadedBy;

  ArtistInfo({
    required this.trainedBy,
    required this.uploadedBy,
  });

  factory ArtistInfo.fromJson(Map<String, dynamic> json) =>
      _$ArtistInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistInfoToJson(this);
}

@JsonSerializable()
class ArtistTrending {
  final bool isTrending;
  final int? position;

  ArtistTrending({
    required this.isTrending,
    this.position,
  });

  factory ArtistTrending.fromJson(Map<String, dynamic> json) =>
      _$ArtistTrendingFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistTrendingToJson(this);
}
