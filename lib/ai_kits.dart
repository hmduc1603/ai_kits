library ai_kits;

import 'package:ai_kits/src/chat_gpt/chat_gpt_service.dart';
import 'package:ai_kits/src/gemini/gemini_service.dart';
import 'package:ai_kits/src/image_ai/image_ai_service.dart';
import 'package:ai_kits/src/local_storage/local_storage.dart';
import 'package:ai_kits/src/voice_ai/voice_ai_service.dart';
import 'package:ai_kits/src/whisper/whisper_service.dart';

import 'ai_kits.dart';

export 'src/chat_gpt/entity/prompting_entity.dart';
export 'src/chat_gpt/entity/chat_gpt_config.dart';
export 'src/chat_gpt/manager/prompt_counting_manager/prompt_counting_manager.dart';
export 'src/chat_gpt/manager/imagination_counting_manager/imagination_counting_manager.dart';
export 'src/chat_gpt/manager/daily_counting_manager/daily_counting_manager.dart';

export 'src/ai_kits_analysis_mixin.dart';
export 'src/chat_gpt/manager/prompt_counting_manager/prompting_counter.dart';
export 'src/chat_gpt/entity/chat_session.dart';
export 'src/database/database.dart';
export 'src/chat_gpt/manager/imagination_counting_manager/imaginating_counter.dart';
export 'src/chat_gpt/entity/chat_gpt_model.dart';
export 'src/image_ai/entity/image_config.dart';
export 'src/image_ai/entity/image_result.dart';
export 'src/image_ai/entity/image_model.dart';
export 'src/voice_ai/entity/voice_config.dart';
export 'src/voice_ai/entity/voice_result.dart';
export 'src/voice_ai/entity/voice_model.dart';
export 'src/chat_gpt/entity/chat_gpt_result.dart';
export 'src/whisper/whisper_config.dart';
export 'src/chat_gpt/manager/daily_counting_manager/daily_counter.dart';
export 'src/file_upload/upload_config.dart';
export 'src/file_upload/upload_service.dart';
export 'src/gemini/entity/gemini_prompting_entity.dart';
export 'src/gemini/entity/gemini_result.dart';
export 'src/gemini/entity/gemini_file_result.dart';
export 'src/gemini/entity/gemini_config.dart';

class AIKits {
  static final AIKits _instance = AIKits._internal();
  AIKits._internal();
  factory AIKits() => _instance;

  final chatGPT = ChatGPTService();
  final imageAIService = ImageAIService();
  final voiceAIService = VoiceAIService();
  final whisperService = WhisperService();
  final geminiService = GeminiService();

  late AIKitsAnalysisMixin analysisMixin;

  Future<void> init({
    required AIKitsAnalysisMixin mixin,
  }) async {
    analysisMixin = mixin;
    await LocalStorage().init();
    await AIKitsDatabase().init();
  }
}
