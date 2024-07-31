import 'dart:math';

import 'package:game_of_life_starter_code/providers/game_rules_provider.dart';
import 'package:game_of_life_starter_code/providers/timer_state_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cells.g.dart';

@riverpod
class TableSize extends _$TableSize {
  @override
  int build() {
    return 10;
  }

  void increment() {
    ref.read(timerStatePProvider.notifier).reset();
    state++;
  }

  void decrement() {
    ref.read(timerStatePProvider.notifier).reset();
    state--;
  }
}

@riverpod
class ListCells extends _$ListCells {
  //TODO 4: Is this class good or it don't follow SOLID?
  late int size;
  @override
  List<List<int>> build() {
    size = ref.watch(tableSizeProvider);

    return [
      for (int i = 0; i < size; i++)
        [
          for (int j = 0; j < size; j++) 0,
        ],
    ];
  }

  int _nextGeneration(int row, int column) {
    List<int> keepAliveList =
        ref.read(gameRulesProvider(GameRule.keepCellAlive));
    List<int> createLifeList = ref.read(gameRulesProvider(GameRule.createLife));
    int count = 0;
    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        if (i == 0 && j == 0) continue;
        int r = row + i;
        int c = column + j;
        if (r >= 0 && r < size && c >= 0 && c < size) {
          count += state[r][c];
        }
      }
    }
    if (state[row][column] == 1) {
      if (keepAliveList.contains(count)) {
        return 1;
      } else {
        return 0;
      }
    } else {
      if (createLifeList.contains(count)) {
        return 1;
      } else {
        return 0;
      }
    }
  }

  void tick() {
    List<List<int>> nextGrid = [
      for (int row = 0; row < state.length; row++)
        [
          for (int column = 0; column < state[row].length; column++)
            _nextGeneration(row, column),
        ],
    ];

    state = nextGrid;
  }

  void random() {
    state = [
      for (int i = 0; i < size; i++)
        [
          for (int j = 0; j < size; j++) Random().nextBool() ? 1 : 0,
        ]
    ];
  }

  void clear() => state = [
        for (int i = 0; i < size; i++)
          [
            for (int j = 0; j < size; j++) 0,
          ]
      ];

  void toggleCell(int column, int row) => state = [
        for (int i = 0; i < size; i++)
          [
            for (int j = 0; j < size; j++)
              (column == i && row == j) ? (state[i][j] + 1) % 2 : state[i][j],
          ]
      ];
}
