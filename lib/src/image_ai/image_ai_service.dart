import 'dart:async';
import 'dart:developer';
import 'package:ai_kits/ai_kits.dart';
import 'package:dio/dio.dart';
import 'package:is_open_proxy/is_open_proxy.dart';

class ImageAIService {
  static final ImageAIService _instance = ImageAIService._internal();
  ImageAIService._internal();
  factory ImageAIService() => _instance;

  late ImageConfig _config;

  void init(ImageConfig config) {
    _config = config;
    ImaginatingCountingManager().setUpLimitation(_config.imaginatingLimitation);
  }

  Future<dynamic> requestImage(String prompt) async {
    try {
      log('requestImage: $prompt', name: 'ImageAIService');
      if (await IsOpenProxy.isOpenProxy) {
        throw Exception('Please turn off your VPN or Proxy to continue');
      }
      final data = _config.body;
      data["prompt"] = prompt;
      final response = await Dio().post(
        _config.hostUrl,
        data: data,
        options: Options(
          receiveTimeout: const Duration(seconds: 60),
          headers: _config.headers,
        ),
      );
      final result = response.data["output"];
      AIKits().analysisMixin.sendEvent("success_promptImageApiRequest");
      return result;
    } catch (e) {
      log(e.toString());
      AIKits().analysisMixin.sendEvent("error_promptImageApiRequest");
      return null;
    }
  }
}