// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'package:ai_kits/ai_kits.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:dio/dio.dart';
import 'package:is_open_proxy/is_open_proxy.dart';
import 'package:collection/collection.dart';

class ChatGPTService {
  static final ChatGPTService _instance = ChatGPTService._internal();
  ChatGPTService._internal();
  factory ChatGPTService() => _instance;

  void init({
    required ChatGPTConfig config,
  }) {
    PromptingCountingManager().setUpLimitation(config.promptingLimitation);
  }

  Future<ChatGPTResult?> promptAnChat(
    List<PromptingEntity> lastPrompts,
    PromptingEntity prompt, {
    int? maxToken,
    double? temperature,
    required ChatGPTConfig config,
    required String token,
  }) async {
    log('Prompt An Stream Chat: ${prompt.prompt}}', name: 'ApiService');
    if (await IsOpenProxy.isOpenProxy) {
      throw Exception('Please turn off your VPN or Proxy to continue');
    }
    final list = lastPrompts.toList();
    list.add(prompt);
    return _promptRenderApiRequest(
        idToken: token,
        maxToken: maxToken,
        prompt: prompt,
        prompts: _getOpenAImessages(list, null),
        config: config);
  }

  List<OpenAIChatCompletionChoiceMessageModel> _getOpenAImessages(
      List<PromptingEntity> promptingEntities, String? systemMessage) {
    List<OpenAIChatCompletionChoiceMessageModel> list = [];
    for (var element in promptingEntities) {
      list.addAll(element.messagesByRole);
    }
    if (systemMessage != null &&
        list.firstWhereOrNull((e) => e.role == OpenAIChatMessageRole.system) ==
            null) {
      list.insert(
          0,
          OpenAIChatCompletionChoiceMessageModel(
              content: systemMessage, role: OpenAIChatMessageRole.system));
    }
    return list;
  }

  Future<PromptingEntity?> promptAnInput(
    List<PromptingEntity> lastPrompts,
    PromptingEntity prompt, {
    int? maxToken,
    double? temperature,
    required ChatGPTConfig config,
    String? systemMessage,
    required String idToken,
  }) async {
    try {
      log('Prompt An Input: ${prompt.prompt}}', name: 'ApiService');
      if (await IsOpenProxy.isOpenProxy) {
        throw Exception('Please turn off your VPN or Proxy to continue');
      }
      final list = lastPrompts.toList();
      list.add(prompt);
      final prompts = _getOpenAImessages(list, systemMessage);
      // Call
      var params = Map.from(config.renderApiConfig.body);
      params.addAll({
        "maxToken": maxToken,
        "temperature": temperature ?? 0.7,
        "messages": prompts.map((e) => e.toMap()).toList()
      });
      final response = await Dio().post(
        config.renderApiConfig.hostUrl,
        data: params,
        options: Options(
          headers: config.renderApiConfig.headers
            ..addAll({
              "service_name": "chatGPT",
              "id_token": idToken,
            }),
        ),
      );
      if (response.statusCode == 200) {
        // Final Prompting
        final data = response.data as Map;
        final result = data["result"] as String;
        log(result, name: "promptAnInput");
        return prompt.copyWith(result: result);
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<ChatGPTResult?> _promptRenderApiRequest({
    double? temperature,
    required PromptingEntity prompt,
    required List<OpenAIChatCompletionChoiceMessageModel> prompts,
    required ChatGPTConfig config,
    required String idToken,
    int? maxToken,
  }) async {
    try {
      var params = Map.from(config.renderApiConfig.body);
      params.addAll({
        "maxToken": maxToken,
        "temperature": temperature ?? 0.7,
        "messages": prompts.map((e) => e.toMap()).toList()
      });
      final enableStream = config.renderApiConfig.stream;
      final url = enableStream
          ? "${config.renderApiConfig.hostUrl}/stream"
          : config.renderApiConfig.hostUrl;
      final response = await Dio().post(
        url,
        data: params,
        options: Options(
          responseType: enableStream ? ResponseType.stream : null,
          headers: config.renderApiConfig.headers
            ..addAll({
              "service_name": "chatGPT",
              "id_token": idToken,
            }),
        ),
      );
      if (response.statusCode == 200) {
        if (enableStream) {
          // Stream Prompt
          Stream<dynamic> dataStream = response.data.stream;
          return ChatGPTResult(
              stream: dataStream.transform(StreamChatGPTTransformer(prompt)));
        } else {
          // Final Prompting
          final data = response.data as Map;
          final result = data["result"] as String;
          return ChatGPTResult(entity: prompt.copyWith(result: result));
        }
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      AIKits().analysisMixin.sendEvent("error_promptRenderApiRequest");
    }
    return null;
  }
}

class StreamChatGPTTransformer
    extends StreamTransformerBase<Uint8List, PromptingEntity> {
  final PromptingEntity promptingEntity;

  StreamChatGPTTransformer(this.promptingEntity);

  List<String> chunks = [];

  @override
  Stream<PromptingEntity> bind(Stream<Uint8List> stream) {
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
