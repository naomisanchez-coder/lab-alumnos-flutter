import 'package:flutter/material.dart';

import 'screens/alumnos_screen.dart';
import 'screens/login_screen.dart';
import 'screens/menu_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

/// Widget principal de Gestión de Alumnos.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestión de Alumnos',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,

      // Ruta inicial de la aplicación.
      initialRoute: '/',

      // Rutas utilizadas para navegar entre las pantallas.
      routes: {
        '/': (context) => const LoginScreen(),
        '/menu': (context) => const MenuScreen(),

        // Vistas temporales hasta implementar cada pantalla.
        '/registro': (context) =>
            const PantallaTemporal(titulo: 'Registrar Alumno'),
        '/alumnos': (context) =>
            const PantallaTemporal(titulo: 'Listar Alumnos'),
        '/alumnos': (context) => const AlumnosScreen(),
      },
    );
  }
}

/// Vista temporal para rutas todavía no desarrolladas.
class PantallaTemporal extends StatelessWidget {
  final String titulo;

  const PantallaTemporal({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titulo)),
      body: Center(
        child: Text(
          'Pantalla de $titulo en desarrollo',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
