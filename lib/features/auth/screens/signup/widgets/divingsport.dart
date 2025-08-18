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
        'name': 'Snorkeling',
        'isChecked': false,
        'icon': 'assets/icons/snorkeling.svg',
        'iconPrimary': 'assets/icons/snorkeling_primary.svg',
      },
      {
        'name': 'Free Diving',
        'isChecked': false,
        'icon': 'assets/icons/freediving.svg',
        'iconPrimary': 'assets/icons/freediving_primary.svg',
      },
      {
        'name': 'Bottle Diving',
        'isChecked': false,
        'icon': 'assets/icons/bottlediving.svg',
        'iconPrimary': 'assets/icons/bottlediving_primary.svg',
      },
      {
        'name': 'Cliff Diving',
        'isChecked': false,
        'icon': 'assets/icons/dods.svg',
        'iconPrimary': 'assets/icons/dods_primary.svg',
      },
      {
        'name': 'Spearfishing',
        'isChecked': false,
        'icon': 'assets/icons/spearfishing.svg',
        'iconPrimary': 'assets/icons/spearfishing_primary.svg',
      },
      {
        'name': 'Kayak',
        'isChecked': false,
        'icon': 'assets/icons/kayak.svg',
        'iconPrimary': 'assets/icons/kayak_primary.svg',
      },
      {
        'name': 'Fishing',
        'isChecked': false,
        'icon': 'assets/icons/fishing.svg',
        'iconPrimary': 'assets/icons/fishing_primary.svg',
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: sports.map((sport) {
        final isChecked = sport['isChecked'] as bool;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.ease,
          margin: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            border: Border.all(
              color: isChecked
                  ? Theme.of(context).colorScheme.primary
                  : Colors.transparent,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: CheckboxListTile(
            value: isChecked,
            onChanged: (val) {
              setState(() {
                // Uncheck all others for radio-like behavior
                for (var s in sports) {
                  s['isChecked'] = false;
                }
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
            secondary: SvgPicture.asset(
              isChecked ? sport['iconPrimary'] : sport['icon'],
              width: 40,
              height: 40,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            controlAffinity: ListTileControlAffinity.leading,
          ),
        );
      }).toList(),
    );
  }
}
