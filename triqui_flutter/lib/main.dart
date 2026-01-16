import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'ad_helper.dart';  // ← IMPORTAR NUESTRO ARCHIVO DE CONSTANTES

// Punto de entrada de la aplicación
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(TriquiApp());
}

// Widget principal de la aplicación
class TriquiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Triqui',
      theme: ThemeData(
        primarySwatch: Colors.red,
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
  
  // Variable para el Banner Ad
  BannerAd? _bannerAd;
  bool _isBannerAdLoaded = false;
  
  // Variable para el Interstitial Ad
  InterstitialAd? _interstitialAd;
  bool _isInterstitialAdLoaded = false;

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
  
  // Cargar los anuncios cuando se inicia la pantalla
  @override
  void initState() {
    super.initState();
    _loadBannerAd();
    _loadInterstitialAd();
  }
  
  // Cargar el anuncio de banner
  void _loadBannerAd() {
    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _isBannerAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          print('Error al cargar el banner: $error');
          ad.dispose();
        },
      ),
    );
    
    _bannerAd!.load();
  }
  
  // Cargar el anuncio intersticial
  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          _isInterstitialAdLoaded = true;
          
          // Configurar callback cuando se cierre el anuncio
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
              _loadInterstitialAd(); // Cargar el siguiente anuncio
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              print('Error al mostrar intersticial: $error');
              ad.dispose();
              _loadInterstitialAd();
            },
          );
        },
        onAdFailedToLoad: (error) {
          print('Error al cargar intersticial: $error');
          _isInterstitialAdLoaded = false;
        },
      ),
    );
  }
  
  // Mostrar el anuncio intersticial
  void _showInterstitialAd() {
    if (_isInterstitialAdLoaded && _interstitialAd != null) {
      _interstitialAd!.show();
      _isInterstitialAdLoaded = false;
    }
  }
  
  // Liberar recursos cuando se cierre la pantalla
  @override
  void dispose() {
    _bannerAd?.dispose();
    _interstitialAd?.dispose();
    super.dispose();
  }

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
        _showInterstitialAd(); // ← MOSTRAR ANUNCIO AL GANAR
        return;
      }

      // Verificar empate
      if (tablero.every((celda) => celda != '')) {
        mensaje = '¡Empate!';
        juegoActivo = false;
        _showInterstitialAd(); // ← MOSTRAR ANUNCIO AL EMPATAR
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
        children: [
          // Contenido principal del juego
          Expanded(
            child: Column(
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
                                ? Colors.green 
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
          ),
          
          // Banner Ad en la parte inferior
          if (_isBannerAdLoaded && _bannerAd != null)
            Container(
              height: _bannerAd!.size.height.toDouble(),
              width: _bannerAd!.size.width.toDouble(),
              child: AdWidget(ad: _bannerAd!),
            ),
        ],
      ),
    );
  }
}
