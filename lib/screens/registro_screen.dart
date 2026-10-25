// Archivo: registro_screen - Proyecto Gestión de Alumnos.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/alumnos_data.dart';
import '../models/alumno.dart';
import '../theme/app_theme.dart';

/// Pantalla para registrar nuevos alumnos.
class RegistroScreen extends StatefulWidget {
  const RegistroScreen({super.key});

  @override
  State<RegistroScreen> createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  // Identificador que permite validar el formulario.
  final _formKey = GlobalKey<FormState>();

  // Controladores para obtener los datos ingresados.
  final _nombreController = TextEditingController();
  final _apellidoController = TextEditingController();
  final _notaController = TextEditingController();

  @override
  void dispose() {
    _nombreController.dispose();
    _apellidoController.dispose();
    _notaController.dispose();
    super.dispose();
  }

  /// Valida nombres y apellidos.
  String? _validarTexto(String? value, String campo) {
    final texto = value?.trim() ?? '';

    if (texto.isEmpty) {
      return 'Ingresa el $campo';
    }

    if (texto.length < 2) {
      return 'Debe tener al menos 2 caracteres';
    }

    if (!RegExp(r"^[a-zA-ZáéíóúÁÉÍÓÚñÑüÜ\s'-]+$").hasMatch(texto)) {
      return 'Ingresa un $campo válido';
    }

    return null;
  }

  /// Comprueba que la calificación esté entre 0 y 20.
  String? _validarNota(String? value) {
    final texto = value?.trim() ?? '';

    if (texto.isEmpty) {
      return 'Ingresa la nota del alumno';
    }

    final nota = int.tryParse(texto);

    if (nota == null) {
      return 'Ingresa un número válido';
    }

    if (nota < 0 || nota > 20) {
      return 'La nota debe estar entre 0 y 20';
    }

    return null;
  }

  /// Registra un alumno en la lista local.
  Future<void> _guardarAlumno() async {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    final nombre = _nombreController.text.trim();
    final apellido = _apellidoController.text.trim();
    final nota = int.parse(_notaController.text.trim());

    // Genera un identificador nuevo para cada estudiante.
    final nuevoId =
        alumnosDemo.fold<int>(
          0,
          (maximo, alumno) => alumno.id > maximo ? alumno.id : maximo,
        ) +
        1;

    final nuevoAlumno = Alumno(
      id: nuevoId,
      nombre: nombre,
      apellido: apellido,
      nota: nota,
    );

    // Agregamos el alumno a la lista compartida en memoria.
    alumnosDemo.add(nuevoAlumno);

    // Mensaje de confirmación.
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Row(
            children: [
              Icon(Icons.check_circle, color: Color(0xFF18833E)),
              SizedBox(width: 10),
              Expanded(
                child: Text('Registro exitoso', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
          content: Text(
            '$nombre $apellido fue registrado correctamente.\n\n'
            'Nota: ${nota.toString().padLeft(2, '0')}\n'
            'Estado: ${nuevoAlumno.aprobado ? "Aprobado" : "Desaprobado"}',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('ACEPTAR'),
            ),
          ],
        );
      },
    );

    if (!mounted) return;

    // Regresa a la pantalla anterior indicando éxito.
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Alumno', style: TextStyle(fontSize: 20)),
      ),

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(18),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),

              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Campo: Nombre del alumno.
                    TextFormField(
                      controller: _nombreController,
                      textCapitalization: TextCapitalization.words,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        hintText: 'Nombre del alumno',
                      ),
                      validator: (value) => _validarTexto(value, 'nombre'),
                    ),

                    const SizedBox(height: 16),

                    // Campo: Apellido del alumno.
                    TextFormField(
                      controller: _apellidoController,
                      textCapitalization: TextCapitalization.words,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(hintText: 'Apellido'),
                      validator: (value) => _validarTexto(value, 'apellido'),
                    ),

                    const SizedBox(height: 16),

                    // Campo: Nota entre 0 y 20.
                    TextFormField(
                      controller: _notaController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,

                      // Solo permite escribir números enteros.
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],

                      decoration: const InputDecoration(
                        hintText: 'Nota (0 - 20)',
                        suffixIcon: Icon(Icons.school_outlined),
                      ),

                      validator: _validarNota,

                      onFieldSubmitted: (_) => _guardarAlumno(),
                    ),

                    const SizedBox(height: 24),

                    // Botón para validar y registrar el alumno.
                    ElevatedButton(
                      onPressed: _guardarAlumno,
                      child: const Text('GUARDAR'),
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
