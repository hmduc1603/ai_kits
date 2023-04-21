library ai_kits;

import 'package:ai_kits/src/chat_gpt/chat_gpt_service.dart';
import 'package:ai_kits/src/local_storage/local_storage.dart';
import 'package:ai_kits/src/stable_diffusion/stable_diffusion_service.dart';

import 'ai_kits.dart';

export 'src/chat_gpt/entity/prompting_entity.dart';
export 'src/stable_diffusion/entity/image_entity.dart';
export 'src/chat_gpt/entity/chat_gpt_config.dart';
export 'src/chat_gpt/manager/prompt_counting_manager/prompt_counting_manager.dart';
export 'src/chat_gpt/manager/imagination_counting_manager/imagination_counting_manager.dart';
export 'src/ai_kits_analysis_mixin.dart';
export 'src/chat_gpt/manager/prompt_counting_manager/prompting_counter.dart';
export 'src/chat_gpt/entity/chat_session.dart';
export 'src/database/database.dart';
export 'src/chat_gpt/manager/imagination_counting_manager/imaginating_counter.dart';
export 'src/stable_diffusion/entity/stable_diffusion_config.dart';
export 'src/chat_gpt/entity/chat_gpt_model.dart';

class AIKits {
  static final AIKits _instance = AIKits._internal();
  AIKits._internal();
  factory AIKits() => _instance;

  final chatGPT = ChatGPTService();
  final stableDiffusion = StableDiffusionService();

  late AIKitsAnalysisMixin analysisMixin;

  Future<void> init({
    required AIKitsAnalysisMixin mixin,
    PromptingLimitation? promptingLimitation,
    ImaginatingLimitation? imaginatingLimitation,
  }) async {
    analysisMixin = mixin;
    await LocalStorage().init();
    await AIKitsDatabase().init();
    if (promptingLimitation != null) {
      PromptingCountingManager().setUpLimitation(promptingLimitation);
    }
    if (imaginatingLimitation != null) {
      ImaginatingCountingManager().setUpLimitation(imaginatingLimitation);
    }
  }
}
