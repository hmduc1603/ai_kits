import 'dart:developer';

import 'package:ai_kits/ai_kits.dart';
import 'package:ai_kits/src/stable_diffusion/entity/stable_diffusion_config.dart';
import 'package:dio/dio.dart';

class StableDiffusionService {
  static final StableDiffusionService _instance =
      StableDiffusionService._internal();
  StableDiffusionService._internal();
  factory StableDiffusionService() => _instance;

  late StableDiffusionConfig _config;

  init(StableDiffusionConfig config) {
    _config = config;
  }

  Future<ImageEntity> getImagination(ImageEntity imageEntity) async {
    log('getImagination', name: 'ApiService');
    final ImageEntity? result = await _getImagination(imageEntity.getUrl!);
    if (result == null) {
      AIKits().analysisMixin.sendEvent("error_api_imagination_request");
      throw Exception("AI is busy with large requests, please try again later");
    }

    log("Imagination result: ${result.output}", name: "ApiService");

    return result;
  }

  Future<ImageEntity> requestImagination(ImageInput imageInput) async {
    log('requestImagination', name: 'ApiService');
    final ImageEntity? result = await _requestImagination(imageInput);
    if (result == null) {
      AIKits().analysisMixin.sendEvent("error_api_imagination_request");
      throw Exception("AI is busy with large requests, please try again later");
    }

    log("Imagination result: ${result.output}", name: "ApiService");

    return result;
  }

  Future<ImageEntity?> _requestImagination(ImageInput imageInput) async {
    final data = {
      "version": _config.modelVersion,
      "input": imageInput.toJson()
    };
    final response = await Dio().post(
      "https://api.replicate.com/v1/predictions",
      data: data,
      options: Options(
        receiveTimeout: 15000,
        headers: {
          "Authorization": "Token ${_config.replicateApiKey}",
        },
      ),
    );
    if (response.statusCode == 201) {
      log("requestImagination + result:${response.data}");
      return ImageEntity.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<ImageEntity?> _getImagination(String url) async {
    final response = await Dio().get(
      url,
      options: Options(
        receiveTimeout: 15000,
        headers: {
          "Authorization": "Token ${_config.replicateApiKey}",
        },
      ),
    );
    if (response.statusCode == 201 || response.statusCode == 200) {
      return ImageEntity.fromJson(response.data);
    } else {
      return null;
    }
  }
}
