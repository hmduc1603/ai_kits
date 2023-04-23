// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stability_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StabilityConfig _$StabilityConfigFromJson(Map<String, dynamic> json) =>
    StabilityConfig(
      stabilityKey: json['stabilityKey'] as String,
      imageHeight: json['imageHeight'] as int?,
      imageWidth: json['imageWidth'] as int?,
      stabilityEngine: json['stabilityEngine'] as String?,
      imaginatingLimitation: ImaginatingLimitation.fromJson(
          json['imaginatingLimitation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StabilityConfigToJson(StabilityConfig instance) =>
    <String, dynamic>{
      'stabilityKey': instance.stabilityKey,
      'imageHeight': instance.imageHeight,
      'imageWidth': instance.imageWidth,
      'stabilityEngine': instance.stabilityEngine,
      'imaginatingLimitation': instance.imaginatingLimitation,
    };
