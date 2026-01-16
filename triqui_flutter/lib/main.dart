import 'package:flutter/material.dart';

// Punto de entrada de la aplicación
void main() {
  runApp(TriquiApp());
}

// Widget principal de la aplicación
class TriquiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Triqui',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TriquiGame(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Widget del juego (con estado)
class TriquiGame extends StatefulWidget {
  @override
  _TriquiGameState createState() => _TriquiGameState();
}

class _TriquiGameState extends State<TriquiGame> {
  // Variables del estado del juego
  List<String> tablero = List.filled(9, ''); // 9 celdas vacías
  String jugadorActual = 'X';
  bool juegoActivo = true;
  String mensaje = 'Turno: X';

  // Combinaciones ganadoras (igual que en JavaScript)
  final List<List<int>> combinacionesGanadoras = [
    [0, 1, 2], // Fila 1
    [3, 4, 5], // Fila 2
    [6, 7, 8], // Fila 3
    [0, 3, 6], // Columna 1
    [1, 4, 7], // Columna 2
    [2, 5, 8], // Columna 3
    [0, 4, 8], // Diagonal 1
    [2, 4, 6], // Diagonal 2
  ];

  // Función que maneja el clic en una celda
  void manejarClick(int index) {
    // Si la celda está ocupada o el juego terminó, no hacer nada
    if (tablero[index] != '' || !juegoActivo) {
      return;
    }

    // Actualizar el estado (setState es como "re-renderizar" en React)
    setState(() {
      tablero[index] = jugadorActual;

      // Verificar si hay ganador
      if (verificarGanador()) {
        mensaje = '¡Jugador $jugadorActual gana!';
        juegoActivo = false;
        return;
      }

      // Verificar empate
      if (tablero.every((celda) => celda != '')) {
        mensaje = '¡Empate!';
        juegoActivo = false;
        return;
      }

      // Cambiar de jugador
      jugadorActual = jugadorActual == 'X' ? 'O' : 'X';
      mensaje = 'Turno: $jugadorActual';
    });
  }

  // Función para verificar si hay ganador
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

  // Función para reiniciar el juego
  void reiniciarJuego() {
    setState(() {
      tablero = List.filled(9, '');
      jugadorActual = 'X';
      juegoActivo = true;
      mensaje = 'Turno: X';
    });
  }

  // Construir la interfaz visual
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior
      appBar: AppBar(
        title: Text('Triqui'),
        centerTitle: true,
      ),
      // Cuerpo de la aplicación
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Mensaje del estado del juego
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              mensaje,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          
          // Tablero del juego (Grid de 3x3)
          Padding(
            padding: EdgeInsets.all(20),
            child: AspectRatio(
              aspectRatio: 1,
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3 columnas
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
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          tablero[index],
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: tablero[index] == 'X' 
                                ? Colors.blue 
                                : Colors.red,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          
          // Botón de reiniciar
          ElevatedButton(
            onPressed: reiniciarJuego,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            ),
            child: Text(
              'Reiniciar Juego',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
