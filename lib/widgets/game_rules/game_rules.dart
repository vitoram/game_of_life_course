import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_of_life_starter_code/providers/game_rules_provider.dart';

class GameRulesRow extends ConsumerWidget {
  final GameRule value;
  const GameRulesRow(this.value, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              value == GameRule.createLife ? 'Create Life' : 'Keep Alive',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Consumer(
              builder: (context, ref, child) {
                List<int> list = ref.watch(gameRulesProvider(value));
                //Define the number of nearby cells to Keep Alive or Create Life (depending on value)
                return Row(
                  children: [
                    for (int i = 1; i < 9; i++)
                      //The button that shows what value is selected
                      ElevatedButton(
                        onPressed: () => ref
                            .read(gameRulesProvider(value).notifier)
                            .toggle(i),
                        child: Text('$i'),
                        style: ButtonStyle(
                          shape: const WidgetStatePropertyAll(CircleBorder()),
                          padding:
                              const WidgetStatePropertyAll(EdgeInsets.all(20)),
                          //If the number is selected (list contains the value) the button is blue
                          backgroundColor: WidgetStatePropertyAll(
                            list.contains(i) ? Colors.blue.shade300 : null,
                          ),
                        ),
                      )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
