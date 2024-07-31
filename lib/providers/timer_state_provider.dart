import 'package:game_of_life_starter_code/models/game_state.dart';
import 'package:game_of_life_starter_code/providers/generation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'timer_state_provider.g.dart';

@riverpod
class TimerStateP extends _$TimerStateP {
  late GameTimer _game;
  @override
  TimerState build() {
    _game = GameTimer(
        //TODO 1: Is a good pratice to pass this function here?
        tickFunction: () {
      ref.read(generationProvider.notifier).increase();
    });
    return _game.gameState;
  }

  void startPause() {
    _game.startPause();
    state = _game.gameState;
  }

  void reset() {
    _game.reset();
    //TODO 3: Is a good pratice to invalidate the generation provider here?
    ref.invalidate(generationProvider);
    state = _game.gameState;
  }
}
