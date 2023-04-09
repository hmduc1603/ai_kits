import 'package:ai_kits/ai_kits.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class ChatSession {
  int? id;
  String title;
  List<PromptingEntity> results;
  @Property(type: PropertyType.date)
  final DateTime createdDate;

  ChatSession({
    this.title = "Blank Chat",
    this.results = const [],
    required this.createdDate,
  });

  bool get isSavedToDB => id != null;
}
