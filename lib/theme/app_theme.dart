// Archivo: app_theme - Proyecto Gestión de Alumnos.

import 'package:flutter/material.dart';

/// Configuración visual general de la aplicación Gestión de Alumnos.
/// Permite reutilizar los mismos colores y estilos en todas las pantallas.
class AppTheme {
  // Colores principales de la Sección A.
  static const Color primaryColor = Color(0xFF5B40CF);
  static const Color lightPurple = Color(0xFFF0EBFF);
  static const Color backgroundColor = Colors.white;
  static const Color textColor = Color(0xFF263044);

  /// Tema global utilizado por MaterialApp.
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      // Define el esquema de colores de la aplicación.
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        primary: primaryColor,
        surface: backgroundColor,
      ),

      scaffoldBackgroundColor: backgroundColor,

      // Configuración de las barras superiores.
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
      ),

      // Estilo de los botones principales.
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 48),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),

      // Apariencia de los campos de texto.
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Color(0xFFD8D8E0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Color(0xFFD8D8E0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: primaryColor, width: 2),
        ),
      ),

      // Estilo de tarjetas para alumnos y otros elementos.
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 1,
        margin: const EdgeInsets.symmetric(vertical: 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),

      // Estilo general de los textos.
      textTheme: const TextTheme(
        headlineSmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
        bodyMedium: TextStyle(fontSize: 14, color: textColor),
      ),
    );
  }
}
