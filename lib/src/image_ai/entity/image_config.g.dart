// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageConfig _$ImageConfigFromJson(Map<String, dynamic> json) => ImageConfig(
      headers: json['headers'] as Map<String, dynamic>,
      body: json['body'] as Map<String, dynamic>,
      hostUrl: json['hostUrl'] as String,
      imaginatingLimitation: ImaginatingLimitation.fromJson(
          json['imaginatingLimitation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImageConfigToJson(ImageConfig instance) =>
    <String, dynamic>{
      'headers': instance.headers,
      'body': instance.body,
      'hostUrl': instance.hostUrl,
      'imaginatingLimitation': instance.imaginatingLimitation,
    };
