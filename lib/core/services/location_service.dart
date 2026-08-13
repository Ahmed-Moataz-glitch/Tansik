import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class LocationResult {
  final Position? position;
  final String? errorMessage;
  final bool isServiceDisabled;
  final bool isPermissionDenied;

  LocationResult({
    this.position,
    this.errorMessage,
    this.isServiceDisabled = false,
    this.isPermissionDenied = false,
  });
}

class LocationService {
  /// Check permissions, GPS status, and fetch current/last user position safely.
  static Future<LocationResult> getCurrentPosition() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return LocationResult(
          isServiceDisabled: true,
          errorMessage: 'خدمة الموقع (GPS) غير مفعلة. يمكنك تفعيلها أو اختيار المحافظة يدوياً.',
        );
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return LocationResult(
            isPermissionDenied: true,
            errorMessage: 'تم رفض إذن الوصول إلى الموقع.',
          );
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return LocationResult(
          isPermissionDenied: true,
          errorMessage: 'إذن الموقع مرفوض دائماً. يمكنك اختيار محافظتك يدوياً.',
        );
      }

      // 1. Try to get last known position first (fast & non-blocking)
      try {
        Position? lastPosition = await Geolocator.getLastKnownPosition();
        if (lastPosition != null) {
          return LocationResult(position: lastPosition);
        }
      } catch (e) {
        debugPrint('Error fetching last known position: $e');
      }

      // 2. Fetch current position using FusedLocationProvider (forceLocationManager: false)
      // Attempt 1: Low accuracy (fast network/cell fix)
      try {
        final position = await Geolocator.getCurrentPosition(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.low,
            timeLimit: Duration(seconds: 5),
          ),
        );
        return LocationResult(position: position);
      } catch (e) {
        debugPrint('Attempt 1 (Low accuracy) failed: $e');
      }

      // Attempt 2: Lowest accuracy fallback
      try {
        final position = await Geolocator.getCurrentPosition(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.lowest,
            timeLimit: Duration(seconds: 4),
          ),
        );
        return LocationResult(position: position);
      } catch (e) {
        debugPrint('Attempt 2 (Lowest accuracy) failed: $e');
      }

      return LocationResult(
        errorMessage: 'تعذر التقاط إشارة GPS الحالية. يمكنك اختيار محافظتك يدوياً للحصول على نتائج دقيقة.',
      );
    } catch (e) {
      return LocationResult(
        errorMessage: 'حدث خطأ أثناء تحديد الموقع: $e',
      );
    }
  }

  /// Calculates distance in kilometers between user position and college coordinates.
  static double calculateDistanceInKm({
    required double startLat,
    required double startLng,
    required double endLat,
    required double endLng,
  }) {
    final distanceInMeters = Geolocator.distanceBetween(
      startLat,
      startLng,
      endLat,
      endLng,
    );
    return distanceInMeters / 1000.0;
  }
}
