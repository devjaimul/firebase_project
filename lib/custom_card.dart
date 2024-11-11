import 'package:flutter/material.dart';
import 'package:test01/entities.dart';

class CustomCard extends StatelessWidget {
  final Cricket cricket;

  const CustomCard({
    super.key,
    required this.cricket,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(cricket.team1, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(cricket.team1Name),
              ],
            ),
            const Text('Vs', style: TextStyle(fontWeight: FontWeight.bold)),
            Column(
              children: [
                Text(cricket.team2, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(cricket.team2Name),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
