// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:ai_kits/ai_kits.dart';

class ChatGPTResult {
  final PromptingEntity? entity;
  final Stream<PromptingEntity>? stream;
  ChatGPTResult({
    this.entity,
    this.stream,
  });

  bool get isValid => entity != null || stream != null;

  bool get hasStream => stream != null;

  bool get hasEntity => entity != null;

  Stream<PromptingEntity>? _broadcastStream;

  Stream<PromptingEntity>? getBroadcastStream() {
    _broadcastStream ??= stream?.asBroadcastStream();
    return _broadcastStream;
  }
}
