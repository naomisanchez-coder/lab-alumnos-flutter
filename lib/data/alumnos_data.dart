// Archivo: alumnos_data - Proyecto Gestión de Alumnos.

import '../models/alumno.dart';

/// Lista de mapas que contiene los alumnos de demostración.
final List<Map<String, dynamic>> alumnosIniciales = [
  {'id': 1, 'nombre': 'Ana', 'apellido': 'Torres', 'nota': 18},
  {'id': 2, 'nombre': 'Luis', 'apellido': 'García', 'nota': 12},
  {'id': 3, 'nombre': 'María', 'apellido': 'López', 'nota': 9},
  {'id': 4, 'nombre': 'Carlos', 'apellido': 'Ruiz', 'nota': 15},
];

/// Convierte los mapas iniciales en objetos Alumno.
final List<Alumno> alumnosDemo = alumnosIniciales
    .map((mapa) => Alumno.fromMap(mapa))
    .toList();
