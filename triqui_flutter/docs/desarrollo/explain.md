# 📖 Guía Completa - Entendiendo Flutter y el Proyecto

## 📂 Estructura del Proyecto

```
triqui_flutter/
├── android/                    # Código nativo de Android
│   ├── app/
│   │   ├── src/
│   │   │   └── main/
│   │   │       ├── AndroidManifest.xml  # Configuración de la app Android
│   │   │       ├── kotlin/              # Código nativo (si lo necesitas)
│   │   │       └── res/                 # Recursos (íconos, colores)
│   │   └── build.gradle                 # Configuración de compilación
│   └── gradle/                          # Sistema de compilación de Android
│
├── ios/                        # Código nativo de iOS (para Mac)
│   ├── Runner/
│   │   ├── Info.plist                   # Configuración de la app iOS
│   │   └── Assets.xcassets/             # Recursos iOS
│   └── Runner.xcodeproj/                # Proyecto Xcode
│
├── lib/                        # TU CÓDIGO DART (LO MÁS IMPORTANTE)
│   └── main.dart                        # Punto de entrada de la app
│
├── test/                       # Pruebas unitarias (tests)
│   └── widget_test.dart
│
├── web/                        # Soporte para web (Flutter Web)
│   ├── index.html
│   └── favicon.png
│
├── windows/                    # Soporte para Windows
│   └── ...
│
├── linux/                      # Soporte para Linux
│   └── ...
│
├── macos/                      # Soporte para macOS
│   └── ...
│
├── docs/                       # DOCUMENTACIÓN (que estás leyendo)
│   ├── plan.md                          # Plan del proyecto
│   └── explain.md                       # Este archivo
│
├── .gitignore                  # Archivos que Git debe ignorar
├── pubspec.yaml                # ARCHIVO DE CONFIGURACIÓN PRINCIPAL
├── pubspec.lock                # Versiones exactas de dependencias
├── README.md                   # Documentación principal
└── triqui_flutter.iml          # Configuración de IntelliJ/Android Studio
```

---

## 🎯 Carpetas Más Importantes

### 1. `lib/` - Tu Código
**Esta es la carpeta donde pasarás el 90% de tu tiempo.**

- Contiene todo tu código Dart
- `main.dart` es el punto de entrada
- Aquí defines la UI, la lógica, las pantallas

**Ejemplo de organización típica (para proyectos más grandes):**
```
lib/
├── main.dart
├── screens/           # Pantallas de la app
│   ├── home.dart
│   └── game.dart
├── widgets/           # Componentes reutilizables
│   ├── button.dart
│   └── card.dart
├── models/            # Clases de datos
│   └── player.dart
└── services/          # Lógica de negocio
    └── game_logic.dart
```

### 2. `pubspec.yaml` - Configuración
**El archivo más importante después de tu código.**

Define:
- Nombre de la app
- Versión
- Dependencias (paquetes externos)
- Recursos (imágenes, fuentes)

### 3. `android/` - Código Nativo Android
- Flutter genera código Android automáticamente
- Solo necesitas modificarlo para configuraciones específicas
- Ejemplo: Cambiar nombre de la app, permisos, ícono

### 4. `ios/` - Código Nativo iOS
- Similar a `android/` pero para iPhone/iPad
- Solo lo usarás si compilas para iOS (necesitas Mac)

---

## 📱 ¿Cómo Funciona Flutter?

### Concepto General

```
Tu Código Dart (lib/main.dart)
        ↓
Flutter Framework (widgets, rendering)
        ↓
Flutter Engine (C++)
        ↓
Platform-Specific Code (Android/iOS)
        ↓
Dispositivo (teléfono, tablet, emulador)
```

### Flujo de Ejecución

1. **Escribes código Dart** en `lib/main.dart`
2. **Flutter compila** tu código
3. **Se genera un ejecutable nativo** (APK para Android, IPA para iOS)
4. **Se instala y ejecuta** en el dispositivo

---

## 🔑 Conceptos Clave

### 1. SDK (Software Development Kit)

**¿Qué es un SDK?**
- Un conjunto de herramientas para desarrollar software
- Incluye compiladores, librerías, documentación, herramientas

**Flutter SDK incluye:**
- Compilador de Dart
- Framework de Flutter (widgets, rendering)
- Herramientas de línea de comandos (`flutter`)
- DevTools (herramientas de depuración)
- Documentación

**Android SDK incluye:**
- Herramientas para compilar apps Android
- Emuladores
- Platform tools (adb, fastboot)
- Librerías de Android

### 2. Dart (El Lenguaje)

