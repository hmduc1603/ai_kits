import 'dart:developer';

import 'package:google_mlkit_translation/google_mlkit_translation.dart';
import 'package:language_code/language_code.dart';

class MLTranslation {
  static final MLTranslation _instance = MLTranslation._internal();
  MLTranslation._internal();
  factory MLTranslation() => _instance;

  final _modelManager = OnDeviceTranslatorModelManager();
  OnDeviceTranslator? _onDeviceTranslator;

  init() async {
    try {
      final currentLanguage = LanguageCode.code.code;
      if (currentLanguage == TranslateLanguage.english.bcpCode) {
        log("System language is English, skip!", name: "MLTranslation");
        return;
      }
      log("Checking downloaded model for language: $currentLanguage",
          name: "MLTranslation");
      // Check english source
      final bool isEnglishDownloaded = await _modelManager
          .isModelDownloaded(TranslateLanguage.english.bcpCode);
      if (!isEnglishDownloaded) {
        await _modelManager.downloadModel(TranslateLanguage.english.bcpCode);
      }
      // Check current device's language
      final bool isDeviceLanguageDownloaded =
          await _modelManager.isModelDownloaded(currentLanguage);
      if (!isDeviceLanguageDownloaded) {
        await _modelManager.downloadModel(currentLanguage);
      }
      // Set translator
      _onDeviceTranslator = OnDeviceTranslator(
          sourceLanguage: TranslateLanguage.english,
          targetLanguage: TranslateLanguage.values
              .firstWhere((e) => e.bcpCode == currentLanguage));
    } catch (e) {
      log(e.toString());
    }
  }

  Future<bool> checkDownloadedModel(String langCode) {
    return _modelManager.isModelDownloaded(langCode);
  }

  Future<bool> downloadLangModel(String langCode) {
    return _modelManager.downloadModel(langCode);
  }

  Future<String?> translateText(String text) async {
    return _onDeviceTranslator?.translateText(text);
  }
}
