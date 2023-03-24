import 'dart:convert';

class ChatGPTConfig {
  final bool enableTurbo;
  final List<String> chatGPTKeys;
  final String model;
  final bool shouldUseDirectApi;
  final ChatGPTCustomHost customHost;
  ChatGPTConfig({
    required this.enableTurbo,
    required this.chatGPTKeys,
    required this.model,
    required this.shouldUseDirectApi,
    this.customHost = const ChatGPTCustomHost(),
  });
}

class ChatGPTCustomHost {
  final String url;
  final String dataJsonAsString;
  final Map<String, dynamic>? headers;

  Map<String, dynamic> getData(String prompt) {
    final data = dataJsonAsString.replaceAll("~~prompt~~", prompt).toString();
    return jsonDecode(data);
  }

  const ChatGPTCustomHost({
    this.url = "https://ai.dataplazma.com/api/v1/completions",
    this.dataJsonAsString = '{"prompt":"~~prompt~~"}',
    this.headers = const {
      "Authorization": "Bearer j1n1k98n349v839nv839nvs86bvs4aasd0"
    },
  });
}
