import 'package:Wedive/utils/constants/colors.dart';
import 'package:Wedive/utils/constants/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MarkerSvg extends StatelessWidget {
  final Color color;
  final double width;
  final double height;

  const MarkerSvg({
    super.key,
    this.color = WediveColorsTheme.backgroundWhite,
    this.width = FlutterMapConstants.defaultMarkerSize,
    this.height = FlutterMapConstants.defaultMarkerSize,
  });

  String _colorToHex(Color c) {
    return '#${c.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}';
  }

  @override
  Widget build(BuildContext context) {
    final svgColor = _colorToHex(color);
    final svg =
        '''
<svg width="40" height="47" viewBox="0 0 40 47" fill="none" xmlns="http://www.w3.org/2000/svg">
  <circle cx="20" cy="45" r="1.5" fill="$svgColor" stroke="$svgColor"/>
  <path d="M19.2834 40.2491L20.717 40.2509L19.9991 41.1807L19.2834 40.2491Z" fill="$svgColor" stroke="$svgColor"/>
  <circle cx="20" cy="20" r="18.5" fill="$svgColor" stroke="$svgColor" stroke-width="3"/>
</svg>
''';
    return SvgPicture.string(
      svg,
      width: width,
      height: height,
      fit: BoxFit.contain,
    );
  }
}
