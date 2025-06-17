import 'package:flutter/material.dart';
class AppTextStyles {
  final ColorScheme colors;

  const AppTextStyles(this.colors);

  TextTheme get textTheme {
    return TextTheme(
      displayLarge: _base.copyWith(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: colors.onBackground,
      ),
      
      // For competitor names
      headlineMedium: _base.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: colors.onSurface,
      ),
      
      // For AppBar titles
      titleLarge: _base.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: colors.onSurface,
      ),
      
      // For odds values
      bodyLarge: _base.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: colors.onSurface,
      ),
      
      // For supporting text, like match time
      bodyMedium: _base.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: colors.onSurfaceVariant,
      ),
      
      // For button text
      labelLarge: _base.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: colors.onPrimary,
      ),
    );
  }

  static const TextStyle _base = TextStyle(fontFamily: 'Inter');
}
