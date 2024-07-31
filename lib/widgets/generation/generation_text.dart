import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_of_life_starter_code/providers/generation.dart';

class GenerationText extends ConsumerWidget {
  const GenerationText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int generation = ref.watch(generationProvider);
    return Text('Generation: $generation');
  }
}
