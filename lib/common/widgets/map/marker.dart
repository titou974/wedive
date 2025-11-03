import 'package:Wedive/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MarkerSvg extends StatefulWidget {
  final Color color;
  final double width;
  final double height;
  final Duration duration;
  final Curve curve;

  const MarkerSvg({
    super.key,
    this.color = WediveColorsTheme.backgroundWhite,
    this.width = 40,
    this.height = 47,
    this.duration = const Duration(milliseconds: 800),
    this.curve = Curves.easeInOut,
  });

  @override
  State<MarkerSvg> createState() => _MarkerSvgState();
}

class _MarkerSvgState extends State<MarkerSvg>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<Color?> _colorAnim;
  Color? _currentColor;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.color;
    _ctrl = AnimationController(vsync: this, duration: widget.duration);
    _colorAnim = ColorTween(
      begin: widget.color,
      end: widget.color,
    ).animate(CurvedAnimation(parent: _ctrl, curve: widget.curve));
    // start at end so initial build uses widget.color
    _ctrl.value = 1.0;
  }

  @override
  void didUpdateWidget(covariant MarkerSvg oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.color != widget.color) {
      // create new tween from current animated value (or oldWidget.color) to new color
      final begin = _colorAnim.value ?? oldWidget.color;
      _colorAnim = ColorTween(
        begin: begin,
        end: widget.color,
      ).animate(CurvedAnimation(parent: _ctrl, curve: widget.curve));
      _ctrl
        ..duration = widget.duration
        ..forward(from: 0.0);
      _currentColor = widget.color;
    } else if (oldWidget.duration != widget.duration) {
      _ctrl.duration = widget.duration;
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  String _colorToHex(Color c) {
    return '#${c.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}';
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorAnim,
      builder: (context, child) {
        final color = _colorAnim.value ?? widget.color;
        final svgColor = _colorToHex(color!);
        final svg =
            '''
<svg width="${widget.width}" height="${widget.height}" viewBox="0 0 40 47" fill="none" xmlns="http://www.w3.org/2000/svg">
  <circle cx="20" cy="45" r="1.5" fill="$svgColor" stroke="$svgColor"/>
  <path d="M19.2834 40.2491L20.717 40.2509L19.9991 41.1807L19.2834 40.2491Z" fill="$svgColor" stroke="$svgColor"/>
  <circle cx="20" cy="20" r="18.5" fill="$svgColor" stroke="$svgColor" stroke-width="3"/>
</svg>
''';
        return SvgPicture.string(
          svg,
          width: widget.width,
          height: widget.height,
        );
      },
    );
  }
}
