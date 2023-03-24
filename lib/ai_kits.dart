library ai_kits;

import 'package:ai_kits/src/ai_kits_analysis_mixin.dart';
import 'package:ai_kits/src/chat_gpt/chat_gpt_service.dart';
import 'package:ai_kits/src/stable_diffusion/stable_diffusion_service.dart';

class AIKits {
  static final AIKits _instance = AIKits._internal();
  AIKits._internal();
  factory AIKits() => _instance;

  final chatGPT = ChatGPTService();
  final stableDiffusion = StableDiffusionService();

  late AIKitsAnalysisMixin analysisMixin;

  void init({required AIKitsAnalysisMixin mixin}) {
    analysisMixin = mixin;
  }
}
