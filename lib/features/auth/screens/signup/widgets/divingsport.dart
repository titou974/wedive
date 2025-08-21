import 'package:Wedive/utils/constants/fr_strings.dart';
import 'package:Wedive/utils/constants/sizes.dart';
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
        'name': WediveTextsFr.freeDiving,
        'description': WediveTextsFr.freeDivingDescription,
        'isChecked': true,
        'icon': 'assets/icons/freediving.svg',
        'iconPrimary': 'assets/icons/freediving_primary.svg',
      },
      {
        'name': WediveTextsFr.snorkeling,
        'description': WediveTextsFr.snorkelingDescription,
        'isChecked': true,
        'icon': 'assets/icons/snorkeling.svg',
        'iconPrimary': 'assets/icons/snorkeling_primary.svg',
      },
      {
        'name': WediveTextsFr.bottleDiving,
        'description': WediveTextsFr.bottleDivingDescription,
        'isChecked': false,
        'icon': 'assets/icons/bottlediving.svg',
        'iconPrimary': 'assets/icons/bottlediving_primary.svg',
      },
      {
        'name': WediveTextsFr.cliffDiving,
        'description': WediveTextsFr.cliffDivingDescription,
        'isChecked': false,
        'icon': 'assets/icons/dods.svg',
        'iconPrimary': 'assets/icons/dods_primary.svg',
      },
      {
        'name': WediveTextsFr.spearfishing,
        'description': WediveTextsFr.spearfishingDescription,
        'isChecked': false,
        'icon': 'assets/icons/spearfishing.svg',
        'iconPrimary': 'assets/icons/spearfishing_primary.svg',
      },
      {
        'name': WediveTextsFr.kayak,
        'description': WediveTextsFr.kayakDescription,
        'isChecked': false,
        'icon': 'assets/icons/kayak.svg',
        'iconPrimary': 'assets/icons/kayak_primary.svg',
      },
      {
        'name': WediveTextsFr.fishing,
        'description': WediveTextsFr.fishingDescription,
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
          margin: const EdgeInsets.symmetric(vertical: WediveSizes.sm),
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
                sport['isChecked'] = val ?? false;
                if (val == true) {
                  widget.onChanged(sport['name']);
                }
              });
            },
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sport['name'],
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(
                  height: WediveSizes.xs,
                ), // Space between title and subtitle
                Text(
                  sport['description'],
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
            secondary: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              transitionBuilder: (child, animation) =>
                  FadeTransition(opacity: animation, child: child),
              child: SvgPicture.asset(
                isChecked ? sport['iconPrimary'] : sport['icon'],
                width: 50,
                height: 50,
                key: ValueKey(
                  isChecked,
                ), // Important for AnimatedSwitcher to detect change
              ),
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
