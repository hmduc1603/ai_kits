import 'dart:developer';

import 'package:ai_kits/ai_kits.dart';
import 'package:ai_kits/src/chat_gpt/manager/daily_counting_manager/daily_counter.dart';
import 'package:ai_kits/src/local_storage/local_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'daily_counting_manager.g.dart';

@JsonSerializable()
class DailyLimitation {
  final int dailyLimitation;

  const DailyLimitation({
    this.dailyLimitation = 1,
  });

  factory DailyLimitation.fromJson(Map<String, dynamic> json) =>
      _$DailyLimitationFromJson(json);

  Map<String, dynamic> toJson() => _$DailyLimitationToJson(this);
}

class DailyCountingManager {
  static final DailyCountingManager _instance =
      DailyCountingManager._internal();
  DailyCountingManager._internal();
  factory DailyCountingManager() => _instance;

  late DailyLimitation _limitation;

  setUpLimitation(DailyLimitation limitation) {
    _limitation = limitation;
  }

  int todayLeft(DailyCounter? counter) {
    if (counter == null) {
      return _limitation.dailyLimitation;
    } else {
      if (counter.updatedDate.day == DateTime.now().day) {
        if (counter.counting < _limitation.dailyLimitation) {
          return _limitation.dailyLimitation - counter.counting;
        } else {
          return 0;
        }
      } else {
        return _limitation.dailyLimitation;
      }
    }
  }

  checkShouldProceed({
    required Function(bool shouldProceed, DailyCounter? counter)
        onShouldProceed,
    required bool isPremium,
    required VoidCallback onPremiumCallBack,
  }) {
    if (isPremium) {
      onPremiumCallBack();
      return;
    }
    if (_limitation.dailyLimitation == 0) {
      onShouldProceed(false, null);
      return;
    }
    // Normal case
    AIKits().analysisMixin.sendEvent("check_daily_limitation");
    bool shouldProceed = false;
    DailyCounter? counter = LocalStorage().dailyCounter;
    if (counter == null) {
      shouldProceed = true;
    } else {
      if (counter.updatedDate.day == DateTime.now().day) {
        if (counter.counting < _limitation.dailyLimitation) {
          shouldProceed = true;
        }
      } else {
        // reset to new day
        counter.resetToNewDay();
        shouldProceed = true;
      }
    }
    log("checkShouldProceed: $shouldProceed", name: "DailyCountingManager");
    onShouldProceed(shouldProceed, counter);
    AIKits()
        .analysisMixin
        .sendEvent("reach_daily_limitation_${!shouldProceed}");
  }

  increaseCounter({DailyCounter? counter, required String type}) {
    log("increaseCounter: $type");
    if (counter == null) {
      LocalStorage().setDailyCounter(DailyCounter(
        updatedDate: DateTime.now(),
        counting: 1,
        type: type,
      ));
    } else {
      counter.counting += 1;
      counter.updatedDate = DateTime.now();
      LocalStorage().setDailyCounter(counter);
    }
  }

  decreaseCounter({DailyCounter? counter, required String type}) {
    log("decreaseCounter: $type");
    if (counter != null && counter.counting > 0) {
      counter.counting -= 1;
      counter.updatedDate = DateTime.now();
      LocalStorage().setDailyCounter(counter);
    }
  }
}

class DailyReachedLimitError {
  static const message =
      "You have reached daily limitation, please try again in next day";
}
