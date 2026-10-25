import 'package:flutter/material.dart';

import 'screens/login_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

/// Widget principal de la aplicación Gestión de Alumnos.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestión de Alumnos',
      debugShowCheckedModeBanner: false,

      // Aplicamos el tema global morado a toda la aplicación.
      theme: AppTheme.lightTheme,

      // Login será la pantalla inicial.
      home: const LoginScreen(),
    );
  }
}
