import 'package:flutter/material.dart';

class CounterCard extends StatelessWidget {
  final String title;
  final int value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CounterCard({
    Key? key,
    required this.title,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: const Color(0xFF111328),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, color: Color(0xFFB0BEC5))),
          Text(value.toString(), style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.remove_circle),
                iconSize: 40,
                color: const Color(0xFF00E5FF),
                onPressed: onDecrement,
              ),
              IconButton(
                icon: const Icon(Icons.add_circle),
                iconSize: 40,
                color: const Color(0xFF00E5FF),
                onPressed: onIncrement,
              ),
            ],
          )
        ],
      ),
    );
  }
}