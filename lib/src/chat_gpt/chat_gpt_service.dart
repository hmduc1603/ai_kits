import 'dart:developer';
import 'package:ai_kits/ai_kits.dart';
import 'package:dart_openai/openai.dart';
import 'package:dio/dio.dart';
import 'package:is_open_proxy/is_open_proxy.dart';

class ChatGPTService {
  static final ChatGPTService _instance = ChatGPTService._internal();
  ChatGPTService._internal();
  factory ChatGPTService() => _instance;

  late ChatGPTConfig _config;

  void init(ChatGPTConfig config) {
    _config = config;
  }

  Future<PromptingEntity> promptAnInput(PromptingEntity promptingEntity) async {
    log('promptAnInput', name: 'ApiService');
    if (await IsOpenProxy.isOpenProxy) {
      throw Exception('Please turn off your VPN or Proxy to continue');
    }
    final String? result = await _promptRequest(promptingEntity.prompt);
    if (result == null) {
      AIKits().analysisMixin.sendEvent("error_promptAnInput");
      throw Exception("AI is busy with large requests, please try again later");
    }

    log("Prompting result: $result", name: "ApiService");

    return promptingEntity.copyWith.result(result);
  }

  Future<PromptingEntity> promptAnChat(
      List<PromptingEntity> lastPrompts, PromptingEntity prompt) async {
    log('promptAnChat', name: 'ApiService');
    if (await IsOpenProxy.isOpenProxy) {
      throw Exception('Please turn off your VPN or Proxy to continue');
    }
    final list = lastPrompts.toList();
    list.add(prompt);
    final String? result = _config.shouldUseDirectApiOnChat
        ? await _promptTurboRequest(list)
        : await _promptCustomRequest(prompt.prompt);
    if (result == null) {
      AIKits().analysisMixin.sendEvent("error_promptAnChat");
      throw Exception("AI is busy with large requests, please try again later");
    }

    log("Prompting result: $result", name: "ApiService");

    return prompt.copyWith.result(result);
  }

  Future<String?> _promptTurboRequest(
      List<PromptingEntity> promptingEntities) async {
    AIKits().analysisMixin.sendEvent("prompt_turbo_chat_gpt_request");
    final listKeys = _config.chatGPTKeys;
    if (listKeys.isEmpty) {
      return null;
    }
    final String key = (listKeys.toList()..shuffle()).first;
    try {
      OpenAI.apiKey = key;
      final OpenAIChatCompletionModel chatCompletion =
          await OpenAI.instance.chat.create(
        model: "gpt-3.5-turbo",
        messages: promptingEntities
            .map((e) => OpenAIChatCompletionChoiceMessageModel(
                content: e.prompt, role: OpenAIChatMessageRole.user))
            .toList(),
        maxTokens: 500,
      );
      return chatCompletion.choices.first.message.content.trim();
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<String?> _promptCustomRequest(String prompt) async {
    AIKits().analysisMixin.sendEvent("prompt_custom_request");
    try {
      final response = await Dio().post(
        _config.customHost.url,
        data: _config.customHost.getData(prompt),
        options: Options(
          receiveTimeout: 15000,
          headers: _config.customHost.headers,
        ),
      );
      if (response.data != null) {
        final data =
            (response.data["choices"] as List).first["text"].toString().trim();
        return data;
      }
    } catch (e) {
      log(e.toString());
      AIKits().analysisMixin.sendEvent("error_custom_request");
    }
    return null;
  }

  Future<String?> _promptChatGptRequest(String prompt) async {
    AIKits().analysisMixin.sendEvent("prompt_chat_gpt_request");
    final listKeys = _config.chatGPTKeys;
    if (listKeys.isEmpty) {
      return null;
    }
    final String key = (listKeys.toList()..shuffle()).first;
    try {
      OpenAI.apiKey = key;
      if (_config.enableTurbo) {
        const model = "gpt-3.5-turbo";
        AIKits().analysisMixin.sendEvent("prompt_$model");
        final OpenAIChatCompletionModel chatCompletion =
            await OpenAI.instance.chat.create(
          model: model,
          messages: [
            OpenAIChatCompletionChoiceMessageModel(
                role: OpenAIChatMessageRole.user, content: prompt),
          ],
          maxTokens: 1000,
        );
        return chatCompletion.choices.first.message.content.trim();
      } else {
        final model = _config.model;
        AIKits().analysisMixin.sendEvent("prompt_$model");
        final OpenAICompletionModel completion =
            await OpenAI.instance.completion.create(
          model: model,
          prompt: prompt,
          maxTokens: 1000,
        );
        return completion.choices.first.text.trim();
      }
    } catch (e) {
      log(e.toString());
      AIKits().analysisMixin.sendEvent('chat_gpt_error_key');
      return null;
    }
  }

  Future<String?> _promptRequest(String prompt) async {
    log(prompt, name: 'promptRequest');
    if (_config.shouldUseDirectApi) {
      final result2 = await _promptChatGptRequest(prompt);
      if (result2 == null) {
        return _promptCustomRequest(prompt);
      } else {
        return result2;
      }
    } else {
      final result1 = await _promptCustomRequest(prompt);
      if (result1 == null) {
        return _promptChatGptRequest(prompt);
      } else {
        return result1;
      }
    }
  }
}
