import 'package:flutter/material.dart';

/// Enum representing the official Egyptian Tansik Geographic Distribution Zones:
/// - zoneA: مجموعة (أ) - النطاق الجغرافي الأول
/// - zoneB: مجموعة (ب) - النطاق الجغرافي الثاني
/// - zoneC: مجموعة (ج) - النطاق الجغرافي الثالث
enum TansikZone {
  zoneA('مجموعة (أ)', Color(0xFF10B981), Icons.verified_rounded),
  zoneB('مجموعة (ب)', Color(0xFF3B82F6), Icons.explore_rounded),
  zoneC('مجموعة (ج)', Color(0xFF8B5CF6), Icons.public_rounded);

  final String label;
  final Color color;
  final IconData icon;

  const TansikZone(this.label, this.color, this.icon);
}
