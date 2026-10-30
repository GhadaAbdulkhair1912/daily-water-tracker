import 'package:flutter/material.dart';
import '../widgets/bottom_button.dart';

class ResultScreen extends StatelessWidget {
  final double litres;
  final int weight;
  final int age;
  final double activityHours;

  const ResultScreen({
    Key? key,
    required this.litres,
    required this.weight,
    required this.age,
    required this.activityHours,
  }) : super(key: key);

  String getGuidanceText() {
    if (litres < 2.0) return 'Low';
    if (litres <= 3.0) return 'Good';
    return 'High';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Daily Water Intake')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: const Color(0xFF111328),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('${litres.toStringAsFixed(2)} L / Day',
                      style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Color(0xFF00E5FF))),
                  const Text('Estimated value (educational formula)\nnot medical advice',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey)),
                  Text(getGuidanceText(), textAlign: TextAlign.center, style: const TextStyle(fontSize: 18)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Weight: $weight kg'),
                      Text('Age: $age y'),
                      Text('Activity: ${activityHours.toInt()} h'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            title: 'Re-calculate',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}