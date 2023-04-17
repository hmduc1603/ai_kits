// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prompt_counting_manager.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PromptingLimitation _$PromptingLimitationFromJson(Map<String, dynamic> json) =>
    PromptingLimitation(
      dailyPromptingLimit: json['dailyPromptingLimit'] as int,
      dailyChatLimit: json['dailyChatLimit'] as int? ?? 1,
    );

Map<String, dynamic> _$PromptingLimitationToJson(
        PromptingLimitation instance) =>
    <String, dynamic>{
      'dailyPromptingLimit': instance.dailyPromptingLimit,
      'dailyChatLimit': instance.dailyChatLimit,
    };
