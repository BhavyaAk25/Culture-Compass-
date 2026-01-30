import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Culture Compass Design System - Typography
/// Headlines: Fraunces (elegant serif)
/// Body/UI: Inter (clean sans-serif)
class AppTypography {
  AppTypography._();

  // Headline font (Fraunces - elegant serif for titles)
  static TextStyle headline1 = GoogleFonts.fraunces(
    fontSize: 48,
    fontWeight: FontWeight.w600,
    color: AppColors.textOnDark,
    letterSpacing: -1.5,
  );

  static TextStyle headline2 = GoogleFonts.fraunces(
    fontSize: 36,
    fontWeight: FontWeight.w600,
    color: AppColors.textOnDark,
    letterSpacing: -0.5,
  );

  static TextStyle headline3 = GoogleFonts.fraunces(
    fontSize: 28,
    fontWeight: FontWeight.w500,
    color: AppColors.textOnDark,
  );

  static TextStyle headline4 = GoogleFonts.fraunces(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: AppColors.textOnDark,
  );

  static TextStyle headline5 = GoogleFonts.fraunces(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.textOnDark,
  );

  // Body font (Inter - clean for readability)
  static TextStyle bodyLarge = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.textOnDark,
    height: 1.6,
  );

  static TextStyle bodyMedium = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textOnDark,
    height: 1.5,
  );

  static TextStyle bodySmall = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  // UI Elements
  static TextStyle button = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );

  static TextStyle caption = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
  );

  static TextStyle label = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  // Special styles
  static TextStyle quote = GoogleFonts.fraunces(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
    color: AppColors.accent,
    height: 1.6,
  );

  static TextStyle tagline = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.accent,
    letterSpacing: 2,
  );
}
