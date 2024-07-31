import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_of_life_starter_code/providers/cells.dart';
import 'package:game_of_life_starter_code/providers/timer_state_provider.dart';

class TimerRow extends ConsumerWidget {
  const TimerRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Controls the timer
    //Uses a State Pattern (TimerState) models/game_state.dart
    //Has 3 states -> Running, Paused, Start
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          //Reset the game
          //Set generation to 0 -> made inside timerStatePProvider.reset()
          //Don't clear the table inside .reset() because not always will clear the table on reset timer.
          onPressed: () {
            ref.read(listCellsProvider.notifier).clear();
            ref.read(timerStatePProvider.notifier).reset();
          },
          icon: const Icon(Icons.refresh),
        ),
        Consumer(
          builder: (context, ref, child) {
            //If the game is running is a arrow, else is pause symble
            IconData icon = ref.watch(timerStatePProvider).getIcon;
            return IconButton(
              onPressed: () =>
                  ref.read(timerStatePProvider.notifier).startPause(),
              icon: Icon(icon),
            );
          },
        ),
        IconButton(
          onPressed: () {
            //Create a new table with random values
            //Reset the timer, reset generatiom (inside reset())
            ref.read(timerStatePProvider.notifier).reset();
            ref.read(listCellsProvider.notifier).random();
          },
          icon: const Icon(Icons.shuffle),
        ),
      ],
    );
  }
}
