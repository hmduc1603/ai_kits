import 'dart:async';
import 'dart:developer';
import 'package:ai_kits/ai_kits.dart';
import 'package:dio/dio.dart';
import 'package:is_open_proxy/is_open_proxy.dart';

class ImageAIService {
  static final ImageAIService _instance = ImageAIService._internal();
  ImageAIService._internal();
  factory ImageAIService() => _instance;

  void init(ImageConfig config) {
    ImaginatingCountingManager().setUpLimitation(config.imaginatingLimitation);
  }

  Future<dynamic> requestImage({
    required String prompt,
    required ImageConfig config,
    required String token,
  }) async {
    try {
      log('requestImage: $prompt', name: 'ImageAIService');
      if (await IsOpenProxy.isOpenProxy) {
        throw Exception('Please turn off your VPN or Proxy to continue');
      }
      final data = config.body;
      data["prompt"] = prompt;
      final response = await Dio().post(
        config.hostUrl,
        data: data,
        options: Options(
            receiveTimeout: const Duration(seconds: 60),
            headers: config.headers..addAll({'id_token': token})),
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
