import 'package:hive/hive.dart';

part 'imaginating_counter.g.dart';

@HiveType(typeId: 8)
class ImaginatingCounter extends HiveObject {
  @HiveField(0)
  int counting;
  @HiveField(1)
  DateTime updatedDate;

  ImaginatingCounter({
    required this.updatedDate,
    required this.counting,
  });

  resetToNewDay() {
    counting = 0;
  }
}
