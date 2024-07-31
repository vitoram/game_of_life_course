// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';

//Using the State Pattern to create the timer logic
//has 3 states -> Running, Paused, Start
//has 3 functions -> StartPause -> start and pause the timer
//                -> Reset -> pause the clock and reset set the state to Start
//                -> GetIcon -> get the icon of Play or Pause symbol
sealed class TimerState {
  void startPause(GameTimer game);
  void reset(GameTimer game);
  IconData get getIcon;
}

class RunningGameState extends TimerState {
  //This State represents that the game is running
  //The clock is started when the Class is initiated
  //The periodic function is passed as parameter
  //TODO 6: Pass the function as a parameter is a good practice?
  final Timer _timer;
  final Function() tickFunction;
  RunningGameState(this.tickFunction)
      : _timer = Timer.periodic(
          const Duration(seconds: 1),
          (timer) {
            tickFunction();
          },
        );

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
  //This State represents that the game is paused
  //Has no complex function, only state changes

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
  //This State represents that the game is paused
  //Has no complex function, only state changes
  @override
  IconData get getIcon => Icons.play_arrow;

  @override
  void reset(GameTimer game) {}

  @override
  void startPause(GameTimer game) =>
      game.gameState = RunningGameState(game.tickFunction);
}

class GameTimer {
  //The context
  //The tickFunction will be used when the Timer ticks (at Running State)
  Function() tickFunction;
  GameTimer({required this.tickFunction});

  TimerState gameState = StartGameState();

  void startPause() => gameState.startPause(this);
  void reset() => gameState.reset(this);
  IconData get getIcon => gameState.getIcon;
}
