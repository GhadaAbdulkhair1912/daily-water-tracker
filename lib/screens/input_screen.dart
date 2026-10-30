import 'package:flutter/material.dart';
import '../widgets/gender_card.dart';
import '../widgets/counter_card.dart';
import '../widgets/bottom_button.dart';
import '../utils/water_calculator.dart';
import 'result_screen.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  String? selectedGender;
  int weight = 60;
  int age = 20;
  double activityHours = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.water_drop, color: Color(0xFF00E5FF)),
            SizedBox(width: 8),
            Text('Water Tracker'),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GenderCard(
                    title: 'MALE',
                    icon: Icons.male,
                    isSelected: selectedGender == 'male',
                    onTap: () => setState(() => selectedGender = 'male'),
                  ),
                ),
                Expanded(
                  child: GenderCard(
                    title: 'FEMALE',
                    icon: Icons.female,
                    isSelected: selectedGender == 'female',
                    onTap: () => setState(() => selectedGender = 'female'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(color: const Color(0xFF111328), borderRadius: BorderRadius.circular(15.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('ACTIVITY (hours/day)', style: TextStyle(color: Color(0xFFB0BEC5))),
                  Text('${activityHours.toInt()} h', style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                  Slider(
                    value: activityHours,
                    min: 0,
                    max: 8,
                    activeColor: const Color(0xFF00E5FF),
                    onChanged: (newValue) => setState(() => activityHours = newValue),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CounterCard(
                    title: 'WEIGHT (kg)',
                    value: weight,
                    onIncrement: () => setState(() { if (weight < 200) weight++; }),
                    onDecrement: () => setState(() { if (weight > 30) weight--; }),
                  ),
                ),
                Expanded(
                  child: CounterCard(
                    title: 'AGE (years)',
                    value: age,
                    onIncrement: () => setState(() { if (age < 100) age++; }),
                    onDecrement: () => setState(() { if (age > 10) age--; }),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            title: 'Calculate Water Intake',
            onTap: () {
              if (selectedGender == null) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please select gender')));
                return;
              }
              double litres = calculateWaterLitres(weightKg: weight, activityHours: activityHours);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultScreen(
                    litres: litres,
                    weight: weight,
                    age: age,
                    activityHours: activityHours,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}