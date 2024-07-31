// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';

sealed class TimerState {
  void startPause(GameTimer game);
  void reset(GameTimer game);
  IconData get getIcon;
}

class RunningGameState extends TimerState {
  final Timer _timer;
  final Function() tickFunction;
  RunningGameState(this.tickFunction)
      : _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
          tickFunction();
        });

  @override
  IconData get getIcon => Icons.pause;

  @override
  void reset(GameTimer game) {
    _timer.cancel();
    game.gameState = StartGameState();
  }

  @override
  void startPause(GameTimer game) {
    _timer.cancel();
    game.gameState = PausedGameState();
  }
}

class PausedGameState extends TimerState {
  @override
  IconData get getIcon => Icons.play_arrow;

  @override
  void reset(GameTimer game) {
    game.gameState = StartGameState();
  }

  @override
  void startPause(GameTimer game) =>
      game.gameState = RunningGameState(game.tickFunction);
}

class StartGameState extends TimerState {
  @override
  IconData get getIcon => Icons.play_arrow;

  @override
  void reset(GameTimer game) {}

  @override
  void startPause(GameTimer game) =>
      game.gameState = RunningGameState(game.tickFunction);
}

class GameTimer {
  Function() tickFunction;
  GameTimer({required this.tickFunction});

  TimerState gameState = StartGameState();

  void startPause() => gameState.startPause(this);
  void reset() => gameState.reset(this);
  IconData get getIcon => gameState.getIcon;
}
