import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_of_life_starter_code/providers/cells.dart';
import 'package:game_of_life_starter_code/providers/timer_state_provider.dart';

class TimerRow extends ConsumerWidget {
  const TimerRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            ref.read(listCellsProvider.notifier).clear();
            ref.read(timerStatePProvider.notifier).reset();
          },
          icon: const Icon(Icons.refresh),
        ),
        Consumer(
          builder: (context, ref, child) {
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
            ref.read(timerStatePProvider.notifier).reset();
            ref.read(listCellsProvider.notifier).random();
          },
          icon: const Icon(Icons.shuffle),
        ),
      ],
    );
  }
}
