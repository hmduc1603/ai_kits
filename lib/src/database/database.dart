import 'dart:developer';
import 'package:ai_kits/ai_kits.dart';
import 'package:path_provider/path_provider.dart';
import '../../../objectbox.g.dart';

abstract class _AIKitsDatabase {
  Future<void> init();

  Future<int?> savePrompt(PromptingEntity promptingEntity);

  Stream<List<PromptingEntity>>? listenPromptHistories({String? type});

  Stream<List<PromptingEntity>>? listenPromptHistoriesByInput({String? input});

  Future<void> saveImage(StabilityResult imageResult);

  Stream<List<StabilityResult>>? listenImageHistories();

  Future<List<PromptingEntity>?> getLastPrompts(String type);

  Future<PromptingEntity?> getLastPromptById(int id);

  Future<ChatSession?> saveChatSession(ChatSession chatSession);

  Stream<List<ChatSession>>? listenChatSession();

  Stream<List<ChatSession>>? listenChatSessionById(int id);

  void removeAllChatSessions();

  void removeAllPrompts();

  void removePromptsByType(String type);

  void removeAllImages();
}

class AIKitsDatabase extends _AIKitsDatabase {
  static final AIKitsDatabase _instance = AIKitsDatabase._internal();
  AIKitsDatabase._internal();
  factory AIKitsDatabase() => _instance;

  Store? store;

  @override
  Future<void> init() async {
    try {
      final dir = await getApplicationSupportDirectory();
      if (store?.isClosed() == false) {
        store?.close();
      }
      store = await openStore(directory: '${dir.path}/AIKitsDatabase');
    } catch (e) {
      log(e.toString());
      store?.box<PromptingEntity>().removeAll();
      store?.box<ChatSession>().removeAll();
      store?.box<StabilityResult>().removeAll();
    }
  }

  @override
  Future<int?> savePrompt(PromptingEntity promptingEntity) async {
    log('savePrompt', name: 'AIKitsDatabase');
    final id = await store?.box<PromptingEntity>().putAsync(promptingEntity);
    return id;
  }

  @override
  Stream<List<PromptingEntity>>? listenPromptHistories({String? type}) {
    return store
        ?.box<PromptingEntity>()
        .query(type != null
            ? PromptingEntity_.rawType.equals(type)
            : PromptingEntity_.rawType.isNull())
        .watch(triggerImmediately: true)
        .map(
          (query) => query.find(),
        );
  }

  @override
  Stream<List<StabilityResult>>? listenImageHistories() {
    return store
        ?.box<StabilityResult>()
        .query()
        .watch(triggerImmediately: true)
        .map(
          (query) => query.find(),
        );
  }

  @override
  Future<void> saveImage(StabilityResult imageResult) async {
    log('saveImage', name: 'AIKitsDatabase');
    await store?.box<StabilityResult>().putAsync(imageResult);
  }

  @override
  Future<List<PromptingEntity>?> getLastPrompts(String type) async {
    return store
        ?.box<PromptingEntity>()
        .query(PromptingEntity_.rawType.equals(type))
        .build()
        .find();
  }

  @override
  Stream<List<ChatSession>>? listenChatSession() {
    return store
        ?.box<ChatSession>()
        .query()
        .watch(triggerImmediately: true)
        .map(
          (query) => query.find(),
        );
  }

  @override
  Stream<List<ChatSession>>? listenChatSessionById(int id) {
    return store
        ?.box<ChatSession>()
        .query(ChatSession_.id.equals(id))
        .watch(triggerImmediately: true)
        .map(
          (query) => query.find(),
        );
  }

  @override
  Future<ChatSession?> saveChatSession(ChatSession chatSession) async {
    log('saveChatSession', name: 'AIKitsDatabase');
    final id = await store?.box<ChatSession>().putAsync(chatSession);
    if (id != null) {
      return store?.box<ChatSession>().get(id);
    }
    return null;
  }

  @override
  void removeAllChatSessions() {
    store?.box<ChatSession>().removeAll();
  }

  @override
  void removeAllPrompts() {
    store?.box<PromptingEntity>().removeAll();
  }

  @override
  void removeAllImages() {
    store?.box<StabilityResult>().removeAll();
  }

  @override
  Stream<List<PromptingEntity>>? listenPromptHistoriesByInput({String? input}) {
    return store
        ?.box<PromptingEntity>()
        .query(input != null
            ? PromptingEntity_.input.equals(input)
            : PromptingEntity_.input.isNull())
        .watch(triggerImmediately: true)
        .map(
          (query) => query.find(),
        );
  }

  @override
  Future<PromptingEntity?> getLastPromptById(int id) async {
    return store?.box<PromptingEntity>().get(id);
  }

  @override
  void removePromptsByType(String type) {
    store
        ?.box<PromptingEntity>()
        .query(PromptingEntity_.rawType.equals(type))
        .build()
        .remove();
  }
}
