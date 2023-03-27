import 'package:hive/hive.dart';

part 'prompting_counter.g.dart';

@HiveType(typeId: 5)
class PromptingCounter extends HiveObject {
  @HiveField(0)
  int counting;
  @HiveField(1)
  DateTime updatedDate;

  PromptingCounter({
    required this.updatedDate,
    required this.counting,
  });

  resetToNewDay() {
    counting = 0;
  }
}


