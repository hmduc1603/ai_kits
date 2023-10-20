import 'dart:developer';
import 'package:ai_kits/ai_kits.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:dio/dio.dart';
import 'package:is_open_proxy/is_open_proxy.dart';

class ChatGPTService {
  static final ChatGPTService _instance = ChatGPTService._internal();
  ChatGPTService._internal();
  factory ChatGPTService() => _instance;

  late ChatGPTConfig _config;

  void init({
    required ChatGPTConfig config,
  }) {
    _config = config;
    PromptingCountingManager().setUpLimitation(config.promptingLimitation);
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
    final String? result =
        !_config.shouldUseRenderApi && _config.externalApiConfig != null
            ? await promptExternalApiRequest(
                temperature: temperature, prompts: _getOpenAImessages(list))
            : await promptRenderApiRequest(
                temperature: temperature, prompts: _getOpenAImessages(list));
    if (result == null) {
      AIKits().analysisMixin.sendEvent("error_promptAnChat");
      throw Exception("AI is busy with large requests, please try again later");
    }

    log("Prompting result: $result", name: "ApiService");

    return prompt.copyWith.result(result);
  }

  List<OpenAIChatCompletionChoiceMessageModel> _getOpenAImessages(
      List<PromptingEntity> promptingEntities) {
    List<OpenAIChatCompletionChoiceMessageModel> list = [];
    for (var element in promptingEntities) {
      list.addAll(element.messagesByRole);
    }
    return list;
  }

  Future<String?> promptExternalApiRequest({
    double? temperature,
    required List<OpenAIChatCompletionChoiceMessageModel> prompts,
  }) async {
    AIKits().analysisMixin.sendEvent("prompt_rapid_request");
    try {
      final params = _config.externalApiConfig!.params
        ..addAll({
          "messages": prompts
              .map((e) => {
                    "role": e.role.name,
                    "content": e.content,
                  })
              .toList()
        });
      if (params.containsKey("temperature")) {
        params["temperature"] = temperature ?? 0.7;
      }
      final response = await Dio().post(
        _config.externalApiConfig!.hostUrl,
        data: params,
        options: Options(
          headers: _config.externalApiConfig!.headers,
        ),
      );
      if (response.data != null) {
        final json = response.data as Map;
        if (json.containsKey(_config.externalApiConfig!.resultJsonKey)) {
          return json[_config.externalApiConfig!.resultJsonKey];
        } else {
          final data = (response.data["choices"] as List)
              .first["message"]["content"]
              .toString()
              .trim();
          return data;
        }
      }
    } catch (e) {
      log(e.toString());
      AIKits().analysisMixin.sendEvent("error_promptRapidApiRequest");
    }
    return null;
  }

  Future<String?> promptRenderApiRequest({
    double? temperature,
    required List<OpenAIChatCompletionChoiceMessageModel> prompts,
  }) async {
    AIKits().analysisMixin.sendEvent("prompt_render_request");
    try {
      var params = Map.from(_config.renderApiConfig.body);
      params.addAll({
        "temperature": temperature ?? 0.7,
        "messages": prompts.map((e) => e.toMap()).toList()
      });
      final response = await Dio().post(
        _config.renderApiConfig.hostUrl,
        data: params,
        options: Options(
          headers: _config.renderApiConfig.headers
            ..addAll({"service_name": "chatGPT"}),
        ),
      );
      if (response.data != null) {
        final data = response.data["result"] as String;
        return data;
      }
    } catch (e) {
      log(e.toString());
      AIKits().analysisMixin.sendEvent("error_promptRenderApiRequest");
    }
    return null;
  }
}
