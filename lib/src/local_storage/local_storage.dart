import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../chat_gpt/manager/imagination_counting_manager/imaginating_counter.dart';
import '../chat_gpt/manager/prompt_counting_manager/prompting_counter.dart';

class LocalStorage {
  static final LocalStorage _instance = LocalStorage._internal();
  LocalStorage._internal();
  factory LocalStorage() => _instance;

  static const _kPrefBoxName = "aiKits";
  static const _kPromptingCounter = 'kPromptingCounter';
  static const _kImaginatingCounter = 'kImaginatingCounter';

  Box? box;

  Future<void> init() async {
    // Hive
    final dir = await getApplicationDocumentsDirectory();
    Hive.init('${dir.path}/ai_kits');
    box = await Hive.openBox(_kPrefBoxName);
    return;
  }

  PromptingCounter? get promptingCounter => box?.get(_kPromptingCounter);

  Future<void> setPromptingCounter(PromptingCounter counter) async {
    return box?.put(_kPromptingCounter, counter);
  }

  ImaginatingCounter? get imaginatingCounter => box?.get(_kImaginatingCounter);

  Future<void> setImaginatingCounter(ImaginatingCounter counter) async {
    return box?.put(_kImaginatingCounter, counter);
  }
}
