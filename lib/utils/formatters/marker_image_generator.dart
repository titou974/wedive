// utils/helpers/marker_image_generator.dart
import 'dart:async';
import 'dart:ui' as ui;
import 'package:Wedive/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MarkerImageGenerator {
  /// Generate a marker image with spot photo inside
  static Future<Uint8List> generateMarkerWithImage({
    required String spotImagePath,
    required bool isSelected,
    double markerWidth = 80,
    double markerHeight = 100,
  }) async {
    try {
      // Create a custom painter widget
      final widget = _MarkerWidget(
        spotImagePath: spotImagePath,
        isSelected: isSelected,
        markerWidth: markerWidth,
        markerHeight: markerHeight,
      );

      // Convert widget to image
      final bytes = await _widgetToImage(widget, markerWidth, markerHeight);
      return bytes;
    } catch (e) {
      debugPrint('Error generating marker image: $e');
      // Return a fallback marker
      return await _generateFallbackMarker();
    }
  }

  /// Convert widget to image bytes
  static Future<Uint8List> _widgetToImage(
    Widget widget,
    double width,
    double height,
  ) async {
    final repaintBoundary = RenderRepaintBoundary();
    final view = ui.PlatformDispatcher.instance.views.first;
    final size = Size(width, height);

    final renderView = RenderView(
      view: view,
      child: RenderPositionedBox(
        alignment: Alignment.center,
        child: repaintBoundary,
      ),
      configuration: ViewConfiguration(
        physicalConstraints: BoxConstraints(
          maxWidth: size.width,
          maxHeight: size.height,
        ),
        devicePixelRatio: 1.0,
      ),
    );

    final pipelineOwner = PipelineOwner();
    final buildOwner = BuildOwner(focusManager: FocusManager());

    pipelineOwner.rootNode = renderView;
    renderView.prepareInitialFrame();

    final rootElement = RenderObjectToWidgetAdapter<RenderBox>(
      container: repaintBoundary,
      child: Directionality(textDirection: TextDirection.ltr, child: widget),
    ).attachToRenderTree(buildOwner);

    buildOwner.buildScope(rootElement);
    buildOwner.finalizeTree();

    pipelineOwner.flushLayout();
    pipelineOwner.flushCompositingBits();
    pipelineOwner.flushPaint();

    final image = await repaintBoundary.toImage(pixelRatio: 3.0);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    return byteData!.buffer.asUint8List();
  }

  /// Generate a simple fallback marker
  static Future<Uint8List> _generateFallbackMarker() async {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    final paint = Paint()..color = Colors.blue;

    // Draw a simple circle marker
    canvas.drawCircle(const Offset(20, 20), 20, paint);

    final picture = recorder.endRecording();
    final image = await picture.toImage(40, 40);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    return byteData!.buffer.asUint8List();
  }
}

/// Custom widget for the marker
class _MarkerWidget extends StatelessWidget {
  final String spotImagePath;
  final bool isSelected;
  final double markerWidth;
  final double markerHeight;

  const _MarkerWidget({
    required this.spotImagePath,
    required this.isSelected,
    required this.markerWidth,
    required this.markerHeight,
  });

  @override
  Widget build(BuildContext context) {
    final scale = isSelected ? 1.3 : 1.0;

    return Transform.scale(
      scale: scale,
      child: SizedBox(
        width: markerWidth,
        height: markerHeight,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // SVG Marker background
            SvgPicture.asset(
              WediveImages.markerSvg,
              width: markerWidth,
              height: markerHeight,
              colorFilter: isSelected
                  ? const ColorFilter.mode(Color(0xFF0066FF), BlendMode.srcIn)
                  : null,
            ),
            // Spot image in the circle
            Positioned(
              top: markerHeight * 0.15, // Adjust based on your SVG
              child: ClipOval(
                child: SizedBox(
                  width: markerWidth * 0.53, // Adjust to fit your SVG circle
                  height: markerWidth * 0.53,
                  child: Image.asset(
                    spotImagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: const Icon(Icons.image_not_supported),
                      );
                    },
                  ),
                ),
              ),
            ),
            // Optional: Add a white border around the image
            Positioned(
              top: markerHeight * 0.15,
              child: Container(
                width: markerWidth * 0.53,
                height: markerWidth * 0.53,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
