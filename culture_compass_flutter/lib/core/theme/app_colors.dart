import 'package:flutter/material.dart';

/// Culture Compass Design System - Color Tokens
/// Aesthetic: Cozy library with evergreen greens, walnut wood, parchment surfaces,
/// brass accents, and ruby highlights.
class AppColors {
  AppColors._();

  // Core palette (Warm light mode primary)
  static const Color background = Color(0xFFF4EEE4); // parchment
  static const Color surface = Color(0xFFE7D7C5); // warm wood
  static const Color surfaceLight = Color(0xFFFDF9F2);
  static const Color primary = Color(0xFF6B4F2A); // walnut
  static const Color primaryHover = Color(0xFF7B5C33);
  static const Color accent = Color(0xFFB08B4F); // brass
  static const Color accentRuby = Color(0xFF7A2E3A);
  static const Color textOnDark = Color(0xFF2B1D16);
  static const Color textOnLight = Color(0xFF2B1D16);
  static const Color borderSubtle = Color(0xFFDAC6AE);

  // Extended palette
  static const Color surfaceElevated = Color(0xFFF1E6D6);
  static const Color surfaceCard = Color(0xFFEBDDCB);
  static const Color success = Color(0xFF4A7C59);
  static const Color warning = Color(0xFFB8892B);
  static const Color error = Color(0xFFC24B4B);
  static const Color info = Color(0xFF4F7E93);

  // Text colors
  static const Color textPrimary = textOnDark;
  static const Color textSecondary = Color(0xFF5E4C3D);
  static const Color textMuted = Color(0xFF8A7464);

  // Gradients
  static const LinearGradient woodGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFEBDDCB),
      Color(0xFFE0CDB6),
    ],
  );

  static const LinearGradient evergreenGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF8C6A3C),
      Color(0xFF6B4F2A),
    ],
  );

  static const LinearGradient splashGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFF4EEE4),
      Color(0xFFEBDDCB),
      Color(0xFFE0CDB6),
    ],
  );
}
