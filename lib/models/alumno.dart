// Archivo: alumno - Proyecto Gestión de Alumnos.

/// Modelo que representa la información de un alumno.
class Alumno {
  final int id;
  final String nombre;
  final String apellido;
  final int nota;

  Alumno({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.nota,
  });

  /// Devuelve el nombre completo del estudiante.
  String get nombreCompleto => '$nombre $apellido';

  /// Determina el estado académico según la nota.
  bool get aprobado => nota >= 11;

  /// Convierte la información del alumno en un mapa.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'apellido': apellido,
      'nota': nota,
      'aprobado': aprobado,
    };
  }

  /// Permite crear un alumno a partir de un mapa.
  factory Alumno.fromMap(Map<String, dynamic> mapa) {
    return Alumno(
      id: mapa['id'] as int,
      nombre: mapa['nombre'] as String,
      apellido: mapa['apellido'] as String,
      nota: mapa['nota'] as int,
    );
  }
}
