// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:ai_kits/src/gemini/entity/gemini_prompting_entity.dart';

class GeminiResult {
  final GeminiPromptingEntity? entity;
  final Stream<GeminiPromptingEntity>? stream;
  GeminiResult({
    this.entity,
    this.stream,
  });

  bool get isValid => entity != null || stream != null;

  bool get hasStream => stream != null;

  bool get hasEntity => entity != null;

  Stream<GeminiPromptingEntity>? _broadcastStream;

  Stream<GeminiPromptingEntity>? getBroadcastStream() {
    _broadcastStream ??= stream?.asBroadcastStream();
    return _broadcastStream;
  }
}
