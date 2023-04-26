library ai_kits;

import 'package:ai_kits/src/chat_gpt/chat_gpt_service.dart';
import 'package:ai_kits/src/local_storage/local_storage.dart';
import 'package:ai_kits/src/stability_ai/stability_ai_service.dart';

import 'ai_kits.dart';

export 'src/chat_gpt/entity/prompting_entity.dart';
export 'src/chat_gpt/entity/chat_gpt_config.dart';
export 'src/chat_gpt/manager/prompt_counting_manager/prompt_counting_manager.dart';
export 'src/chat_gpt/manager/imagination_counting_manager/imagination_counting_manager.dart';
export 'src/ai_kits_analysis_mixin.dart';
export 'src/chat_gpt/manager/prompt_counting_manager/prompting_counter.dart';
export 'src/chat_gpt/entity/chat_session.dart';
export 'src/database/database.dart';
export 'src/chat_gpt/manager/imagination_counting_manager/imaginating_counter.dart';
export 'src/chat_gpt/entity/chat_gpt_model.dart';
export 'src/stability_ai/entity/stability_config.dart';
export 'src/stability_ai/entity/stability_result.dart';

class AIKits {
  static final AIKits _instance = AIKits._internal();
  AIKits._internal();
  factory AIKits() => _instance;

  final chatGPT = ChatGPTService();
  final stabilityService = StabilityAIService();

  late AIKitsAnalysisMixin analysisMixin;

  Future<void> init({
    required AIKitsAnalysisMixin mixin,
  }) async {
    analysisMixin = mixin;
    await LocalStorage().init();
    await AIKitsDatabase().init();
  }
}
