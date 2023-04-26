import 'dart:developer';
import 'dart:ui';

import 'package:ai_kits/ai_kits.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../local_storage/local_storage.dart';
part 'imagination_counting_manager.g.dart';

@JsonSerializable()
class ImaginatingLimitation {
  final int dailyImaginatingLimitation;
  final int lifetimeLimitation;
  final bool enableLifetimLimitation;

  const ImaginatingLimitation({
    this.dailyImaginatingLimitation = 1,
    this.lifetimeLimitation = 1,
    this.enableLifetimLimitation = false,
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

  ImaginatingCounter? get counter => LocalStorage().imaginatingCounter;

  setUpLimitation(ImaginatingLimitation limitation) {
    _limitation = limitation;
  }

  Stream<ImaginatingCounter>? listenToImaginatingCounter() {
    return LocalStorage().listenToImaginatingCounter();
  }

  int todayLeft(ImaginatingCounter? counter) {
    if (counter == null) {
      return _limitation.dailyImaginatingLimitation;
    } else {
      if (counter.updatedDate.day == DateTime.now().day) {
        if (counter.counting < _limitation.dailyImaginatingLimitation) {
          return _limitation.dailyImaginatingLimitation - counter.counting;
        } else {
          return 0;
        }
      } else {
        return _limitation.dailyImaginatingLimitation;
      }
    }
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
    // On Life time limitation
    if (_limitation.enableLifetimLimitation) {
      log("checkLifetimeShouldProceed", name: "ImaginatingCountingManager");
      onShouldProceed(_checkLifetimeShouldProceed(), null);
      return;
    }
    // Normal case
    AIKits().analysisMixin.sendEvent("check_imagination_limitation");
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
    AIKits()
        .analysisMixin
        .sendEvent("reach_imagination_limitation_${!shouldProceed}");
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

  bool _checkLifetimeShouldProceed() {
    AIKits().analysisMixin.sendEvent("check_lifetime_imagination_limitation");
    bool shouldProceed = false;
    int counter = LocalStorage().imaginatingLifetimeCounter;
    if (counter < _limitation.lifetimeLimitation) {
      shouldProceed = true;
      LocalStorage().setImaginationLifetimeCounter(counter + 1);
    }
    return shouldProceed;
  }
}

class ImaginatingReachedLimitError {
  static const message =
      "You have reached daily limitation, please try again in next day";
}
