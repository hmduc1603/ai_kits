import 'dart:convert';

import 'package:ai_kits/ai_kits.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:objectbox/objectbox.dart';

part 'chat_session.g.dart';

@CopyWith()
@Entity()
class ChatSession {
  int? id;
  List<String> resultsAsJson;
  @Property(type: PropertyType.date)
  final DateTime createdDate;
  List<String> relations;

  ChatSession({
    this.resultsAsJson = const [],
    required this.createdDate,
    this.relations = const [],
  });

  bool get isSavedToDB => id != null;

  updateResults(PromptingEntity entity) {
    final newList = resultsAsJson.toList();
    newList.add(jsonEncode(entity.toJson()));
    resultsAsJson = newList;
  }

  updateRelations(List<String> relations) {
    if (relations.isNotEmpty) {
      this.relations = relations;
    }
  }

  List<PromptingEntity> get results {
    return resultsAsJson
        .map((e) => PromptingEntity.fromJson(jsonDecode(e)))
        .toList();
  }
}
