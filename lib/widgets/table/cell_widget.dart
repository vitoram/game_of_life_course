import 'package:flutter/material.dart';

class CellWidget extends StatelessWidget {
  final int alive;
  const CellWidget({super.key, required this.alive});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: alive == 1 ? Colors.black : Colors.white,
        border: Border.all(color: Colors.grey),
      ),
    );
  }
}
