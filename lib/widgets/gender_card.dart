import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const GenderCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector( //
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(

          color: isSelected ? const Color(0xFF1D1E33) : const Color(0xFF111328),
          borderRadius: BorderRadius.circular(15.0),

          border: isSelected ? Border.all(color: const Color(0xFF00E5FF), width: 2) : null,
        ),
        child: Column( //
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 80.0,

              color: isSelected ? const Color(0xFF00E5FF) : Colors.white,
            ),
            const SizedBox(height: 15.0), //[cite: 10]
            Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                color: Color(0xFFB0BEC5), //[cite: 6]
              ),
            ),
          ],
        ),
      ),
    );
  }
}