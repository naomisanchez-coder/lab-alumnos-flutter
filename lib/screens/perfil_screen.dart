import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Pantalla que permite visualizar y editar el perfil del usuario.
class PerfilScreen extends StatefulWidget {
  const PerfilScreen({super.key});

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  // Información inicial del usuario de demostración.
  String _nombre = 'María González';
  String _email = 'maria.gonzalez@correo.com';
  String _telefono = '912345678';
  final String _rol = 'Docente';

  // Controladores utilizados para editar la información.
  final _nombreController = TextEditingController();
  final _emailController = TextEditingController();
  final _telefonoController = TextEditingController();

  @override
  void dispose() {
    // Liberamos los controladores al cerrar la pantalla.
    _nombreController.dispose();
    _emailController.dispose();
    _telefonoController.dispose();
    super.dispose();
  }

  /// Abre el formulario para modificar los datos del perfil.
  Future<void> _editarPerfil() async {
    final formKey = GlobalKey<FormState>();

    // Cargamos los datos actuales en el formulario.
    _nombreController.text = _nombre;
    _emailController.text = _email;
    _telefonoController.text = _telefono;

    final guardar = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Editar Perfil'),

          content: SizedBox(
            width: 360,
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Campo para editar el nombre.
                    TextFormField(
                      controller: _nombreController,
                      textCapitalization: TextCapitalization.words,
                      decoration: const InputDecoration(
                        labelText: 'Nombre completo',
                        prefixIcon: Icon(Icons.person_outline),
                      ),
                      validator: (value) {
                        final nombre = value?.trim() ?? '';

                        if (nombre.isEmpty) {
                          return 'Ingresa tu nombre';
                        }

                        if (nombre.length < 2) {
                          return 'El nombre debe tener al menos 2 caracteres';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 14),

                    // Campo para editar el correo electrónico.
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Correo electrónico',
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                      validator: (value) {
                        final email = value?.trim() ?? '';

                        if (email.isEmpty) {
                          return 'Ingresa tu correo electrónico';
                        }

                        final patron = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

                        if (!patron.hasMatch(email)) {
                          return 'Ingresa un correo válido';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 14),

                    // Campo para editar el teléfono.
                    TextFormField(
                      controller: _telefonoController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: 'Teléfono',
                        prefixIcon: Icon(Icons.phone_outlined),
                      ),
                      validator: (value) {
                        final telefono = value?.trim() ?? '';

                        if (telefono.isEmpty) {
                          return 'Ingresa tu teléfono';
                        }

                        if (!RegExp(r'^\d{9}$').hasMatch(telefono)) {
                          return 'Ingresa un teléfono de 9 dígitos';
                        }

                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),

          actions: [
            // Cierra el formulario sin guardar cambios.
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext, false);
              },
              child: const Text('CANCELAR'),
            ),

            // Valida la información antes de guardar.
            TextButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Navigator.pop(dialogContext, true);
                }
              },
              child: const Text('GUARDAR'),
            ),
          ],
        );
      },
    );

    // Si el usuario guardó, actualizamos el estado.
    if (!mounted) return;

    if (guardar == true) {
      setState(() {
        _nombre = _nombreController.text.trim();
        _email = _emailController.text.trim();
        _telefono = _telefonoController.text.trim();
      });

      // Mensaje que confirma la actualización.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Perfil actualizado correctamente'),
          backgroundColor: AppTheme.primaryColor,
        ),
      );
    }
  }

  /// Construye una fila reutilizable para mostrar datos del perfil.
  Widget _filaPerfil({
    required IconData icono,
    required String etiqueta,
    required String valor,
  }) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 2,
          ),

          leading: Icon(icono, color: const Color(0xFF4B5563), size: 21),

          title: Text(
            etiqueta,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),

          trailing: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 195),
            child: Text(
              valor,
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12, color: Color(0xFF4B5563)),
            ),
          ),
        ),

        const Divider(height: 1),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior morada definida por el tema global.
      appBar: AppBar(
        title: const Text('Perfil', style: TextStyle(fontSize: 20)),
      ),

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(18),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Avatar circular con botón de edición.
                  Center(
                    child: SizedBox(
                      width: 116,
                      height: 116,
                      child: Stack(
                        children: [
                          const CircleAvatar(
                            radius: 54,
                            backgroundColor: AppTheme.lightPurple,
                            child: Icon(
                              Icons.person,
                              size: 65,
                              color: AppTheme.primaryColor,
                            ),
                          ),

                          // Botón para editar el perfil desde el avatar.
                          Positioned(
                            right: 0,
                            bottom: 8,
                            child: InkWell(
                              onTap: _editarPerfil,
                              borderRadius: BorderRadius.circular(30),
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                  color: AppTheme.primaryColor,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Nombre del usuario.
                  Text(
                    _nombre,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textColor,
                    ),
                  ),

                  const SizedBox(height: 5),

                  // Correo electrónico del usuario.
                  Text(
                    _email,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
                  ),

                  const SizedBox(height: 30),

                  // Información organizada mediante ListTile.
                  _filaPerfil(
                    icono: Icons.person,
                    etiqueta: 'Nombre',
                    valor: _nombre,
                  ),

                  _filaPerfil(
                    icono: Icons.email,
                    etiqueta: 'Email',
                    valor: _email,
                  ),

                  _filaPerfil(
                    icono: Icons.phone,
                    etiqueta: 'Teléfono',
                    valor: _telefono,
                  ),

                  _filaPerfil(
                    icono: Icons.settings,
                    etiqueta: 'Roles',
                    valor: _rol,
                  ),

                  const SizedBox(height: 22),

                  // Botón principal para modificar los datos.
                  OutlinedButton(
                    onPressed: _editarPerfil,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppTheme.primaryColor,
                      side: const BorderSide(color: AppTheme.primaryColor),
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: const Text(
                      'EDITAR PERFIL',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
