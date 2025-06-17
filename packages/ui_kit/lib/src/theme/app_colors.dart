import 'package:flutter/material.dart';

abstract final class AppColors {
  static const ColorScheme darkScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFEED13B),
    onPrimary: Color(0xFF1A1A1A),
    secondary: Color(0xFF48A2E8),
    onSecondary: Color(0xFFFFFFFF),
    error: Color(0xFFF44336),
    onError: Color(0xFFFFFFFF),
    surface: Color(0xFF121212),
    onSurface: Color(0xFFFFFFFF),
    surfaceContainerHighest: Color(0xFF2C2C2E), // For containers on top of surface
    onSurfaceVariant: Color(0xFFBDBDBD),
    outline: Color(0xFF424242),
    // Custom colors
    tertiary: Color(0xFF4CAF50), // Odds Increase Green
    onTertiary: Color(0xFFF44336), // Odds Decrease Red
  );
}
