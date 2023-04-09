import 'dart:convert';

import 'package:ai_kits/ai_kits.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class ChatSession {
  int? id;
  List<String> resultsAsJson;
  @Property(type: PropertyType.date)
  final DateTime createdDate;

  ChatSession({
    this.resultsAsJson = const [],
    required this.createdDate,
  });

  bool get isSavedToDB => id != null;

  updateResults(PromptingEntity entity) {
    final newList = resultsAsJson.toList();
    newList.add(jsonEncode(entity.toJson()));
    resultsAsJson = newList;
  }

  List<PromptingEntity> get results {
    return resultsAsJson
        .map((e) => PromptingEntity.fromJson(jsonDecode(e)))
        .toList();
  }
}
