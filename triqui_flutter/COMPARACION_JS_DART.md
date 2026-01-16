# 🔄 JavaScript vs Dart - Comparación Lado a Lado

## Variables de Estado

### JavaScript (HTML)
```javascript
let tablero = ['', '', '', '', '', '', '', '', ''];
let jugadorActual = 'X';
let juegoActivo = true;
```

### Dart (Flutter)
```dart
List<String> tablero = List.filled(9, '');
String jugadorActual = 'X';
bool juegoActivo = true;
```

---

## Combinaciones Ganadoras

### JavaScript
```javascript
const combinacionesGanadoras = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
];
```

### Dart
```dart
final List<List<int>> combinacionesGanadoras = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
];
```

**Diferencia**: En Dart declaramos el tipo `List<List<int>>` (lista de listas de enteros).

---

## Manejar Click

### JavaScript
```javascript
function manejarClick(e) {
    const index = e.target.getAttribute('data-index');
    
    if (tablero[index] !== '' || !juegoActivo) {
        return;
    }
    
    tablero[index] = jugadorActual;
    e.target.textContent = jugadorActual;
    
    if (verificarGanador()) {
        mensaje.textContent = `¡Jugador ${jugadorActual} gana!`;
        juegoActivo = false;
        return;
    }
    
    if (tablero.every(celda => celda !== '')) {
        mensaje.textContent = '¡Empate!';
        juegoActivo = false;
        return;
    }
    
    jugadorActual = jugadorActual === 'X' ? 'O' : 'X';
    mensaje.textContent = `Turno: ${jugadorActual}`;
}
```

### Dart
```dart
void manejarClick(int index) {
    if (tablero[index] != '' || !juegoActivo) {
        return;
    }
    
    setState(() {  // ← DIFERENCIA CLAVE
        tablero[index] = jugadorActual;
        
        if (verificarGanador()) {
            mensaje = '¡Jugador $jugadorActual gana!';
            juegoActivo = false;
            return;
        }
        
        if (tablero.every((celda) => celda != '')) {
            mensaje = '¡Empate!';
            juegoActivo = false;
            return;
        }
        
        jugadorActual = jugadorActual == 'X' ? 'O' : 'X';
        mensaje = 'Turno: $jugadorActual';
    });
}
```

**Diferencias:**
- Dart: usamos `setState()` para actualizar la UI automáticamente
- Dart: no necesitamos manipular el DOM manualmente
- Dart: strings con variables usan `$variable` en vez de `${variable}`
- Dart: `!=` en vez de `!==`

---

## Verificar Ganador

### JavaScript
```javascript
function verificarGanador() {
    return combinacionesGanadoras.some(combinacion => {
        const [a, b, c] = combinacion;
        return tablero[a] !== '' && 
               tablero[a] === tablero[b] && 
               tablero[a] === tablero[c];
    });
}
```

### Dart
```dart
bool verificarGanador() {
    for (var combinacion in combinacionesGanadoras) {
        if (tablero[combinacion[0]] != '' &&
            tablero[combinacion[0]] == tablero[combinacion[1]] &&
            tablero[combinacion[0]] == tablero[combinacion[2]]) {
            return true;
        }
    }
    return false;
}
```

**Diferencias:**
- Dart: especificamos el tipo de retorno `bool`
- Dart: usamos `for-in` en vez de `.some()`
- Ambas hacen exactamente lo mismo

---

## Reiniciar Juego

### JavaScript
```javascript
function reiniciarJuego() {
    tablero = ['', '', '', '', '', '', '', '', ''];
    jugadorActual = 'X';
    juegoActivo = true;
    mensaje.textContent = 'Turno: X';
    celdas.forEach(celda => {
        celda.textContent = '';
    });
}
```

### Dart
```dart
void reiniciarJuego() {
    setState(() {
        tablero = List.filled(9, '');
        jugadorActual = 'X';
        juegoActivo = true;
        mensaje = 'Turno: X';
    });
}
```

**Diferencias:**
- Dart: no necesitamos limpiar las celdas manualmente, `setState()` redibuja todo
- Dart: más simple porque Flutter maneja la UI automáticamente

---

## Interfaz de Usuario

### JavaScript (HTML)
```html
<div id="tablero">
    <div class="celda" data-index="0"></div>
    <div class="celda" data-index="1"></div>
    <!-- ... más celdas -->
</div>

<button id="reiniciar">Reiniciar Juego</button>

<style>
    #tablero {
        display: grid;
        grid-template-columns: repeat(3, 100px);
        gap: 5px;
    }
    .celda {
        width: 100px;
        height: 100px;
        background-color: white;
        border: 2px solid #333;
    }
</style>

<script>
    const celdas = document.querySelectorAll('.celda');
    celdas.forEach(celda => {
        celda.addEventListener('click', manejarClick);
    });
</script>
```

### Dart (Flutter)
```dart
GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
    ),
    itemCount: 9,
    itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () => manejarClick(index),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 2),
                ),
                child: Center(
                    child: Text(
                        tablero[index],
                        style: TextStyle(fontSize: 48),
                    ),
                ),
            ),
        );
    },
)

ElevatedButton(
    onPressed: reiniciarJuego,
    child: Text('Reiniciar Juego'),
)
```

**Diferencias:**
- Flutter: Todo es código Dart (no hay HTML/CSS separado)
- Flutter: Widgets en vez de elementos HTML
- Flutter: Estilos integrados en los Widgets
- Flutter: `onTap` en vez de `addEventListener`

---

## 🎯 Resumen de Diferencias Clave

| Aspecto | JavaScript | Dart |
|---------|------------|------|
| **Tipos** | Opcionales | Obligatorios |
| **UI** | HTML + CSS | Widgets |
| **Estado** | Variables + DOM | setState() |
| **Comparación** | `===`, `!==` | `==`, `!=` |
| **Strings** | `` `${var}` `` | `'$var'` |
| **Listas** | `array.every()` | `list.every()` |
| **Eventos** | `addEventListener` | `onTap`, `onPressed` |
| **Estilos** | CSS separado | En el código |

---

## 💡 Lo Mejor de Flutter

1. **Un solo código** para actualizar UI (setState)
2. **Hot Reload** - cambios instantáneos
3. **Componentes nativos** - mejor rendimiento
4. **Tipado fuerte** - menos errores
5. **Todo en un lugar** - código, UI y estilos juntos

---

## 🚀 Siguiente Nivel

Ahora que entiendes las similitudes, verás que:
- La **lógica** es casi idéntica
- Los **conceptos** son los mismos
- Solo cambia la **sintaxis** y la forma de actualizar la UI

¡Dart no es tan diferente de JavaScript! 🎉
