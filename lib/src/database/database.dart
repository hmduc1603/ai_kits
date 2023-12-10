import 'dart:developer';
import 'package:ai_kits/ai_kits.dart';
import 'package:ai_kits/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';

abstract class _AIKitsDatabase {
  Future<void> init();

  Future<int?> savePrompt(PromptingEntity promptingEntity);

  Future<PromptingEntity?> getLastPromptById(int id);

  Stream<List<PromptingEntity>>? listenPromptHistories({String? type});

  Stream<List<PromptingEntity>>? listenPromptHistoriesByInput({String? input});

  Future<void> saveImage(ImageResult imageResult);

  Stream<List<ImageResult>>? listenImageHistories();

  Future<List<PromptingEntity>?> getLastPrompts(String type);

  Future<ChatSession?> saveChatSession(ChatSession chatSession);

  Stream<List<ChatSession>>? listenChatSession();

  Stream<List<ChatSession>>? listenChatSessionById(int id);

  void removeAllChatSessions();

  void removeChatSessionById(int id);

  void removeAllPrompts();

  void removePromptById(int id);

  void removeAllPromptsByType(String type);

  void removeAllImages();

  Future<VoiceResult?> saveVoiceResult(VoiceResult voiceResult);

  Future<VoiceResult?> getVoiceResultByRequestId(String requestId);

  Stream<List<VoiceResult>>? listenToVoiceResults();

  void removeVoiceResult(int id);
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
      final path = '${dir.path}/AIKitsDatabase';
      // Check if the store is already open
      if (Store.isOpen(path)) {
        // Attach to the already opened store
        store = Store.attach(getObjectBoxModel(), path);
      } else {
        store = await openStore(directory: path);
      }
    } catch (e) {
      log(name: "AIKitsDatabase", e.toString());
      store?.box<PromptingEntity>().removeAll();
      store?.box<ChatSession>().removeAll();
      store?.box<ImageResult>().removeAll();
      store?.box<VoiceResult>().removeAll();
    }
  }

  @override
  Future<int?> savePrompt(PromptingEntity promptingEntity) async {
    log('savePrompt', name: 'AIKitsDatabase');
    return store?.box<PromptingEntity>().putAsync(promptingEntity);
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
  Stream<List<ImageResult>>? listenImageHistories() {
    return store
        ?.box<ImageResult>()
        .query()
        .watch(triggerImmediately: true)
        .map(
          (query) => query.find(),
        );
  }

  @override
  Future<void> saveImage(ImageResult imageResult) async {
    log('saveImage', name: 'AIKitsDatabase');
    await store?.box<ImageResult>().putAsync(imageResult);
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
    store?.box<ImageResult>().removeAll();
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
  void removeAllPromptsByType(String type) {
    store
        ?.box<PromptingEntity>()
        .query(PromptingEntity_.rawType.equals(type))
        .build()
        .remove();
  }

  @override
  Future<PromptingEntity?> getLastPromptById(int id) async {
    return store?.box<PromptingEntity>().get(id);
  }

  @override
  Stream<List<VoiceResult>>? listenToVoiceResults() {
    return store
        ?.box<VoiceResult>()
        .query()
        .watch(triggerImmediately: true)
        .map(
          (query) => query.find(),
        );
  }

  @override
  Future<VoiceResult?> saveVoiceResult(VoiceResult voiceResult) async {
    return store?.box<VoiceResult>().putAndGetAsync(voiceResult);
  }

  @override
  void removeVoiceResult(int id) {
    store?.box<VoiceResult>().remove(id);
  }

  @override
  Future<VoiceResult?> getVoiceResultByRequestId(String requestId) async {
    return store
        ?.box<VoiceResult>()
        .query(VoiceResult_.requestId.equals(requestId))
        .build()
        .find()
        .firstOrNull;
  }

  @override
  void removeChatSessionById(int id) {
    store?.box<ChatSession>().remove(id);
  }

  @override
  void removePromptById(int id) {
    store?.box<PromptingEntity>().remove(id);
  }
}
