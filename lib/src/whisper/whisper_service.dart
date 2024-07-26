// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:ai_kits/src/chat_gpt/manager/daily_counting_manager/daily_counting_manager.dart';
import 'package:ai_kits/src/whisper/whisper_config.dart';
import 'package:dio/dio.dart';
import 'package:is_open_proxy/is_open_proxy.dart';
import 'package:http_parser/http_parser.dart';

class WhisperService {
  static final WhisperService _instance = WhisperService._internal();
  WhisperService._internal();
  factory WhisperService() => _instance;

  void init({
    required WhisperConfig config,
  }) {
    DailyCountingManager().setUpLimitation(config.dailyLimitation);
  }

  Future<String?> startTranscription({
    required String path,
    required WhisperConfig config,
  }) async {
    try {
      log('Start Transcription: $path');
      if (await IsOpenProxy.isOpenProxy) {
        throw Exception('Please turn off your VPN or Proxy to continue');
      }
      //Call
      final form = FormData();
      final file = await MultipartFile.fromFile(
        path,
        contentType: MediaType("audio", "m4a"),
      );
      log("${file.contentType} - ${file.filename} - ${file.headers}",
          name: "Form File");
      form.files.add(MapEntry('file', file));
      final response = await Dio().post(
        "${config.renderApiConfig.hostUrl}/transcriptions",
        data: form,
        options: Options(
            headers: config.renderApiConfig.headers
              ..addAll({
                'Content-Type': 'multipart/form-data',
              })),
      );
      if (response.statusCode == 200) {
        // Final Prompting
        final data = response.data as Map;
        final result = data["result"] as String;
        return result;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
