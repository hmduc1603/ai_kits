// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:ai_kits/ai_kits.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:is_open_proxy/is_open_proxy.dart';

class GeminiService {
  static final GeminiService _instance = GeminiService._internal();
  GeminiService._internal();
  factory GeminiService() => _instance;

  void init({
    required GeminiConfig config,
  }) {
    PromptingCountingManager().setUpLimitation(config.promptingLimitation);
  }

  Future<GeminiResult> promptAnChat(
    GeminiPromptingEntity prompt, {
    int? maxToken,
    double? temperature,
    String? systemInstruction,
    required GeminiConfig config,
    required String idToken,
  }) async {
    log('Prompt An Stream Chat: ${prompt.prompt}}', name: 'GeminiService');
    if (await IsOpenProxy.isOpenProxy) {
      throw Exception('Please turn off your VPN or Proxy to continue');
    }
    var params = Map.from(config.renderApiConfig.body);
    params.addAll({
      "max_tokens": maxToken,
      "temperature": temperature ?? 1,
      "history": prompt.history?.map((e) => e.toJson()).toList(),
      "prompt": prompt.prompt,
      "instruction": systemInstruction,
    });
    final response = await Dio().post(
      "${config.renderApiConfig.hostUrl}/stream",
      data: params,
      options: Options(
        headers: config.renderApiConfig.headers
          ..addAll({
            "service_name": "gemini",
            "id_token": idToken,
          }),
      ),
    );
    if (response.statusCode == 200) {
      // Stream Prompt
      Stream<dynamic> dataStream = response.data.stream;
      return GeminiResult(
          stream: dataStream.transform(StreamChatGeminiTransformer(prompt)));
    } else {
      throw Exception(response.statusMessage);
    }
  }

  Future<GeminiPromptingEntity> promptAnInput(
    GeminiPromptingEntity prompt, {
    int? maxToken,
    double? temperature,
    required GeminiConfig config,
    bool forceJsonMode = false,
    String? systemInstruction,
    required String idToken,
  }) async {
    log('Prompt An Input: ${prompt.prompt}}', name: 'GeminiService');
    if (await IsOpenProxy.isOpenProxy) {
      throw Exception('Please turn off your VPN or Proxy to continue');
    }
    // Call
    var params = Map.from(config.renderApiConfig.body);
    params.addAll({
      "max_tokens": maxToken,
      "temperature": temperature ?? 1,
      "history": prompt.history?.map((e) => e.toJson()).toList(),
      "prompt": prompt.prompt,
      "instruction": systemInstruction,
      "force_json_mode": forceJsonMode,
    });
    final headers = config.renderApiConfig.headers;
    headers.addAll({
      "service_name": "gemini",
      "id_token": idToken,
    });
    final response = await Dio().post(
      config.renderApiConfig.hostUrl,
      data: params,
      options: Options(headers: headers),
    );
    if (response.statusCode == 200) {
      // Final Prompting
      // Map String
      final result = response.data["result"];
      log(result, name: "GeminiService");
      return prompt.copyWith(result: result);
    } else {
      throw Exception(response.statusMessage);
    }
  }

  Future<GeminiFileResult> uploadFile(
    String url,
    String mimeType, {
    int? maxToken,
    double? temperature,
    required GeminiConfig config,
    required String idToken,
  }) async {
    log('Upload file: $url - $mimeType', name: 'GeminiService');
    if (await IsOpenProxy.isOpenProxy) {
      throw Exception('Please turn off your VPN or Proxy to continue');
    }
    // Call
    var params = Map.from(config.renderApiConfig.body);
    params.addAll({
      "url": url,
      "mime_type": mimeType,
    });
    final response = await Dio().post(
      "${config.renderApiConfig.hostUrl}/upload",
      data: params,
      options: Options(
        headers: config.renderApiConfig.headers
          ..addAll({
            "service_name": "gemini",
            "id_token": idToken,
          }),
      ),
    );
    if (response.statusCode == 200) {
      // Final Prompting
      // Map String
      final result = response.data;
      return GeminiFileResult.fromJson(result);
    } else {
      throw Exception(response.statusMessage);
    }
  }
}

class StreamChatGeminiTransformer
    extends StreamTransformerBase<Uint8List, GeminiPromptingEntity> {
  final GeminiPromptingEntity promptingEntity;

  StreamChatGeminiTransformer(this.promptingEntity);

  List<String> chunks = [];

  @override
  Stream<GeminiPromptingEntity> bind(Stream<Uint8List> stream) {
    return stream.map((data) {
      // Modify the data before passing it downstream
      chunks.add(EmojiParser.replaceEmoji(
              String.fromCharCodes(data).replaceAll("\\n", "\n"))
          .replaceAll('\\', ""));
      return promptingEntity.copyWith(result: chunks.join());
    });
  }
}

class EmojiParser {
  // To detect a single unicode
  static const regEx1 = '\\\\u([0-9a-fA-F]{4})';

// To detect a 2-bytes unicode
  static const regEx2 = '$regEx1$regEx1';

  static String _regExEmojiUnicode(String text, String regEx) {
    final regexCheck = RegExp(regEx, caseSensitive: false);
    String newText = '';
    int lastEndText = 0;
    int lastEndNewText = 0;

    regexCheck.allMatches(text).forEach((match) {
      final start = match.start;
      final end = match.end;

      final String replacement = jsonDecode('"${match.group(0)}"');

      String startString;
      newText == ''
          ? startString = '${text.substring(0, start)}$replacement'
          : startString =
              '${newText.substring(0, lastEndNewText)}${text.substring(lastEndText, start)}$replacement';

      lastEndNewText = startString.length;
      lastEndText = end;

      newText = '$startString${text.substring(end)}';
    });

    if (newText == '') newText = text;

    return newText;
  }

  static String replaceEmoji(String text) {
    String newText = text;

    // Checking for 2-bytes and single bytes emojis
    if (newText.contains('\\u')) newText = _regExEmojiUnicode(newText, regEx2);
    if (newText.contains('\\u')) newText = _regExEmojiUnicode(newText, regEx1);

    return newText;
  }
}
