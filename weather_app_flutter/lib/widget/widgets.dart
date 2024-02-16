import 'package:flutter/material.dart';

class AdditionalCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const AdditionalCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 32),
        const SizedBox(
          height: 8,
        ),
        Text(label),
        const SizedBox(
          height: 8,
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class MyCard extends StatelessWidget {
  final String time;
  final IconData icon;
  final String temperature;

  const MyCard({
    super.key,
    required this.time,
    required this.icon,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(children: [
          Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            time,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          Icon(icon),
          const SizedBox(
            height: 8,
          ),
          Text(
            temperature,
          ),
        ]),
      ),
    );
  }
}
