import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_of_life_starter_code/providers/game_rules_provider.dart';
import 'package:game_of_life_starter_code/widgets/game_rules/game_rules.dart';
import 'package:game_of_life_starter_code/widgets/generation/generation_text.dart';
import 'package:game_of_life_starter_code/widgets/table/game_table.dart';
import 'package:game_of_life_starter_code/widgets/table_size/table_size_row.dart';
import 'package:game_of_life_starter_code/widgets/timer_row/timer_row.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MaterialApp(
        home: GameOfLife(),
      ),
    ),
  );
}

class GameOfLife extends ConsumerWidget {
  const GameOfLife({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        //Text to show the number of generations
        title: const GenerationText(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Defines the number of nearby cells to Keep Alive and Create Life
          for (var value in GameRule.values) GameRulesRow(value),
          //Defines the size of the row. Can increment and decrement the size
          const TableSizeRow(),
          //Controls the timer - Start, Pause, Refresh - also creates a random table
          const TimerRow(),
          //The Grid of cells
          const Expanded(
            child: GameTable(),
          ),
        ],
      ),
    );
  }
}