**¿Qué es Dart?**
- Lenguaje de programación creado por Google (2011)
- Diseñado para interfaces de usuario
- Tipado estático (como TypeScript)
- Se compila a código nativo (muy rápido)

**Características:**
```dart
// Tipado estático
String nombre = "Juan";
int edad = 25;
List<String> frutas = ['manzana', 'pera'];

// Funciones con tipos
int sumar(int a, int b) {
  return a + b;
}

// Clases
class Persona {
  String nombre;
  int edad;
  
  Persona(this.nombre, this.edad);
  
  void saludar() {
    print('Hola, soy $nombre');
  }
}
```

### 3. Flutter (El Framework)

**¿Qué es Flutter?**
- Framework para crear apps multiplataforma
- Un solo código → Android, iOS, Web, Windows, Linux, macOS
- Usa Dart como lenguaje
- Renderiza su propia UI (no usa componentes nativos)

**Ventajas:**
- ✅ Desarrollo rápido con Hot Reload
- ✅ UI consistente en todas las plataformas
- ✅ Rendimiento nativo (60fps)
- ✅ Gran comunidad y documentación
- ✅ Gratis y open source

**Desventajas:**
- ❌ Apps más pesadas que nativas
- ❌ Menos adopción que React Native (pero creciendo)
- ❌ Acceso limitado a APIs específicas de plataforma

### 4. Widget (Componente Visual)

**TODO en Flutter es un Widget.**

```dart
// Widget sin estado (no cambia)
class MiWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Hola');
  }
}

// Widget con estado (puede cambiar)
class Contador extends StatefulWidget {
  @override
  _ContadorState createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {
  int numero = 0;
  
  @override
  Widget build(BuildContext context) {
    return Text('Contador: $numero');
  }
}
```

**Tipos de Widgets:**
- **Layout**: Column, Row, Container, Stack
- **Interacción**: Button, GestureDetector, TextField
- **Visualización**: Text, Image, Icon
- **Material**: AppBar, Card, Dialog (estilo Android)
- **Cupertino**: CupertinoButton, CupertinoSwitch (estilo iOS)

### 5. State (Estado)

**¿Qué es el Estado?**
- Datos que pueden cambiar con el tiempo
- Cuando el estado cambia, Flutter redibuja la UI

**Ejemplo en tu juego:**
```dart
// Estado del juego
List<String> tablero = ['', '', '', ...];  // Cambia cada jugada
String jugadorActual = 'X';                // Cambia cada turno
bool juegoActivo = true;                   // Cambia al terminar

// Cuando cambias el estado:
setState(() {
  tablero[0] = 'X';  // Flutter redibuja automáticamente
});
```

### 6. Hot Reload (Recarga en Caliente)

**¿Qué es Hot Reload?**
- Inyecta código actualizado sin reiniciar la app
- Mantiene el estado actual
- Cambios visibles en menos de 1 segundo

**Ejemplo:**
1. Cambias un color en el código
2. Presionas `r` en la terminal
3. El color cambia instantáneamente en el emulador
4. No pierdes el progreso del juego

**Hot Restart vs Hot Reload:**
- **Hot Reload** (`r`): Mantiene el estado, muy rápido
- **Hot Restart** (`R`): Reinicia la app, pierde el estado

### 7. Build Method (Método de Construcción)

**Es el corazón de cada Widget.**

```dart
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('Mi App')),
    body: Center(
      child: Text('Hola Mundo'),
    ),
  );
}
```

- Se ejecuta cada vez que el estado cambia
- Describe cómo debe verse la UI
- Flutter optimiza las actualizaciones automáticamente

### 8. MaterialApp (Tema de Google)

```dart
MaterialApp(
  title: 'Triqui',
  theme: ThemeData(
    primarySwatch: Colors.blue,  // Color principal
  ),
  home: TriquiGame(),  // Pantalla inicial
)
```

- Implementa el diseño Material (Android)
- Proporciona navegación, temas, locales
- Alternativa: `CupertinoApp` (estilo iOS)

### 9. Scaffold (Estructura de Pantalla)

```dart
Scaffold(
  appBar: AppBar(...),      // Barra superior
  body: Column(...),        // Contenido principal
  floatingActionButton: ... // Botón flotante
  drawer: Drawer(...),      // Menú lateral
)
```

- Proporciona estructura básica de una pantalla
- Incluye AppBar, Body, BottomNavigationBar, etc.

### 10. pubspec.yaml (Archivo de Configuración)

