import 'dart:developer';
import 'package:ai_kits/ai_kits.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:dio/dio.dart';
import 'package:is_open_proxy/is_open_proxy.dart';
import 'package:tuple/tuple.dart';

class ChatGPTService {
  static final ChatGPTService _instance = ChatGPTService._internal();
  ChatGPTService._internal();
  factory ChatGPTService() => _instance;

  void init({
    required ChatGPTConfig config,
  }) {
    PromptingCountingManager().setUpLimitation(config.promptingLimitation);
  }

  Future<PromptingEntity> promptAnChat(
    List<PromptingEntity> lastPrompts,
    PromptingEntity prompt, {
    int? maxToken,
    double? temperature,
    required ChatGPTConfig config,
  }) async {
    log('Prompt An Chat: ${prompt.prompt}}', name: 'ApiService');
    if (await IsOpenProxy.isOpenProxy) {
      throw Exception('Please turn off your VPN or Proxy to continue');
    }
    final list = lastPrompts.toList();
    list.add(prompt);
    final Tuple2<String, int?>? results =
        !config.shouldUseRenderApi && config.externalApiConfig != null
            ? await promptExternalApiRequest(
                config: config,
                temperature: temperature,
                prompts: _getOpenAImessages(list))
            : await promptRenderApiRequest(
                chatId: prompt.chatId,
                config: config,
                temperature: temperature,
                prompts: _getOpenAImessages(list));
    if (results == null) {
      AIKits().analysisMixin.sendEvent("error_promptAnChat");
      throw Exception("AI is busy with large requests, please try again later");
    }

    log("Prompting result: $results", name: "ApiService");

    return prompt.copyWith(
      result: results.item1,
      chatId: results.item2,
    );
  }

  List<OpenAIChatCompletionChoiceMessageModel> _getOpenAImessages(
      List<PromptingEntity> promptingEntities) {
    List<OpenAIChatCompletionChoiceMessageModel> list = [];
    for (var element in promptingEntities) {
      list.addAll(element.messagesByRole);
    }
    return list;
  }

  Future<Tuple2<String, int?>?> promptExternalApiRequest({
    double? temperature,
    required List<OpenAIChatCompletionChoiceMessageModel> prompts,
    required ChatGPTConfig config,
  }) async {
    AIKits().analysisMixin.sendEvent("prompt_rapid_request");
    try {
      final params = config.externalApiConfig!.params
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
        config.externalApiConfig!.hostUrl,
        data: params,
        options: Options(
          headers: config.externalApiConfig!.headers,
        ),
      );
      if (response.data != null) {
        final json = response.data as Map;
        if (json.containsKey(config.externalApiConfig!.resultJsonKey)) {
          return json[config.externalApiConfig!.resultJsonKey];
        } else {
          final data = (response.data["choices"] as List)
              .first["message"]["content"]
              .toString()
              .trim();
          return Tuple2(data, null);
        }
      }
    } catch (e) {
      log(e.toString());
      AIKits().analysisMixin.sendEvent("error_promptRapidApiRequest");
    }
    return null;
  }

  Future<Tuple2<String, int?>?> promptRenderApiRequest({
    double? temperature,
    int? chatId,
    required List<OpenAIChatCompletionChoiceMessageModel> prompts,
    required ChatGPTConfig config,
  }) async {
    AIKits().analysisMixin.sendEvent("prompt_render_request");
    try {
      var params = Map.from(config.renderApiConfig.body);
      params.addAll({
        "temperature": temperature ?? 0.7,
        "messages": prompts.map((e) => e.toMap()).toList()
      });
      if (chatId != null) {
        params.addAll({"chatId": chatId});
      }
      final response = await Dio().post(
        config.renderApiConfig.hostUrl,
        data: params,
        options: Options(
          headers: config.renderApiConfig.headers
            ..addAll({"service_name": "chatGPT"}),
        ),
      );
      if (response.data != null) {
        final data = response.data as Map;
        final result = data["result"] as String;
        int? chatId;
        if (data.containsKey("chatId")) {
          chatId = data["chatId"];
        }
        return Tuple2(result, chatId);
      }
    } catch (e) {
      log(e.toString());
      AIKits().analysisMixin.sendEvent("error_promptRenderApiRequest");
    }
    return null;
  }
}
