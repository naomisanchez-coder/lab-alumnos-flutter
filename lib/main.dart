import 'package:flutter/material.dart';

import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

/// Widget principal que configura el tema global de la aplicación.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestión de Alumnos',
      debugShowCheckedModeBanner: false,

      // Aplicamos el tema definido en app_theme.dart.
      theme: AppTheme.lightTheme,

      // Pantalla temporal para comprobar los estilos.
      // Posteriormente será reemplazada por LoginScreen.
      home: const ThemePreviewScreen(),
    );
  }
}

/// Pantalla temporal utilizada para comprobar el tema global.
class ThemePreviewScreen extends StatelessWidget {
  const ThemePreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gestión de Alumnos')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bienvenido',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Correo electrónico',
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                prefixIcon: Icon(Icons.lock_outline),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('INICIAR SESIÓN'),
            ),
            const SizedBox(height: 20),
            const Card(
              child: ListTile(
                leading: Icon(Icons.school),
                title: Text('Gestión de Alumnos'),
                subtitle: Text('Vista previa del tema global'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
