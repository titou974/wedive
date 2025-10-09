import 'package:Wedive/utils/constants/fr_strings.dart';
import 'package:Wedive/utils/constants/sizes.dart';
import 'package:Wedive/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DivingSportPage extends StatefulWidget {
  final List<String> selectedSports;
  final Function(List<String>) onChanged;

  const DivingSportPage({
    super.key,
    required this.selectedSports,
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
        'iconSecondary': 'assets/icons/freediving_secondary.svg',
      },
      {
        'name': WediveTextsFr.snorkeling,
        'description': WediveTextsFr.snorkelingDescription,
        'isChecked': true,
        'icon': 'assets/icons/snorkeling.svg',
        'iconPrimary': 'assets/icons/snorkeling_primary.svg',
        'iconSecondary': 'assets/icons/snorkeling_secondary.svg',
      },
      {
        'name': WediveTextsFr.bottleDiving,
        'description': WediveTextsFr.bottleDivingDescription,
        'isChecked': false,
        'icon': 'assets/icons/bottlediving.svg',
        'iconPrimary': 'assets/icons/bottlediving_primary.svg',
        'iconSecondary': 'assets/icons/bottlediving_secondary.svg',
      },
      {
        'name': WediveTextsFr.cliffDiving,
        'description': WediveTextsFr.cliffDivingDescription,
        'isChecked': false,
        'icon': 'assets/icons/dods.svg',
        'iconPrimary': 'assets/icons/dods_primary.svg',
        'iconSecondary': 'assets/icons/dods_secondary.svg',
      },
      {
        'name': WediveTextsFr.spearfishing,
        'description': WediveTextsFr.spearfishingDescription,
        'isChecked': false,
        'icon': 'assets/icons/spearfishing.svg',
        'iconPrimary': 'assets/icons/spearfishing_primary.svg',
        'iconSecondary': 'assets/icons/spearfishing_secondary.svg',
      },
      {
        'name': WediveTextsFr.fishing,
        'description': WediveTextsFr.fishingDescription,
        'isChecked': false,
        'icon': 'assets/icons/fishing.svg',
        'iconPrimary': 'assets/icons/fishing_primary.svg',
        'iconSecondary': 'assets/icons/fishing_secondary.svg',
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final dark = WeDiveHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: sports.map((sport) {
        final isChecked = widget.selectedSports.contains(sport['name']);
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
                if (val == true) {
                  // Add to selected
                  final updated = List<String>.from(widget.selectedSports)
                    ..add(sport['name']);
                  widget.onChanged(updated);
                } else {
                  // Remove from selected
                  final updated = List<String>.from(widget.selectedSports)
                    ..remove(sport['name']);
                  widget.onChanged(updated);
                }
              });
            },
            activeColor: Theme.of(context).colorScheme.primary,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sport['name'],
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(height: WediveSizes.xs),
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
                isChecked
                    ? dark
                          ? sport['iconSecondary']
                          : sport['iconPrimary']
                    : sport['icon'],
                width: 50,
                height: 50,
                key: ValueKey(isChecked),
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
