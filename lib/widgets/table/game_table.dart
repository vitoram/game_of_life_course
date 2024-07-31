import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_of_life_starter_code/models/game_state.dart';
import 'package:game_of_life_starter_code/providers/cells.dart';
import 'package:game_of_life_starter_code/providers/timer_state_provider.dart';
import 'package:game_of_life_starter_code/widgets/table/cell_widget.dart';

class GameTable extends ConsumerWidget {
  const GameTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int size = ref.watch(tableSizeProvider);
    //Only allow manual changes when the timer is on Start Game State.
    //Select to not recreate when changes between Start and Pause State
    bool enableToggle = ref
        .watch(timerStatePProvider.select((state) => state is StartGameState));
    return GridView.count(
      crossAxisCount: size,
      children: [
        for (int row = 0; row < size; row++)
          for (int column = 0; column < size; column++)
            Consumer(
              builder: (context, ref, child) {
                //Select to only recreate if the cell change it's value
                int alive = ref.watch(listCellsProvider.select((list) {
                  //Check index of list because when decrease the size of the cell it trys to access the cell
                  return (list.length > row && list[row].length > column)
                      ? list[row][column]
                      : 0;
                }));
                Widget child = CellWidget(alive: alive);
                //TODO 5: The choice of wich widget (GestureDetector or not) should be handled here? Or place inside another class is a better practice?
                return enableToggle
                    ? GestureDetector(
                        onTap: () => ref
                            .read(listCellsProvider.notifier)
                            .toggleCell(row, column),
                        child: child,
                      )
                    : child;
              },
            )
      ],
    );
  }
}
