import 'package:game_of_life_starter_code/providers/timer_state_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_rules_provider.g.dart';

enum GameRule { keepCellAlive, createLife }

@riverpod
class GameRules extends _$GameRules {
  @override
  List<int> build(GameRule gameRule) {
    return switch (gameRule) {
      GameRule.createLife => [3],
      GameRule.keepCellAlive => [2, 3],
    };
  }

  void toggle(int value) {
    if (state.contains(value)) {
      _remove(value);
    } else {
      _add(value);
    }
    ref.read(timerStatePProvider.notifier).reset();
  }

  void _add(int newValue) {
    state = [...state, newValue];
  }

  void _remove(int value) {
    state = [
      for (int i in state)
        if (i != value) i
    ];
  }
}
