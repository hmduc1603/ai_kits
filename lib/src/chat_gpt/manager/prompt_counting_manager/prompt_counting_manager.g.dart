// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prompt_counting_manager.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PromptingLimitation _$PromptingLimitationFromJson(Map<String, dynamic> json) =>
    PromptingLimitation(
      dailyPromptingLimit: json['dailyPromptingLimit'] as int? ?? 1,
      dailyChatingLimitation: json['dailyChatingLimitation'] as int? ?? 1,
    );

Map<String, dynamic> _$PromptingLimitationToJson(
        PromptingLimitation instance) =>
    <String, dynamic>{
      'dailyPromptingLimit': instance.dailyPromptingLimit,
      'dailyChatingLimitation': instance.dailyChatingLimitation,
    };
