import 'package:flutter/material.dart';

class CounterDisplay extends StatelessWidget {
  final int counter;

  const CounterDisplay({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Seu contador está em: $counter',
      style: TextStyle(
        color: counter >= 0 ? Colors.green : Colors.red,
        fontSize: 30,
      ),
    );
  }
}
