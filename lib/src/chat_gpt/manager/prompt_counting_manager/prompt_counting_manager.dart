import 'dart:developer';

import 'package:ai_kits/src/chat_gpt/manager/prompt_counting_manager/prompting_counter.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../local_storage/local_storage.dart';

part 'prompt_counting_manager.g.dart';

@JsonSerializable()
class PromptingLimitation {
  final int dailyPromptingLimit;
  final int dailyChatLimit;

  const PromptingLimitation({
    required this.dailyPromptingLimit,
    this.dailyChatLimit = 1,
  });

  factory PromptingLimitation.fromJson(Map<String, dynamic> json) =>
      _$PromptingLimitationFromJson(json);

  Map<String, dynamic> toJson() => _$PromptingLimitationToJson(this);
}

class PromptingCountingManager {
  static final PromptingCountingManager _instance =
      PromptingCountingManager._internal();
  PromptingCountingManager._internal();
  factory PromptingCountingManager() => _instance;

  late PromptingLimitation _limitation;

  setUpLimitation(PromptingLimitation limitation) {
    _limitation = limitation;
  }

  checkShouldChat(
      {required Function(bool shouldProceed, PromptingCounter? counter)
          onShouldProceed}) {
    bool shouldProceed = false;
    PromptingCounter? counter = LocalStorage().chatCounter;
    if (counter == null) {
      shouldProceed = true;
    } else {
      if (counter.updatedDate.day == DateTime.now().day) {
        if (counter.counting < _limitation.dailyChatLimit) {
          shouldProceed = true;
        }
      } else {
        // reset to new day
        counter.resetToNewDay();
        shouldProceed = true;
      }
    }
    log("checkShouldChat: $shouldProceed - $counter",
        name: "PromptingCountingManager");
    onShouldProceed(shouldProceed, counter);
  }

  checkShouldProceed(
      {required Function(bool shouldProceed, PromptingCounter? counter)
          onShouldProceed}) {
    bool shouldProceed = false;
    PromptingCounter? counter = LocalStorage().promptingCounter;
    if (counter == null) {
      shouldProceed = true;
    } else {
      if (counter.updatedDate.day == DateTime.now().day) {
        if (counter.counting < _limitation.dailyPromptingLimit) {
          shouldProceed = true;
        }
      } else {
        // reset to new day
        counter.resetToNewDay();
        shouldProceed = true;
      }
    }
    log("checkShouldProceed: $shouldProceed - $counter",
        name: "PromptingCountingManager");
    onShouldProceed(shouldProceed, counter);
  }

  increaseCounter({PromptingCounter? counter}) {
    if (counter == null) {
      LocalStorage().setPromptingCounter(PromptingCounter(
        updatedDate: DateTime.now(),
        counting: 1,
      ));
    } else {
      counter.counting += 1;
      counter.updatedDate = DateTime.now();
      LocalStorage().setPromptingCounter(counter);
    }
  }

  increaseChatCounter({PromptingCounter? counter}) {
    if (counter == null) {
      LocalStorage().setChatCounter(PromptingCounter(
        updatedDate: DateTime.now(),
        counting: 1,
      ));
    } else {
      counter.counting += 1;
      counter.updatedDate = DateTime.now();
      LocalStorage().setChatCounter(counter);
    }
  }
}