```yaml
name: triqui_flutter          # Nombre del paquete
description: Juego de Triqui  # Descripción

environment:
  sdk: '>=2.19.0 <4.0.0'      # Versión de Dart requerida

dependencies:                  # Paquetes que necesitas
  flutter:
    sdk: flutter
  google_mobile_ads: ^3.0.0   # Ejemplo: AdMob

flutter:
  uses-material-design: true  # Usar Material Design
```

**Comandos importantes:**
```bash
flutter pub get      # Descargar dependencias
flutter pub upgrade  # Actualizar dependencias
flutter pub outdated # Ver paquetes desactualizados
```

---

## 🔄 Ciclo de Vida de una App Flutter

### 1. Desarrollo
```bash
# Escribes código en lib/main.dart
code lib/main.dart

# Ejecutas la app
flutter run
```

### 2. Compilación
```
Flutter lee tu código Dart
     ↓
Compila a código nativo
     ↓
Genera APK/IPA
     ↓
Instala en dispositivo
```

### 3. Ejecución
```
App se inicia
     ↓
main() se ejecuta
     ↓
runApp(MyApp())
     ↓
MyApp.build() se llama
     ↓
UI se renderiza
     ↓
Usuario interactúa
     ↓
setState() actualiza
     ↓
build() se llama de nuevo
     ↓
UI se actualiza
```

---

## 🛠️ Herramientas y Comandos

### Flutter CLI (Línea de Comandos)

```bash
# Información del sistema
flutter doctor          # Diagnosticar problemas
flutter --version       # Ver versión de Flutter

# Gestión de proyectos
flutter create mi_app   # Crear nuevo proyecto
flutter pub get         # Descargar dependencias
flutter clean           # Limpiar cache de compilación

# Ejecución
flutter run             # Ejecutar en dispositivo/emulador
flutter run -d chrome   # Ejecutar en Chrome
flutter run -d android  # Ejecutar en Android
flutter devices         # Ver dispositivos disponibles

# Emuladores
flutter emulators       # Listar emuladores
flutter emulators --launch pixel  # Iniciar emulador

# Compilación
flutter build apk       # Compilar APK (Android)
flutter build appbundle # Compilar AAB (Play Store)
flutter build ios       # Compilar para iOS

# Análisis
flutter analyze         # Analizar código
flutter test            # Ejecutar tests

# Actualización
flutter upgrade         # Actualizar Flutter
```

### Durante la Ejecución (`flutter run`)

```
r  - Hot reload (recarga rápida)
R  - Hot restart (reinicio completo)
h  - Ayuda (lista de comandos)
p  - Mostrar grid de construcción
o  - Cambiar entre Android/iOS
q  - Salir
```

---

## 📦 Dependencias y Paquetes

### ¿Qué son los Paquetes?

Librerías reutilizables que otros desarrolladores crearon.

**Repositorio oficial**: https://pub.dev

### Agregar un Paquete

1. **Busca el paquete** en pub.dev
2. **Agrégalo a `pubspec.yaml`**:
   ```yaml
   dependencies:
     google_fonts: ^6.1.0
   ```
3. **Descárgalo**:
   ```bash
   flutter pub get
   ```
4. **Úsalo en tu código**:
   ```dart
   import 'package:google_fonts/google_fonts.dart';
   
   Text(
     'Hola',
     style: GoogleFonts.roboto(fontSize: 20),
   )
   ```

### Paquetes Populares

- `google_mobile_ads` - Anuncios
- `shared_preferences` - Guardar datos localmente
- `http` - Peticiones HTTP
- `provider` - Manejo de estado
- `sqflite` - Base de datos SQLite
- `image_picker` - Seleccionar imágenes
- `camera` - Acceso a cámara
- `geolocator` - GPS/ubicación

---

## 🎮 Cómo Funciona Tu Juego de Triqui

### Arquitectura

```
main() - Punto de entrada
   ↓
runApp(TriquiApp())
   ↓
MaterialApp (configuración)
   ↓
TriquiGame (pantalla del juego)
   ↓
_TriquiGameState (estado del juego)
   ↓
build() - UI del juego
   ├── Scaffold (estructura)
   ├── AppBar (barra superior)
   └── Column
       ├── Text (mensaje)
       ├── GridView (tablero 3x3)
       └── Button (reiniciar)
```

### Flujo de Interacción

```
Usuario hace clic en celda
        ↓
GestureDetector.onTap()
        ↓
manejarClick(index)
        ↓
setState(() {
  tablero[index] = 'X'
  verificarGanador()
  cambiarJugador()
})
        ↓
build() se ejecuta
        ↓
UI se actualiza
        ↓
Usuario ve la X en el tablero
```

### Componentes Principales

