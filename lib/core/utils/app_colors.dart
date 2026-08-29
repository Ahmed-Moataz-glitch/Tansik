import 'package:flutter/material.dart';

abstract class AppColors {
  // Brand Primary Palette
  static const Color primary = Color(0xFFC92A34); // Rich Crimson
  static const Color primaryLight = Color(0xFFE84A54);
  static const Color primaryDark = Color(0xFFA31A23);
  static const Color secondary = Color(0xFFEA5A63);
  static const Color secondaryLight = Color(0xFFFF7A82);

  // Surface & Neutrals - Light Mode
  static const Color lightScaffold = Color(0xFFF8FAFC);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color lightBorder = Color(0xFFE2E8F0);
  static const Color lightUnselected = Color(0xFFF1F5F9);
  static const Color textPrimaryLight = Color(0xFF0F172A);
  static const Color textSecondaryLight = Color(0xFF64748B);
  static const Color textMutedLight = Color(0xFF94A3B8);

  // Surface & Neutrals - Dark Mode
  static const Color darkScaffold = Color(0xFF121316); // Modern Obsidian Charcoal
  static const Color darkSurface = Color(0xFF1C1D22);  // Elevated Surface & Modal
  static const Color darkCard = Color(0xFF1C1D22);     // Card Background
  static const Color darkBorder = Color(0xFF2D2E36);   // Subtle Clean Border
  static const Color darkUnselected = Color(0xFF24252B); // Inactive/Unselected Item
  static const Color textPrimaryDark = Color(0xFFF4F4F6);
  static const Color textSecondaryDark = Color(0xFFA1A1AA);
  static const Color textMutedDark = Color(0xFF71717A);

  // Recommendation Status Colors
  static const Color guaranteed = Color(0xFF10B981); // Emerald
  static const Color likely = Color(0xFF3B82F6);     // Blue
  static const Color ambitious = Color(0xFFF59E0B);  // Amber
  static const Color far = Color(0xFF94A3B8);        // Slate

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFFE84A54), Color(0xFFC92A34)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient headerGradient = LinearGradient(
    colors: [Color(0xFFC92A34), Color(0xFFA31A23)],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

  static const Color transparent = Colors.transparent;
}
