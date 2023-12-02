// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VoiceModelList _$VoiceModelListFromJson(Map<String, dynamic> json) =>
    VoiceModelList(
      models: (json['models'] as List<dynamic>)
          .map((e) => VoiceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VoiceModelListToJson(VoiceModelList instance) =>
    <String, dynamic>{
      'models': instance.models,
    };

VoiceModel _$VoiceModelFromJson(Map<String, dynamic> json) => VoiceModel(
      id: json['_id'] as String,
      artistName: json['artistname'] as String,
      uses: json['uses'] as int,
      image: ArtistImage.fromJson(json['image'] as Map<String, dynamic>),
      isLive: json['isLive'] as bool?,
      isPublic: json['isPublic'] as bool?,
      urlParam: json['urlParam'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      likes: json['likes'] as int?,
      customDisplayName: json['customDisplayName'] as String?,
    );

Map<String, dynamic> _$VoiceModelToJson(VoiceModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'artistname': instance.artistName,
      'uses': instance.uses,
      'image': instance.image,
      'isLive': instance.isLive,
      'isPublic': instance.isPublic,
      'urlParam': instance.urlParam,
      'createdAt': instance.createdAt?.toIso8601String(),
      'likes': instance.likes,
      'customDisplayName': instance.customDisplayName,
    };

ArtistImage _$ArtistImageFromJson(Map<String, dynamic> json) => ArtistImage(
      url: json['url'] as String,
      blurhash: json['blurhash'] as String,
    );

Map<String, dynamic> _$ArtistImageToJson(ArtistImage instance) =>
    <String, dynamic>{
      'url': instance.url,
      'blurhash': instance.blurhash,
    };

ArtistInfo _$ArtistInfoFromJson(Map<String, dynamic> json) => ArtistInfo(
      trainedBy: json['trainedBy'] as String,
      uploadedBy: json['uploadedBy'] as String,
    );

Map<String, dynamic> _$ArtistInfoToJson(ArtistInfo instance) =>
    <String, dynamic>{
      'trainedBy': instance.trainedBy,
      'uploadedBy': instance.uploadedBy,
    };

ArtistTrending _$ArtistTrendingFromJson(Map<String, dynamic> json) =>
    ArtistTrending(
      isTrending: json['isTrending'] as bool,
      position: json['position'] as int?,
    );

Map<String, dynamic> _$ArtistTrendingToJson(ArtistTrending instance) =>
    <String, dynamic>{
      'isTrending': instance.isTrending,
      'position': instance.position,
    };
