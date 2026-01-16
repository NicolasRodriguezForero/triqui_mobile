# Triqui en Flutter - Guía de Aprendizaje

## 🎯 Conceptos Clave de Dart vs JavaScript

### Variables y Tipos

**JavaScript:**
```javascript
let nombre = "Juan";  // tipo inferido
let edad = 25;
```

**Dart:**
```dart
String nombre = "Juan";  // tipo explícito
int edad = 25;
// O usar 'var' para inferencia:
var nombre = "Juan";     // Dart infiere que es String
```

### Listas (Arrays)

**JavaScript:**
```javascript
let tablero = ['', '', '', '', '', '', '', '', ''];
```

**Dart:**
```dart
List<String> tablero = List.filled(9, '');
// O simplemente:
List<String> tablero = ['', '', '', '', '', '', '', '', ''];
```

### Funciones

**JavaScript:**
```javascript
function verificarGanador() {
  return true;
}
// o arrow function:
const verificarGanador = () => true;
```

**Dart:**
```dart
bool verificarGanador() {
  return true;
}
// Tipos obligatorios en parámetros:
void manejarClick(int index) {
  // código
}
```

### Condicionales (igual que JavaScript)

```dart
if (tablero[index] != '') {
  return;
}

String jugador = actual == 'X' ? 'O' : 'X';
```

---

## 🏗️ Conceptos de Flutter

### 1. Todo es un Widget

En Flutter, **TODO** es un Widget (componente visual):
- Un botón es un Widget
- Un texto es un Widget
- El layout completo es un Widget
- ¡Hasta la app entera es un Widget!

**Tipos de Widgets:**

#### StatelessWidget (Sin Estado)
- No cambia con el tiempo
- Como un componente funcional puro en React
- Ejemplo: `TriquiApp`

```dart
class TriquiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(...);
  }
}
```

#### StatefulWidget (Con Estado)
- Puede cambiar con el tiempo
- Como un componente con `useState` en React
- Ejemplo: `TriquiGame`

```dart
class TriquiGame extends StatefulWidget {
  @override
  _TriquiGameState createState() => _TriquiGameState();
}

class _TriquiGameState extends State<TriquiGame> {
  // Variables de estado aquí
  List<String> tablero = List.filled(9, '');
  
  // Para actualizar la UI:
  setState(() {
    tablero[0] = 'X';
  });
}
```

### 2. setState() - Como re-renderizar

**JavaScript (manipulación DOM):**
```javascript
tablero[index] = jugadorActual;
document.querySelector(`[data-index="${index}"]`).textContent = jugadorActual;
```

**Flutter (setState):**
```dart
setState(() {
  tablero[index] = jugadorActual;
  // Flutter automáticamente redibuja la UI
});
```

### 3. Estructura del Código

```dart
// 1. PUNTO DE ENTRADA
void main() {
  runApp(TriquiApp());  // Inicia la app
}

// 2. APP PRINCIPAL (configuración)
class TriquiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Triqui',
      theme: ThemeData(...),
      home: TriquiGame(),  // Pantalla inicial
    );
  }
}

// 3. PANTALLA DEL JUEGO (lógica)
class TriquiGame extends StatefulWidget {
  @override
  _TriquiGameState createState() => _TriquiGameState();
}

// 4. ESTADO DE LA PANTALLA
class _TriquiGameState extends State<TriquiGame> {
  // Variables
  List<String> tablero = List.filled(9, '');
  
  // Funciones
  void manejarClick(int index) { ... }
  bool verificarGanador() { ... }
  
  // UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(...);
  }
}
```

---

## 📦 Widgets Principales Usados

### Scaffold
Estructura básica de una pantalla con AppBar y Body:
```dart
Scaffold(
  appBar: AppBar(title: Text('Título')),
  body: Column(children: [...]),
)
```

### Column & Row
Layouts verticales y horizontales:
```dart
Column(
  children: [
    Text('Línea 1'),
    Text('Línea 2'),
  ],
)
```

### GridView.builder
Grid (cuadrícula) generado dinámicamente:
```dart
GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,  // 3 columnas
  ),
  itemCount: 9,
  itemBuilder: (context, index) {
    return Container(...);  // Cada celda
  },
)
```

### GestureDetector
Detecta gestos (clicks, swipes, etc):
```dart
GestureDetector(
  onTap: () => manejarClick(index),
  child: Container(...),
)
```

### Container
Como un `<div>` en HTML:
```dart
Container(
  decoration: BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Colors.black),
  ),
  child: Text('Contenido'),
)
```

---

## 🚀 Cómo Ejecutar

### 1. Después de instalar Flutter:

```bash
# Verifica que Flutter esté instalado
flutter doctor

# Ve a la carpeta del proyecto
cd triqui_flutter

# Obtén las dependencias
flutter pub get

# Ejecuta en un emulador/dispositivo
flutter run
```

### 2. Opciones de ejecución:

```bash
# En Chrome (para probar rápido)
flutter run -d chrome

# En Android
flutter run -d android

# En iOS (solo Mac)
flutter run -d ios
```

---

## 📱 Diferencias con el HTML

| Concepto | HTML/JS | Flutter |
|----------|---------|---------|
| Estructura | `<div>`, `<button>` | `Container()`, `ElevatedButton()` |
| Estilos | CSS separado | Dentro del Widget |
| Layout | Flexbox/Grid CSS | `Column`, `Row`, `GridView` |
| Estado | Variables + DOM | `setState()` |
| Eventos | `addEventListener` | `onTap`, `onPressed`, etc |
| Renderizar | Manipular DOM | `build()` method |

---

## 🎓 Próximos Pasos

1. ✅ Ejecuta la app en un emulador
2. 📱 Prueba en tu dispositivo Android
3. 🎨 Personaliza colores y estilos
4. 💰 Integraremos AdMob (anuncios)
5. 🚀 Publicaremos en Play Store

---

## 🔥 Hot Reload

Una de las mejores características de Flutter:

1. Ejecuta `flutter run`
2. Modifica el código (ej: cambia un color)
3. Presiona `r` en la terminal
4. ¡Los cambios aparecen INSTANTÁNEAMENTE sin reiniciar la app!

Esto hace el desarrollo súper rápido.

---

## 💡 Tips

- **No te asustes con los tipos**: Dart es muy claro una vez que te acostumbras
- **Piensa en Widgets**: Todo se construye componiendo widgets
- **setState es tu amigo**: Cada vez que cambies algo visual, usa `setState()`
- **Documentación oficial**: https://flutter.dev es excelente
