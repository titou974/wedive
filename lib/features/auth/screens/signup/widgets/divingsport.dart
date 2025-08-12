import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DivingSportPage extends StatefulWidget {
  final String? selectedSport;
  final Function(String) onChanged;

  const DivingSportPage({
    super.key,
    required this.selectedSport,
    required this.onChanged,
  });

  @override
  State<DivingSportPage> createState() => _DivingSportPageState();
}

class _DivingSportPageState extends State<DivingSportPage> {
  late List<Map<String, dynamic>> sports;

  @override
  void initState() {
    super.initState();
    sports = [
      {
        'name': 'Scuba Diving',
        'isChecked': false,
        'icon': 'assets/icons/apple.svg',
      },
      {
        'name': 'Free Diving',
        'isChecked': false,
        'icon': 'assets/icons/apple.svg',
      },
      {
        'name': 'Snorkeling',
        'isChecked': false,
        'icon': 'assets/icons/apple.svg',
      },
      {
        'name': 'Underwater Photography',
        'isChecked': false,
        'icon': 'assets/icons/apple.svg',
      },
      {
        'name': 'Spearfishing',
        'isChecked': false,
        'icon': 'assets/icons/apple.svg',
      },
      {
        'name': 'Wreck Diving',
        'isChecked': false,
        'icon': 'assets/icons/apple.svg',
      },
      {
        'name': 'Cave Diving',
        'isChecked': false,
        'icon': 'assets/icons/apple.svg',
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: sports.map((sport) {
        return CheckboxListTile(
          value: sport['isChecked'],
          onChanged: (val) {
            setState(() {
              sport['isChecked'] = val ?? false;
              if (val == true) {
                widget.onChanged(sport['name']);
              }
            });
          },
          title: Text(
            sport['name'],
            style: Theme.of(context).textTheme.labelLarge,
          ),
          secondary: SvgPicture.asset(sport['icon'], width: 40, height: 40),
        );
      }).toList(),
    );
  }
}
