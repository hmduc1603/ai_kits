import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'package:ai_kits/ai_kits.dart';
import 'package:dio/dio.dart';
import 'package:is_open_proxy/is_open_proxy.dart';

class StabilityAIService {
  static final StabilityAIService _instance = StabilityAIService._internal();
  StabilityAIService._internal();
  factory StabilityAIService() => _instance;

  late StabilityConfig _config;

  void init(StabilityConfig config) {
    _config = config;
    ImaginatingCountingManager().setUpLimitation(_config.imaginatingLimitation);
  }

  Future<Uint8List?> requestImage(String prompt) async {
    log('requestImage: $prompt', name: 'StabilityAIService');
    if (await IsOpenProxy.isOpenProxy) {
      throw Exception('Please turn off your VPN or Proxy to continue');
    }
    final response = await Dio().post(
      "https://api.stability.ai/v1/generation/${_config.stabilityEngine}/text-to-image",
      data: {
        "height": _config.imageHeight ?? 768,
        "width": _config.imageWidth ?? 768,
        "steps": _config.steps ?? 30,
        "text_prompts": [
          {"text": prompt, "weight": 0.5}
        ],
        "style_preset": _config.stylePreset,
      },
      options: Options(
        receiveTimeout: 30000,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${_config.key}",
        },
      ),
    );
    if (response.statusCode == 200) {
      return base64Decode(response.data["artifacts"][0]["base64"]);
    } else {
      throw Exception();
    }
  }
}
