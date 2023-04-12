import 'dart:developer';
import 'package:ai_kits/ai_kits.dart';
import 'package:path_provider/path_provider.dart';
import '../../../objectbox.g.dart';

abstract class _AIKitsDatabase {
  Future<void> init();

  Future<void> savePrompt(PromptingEntity promptingEntity);

  Stream<List<PromptingEntity>>? listenPromptHistories({String? type});

  Future<void> saveImage(ImageResult imageResult);

  Stream<List<ImageResult>>? listenImageHistories();

  Future<List<PromptingEntity>?> getLastPrompts(String type);

  Future<int?> saveChatSession(ChatSession chatSession);

  Stream<List<ChatSession>>? listenChatSession();

  Stream<List<ChatSession>>? listenChatSessionById(int id);
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
      store?.box<ImageResult>().removeAll();
      store?.box<ChatSession>().removeAll();
    }
  }

  @override
  Future<void> savePrompt(PromptingEntity promptingEntity) async {
    log('savePrompt', name: 'AIKitsDatabase');
    await store?.box<PromptingEntity>().putAsync(promptingEntity);
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
  Future<int?> saveChatSession(ChatSession chatSession) async {
    log('saveChatSession', name: 'AIKitsDatabase');
    final id = await store?.box<ChatSession>().putAsync(chatSession);
    return id;
  }
}
