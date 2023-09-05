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
  late String _rapidApiRegrex;

  void init({
    required ChatGPTConfig config,
    required String rapidApiRegrex,
  }) {
    _config = config;
    _rapidApiRegrex = rapidApiRegrex;
    PromptingCountingManager().setUpLimitation(config.promptingLimitation);
  }

  Future<PromptingEntity> promptAnInput(PromptingEntity promptingEntity) async {
    log('promptAnInput', name: 'ApiService');
    if (await IsOpenProxy.isOpenProxy) {
      throw Exception('Please turn off your VPN or Proxy to continue');
    }
    final String? result = await promptRequest(promptingEntity.prompt);
    if (result == null) {
      AIKits().analysisMixin.sendEvent("error_promptAnInput");
      throw Exception("AI is busy with large requests, please try again later");
    }

    log("Prompting result: $result", name: "ApiService");

    return promptingEntity.copyWith.result(result);
  }

  Future<PromptingEntity> promptAnChat(
    List<PromptingEntity> lastPrompts,
    PromptingEntity prompt, {
    int? maxToken,
    double? temperature,
  }) async {
    log('Prompt An Chat: ${prompt.prompt}}', name: 'ApiService');
    if (await IsOpenProxy.isOpenProxy) {
      throw Exception('Please turn off your VPN or Proxy to continue');
    }
    final list = lastPrompts.toList();
    list.add(prompt);
    final String? result = _config.shouldUseDirectApiOnChat
        ? await promptTurboRequest(list,
            maxToken: maxToken, temperature: temperature)
        : await promptCustomRequest(
            temperature: temperature, prompts: _getOpenAImessages(list));
    if (result == null) {
      AIKits().analysisMixin.sendEvent("error_promptAnChat");
      throw Exception("AI is busy with large requests, please try again later");
    }

    log("Prompting result: $result", name: "ApiService");

    return prompt.copyWith.result(result);
  }

  Future<String?> promptTurboRequest(
    List<PromptingEntity> promptingEntities, {
    int? maxToken,
    double? temperature,
  }) async {
    AIKits().analysisMixin.sendEvent("prompt_turbo_chat_gpt_request");
    final String key = _config.key;
    try {
      OpenAI.apiKey = key;
      final OpenAIChatCompletionModel chatCompletion =
          await OpenAI.instance.chat.create(
        model: ChatGPTModel.turbo,
        messages: _getOpenAImessages(promptingEntities),
        maxTokens: maxToken ?? 500,
        temperature: temperature,
      );
      return chatCompletion.choices.first.message.content.trim();
    } catch (e) {
      log(e.toString());
      AIKits().analysisMixin.sendEvent("error_promptTurboRequest");
      return null;
    }
  }

  List<OpenAIChatCompletionChoiceMessageModel> _getOpenAImessages(
      List<PromptingEntity> promptingEntities) {
    List<OpenAIChatCompletionChoiceMessageModel> list = [];
    for (var element in promptingEntities) {
      list.addAll(element.messagesByRole);
    }
    return list;
  }

  Future<String?> promptCustomRequest({
    double? temperature,
    required List<OpenAIChatCompletionChoiceMessageModel> prompts,
  }) async {
    AIKits().analysisMixin.sendEvent("prompt_custom_request");
    try {
      final response = await Dio().post(
        _config.rapidApiConfig.hostUrl,
        data: _config.rapidApiConfig.params
          ..addAll({
            "temperature": temperature ?? 0.7,
            "messages": prompts
                .map((e) => {
                      "role": e.role.name,
                      "content": e.content,
                    })
                .toList()
          }),
        options: Options(
          headers: _config.rapidApiConfig.headers,
        ),
      );
      if (response.data != null) {
        final regrex = RegExp(_rapidApiRegrex);
        final match = regrex.firstMatch(response.data.toString());
        final result = match?.group(0);
        return result;
      }
    } catch (e) {
      log(e.toString());
      AIKits().analysisMixin.sendEvent("error_promptCustomRequest");
    }
    return null;
  }

  Future<String?> promptCustomModelChatGPTRequest({
    required String prompt,
    required String model,
    int maxTokens = 1000,
  }) async {
    AIKits().analysisMixin.sendEvent("prompt_custom_mode_gpt_request");
    final String key = _config.key;
    try {
      OpenAI.apiKey = key;
      AIKits().analysisMixin.sendEvent("prompt_$model");
      final OpenAICompletionModel completion =
          await OpenAI.instance.completion.create(
        model: model,
        prompt: prompt,
        maxTokens: maxTokens,
      );
      return completion.choices.first.text.trim();
    } catch (e) {
      log(e.toString());
      AIKits().analysisMixin.sendEvent('error_promptCustomModelChatGPTRequest');
      return null;
    }
  }

  Future<String?> promptChatGptRequest(String prompt,
      {String? customModel, int? customMaxTokens}) async {
    AIKits().analysisMixin.sendEvent("prompt_chat_gpt_request");
    final String key = _config.key;
    try {
      OpenAI.apiKey = key;
      if (_config.enableTurbo) {
        final model = customModel ?? ChatGPTModel.turbo;
        AIKits().analysisMixin.sendEvent("prompt_$model");
        final OpenAIChatCompletionModel chatCompletion =
            await OpenAI.instance.chat.create(
          model: model,
          messages: [
            OpenAIChatCompletionChoiceMessageModel(
                role: OpenAIChatMessageRole.user, content: prompt),
          ],
          maxTokens: customMaxTokens ?? 1000,
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
      AIKits().analysisMixin.sendEvent('error_promptChatGptRequest');
      return null;
    }
  }

  Future<String?> promptRequest(String prompt,
      {String? customModel, int? customMaxTokens}) async {
    log(prompt, name: 'promptRequest');
    if (_config.shouldUseDirectApi) {
      final result2 = await promptChatGptRequest(
        prompt,
        customModel: customModel,
        customMaxTokens: customMaxTokens,
      );
      if (result2 == null) {
        return promptCustomRequest(
          prompts: [
            OpenAIChatCompletionChoiceMessageModel(
                role: OpenAIChatMessageRole.user, content: prompt)
          ],
        );
      } else {
        return result2;
      }
    } else {
      final result1 = await promptCustomRequest(
        prompts: [
          OpenAIChatCompletionChoiceMessageModel(
              role: OpenAIChatMessageRole.user, content: prompt)
        ],
      );
      if (result1 == null) {
        return promptChatGptRequest(
          prompt,
          customModel: customModel,
          customMaxTokens: customMaxTokens,
        );
      } else {
        return result1;
      }
    }
  }
}
