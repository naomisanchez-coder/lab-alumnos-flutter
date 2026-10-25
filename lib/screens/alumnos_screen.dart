// Archivo: alumnos_screen - Proyecto Gestión de Alumnos.

import 'package:flutter/material.dart';

import '../data/alumnos_data.dart';
import '../models/alumno.dart';
import '../theme/app_theme.dart';

/// Pantalla que muestra y permite buscar alumnos registrados.
class AlumnosScreen extends StatefulWidget {
  const AlumnosScreen({super.key});

  @override
  State<AlumnosScreen> createState() => _AlumnosScreenState();
}

class _AlumnosScreenState extends State<AlumnosScreen> {
  final TextEditingController _busquedaController = TextEditingController();

  String _textoBusqueda = '';

  @override
  void dispose() {
    _busquedaController.dispose();
    super.dispose();
  }

  /// Filtra los alumnos según el texto ingresado.
  List<Alumno> get _alumnosFiltrados {
    final busqueda = _textoBusqueda.trim().toLowerCase();

    return alumnosDemo.where((alumno) {
      return alumno.nombreCompleto.toLowerCase().contains(busqueda);
    }).toList();
  }

  /// Abre la ruta de registro.
  /// Más adelante conectaremos esta vista al formulario real.
  Future<void> _irARegistro() async {
    await Navigator.pushNamed(context, '/registro');

    if (!mounted) return;

    // Actualiza el listado cuando regresamos del registro.
    setState(() {});
  }

  /// Muestra los detalles del estudiante seleccionado.
  void _mostrarDetalles(Alumno alumno) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Detalle del alumno'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nombre: ${alumno.nombreCompleto}'),
              const SizedBox(height: 10),
              Text('Nota: ${alumno.nota.toString().padLeft(2, '0')}'),
              const SizedBox(height: 10),
              Text('Estado: ${alumno.aprobado ? "Aprobado" : "Desaprobado"}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('CERRAR'),
            ),
          ],
        );
      },
    );
  }

  /// Construye la etiqueta verde o roja del estado académico.
  Widget _estadoAlumno(Alumno alumno) {
    final aprobado = alumno.aprobado;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
        color: aprobado ? const Color(0xFFE2F7E8) : const Color(0xFFFFE5E5),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: aprobado ? const Color(0xFF67C483) : const Color(0xFFE46A6A),
        ),
      ),
      child: Text(
        aprobado ? 'Aprobado' : 'Desaprobado',
        style: TextStyle(
          color: aprobado ? const Color(0xFF187A38) : const Color(0xFFB3261E),
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// Crea una tarjeta reutilizable para cada alumno.
  Widget _tarjetaAlumno(Alumno alumno) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 3),
      color: Colors.white,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),

        // Avatar del estudiante.
        leading: const CircleAvatar(
          radius: 22,
          backgroundColor: AppTheme.lightPurple,
          child: Icon(Icons.school, color: AppTheme.primaryColor),
        ),

        // Nombre y nota.
        title: Text(
          alumno.nombreCompleto,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppTheme.textColor,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            'Nota: ${alumno.nota.toString().padLeft(2, '0')}',
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ),

        // Estado académico y menú de opciones.
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _estadoAlumno(alumno),
            PopupMenuButton<String>(
              tooltip: 'Opciones del alumno',
              icon: const Icon(Icons.more_vert, color: Colors.black54),
              onSelected: (opcion) {
                if (opcion == 'detalle') {
                  _mostrarDetalles(alumno);
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem<String>(
                  value: 'detalle',
                  child: Row(
                    children: [
                      Icon(Icons.info_outline, size: 20),
                      SizedBox(width: 10),
                      Text('Ver detalles'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        onTap: () => _mostrarDetalles(alumno),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final alumnos = _alumnosFiltrados;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Alumnos', style: TextStyle(fontSize: 20)),
        actions: [
          IconButton(
            tooltip: 'Registrar alumno',
            icon: const Icon(Icons.add),
            onPressed: _irARegistro,
          ),
        ],
      ),

      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            children: [
              // Campo para buscar alumnos por nombre o apellido.
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 12),
                child: TextField(
                  controller: _busquedaController,
                  onChanged: (valor) {
                    setState(() {
                      _textoBusqueda = valor;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Buscar alumno...',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: const Color(0xFFF5F5F7),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: _textoBusqueda.isNotEmpty
                        ? IconButton(
                            tooltip: 'Limpiar búsqueda',
                            icon: const Icon(Icons.close),
                            onPressed: () {
                              _busquedaController.clear();
                              setState(() {
                                _textoBusqueda = '';
                              });
                            },
                          )
                        : null,
                  ),
                ),
              ),

              // ListView.builder genera los alumnos dinámicamente.
              Expanded(
                child: alumnos.isEmpty
                    ? const Center(
                        child: Text(
                          'No se encontraron alumnos',
                          style: TextStyle(color: Colors.black54, fontSize: 15),
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        itemCount: alumnos.length,
                        itemBuilder: (context, index) {
                          final alumno = alumnos[index];
                          return _tarjetaAlumno(alumno);
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
