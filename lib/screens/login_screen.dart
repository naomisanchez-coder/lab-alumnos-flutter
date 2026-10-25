// Archivo: login_screen - Proyecto Gestión de Alumnos.

import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Pantalla de inicio de sesión de Gestión de Alumnos.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Permite validar todos los campos del formulario.
  final _formKey = GlobalKey<FormState>();

  // Controladores para obtener los valores ingresados.
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Controla si la contraseña permanece oculta.
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  /// Comprueba los campos antes de continuar.

  void _iniciarSesion() {
    FocusScope.of(context).unfocus();

    // Verifica que el formulario tenga datos válidos.
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Inicio de sesión simulado correctamente'),
          backgroundColor: AppTheme.primaryColor,
        ),
      );

      // Navega al menú y reemplaza la pantalla Login.
      Navigator.pushReplacementNamed(context, '/menu');

      // Posteriormente navegaremos a MenuScreen.
    }
  }

  /// Muestra un aviso informativo sin necesitar un servidor.
  void _recuperarContrasena() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Recuperación de contraseña no disponible en esta demostración.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,

      // Evita que el teclado provoque desbordamientos.
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: ConstrainedBox(
              // Mantiene un ancho similar al de un teléfono
              // incluso cuando ejecutamos Flutter en Chrome.
              constraints: const BoxConstraints(maxWidth: 380),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Ícono principal de la aplicación.
                    Center(
                      child: Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(
                          Icons.school,
                          color: Colors.white,
                          size: 43,
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    const Text(
                      'Iniciar Sesión',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textColor,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Ingresa tus credenciales para\ncontinuar',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        height: 1.4,
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Campo de correo electrónico.
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.mail_outline),
                      ),
                      validator: (value) {
                        final email = value?.trim() ?? '';

                        if (email.isEmpty) {
                          return 'Ingresa tu correo electrónico';
                        }

                        final emailValido = RegExp(
                          r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                        );

                        if (!emailValido.hasMatch(email)) {
                          return 'Ingresa un correo válido';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 16),

                    // Campo de contraseña.
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => _iniciarSesion(),
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          tooltip: _obscurePassword
                              ? 'Mostrar contraseña'
                              : 'Ocultar contraseña',
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingresa tu contraseña';
                        }

                        if (value.length < 6) {
                          return 'Debe tener al menos 6 caracteres';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 24),

                    // Botón principal de inicio de sesión.
                    ElevatedButton(
                      onPressed: _iniciarSesion,
                      child: const Text('LOGIN'),
                    ),

                    const SizedBox(height: 14),

                    // Opción informativa de recuperación.
                    TextButton(
                      onPressed: _recuperarContrasena,
                      child: const Text(
                        '¿Olvidaste tu contraseña?',
                        style: TextStyle(color: Colors.black54, fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
