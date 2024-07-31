import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_of_life_starter_code/providers/cells.dart';

class TableSizeRow extends ConsumerWidget {
  const TableSizeRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Text to show the table size. Number of rows and columns are always equal
        Consumer(
          builder: (context, ref, child) {
            int size = ref.watch(tableSizeProvider);
            return Text('Size: $size');
          },
        ),
        //Incremente/Decrement the table size.
        //It also reset the game -> inside increment and decrement functions of tableSizeProvider

        IconButton(
          onPressed: () => ref.read(tableSizeProvider.notifier).increment(),
          icon: const Icon(Icons.add),
        ),
        IconButton(
          onPressed: () => ref.read(tableSizeProvider.notifier).decrement(),
          icon: const Icon(Icons.remove),
        ),
      ],
    );
  }
}
