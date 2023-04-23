import 'dart:developer';
import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';

import '../../../local_storage/local_storage.dart';
import 'imaginating_counter.dart';

part 'imagination_counting_manager.g.dart';

@JsonSerializable()
class ImaginatingLimitation {
  final int dailyImaginatingLimitation;

  const ImaginatingLimitation({
    this.dailyImaginatingLimitation = 1,
  });

  factory ImaginatingLimitation.fromJson(Map<String, dynamic> json) =>
      _$ImaginatingLimitationFromJson(json);

  Map<String, dynamic> toJson() => _$ImaginatingLimitationToJson(this);
}

class ImaginatingCountingManager {
  static final ImaginatingCountingManager _instance =
      ImaginatingCountingManager._internal();
  ImaginatingCountingManager._internal();
  factory ImaginatingCountingManager() => _instance;

  late ImaginatingLimitation _limitation;

  setUpLimitation(ImaginatingLimitation limitation) {
    _limitation = limitation;
  }

  checkShouldProceed({
    required Function(bool shouldProceed, ImaginatingCounter? counter)
        onShouldProceed,
    required bool isPremium,
    required VoidCallback onPremiumCallBack,
  }) {
    if (isPremium) {
      onPremiumCallBack();
      return;
    }
    bool shouldProceed = false;
    ImaginatingCounter? counter = LocalStorage().imaginatingCounter;
    if (counter == null) {
      shouldProceed = true;
    } else {
      if (counter.updatedDate.day == DateTime.now().day) {
        if (counter.counting < _limitation.dailyImaginatingLimitation) {
          shouldProceed = true;
        }
      } else {
        // reset to new day
        counter.resetToNewDay();
        shouldProceed = true;
      }
    }
    log("checkShouldProceed: $shouldProceed - $counter",
        name: "ImaginatingCountingManager");
    onShouldProceed(shouldProceed, counter);
  }

  increaseCounter({ImaginatingCounter? counter}) {
    if (counter == null) {
      LocalStorage().setImaginatingCounter(ImaginatingCounter(
        updatedDate: DateTime.now(),
        counting: 1,
      ));
    } else {
      counter.counting += 1;
      counter.updatedDate = DateTime.now();
      LocalStorage().setImaginatingCounter(counter);
    }
  }
}

class ImaginatingReachedLimitError {
  static const message =
      "You have reached daily limitation, please try again in next day";
}
