// Archivo: menu_screen - Proyecto Gestión de Alumnos.

import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Pantalla principal de navegación de Gestión de Alumnos.
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  /// Muestra un mensaje de confirmación para cerrar sesión.
  Future<void> _cerrarSesion(BuildContext context) async {
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Cerrar sesión'),
        content: const Text('¿Estás seguro de que deseas cerrar sesión?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('CANCELAR'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: const Text('SALIR'),
          ),
        ],
      ),
    );

    if (confirmar == true && context.mounted) {
      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    }
  }

  /// Crea una opción reutilizable para el menú.
  Widget _opcionMenu({
    required BuildContext context,
    required IconData icono,
    required String titulo,
    required String ruta,
    bool destacada = false,
  }) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 4),
      color: destacada ? AppTheme.lightPurple : Colors.white,
      child: ListTile(
        leading: Icon(icono, color: AppTheme.primaryColor, size: 24),
        title: Text(
          titulo,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          size: 22,
          color: Colors.black54,
        ),
        onTap: () {
          Navigator.pushNamed(context, ruta);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú', style: TextStyle(fontSize: 20)),
        leading: const Icon(Icons.menu),
      ),

      // ListView permite organizar opciones desplazables.
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: ListView(
            padding: const EdgeInsets.all(12),
            children: [
              _opcionMenu(
                context: context,
                icono: Icons.person_add_alt_1,
                titulo: 'Registrar Alumnos',
                ruta: '/registro',
                destacada: true,
              ),
              _opcionMenu(
                context: context,
                icono: Icons.format_list_bulleted,
                titulo: 'Listar Alumnos',
                ruta: '/alumnos',
              ),
              _opcionMenu(
                context: context,
                icono: Icons.person,
                titulo: 'Perfil',
                ruta: '/perfil',
              ),

              // Opción independiente para cerrar sesión.
              Card(
                elevation: 0,
                margin: const EdgeInsets.symmetric(vertical: 4),
                child: ListTile(
                  leading: const Icon(Icons.logout, color: Colors.red),
                  title: const Text(
                    'Logout',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: Colors.black54,
                  ),
                  onTap: () => _cerrarSesion(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
