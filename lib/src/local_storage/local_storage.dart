import 'dart:developer';

import 'package:ai_kits/src/chat_gpt/manager/daily_counting_manager/daily_counter.dart';
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
  static const _kChatCounter = '_kChatCounter';
  static const _kImaginatingLiftimeCounter = 'kImaginatingLifetimeCounter';
  static const _kDailyLimitationCounter = 'kDailyLimitationCounter';

  Box? box;

  Future<void> init() async {
    if (box != null) {
      return;
    }
    // Hive
    final dir = await getApplicationDocumentsDirectory();
    Hive.init('${dir.path}/ai_kits');
    try {
      Hive.registerAdapter(PromptingCounterAdapter());
      Hive.registerAdapter(ImaginatingCounterAdapter());
      Hive.registerAdapter(DailyCounterAdapter());
      box = await Hive.openBox(_kPrefBoxName);
    } catch (_) {
      if (await Hive.boxExists(_kPrefBoxName, path: dir.path)) {
        await Hive.deleteBoxFromDisk(_kPrefBoxName, path: dir.path);
        box = await Hive.openBox(_kPrefBoxName);
      }
    }
  }

  PromptingCounter? get promptingCounter => box?.get(_kPromptingCounter);

  Future<void> setPromptingCounter(PromptingCounter counter) async {
    return box?.put(_kPromptingCounter, counter);
  }

  int get imaginatingLifetimeCounter =>
      box?.get(_kImaginatingLiftimeCounter) ?? 0;

  Future<void> setImaginationLifetimeCounter(int value) async {
    return box?.put(_kImaginatingLiftimeCounter, value);
  }

  PromptingCounter? get chatCounter => box?.get(_kChatCounter);

  Future<void> setChatCounter(PromptingCounter counter) async {
    return box?.put(_kChatCounter, counter);
  }

  Future<void> setDailyCounter(DailyCounter counter) async {
    log("setDailyCounter");
    return box?.put(_kDailyLimitationCounter, counter);
  }

  ImaginatingCounter? get imaginatingCounter => box?.get(_kImaginatingCounter);

  DailyCounter? get dailyCounter => box?.get(_kDailyLimitationCounter);

  Future<void> setImaginatingCounter(ImaginatingCounter counter) async {
    return box?.put(_kImaginatingCounter, counter);
  }

  Stream<ImaginatingCounter>? listenToImaginatingCounter() {
    return box
        ?.watch(key: _kImaginatingCounter)
        .map<ImaginatingCounter>((e) => e.value)
        .asBroadcastStream();
  }

  Stream<int>? listenToImaginatingLifetimeCounter() {
    return box
        ?.watch(key: _kImaginatingLiftimeCounter)
        .map<int>((e) => e.value)
        .asBroadcastStream();
  }
}
