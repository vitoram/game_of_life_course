import 'package:game_of_life_starter_code/providers/cells.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'generation.g.dart';

@riverpod
class Generation extends _$Generation {
  @override
  int build() {
    return 0;
  }

  void increase() {
    state++;
    ////TODO 2: What is better, this function here or in "tickFunction" at timer_state_provider.dart ?
    ref.read(listCellsProvider.notifier).tick();
  }
}
