
<div align="center">

# 🎓 Gestión de Alumnos

### Aplicación Multiplataforma desarrollada con Flutter y Dart

**Laboratorio de Aplicaciones Multiplataformas — Sección A**

![Flutter](https://img.shields.io/badge/Flutter-3.47.6-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.13.5-0175C2?logo=dart&logoColor=white)
![VS Code](https://img.shields.io/badge/VS_Code-IDE-007ACC?logo=visualstudiocode&logoColor=white)
![Git](https://img.shields.io/badge/Git-Control_de_Versiones-F05032?logo=git&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-Repositorio-181717?logo=github&logoColor=white)

**Una aplicación académica para gestionar estudiantes mediante una interfaz intuitiva, organizada y funcional.**

</div>

---

## 📖 1. Descripción del proyecto

**Gestión de Alumnos** es una aplicación desarrollada con Flutter y Dart como parte del laboratorio del curso de Aplicaciones Multiplataformas.

El proyecto consiste en implementar una interfaz de gestión académica que permite visualizar información de estudiantes, registrar nuevos alumnos, consultar sus calificaciones y administrar los datos de un perfil de usuario.

El desarrollo se realizó tomando como referencia el diseño de la **Sección A** proporcionado por el docente, respetando la estructura visual, los componentes principales y la identidad gráfica basada en el color morado.

Además del diseño, se incorporaron funcionalidades básicas que permiten demostrar el uso de componentes visuales, estructuras de datos, validaciones, navegación y gestión de estados en Flutter.

El proyecto se ejecutó y verificó principalmente mediante Google Chrome, utilizando Visual Studio Code desde macOS.

---

## 🎯 2. Objetivos del laboratorio

### Objetivo general

Desarrollar una aplicación multiplataforma utilizando Flutter y Dart, aplicando componentes de interfaz gráfica, estructuras de datos y mecanismos de navegación para implementar un sistema básico de Gestión de Alumnos.

### Objetivos específicos

- Comprender y aplicar los componentes `ListView`, `ListTile` y `Card`.
- Implementar listas y mapas para organizar la información de estudiantes.
- Configurar rutas para navegar entre las diferentes pantallas.
- Utilizar un tema global para mantener una apariencia uniforme.
- Desarrollar formularios con validaciones de datos.
- Implementar funcionalidades de búsqueda y registro de alumnos.
- Aplicar `StatefulWidget` y `setState()` para actualizar interfaces.
- Organizar el código en diferentes carpetas y archivos.
- Utilizar Git y GitHub para registrar los avances del proyecto.
- Documentar y verificar el funcionamiento de las pantallas desarrolladas.

---

## 🛠️ 3. Tecnologías y herramientas utilizadas

| Tecnología | Descripción |
|------------|-------------|
| Flutter | Framework utilizado para desarrollar la interfaz multiplataforma. |
| Dart | Lenguaje de programación utilizado en la aplicación. |
| Visual Studio Code | Entorno de desarrollo utilizado para implementar y organizar el código. |
| Google Chrome | Navegador utilizado para ejecutar y comprobar la aplicación Flutter Web. |
| Git | Herramienta de control de versiones para registrar los avances. |
| GitHub | Plataforma utilizada para almacenar y compartir el repositorio. |
| macOS | Sistema operativo utilizado durante el desarrollo. |
| Material Design | Sistema de componentes visuales utilizado para construir la interfaz. |

### Versiones del entorno

- Flutter: 3.47.6
- Dart: 3.13.5
- IDE: Visual Studio Code
- Sistema operativo: macOS
- Plataforma de pruebas: Google Chrome

---

## 🎨 4. Análisis del diseño

Antes de implementar la aplicación, se analizó la referencia visual proporcionada por el docente.

La actividad presentaba dos propuestas:

- **Sección A:** Gestión de Alumnos.
- **Sección B:** Gestión de Productos.

Para este laboratorio se trabajó exclusivamente con la **Sección A**, correspondiente al sistema de Gestión de Alumnos.

### Características identificadas

- Diseño limpio y sencillo.
- Color morado como identidad visual principal.
- Pantallas organizadas mediante componentes reutilizables.
- Formularios con campos claramente identificados.
- Navegación entre diferentes vistas.
- Listado de estudiantes con calificaciones.
- Etiquetas visuales para distinguir los estados académicos.
- Pantalla de perfil con información del usuario.

### Paleta de colores

| Elemento | Color hexadecimal |
|----------|-------------------|
| Morado principal | `#5B40CF` |
| Morado suave | `#F0EBFF` |
| Fondo principal | `#FFFFFF` |
| Texto oscuro | `#263044` |

Estos colores fueron centralizados mediante la clase `AppTheme`, permitiendo mantener una identidad visual consistente en todas las pantallas.

---

## 📱 5. Pantallas desarrolladas

La aplicación está compuesta por cinco pantallas principales.

### 🔐 5.1. Inicio de Sesión — Login

Esta pantalla representa el punto de acceso inicial a la aplicación.

**Características:**

- Ícono académico representado mediante un birrete.
- Campo para ingresar el correo electrónico.
- Campo para ingresar la contraseña.
- Opción para mostrar y ocultar la contraseña.
- Validación de campos obligatorios.
- Validación del formato del correo electrónico.
- Validación de la longitud mínima de la contraseña.
- Botón LOGIN.
- Mensaje informativo de recuperación de contraseña.
- Navegación hacia el menú principal.

**Componentes utilizados:**

`StatefulWidget`, `Form`, `TextFormField`, `TextEditingController`, `ElevatedButton`, `IconButton`, `SnackBar` y `Navigator`.

**Funcionamiento:**

El usuario ingresa un correo electrónico con formato válido y una contraseña de al menos seis caracteres. Cuando la información cumple las validaciones, la aplicación realiza un inicio de sesión simulado y permite acceder al menú principal.

> Nota: El inicio de sesión es demostrativo. No se implementó autenticación real mediante servidor o base de datos.

### 📋 5.2. Menú Principal

El menú permite acceder a las principales funcionalidades de Gestión de Alumnos.

**Opciones disponibles:**

1. Registrar Alumnos.
2. Listar Alumnos.
3. Perfil.
4. Logout.

**Componentes utilizados:**

`Scaffold`, `AppBar`, `ListView`, `ListTile`, `Card`, `Icon`, `Navigator` y `AlertDialog`.

**Funcionamiento:**

Las opciones del menú se presentan mediante elementos organizados verticalmente. Cada opción permite navegar hacia la pantalla correspondiente.

La opción Logout muestra un cuadro de confirmación antes de regresar al Login.

Se utilizó un método reutilizable para construir las opciones del menú, evitando repetir innecesariamente el código de los componentes.

### 👥 5.3. Listar Alumnos

Esta pantalla muestra los estudiantes registrados y sus respectivas calificaciones.

**Características:**

- Listado dinámico de estudiantes.
- Buscador por nombre o apellido.
- Avatar académico para cada alumno.
- Visualización de la calificación.
- Estado académico automático.
- Etiquetas verdes para alumnos aprobados.
- Etiquetas rojas para alumnos desaprobados.
- Menú de opciones para consultar información.
- Botón para acceder al registro de alumnos.

**Datos iniciales:**

| Alumno | Nota | Estado |
|--------|------|--------|
| Ana Torres | 18 | Aprobado |
| Luis García | 12 | Aprobado |
| María López | 09 | Desaprobado |
| Carlos Ruiz | 15 | Aprobado |

**Componentes utilizados:**

`ListView.builder`, `ListTile`, `Card`, `CircleAvatar`, `TextField`, `PopupMenuButton`, `AlertDialog` y `setState()`.

**Funcionamiento:**

Los estudiantes se presentan dinámicamente mediante `ListView.builder`, utilizando una lista de objetos del modelo `Alumno`.

El buscador permite filtrar los registros por nombre o apellido. Al seleccionar un estudiante, se muestra un cuadro de diálogo con sus datos.

El estado académico se determina automáticamente según la calificación:

- **Aprobado:** nota mayor o igual a 11.
- **Desaprobado:** nota menor a 11.

### 📝 5.4. Registrar Alumno

Esta pantalla permite agregar estudiantes mediante un formulario.

**Campos implementados:**

- Nombre del alumno.
- Apellido del alumno.
- Nota entre 0 y 20.

**Validaciones:**

- Los campos son obligatorios.
- El nombre y apellido deben tener al menos dos caracteres.
- No se admiten números en los campos de nombre y apellido.
- La nota debe ser un número entero.
- La calificación debe encontrarse entre 0 y 20.

**Componentes utilizados:**

`StatefulWidget`, `Form`, `TextFormField`, `TextEditingController`, `FilteringTextInputFormatter`, `ElevatedButton`, `AlertDialog` y `Navigator`.

**Funcionamiento:**

Al presionar GUARDAR, la aplicación verifica que la información ingresada sea válida.

Si los datos son correctos, se crea un nuevo objeto de tipo `Alumno` y se agrega a la lista local de estudiantes.

Posteriormente, aparece un mensaje de confirmación y el usuario puede regresar al listado para visualizar el registro agregado.

El estado de aprobación se calcula automáticamente a partir de la nota.

### 👤 5.5. Perfil de Usuario

Esta pantalla presenta la información de un usuario de demostración.

**Información mostrada:**

- Nombre completo.
- Correo electrónico.
- Teléfono.
- Rol del usuario.

**Características:**

- Avatar circular.
- Botón de edición sobre el avatar.
- Información organizada mediante `ListTile`.
- Botón EDITAR PERFIL.
- Formulario para modificar nombre, correo y teléfono.
- Validaciones de datos.
- Confirmación visual al guardar cambios.

**Componentes utilizados:**

`StatefulWidget`, `CircleAvatar`, `Stack`, `Positioned`, `ListTile`, `OutlinedButton`, `AlertDialog`, `TextFormField` y `setState()`.

**Funcionamiento:**

Al seleccionar EDITAR PERFIL, se abre un formulario con los datos actuales del usuario.

Los campos pueden modificarse y validarse antes de guardar. Cuando la información es correcta, los cambios se reflejan inmediatamente en la pantalla.

El rol se mantiene como un valor fijo de demostración.

> Nota: Las modificaciones del perfil se conservan mientras la pantalla permanece activa. No se implementó persistencia permanente.

---

## 🧩 6. Conceptos de Flutter aplicados

### 6.1. ListView

Se utilizó para organizar elementos verticalmente y permitir el desplazamiento cuando el contenido supera el espacio disponible.

Su aplicación principal se encuentra en el Menú Principal y el listado de estudiantes.

### 6.2. ListTile

Permitió representar información mediante filas que incluyen íconos, títulos, subtítulos y acciones.

Se utilizó en las opciones del menú, los registros de alumnos y la información del perfil.

### 6.3. Listas y mapas

Los datos iniciales se organizaron mediante una lista de mapas:

```dart
final List<Map<String, dynamic>> alumnosIniciales = [
  {
    'id': 1,
    'nombre': 'Ana',
    'apellido': 'Torres',
    'nota': 18,
  },
];
```

Posteriormente, estos datos fueron transformados en objetos del modelo `Alumno`.

Este procedimiento permitió comprender cómo organizar y manipular información estructurada utilizando Dart.

### 6.4. Rutas y navegación

Se implementó navegación mediante `Navigator` y las rutas configuradas en `MaterialApp`.

Las rutas principales son:

| Ruta | Pantalla |
|------|----------|
| `/` | Login |
| `/menu` | Menú Principal |
| `/alumnos` | Listar Alumnos |
| `/registro` | Registrar Alumno |
| `/perfil` | Perfil |

La navegación permite acceder a las funcionalidades desde el menú y regresar a las pantallas anteriores.

### 6.5. Tema Global

Se implementó un archivo llamado `app_theme.dart` que centraliza los estilos generales de la aplicación.

Mediante `ThemeData` se configuraron:

- Colores principales.
- Estilos de botones.
- Barras superiores.
- Campos de texto.
- Tarjetas.
- Tipografía.

Esto permitió mantener una presentación uniforme y facilitar futuras modificaciones.

### 6.6. Cards

Los componentes `Card` permitieron organizar visualmente las opciones y registros dentro de la aplicación.

Su utilización contribuyó a mantener una interfaz ordenada y fácil de comprender.

### 6.7. Gestión de estados

Se utilizó `StatefulWidget` y `setState()` para actualizar información en determinadas pantallas.

Sus principales aplicaciones fueron:

- Mostrar u ocultar contraseñas.
- Filtrar alumnos mediante el buscador.
- Actualizar la lista después del registro.
- Modificar la información del perfil.

---

## 🏗️ 7. Estructura del proyecto

El código fue organizado en carpetas para facilitar su mantenimiento y comprensión.

```text
lab_alumnos/
│
├── lib/
│   │
│   ├── main.dart
│   │
│   ├── screens/
│   │   ├── login_screen.dart
│   │   ├── menu_screen.dart
│   │   ├── alumnos_screen.dart
│   │   ├── registro_screen.dart
│   │   └── perfil_screen.dart
│   │
│   ├── models/
│   │   └── alumno.dart
│   │
│   ├── data/
│   │   └── alumnos_data.dart
│   │
│   └── theme/
│       └── app_theme.dart
│
├── android/
├── ios/
├── web/
├── macos/
├── test/
│
├── pubspec.yaml
├── .gitignore
└── README.md
```

### Descripción de las carpetas

| Carpeta o archivo | Responsabilidad |
|-------------------|-----------------|
| `main.dart` | Inicializa la aplicación y configura las rutas. |
| `screens/` | Contiene las cinco pantallas principales. |
| `models/` | Define la estructura del modelo Alumno. |
| `data/` | Almacena los datos locales de demostración. |
| `theme/` | Contiene la configuración visual global. |
| `pubspec.yaml` | Administra la configuración y dependencias de Flutter. |
| `README.md` | Documenta el desarrollo y funcionamiento del proyecto. |

Esta organización permite separar las responsabilidades del código y facilita la incorporación de nuevas funcionalidades.

---

## 🔄 8. Flujo general de la aplicación

```text
                  INICIO
                    │
                    ▼
             ┌─────────────┐
             │    LOGIN    │
             └─────────────┘
                    │
             Validar datos
                    │
                    ▼
             ┌─────────────┐
             │    MENÚ     │
             └─────────────┘
                    │
          ┌─────────┼─────────┐
          │         │         │
          ▼         ▼         ▼
      REGISTRAR   LISTAR    PERFIL
       ALUMNO     ALUMNOS
          │         ▲         │
          │         │         │
          └─────────┘         ▼
        Guardar datos    Editar perfil

                    MENÚ
                      │
                      ▼
                    LOGOUT
                      │
                      ▼
                    LOGIN
```

La aplicación inicia mostrando el formulario de acceso.

Después de validar los datos, el usuario puede ingresar al Menú Principal y acceder a las diferentes funcionalidades.

Los registros de alumnos se comparten mediante una lista local, permitiendo visualizar nuevos estudiantes durante la ejecución de la aplicación.

---

## ✅ 9. Pruebas realizadas

Durante el desarrollo se verificó progresivamente cada pantalla.

| Pantalla | Pruebas funcionales |
|----------|---------------------|
| Login | Validación de correo y contraseña, visualización de contraseña y navegación. |
| Menú | Acceso a las opciones, navegación y confirmación de Logout. |
| Listar Alumnos | Visualización, búsqueda, estados académicos y detalles. |
| Registrar Alumno | Campos obligatorios, validación de notas y registro de estudiantes. |
| Perfil | Visualización, edición, validación y cancelación de cambios. |

También se utilizó el comando:

```bash
flutter analyze
```

Esta herramienta permite identificar errores y advertencias en el código fuente.

Los problemas encontrados durante la implementación fueron corregidos antes de continuar con el desarrollo.

---

## 💻 10. Instalación y ejecución

### Requisitos

Para ejecutar el proyecto se recomienda contar con:

- Flutter SDK.
- Dart SDK.
- Visual Studio Code o Android Studio.
- Extensiones de Flutter y Dart.
- Google Chrome para ejecución web.
- Git para clonar el repositorio.

### Paso 1. Clonar el repositorio

```bash
git clone https://github.com/naomisanchez-coder/lab-alumnos-flutter.git
```

### Paso 2. Ingresar al proyecto

```bash
cd lab-alumnos-flutter
```

### Paso 3. Instalar las dependencias

```bash
flutter pub get
```

### Paso 4. Comprobar el entorno

```bash
flutter doctor
```

### Paso 5. Ejecutar en Google Chrome

```bash
flutter run -d chrome
```

### Paso 6. Analizar el código

```bash
flutter analyze
```

La aplicación puede ejecutarse desde Visual Studio Code utilizando la terminal integrada.

---

## 📌 11. Alcance y limitaciones

El proyecto tiene un enfoque académico y fue desarrollado para demostrar los conocimientos solicitados en el laboratorio.

### Funcionalidades implementadas

- Navegación entre cinco pantallas.
- Inicio de sesión simulado.
- Validación de formularios.
- Listado dinámico de estudiantes.
- Búsqueda de alumnos.
- Registro de nuevos estudiantes.
- Cálculo automático del estado académico.
- Visualización de detalles.
- Edición local del perfil.

### Limitaciones

- No se implementó una base de datos.
- No se utilizó Firebase.
- No existe autenticación real mediante servidor.
- Los estudiantes agregados se almacenan únicamente en memoria.
- La información registrada no se conserva después de reiniciar completamente la aplicación.
- Los datos editados del perfil no cuentan con almacenamiento permanente.
- La recuperación de contraseña es únicamente informativa.

Estas limitaciones corresponden al alcance establecido para el laboratorio, enfocado principalmente en la construcción de interfaces y el uso de componentes Flutter.

---

## 📚 12. Aprendizajes obtenidos

Durante este laboratorio se reforzaron conocimientos relacionados con:

- Desarrollo multiplataforma mediante Flutter.
- Programación utilizando Dart.
- Creación de interfaces con Material Design.
- Uso de widgets reutilizables.
- Manejo de listas y mapas.
- Organización del código por responsabilidades.
- Gestión de estados e interacciones.
- Validación de formularios.
- Navegación entre pantallas.
- Resolución de errores mediante herramientas de análisis.
- Control de versiones utilizando Git y GitHub.
- Documentación técnica de proyectos de software.

---

## 🔧 13. Control de versiones

Durante el desarrollo se utilizó Git para registrar progresivamente los avances de la aplicación.

Los commits se organizaron de acuerdo con las etapas de implementación:

1. Inicialización del proyecto Flutter.
2. Configuración de la estructura de carpetas.
3. Implementación del tema global morado.
4. Desarrollo de la pantalla Login.
5. Implementación del Menú Principal.
6. Desarrollo del listado y búsqueda de alumnos.
7. Implementación del formulario de registro.
8. Desarrollo del perfil editable y correcciones.
9. Documentación final del proyecto.

Este proceso permitió mantener un historial organizado y facilitar la identificación de los cambios realizados.

---

## 📸 14. Evidencias del laboratorio

Las evidencias del funcionamiento de la aplicación fueron registradas mediante capturas de pantalla durante las diferentes etapas de implementación.

Se documentaron las siguientes vistas:

1. Inicio de Sesión.
2. Menú Principal.
3. Listar Alumnos.
4. Registrar Alumno.
5. Perfil de Usuario.

También se realizaron pruebas sobre:

- Validaciones del Login.
- Confirmación de cierre de sesión.
- Consulta de detalles de alumnos.
- Registro de estudiantes.
- Validaciones de calificación.
- Edición del perfil.

Las capturas y los resultados correspondientes se encuentran documentados en el informe del laboratorio.

---

## 🚀 15. Posibles mejoras futuras

Aunque el proyecto cumple con el alcance académico establecido, se podrían incorporar mejoras adicionales en futuras versiones:

- Integración con Firebase o una base de datos.
- Autenticación real de usuarios.
- Persistencia de estudiantes registrados.
- Edición y eliminación de alumnos.
- Filtros por estado académico.
- Estadísticas de calificaciones.
- Gestión de diferentes roles.
- Almacenamiento permanente de los datos del perfil.
- Adaptaciones adicionales para distintos tamaños de pantalla.

Estas mejoras permitirían ampliar la aplicación hacia un sistema de gestión académica más completo.

---

## 👩‍💻 16. Autoría

**Proyecto académico:** Gestión de Alumnos

**Curso:** Aplicaciones Multiplataformas

**Tecnologías:** Flutter y Dart

**Desarrollo:** Naomi Sánchez Chavarría

**GitHub:** [naomisanchez-coder](https://github.com/naomisanchez-coder)

**Repositorio:** [lab-alumnos-flutter](https://github.com/naomisanchez-coder/lab-alumnos-flutter)

---

<div align="center">

### 💜 Gestión de Alumnos — Flutter

**Proyecto desarrollado con fines académicos para fortalecer el aprendizaje de interfaces multiplataforma, estructuras de datos y navegación en Flutter.**

*Desarrollado con dedicación, organización y aprendizaje continuo.*

</div>
