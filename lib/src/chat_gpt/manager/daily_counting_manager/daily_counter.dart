import 'package:hive/hive.dart';

part 'daily_counter.g.dart';

@HiveType(typeId: 88)
class DailyCounter extends HiveObject {
  @HiveField(0)
  int counting;
  @HiveField(1)
  DateTime updatedDate;
  @HiveField(2)
  String type;

  DailyCounter({
    required this.updatedDate,
    required this.counting,
    required this.type,
  });

  resetToNewDay() {
    counting = 0;
  }
}
