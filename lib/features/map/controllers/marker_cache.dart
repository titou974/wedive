// features/map/controllers/marker_cache.dart
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:Wedive/utils/formatters/marker_image_generator.dart';

class MarkerCache {
  static final MarkerCache _instance = MarkerCache._internal();
  factory MarkerCache() => _instance;
  MarkerCache._internal();

  final Map<String, Uint8List> _cache = {};
  final Map<String, Uint8List> _selectedCache = {};

  /// Get or generate marker image
  Future<Uint8List> getMarkerImage({
    required String spotId,
    required String spotImagePath,
    required bool isSelected,
  }) async {
    final cache = isSelected ? _selectedCache : _cache;
    final cacheKey = '$spotId-$spotImagePath';

    if (cache.containsKey(cacheKey)) {
      return cache[cacheKey]!;
    }

    // Generate new marker image
    final image = await MarkerImageGenerator.generateMarkerWithImage(
      spotImagePath: spotImagePath,
      isSelected: isSelected,
    );

    cache[cacheKey] = image;
    return image;
  }

  /// Preload all marker images
  Future<void> preloadMarkers(List<dynamic> spots) async {
    for (var spot in spots) {
      await getMarkerImage(
        spotId: spot.id,
        spotImagePath: spot.imageUrl,
        isSelected: false,
      );
      await getMarkerImage(
        spotId: spot.id,
        spotImagePath: spot.imageUrl,
        isSelected: true,
      );
    }
    debugPrint(
      'Preloaded ${_cache.length + _selectedCache.length} marker images',
    );
  }

  void clearCache() {
    _cache.clear();
    _selectedCache.clear();
  }
}
