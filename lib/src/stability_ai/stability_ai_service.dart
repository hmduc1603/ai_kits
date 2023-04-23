import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';
import 'package:ai_kits/ai_kits.dart';
import 'package:is_open_proxy/is_open_proxy.dart';
import 'package:stability_sdk/stability_sdk.dart';

class StabilityAIService {
  static final StabilityAIService _instance = StabilityAIService._internal();
  StabilityAIService._internal();
  factory StabilityAIService() => _instance;

  late StabilityConfig _config;
  late StabilityApiClient _client;
  StreamSubscription? _clientSub;

  void init(StabilityConfig config) {
    _config = config;
    _client = StabilityApiClient.init(config.key);
    ImaginatingCountingManager().setUpLimitation(_config.imaginatingLimitation);
  }

  Future<Uint8List?> requestImage(String prompt) async {
    log('requestImage', name: 'StabilityAIService');
    if (await IsOpenProxy.isOpenProxy) {
      throw Exception('Please turn off your VPN or Proxy to continue');
    }
    final request = RequestBuilder(prompt)
        .setHeight(_config.imageHeight ?? 512)
        .setWidth(_config.imageWidth ?? 512)
        .setEngineType(_config.stabilityEngine)
        .setSampleCount(1)
        .setUpSteps(_config.steps)
        .build();
    _clientSub?.cancel();
    final completer = Completer<Uint8List?>();
    _client.generate(request).listen(
      (answer) {
        completer.complete(Uint8List.fromList(answer.artifacts!.first.binary!));
      },
      onDone: () => !completer.isCompleted ? completer.complete() : null,
      onError: (e) => completer.completeError(e),
    );
    return completer.future.timeout(const Duration(seconds: 20));
  }
}
