<div align="center">

# 🎓 Gestión de Alumnos

### Laboratorio de Aplicaciones Multiplataformas · Flutter & Dart

![Flutter](https://img.shields.io/badge/Flutter-3.47.6-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.13.5-0175C2?logo=dart&logoColor=white)
![Plataforma](https://img.shields.io/badge/Pruebas-Google%20Chrome-4285F4?logo=googlechrome&logoColor=white)
![Estado](https://img.shields.io/badge/Estado-Implementado-5B40CF)

**Aplicación académica para visualizar, registrar y consultar estudiantes mediante una interfaz intuitiva, adaptable y diseñada con Material Design.**

</div>

---

## 📖 Descripción del proyecto

**Gestión de Alumnos** es una aplicación desarrollada con **Flutter y Dart** para el curso de **Aplicaciones Multiplataformas**. El proyecto reproduce la **Sección A (Alumnos)** del diseño de referencia proporcionado en clase, utilizando una identidad visual morada, navegación entre pantallas y componentes reutilizables.

La finalidad del laboratorio es poner en práctica los widgets y fundamentos abordados en el curso: **`ListView`, `ListTile`, listas, mapas, rutas, tema global y `Card`**. Se implementaron interacciones locales para comprobar su funcionamiento sin depender de un servicio externo.

## 🎯 Objetivos

- Construir las cinco pantallas solicitadas respetando la referencia visual de la Sección A.
- Aplicar un **tema global** que mantenga colores y estilos coherentes.
- Organizar las opciones y registros mediante **`ListView`, `ListTile` y `Card`**.
- Representar los estudiantes con **listas, mapas y un modelo de datos**.
- Conectar las pantallas mediante **rutas y `Navigator`**.
- Incorporar formularios con validaciones y realizar pruebas funcionales.
- Mantener un historial de desarrollo progresivo mediante **Git y GitHub**.

## 🧩 Análisis y desarrollo

El trabajo comenzó con la revisión del diseño propuesto por el docente y la identificación de **cinco vistas**: Login, Menú, Listar Alumnos, Registrar Alumno y Perfil. A partir de ellas se definieron los elementos comunes (barra superior, color morado, campos, botones e iconos) y se separó la aplicación en archivos según su responsabilidad.

Primero se verificó el entorno Flutter y se ejecutó la aplicación inicial en Chrome. Luego se creó el repositorio Git, se organizaron las carpetas y se configuró el tema global con `ThemeData`. Las pantallas se implementaron progresivamente, comprobando su presentación y sus interacciones antes de continuar con la siguiente. Finalmente, se integraron el registro y el listado utilizando una colección compartida en memoria, y se añadieron las funciones de consulta y edición de perfil.

## 📱 Pantallas implementadas

| Pantalla | Características principales |
|---|---|
| **1. Login** | Correo electrónico, contraseña, mostrar/ocultar contraseña, validaciones e ingreso simulado. |
| **2. Menú principal** | Opciones Registrar Alumnos, Listar Alumnos, Perfil y Logout; confirmación al cerrar sesión. |
| **3. Listar Alumnos** | Buscador por nombre/apellido, tarjetas con nota y estado académico, y cuadro de detalles. |
| **4. Registrar Alumno** | Formulario para nombre, apellido y nota de 0 a 20; validaciones, confirmación y actualización del listado. |
| **5. Perfil** | Avatar, nombre, correo, teléfono y rol; formulario para editar datos con validaciones. |

### ✅ Reglas funcionales de la demostración

- El acceso de Login **valida el formato del correo y la longitud mínima de la contraseña**, pero **no autentica contra un servidor**.
- Las notas son **enteros de 0 a 20**. Una nota **mayor o igual a 11** corresponde a *Aprobado*; de lo contrario, a *Desaprobado*.
- Los alumnos nuevos se incorporan al listado compartido **durante la ejecución actual**.
- Los datos editados en Perfil se actualizan en la pantalla abierta, pero **no se guardan de forma permanente**.
- Las operaciones de Logout y navegación usan rutas de Flutter; **no existe una sesión real con backend**.

## 🛠️ Tecnologías y herramientas

| Herramienta | Uso |
|---|---|
| **Flutter 3.47.6** | Desarrollo de interfaces multiplataforma. |
| **Dart 3.13.5** | Lenguaje de programación y lógica de formularios. |
| **Material Design** | Componentes visuales, formularios, tarjetas y diálogos. |
| **Visual Studio Code** | Edición, ejecución y depuración del proyecto. |
| **Google Chrome** | Ejecución y verificación de la aplicación Flutter Web. |
| **Git y GitHub** | Control de versiones y publicación del código fuente. |

> Las versiones indicadas corresponden al entorno utilizado durante el desarrollo del laboratorio.

## 🗂️ Estructura del proyecto

```text
lab_alumnos/
├── lib/
│   ├── main.dart                # MaterialApp, tema global y rutas
│   ├── data/
│   │   └── alumnos_data.dart    # Datos iniciales y lista en memoria
│   ├── models/
│   │   └── alumno.dart          # Modelo Alumno y conversión a mapas
│   ├── screens/
│   │   ├── login_screen.dart
│   │   ├── menu_screen.dart
│   │   ├── alumnos_screen.dart
│   │   ├── registro_screen.dart
│   │   └── perfil_screen.dart
│   └── theme/
│       └── app_theme.dart       # Paleta morada y estilos compartidos
├── pubspec.yaml                # Configuración y dependencias
└── README.md                   # Documentación
```

Las carpetas generadas por Flutter para las distintas plataformas se conservan en el proyecto, aunque las pruebas de este laboratorio se realizaron en Chrome.

## 🧠 Conceptos de Flutter aplicados

| Concepto | Aplicación concreta |
|---|---|
| **`ListView` / `ListView.builder`** | Menú desplazable y listado dinámico de estudiantes. |
| **`ListTile`** | Opciones del menú, alumnos y filas del perfil. |
| **Listas y mapas** | Datos iniciales en `List<Map<String, dynamic>>` y transformación a objetos `Alumno`. |
| **Rutas / `Navigator`** | Transición entre las cinco pantallas y retorno al Login. |
| **`ThemeData`** | Color morado global, barras, botones, campos y tarjetas. |
| **`Card`** | Agrupación visual de elementos en el menú y listado. |
| **`StatefulWidget` y `setState`** | Visibilidad de contraseña, búsqueda, registro y edición de perfil. |
| **`Form` y `TextFormField`** | Captura y validación de información ingresada. |
| **`AlertDialog` y `SnackBar`** | Confirmaciones, detalles y mensajes al usuario. |

## 🔀 Navegación de la aplicación

```text
Login
  └── Menú principal
       ├── Registrar Alumnos ──> Guardar ──> Regresar
       ├── Listar Alumnos
       │    ├── Buscar / Ver detalles
       │    └── (+) Registrar Alumno ──> Guardar ──> Lista actualizada
       ├── Perfil ──> Editar datos
       └── Logout ──> Confirmar ──> Login
```

## ▶️ Instalación y ejecución

**Requisitos:** Flutter SDK instalado, Dart incluido en Flutter, VS Code (o IDE compatible) y Google Chrome.

1. Clonar el repositorio:

   ```bash
   git clone https://github.com/naomisanchez-coder/lab-alumnos-flutter.git
   cd lab-alumnos-flutter
   ```

2. Obtener las dependencias:

   ```bash
   flutter pub get
   ```

3. Comprobar el proyecto:

   ```bash
   flutter analyze
   ```

4. Ejecutar en Google Chrome:

   ```bash
   flutter run -d chrome
   ```

La interfaz puede probarse con una ventana de navegador estrecha para aproximarse a la presentación móvil. No se requiere conexión a una API ni configuración de base de datos.

## 🧪 Pruebas realizadas

Durante el desarrollo se verificaron manualmente las siguientes funciones:

- Acceso desde Login con validación de correo y contraseña.
- Navegación entre las opciones del Menú y confirmación de Logout.
- Visualización de los cuatro alumnos de demostración.
- Búsqueda por nombre y apellido, incluidos resultados vacíos.
- Identificación de estados Aprobado y Desaprobado según la nota.
- Consulta de detalles de alumnos mediante un cuadro de diálogo.
- Registro de estudiantes con campos obligatorios y nota válida.
- Aparición del nuevo alumno en el listado durante la misma ejecución.
- Consulta y modificación de los datos del Perfil, con validaciones y cancelación.

Se utilizó `flutter analyze` para revisar problemas estáticos del código. **Estas comprobaciones son pruebas manuales; no constituyen una suite de pruebas automatizadas.**

## 📷 Evidencias de la entrega

Las capturas del funcionamiento de las cinco pantallas y sus interacciones se incorporan en el **informe del laboratorio presentado en Canvas**. Incluyen Login, Menú, Listar Alumnos, Registrar Alumno y Perfil, junto con las validaciones y diálogos correspondientes.

## 📌 Alcance y posibles mejoras

Esta entrega se centra en el **diseño y funcionamiento local** solicitado por la rúbrica. No incluye autenticación de producción, almacenamiento persistente ni servicios backend.

Como posibles ampliaciones futuras podrían incorporarse persistencia de alumnos y perfil, autenticación real, edición/eliminación de registros y pruebas automatizadas. Estas mejoras **no forman parte de la implementación actual**.

## 👩‍💻 Autora y repositorio

Desarrollado como laboratorio académico del curso **Aplicaciones Multiplataformas**.

**GitHub:** [naomisanchez-coder](https://github.com/naomisanchez-coder)  
**Repositorio:** [lab-alumnos-flutter](https://github.com/naomisanchez-coder/lab-alumnos-flutter)

---

<div align="center">
  <strong>🎓 Proyecto académico · Flutter + Dart</strong><br>
  <em>Aprendizaje práctico de componentes, navegación y gestión de datos en interfaces multiplataforma.</em>
</div>
