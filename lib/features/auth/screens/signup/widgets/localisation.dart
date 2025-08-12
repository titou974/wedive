import 'package:flutter/material.dart';

class LocalisationPage extends StatelessWidget {
  final String? location;
  final Function(String) onChanged;

  const LocalisationPage({
    super.key,
    required this.location,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Où pratiquez-vous la plongée ?',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Localisation',
            prefixIcon: Icon(Icons.location_on),
          ),
          initialValue: location,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