1. **Estado del Juego**:
   ```dart
   List<String> tablero;     // ['', '', '', ...]
   String jugadorActual;     // 'X' o 'O'
   bool juegoActivo;         // true/false
   String mensaje;           // "Turno: X"
   ```

2. **Lógica**:
   - `manejarClick()` - Procesar jugada
   - `verificarGanador()` - Revisar combinaciones
   - `reiniciarJuego()` - Resetear todo

3. **UI**:
   - `GridView.builder` - Tablero 3x3
   - `GestureDetector` - Detectar clicks
   - `Container` - Celdas individuales
   - `Text` - Mostrar X/O

---

## 🌐 Multiplataforma

### Un Código, Múltiples Plataformas

```dart
// Este mismo código funciona en:
Text('Hola Mundo')
```

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Windows
- ✅ Linux
- ✅ macOS

### Diferencias de Plataforma

**Cuando necesitas código específico:**

```dart
import 'dart:io' show Platform;

if (Platform.isAndroid) {
  // Código solo para Android
} else if (Platform.isIOS) {
  // Código solo para iOS
}
```

---

## 🔍 Debugging (Depuración)

### Herramientas

1. **Print Statements**:
   ```dart
   print('Valor de tablero: $tablero');
   ```

2. **DevTools**:
   - Inspector de widgets
   - Profiler de rendimiento
   - Network inspector
   - Logs

3. **Breakpoints**:
   - En VS Code/Android Studio
   - Pausar ejecución en una línea

### Comandos de Depuración

```bash
flutter logs              # Ver logs en tiempo real
flutter screenshot        # Captura de pantalla
flutter analyze           # Analizar código
```

---

## 📊 Performance (Rendimiento)

### Flutter es Rápido

- Compila a código nativo (no JavaScript)
- 60 FPS (frames por segundo) constantes
- Hot reload no afecta rendimiento

### Consejos:

1. **Evita `setState()` innecesarios**
2. **Usa `const` cuando sea posible**:
   ```dart
   const Text('Hola')  // Mejor
   Text('Hola')        // Menos eficiente
   ```
3. **No construyas widgets complejos en `build()`**

---

## 🚀 Compilación

### Modos de Compilación

1. **Debug** (desarrollo):
   - Hot reload activo
   - Más lento
   - Incluye herramientas de debugging
   ```bash
   flutter run
   ```

2. **Release** (producción):
   - Optimizado
   - 2-3x más rápido
   - Sin debugging
   ```bash
   flutter run --release
   flutter build apk --release
   ```

3. **Profile** (análisis):
   - Para medir rendimiento
   ```bash
   flutter run --profile
   ```

---

## 🎓 Glosario

| Término | Significado |
|---------|-------------|
| **SDK** | Kit de herramientas para desarrollar |
| **Widget** | Componente visual (botón, texto, etc) |
| **State** | Datos que pueden cambiar |
| **setState()** | Notifica a Flutter que el estado cambió |
| **Hot Reload** | Actualizar código sin reiniciar |
| **Build** | Compilar la app |
| **APK** | Android Package (instalador Android) |
| **AAB** | Android App Bundle (formato Play Store) |
| **Emulator** | Dispositivo virtual para probar apps |
| **Dart** | Lenguaje de programación de Flutter |
| **Material** | Estilo de diseño de Google |
| **Scaffold** | Estructura básica de pantalla |
| **pubspec.yaml** | Archivo de configuración |
| **Package** | Librería reutilizable |

---

## 🆘 Solución de Problemas Comunes

### "flutter not found"
```bash
# Reinicia la terminal después de instalar
# O verifica que esté en PATH
```

### "No devices available"
```bash
flutter emulators --launch pixel
# O conecta un dispositivo físico
```

### "Gradle build failed"
```bash
cd android
./gradlew clean
cd ..
flutter clean
flutter pub get
flutter run
```

### Hot reload no funciona
```bash
# Presiona R (hot restart) en vez de r
# O reinicia la app
```

---

## 📚 Recursos Adicionales

### Documentación Oficial:
- Flutter: https://flutter.dev
- Dart: https://dart.dev
- Widgets: https://docs.flutter.dev/ui/widgets

### Tutoriales:
- Flutter Codelabs: https://docs.flutter.dev/codelabs
- Widget of the Week: https://youtube.com/playlist?list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG

### Comunidad:
- Discord: https://discord.gg/flutter
- Stack Overflow: https://stackoverflow.com/questions/tagged/flutter
- Reddit: r/FlutterDev

---

**¡Ahora ya entiendes cómo funciona todo!** 🎉

Cuando estés listo, continúa con la integración de anuncios (Fase 2 del plan).
