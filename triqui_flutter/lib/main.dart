import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Para HapticFeedback
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'ad_helper.dart';
import 'theme_provider.dart';
import 'game_stats.dart';
import 'sound_helper.dart';

// Punto de entrada de la aplicación
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: TriquiApp(),
    ),
  );
}

// Widget principal de la aplicación
class TriquiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return MaterialApp(
      title: 'Triqui',
      theme: themeProvider.lightTheme,
      darkTheme: themeProvider.darkTheme,
      themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Pantalla de inicio
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Clave para forzar reconstrucción del widget de estadísticas
  Key _statsKey = UniqueKey();
  
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Triqui'),
        centerTitle: true,
        actions: [
          // Botón de cambio de tema
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              themeProvider.toggleTheme();
            },
            tooltip: isDark ? 'Modo Claro' : 'Modo Oscuro',
          ),
        ],
      ),
      body: Container(
        decoration: isDark
            ? BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF0A0E27),
                    Color(0xFF1a1a3e),
                  ],
                ),
              )
            : null,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Título del juego con efecto neón si está en modo oscuro
              Text(
                'TRIQUI',
                style: TextStyle(
                  fontSize: 72,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Color(0xFF00FFFF) : Colors.blue,
                  shadows: isDark
                      ? [
                          Shadow(
                            blurRadius: 20,
                            color: Color(0xFF00FFFF),
                          ),
                          Shadow(
                            blurRadius: 40,
                            color: Color(0xFF00FFFF),
                          ),
                        ]
                      : null,
                ),
              ),
              SizedBox(height: 10),
              
              // Subtítulo
              Text(
                'El clásico juego de estrategia',
                style: TextStyle(
                  fontSize: 18,
                  color: isDark ? Color(0xFFFF006E) : Colors.grey[600],
                  fontStyle: FontStyle.italic,
                ),
              ),
              
              SizedBox(height: 60),
              
              // Botón principal de jugar
              ElevatedButton(
                onPressed: () async {
                  // Navegar y esperar a que regrese
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TriquiGame()),
                  );
                  // Cuando regrese, actualizar las estadísticas
                  setState(() {
                    _statsKey = UniqueKey(); // Forzar reconstrucción
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: isDark ? 0 : 5,
                  backgroundColor: isDark ? Color(0xFFFF006E) : Colors.blue,
                  shadowColor: isDark ? Color(0xFFFF006E) : Colors.blue,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.people, size: 24),
                    SizedBox(width: 8),
                    Text(
                      'Jugar 2 Personas',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: 80),
              
              // Estadísticas con key única para forzar reconstrucción
              StatsWidget(key: _statsKey),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget de estadísticas
class StatsWidget extends StatelessWidget {
  const StatsWidget({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    
    return FutureBuilder(
      future: Future.wait([
        GameStats.getXWins(),
        GameStats.getOWins(),
        GameStats.getDraws(),
      ]),
      builder: (context, AsyncSnapshot<List<int>> snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        
        final xWins = snapshot.data![0];
        final oWins = snapshot.data![1];
        final draws = snapshot.data![2];
        
        return Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: isDark ? Color(0xFF1a1a3e) : Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: isDark
                ? Border.all(color: Color(0xFF00FFFF), width: 2)
                : null,
            boxShadow: [
              BoxShadow(
                color: isDark
                    ? Color(0xFF00FFFF).withOpacity(0.3)
                    : Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            children: [
              Text(
                'Estadísticas',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Color(0xFF00FFFF) : Colors.black,
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStat('X', xWins, Colors.red, isDark),
                  _buildStat('O', oWins, Colors.blue, isDark),
                  _buildStat('=', draws, Colors.grey, isDark),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
  
  Widget _buildStat(String label, int value, Color color, bool isDark) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        SizedBox(height: 5),
        Text(
          value.toString(),
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
      ],
    );
  }
}

// Widget del juego (con estado)
class TriquiGame extends StatefulWidget {
  @override
  _TriquiGameState createState() => _TriquiGameState();
}

class _TriquiGameState extends State<TriquiGame> with SingleTickerProviderStateMixin {
  // Variables del estado del juego
  List<String> tablero = List.filled(9, '');
  String jugadorActual = 'X';
  bool juegoActivo = true;
  String mensaje = 'Turno: X';
  
  // Variable para el Banner Ad
  BannerAd? _bannerAd;
  bool _isBannerAdLoaded = false;
  
  // Variable para el Interstitial Ad
  InterstitialAd? _interstitialAd;
  bool _isInterstitialAdLoaded = false;
  
  // Mostrar botones después del juego
  bool _mostrarBotonesFinales = false;
  
  // Variables para animación de línea ganadora
  List<int>? _combinacionGanadora;
  AnimationController? _animationController;
  Animation<double>? _lineAnimation;

  // Combinaciones ganadoras
  final List<List<int>> combinacionesGanadoras = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], // Filas
    [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columnas
    [0, 4, 8], [2, 4, 6], // Diagonales
  ];
  
  @override
  void initState() {
    super.initState();
    _loadBannerAd();
    _loadInterstitialAd();
    
    // Inicializar animación
    _animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _lineAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController!, curve: Curves.easeInOut),
    );
  }
  
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
  
  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          _isInterstitialAdLoaded = true;
          
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
              _loadInterstitialAd();
              // Mostrar botones después de cerrar el anuncio
              setState(() {
                _mostrarBotonesFinales = true;
              });
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              print('Error al mostrar intersticial: $error');
              ad.dispose();
              _loadInterstitialAd();
              setState(() {
                _mostrarBotonesFinales = true;
              });
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
  
  void _showInterstitialAd() {
    if (_isInterstitialAdLoaded && _interstitialAd != null) {
      _interstitialAd!.show();
      _isInterstitialAdLoaded = false;
    } else {
      // Si no hay anuncio, mostrar botones inmediatamente
      setState(() {
        _mostrarBotonesFinales = true;
      });
    }
  }
  
  @override
  void dispose() {
    _bannerAd?.dispose();
    _interstitialAd?.dispose();
    _animationController?.dispose();
    super.dispose();
  }

  void manejarClick(int index) async {
    if (tablero[index] != '' || !juegoActivo) {
      return;
    }

    setState(() {
      tablero[index] = jugadorActual;
    });
    
    // Vibración ligera al hacer click (nativa de Flutter)
    HapticFeedback.lightImpact();
    
    SoundHelper.playClick();

    setState(() {
      // Verificar ganador
      final combinacion = verificarGanador();
      if (combinacion != null) {
        mensaje = '¡Jugador $jugadorActual gana!';
        juegoActivo = false;
        _combinacionGanadora = combinacion;
        
        // Vibración de victoria
        HapticFeedback.heavyImpact();
        
        // Iniciar animación de línea ganadora
        _animationController?.forward();
        
        // Guardar estadísticas
        if (jugadorActual == 'X') {
          GameStats.incrementXWins();
        } else {
          GameStats.incrementOWins();
        }
        
        SoundHelper.playVictory();
        _showInterstitialAd();
        return;
      }

      // Verificar empate
      if (tablero.every((celda) => celda != '')) {
        mensaje = '¡Empate!';
        juegoActivo = false;
        
        // Vibración de empate
        HapticFeedback.mediumImpact();
        
        GameStats.incrementDraws();
        SoundHelper.playDraw();
        _showInterstitialAd();
        return;
      }

      // Cambiar de jugador
      jugadorActual = jugadorActual == 'X' ? 'O' : 'X';
      mensaje = 'Turno: $jugadorActual';
    });
  }

  List<int>? verificarGanador() {
    for (var combinacion in combinacionesGanadoras) {
      if (tablero[combinacion[0]] != '' &&
          tablero[combinacion[0]] == tablero[combinacion[1]] &&
          tablero[combinacion[0]] == tablero[combinacion[2]]) {
        return combinacion;
      }
    }
    return null;
  }

  void reiniciarJuego() {
    setState(() {
      tablero = List.filled(9, '');
      jugadorActual = 'X';
      juegoActivo = true;
      mensaje = 'Turno: X';
      _mostrarBotonesFinales = false;
      _combinacionGanadora = null;
      _animationController?.reset();
    });
  }
  
  void volverAlInicio() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Triqui - 2 Jugadores'),
        centerTitle: true,
      ),
      body: Container(
        decoration: isDark
            ? BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF0A0E27),
                    Color(0xFF1a1a3e),
                  ],
                ),
              )
            : null,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Mensaje del estado
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      mensaje,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Color(0xFF00FFFF) : Colors.black,
                        shadows: isDark
                            ? [
                                Shadow(
                                  blurRadius: 10,
                                  color: Color(0xFF00FFFF),
                                ),
                              ]
                            : null,
                      ),
                    ),
                  ),
                  
                  // Tablero
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemCount: 9,
                        itemBuilder: (context, index) {
                          // Verificar si esta celda es parte de la combinación ganadora
                          final esGanadora = _combinacionGanadora?.contains(index) ?? false;
                          
                          return AnimatedBuilder(
                            animation: _lineAnimation ?? AlwaysStoppedAnimation(0),
                            builder: (context, child) {
                              return GestureDetector(
                                onTap: () => manejarClick(index),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: esGanadora
                                        ? (isDark
                                            ? Color(0xFFFFD700).withOpacity(0.3 + (_lineAnimation?.value ?? 0) * 0.3)
                                            : Colors.yellow.withOpacity(0.3 + (_lineAnimation?.value ?? 0) * 0.3))
                                        : (isDark
                                            ? Color(0xFF1a1a3e)
                                            : Colors.white),
                                    border: Border.all(
                                      color: esGanadora
                                          ? (isDark ? Color(0xFFFFD700) : Colors.orange)
                                          : (isDark ? Color(0xFF00FFFF) : Colors.black),
                                      width: esGanadora ? 3 : 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: esGanadora
                                        ? [
                                            BoxShadow(
                                              color: (isDark ? Color(0xFFFFD700) : Colors.orange)
                                                  .withOpacity(0.5 * (_lineAnimation?.value ?? 0)),
                                              blurRadius: 20,
                                              spreadRadius: 5,
                                            ),
                                          ]
                                        : (isDark
                                            ? [
                                                BoxShadow(
                                                  color: Color(0xFF00FFFF).withOpacity(0.3),
                                                  blurRadius: 8,
                                                ),
                                              ]
                                            : null),
                                  ),
                                  child: Center(
                                    child: Text(
                                      tablero[index],
                                      style: TextStyle(
                                        fontSize: 48,
                                        fontWeight: FontWeight.bold,
                                        color: tablero[index] == 'X'
                                            ? (isDark ? Color(0xFFFF006E) : Colors.red)
                                            : (isDark ? Color(0xFF00FFFF) : Colors.blue),
                                        shadows: isDark && tablero[index] != ''
                                            ? [
                                                Shadow(
                                                  blurRadius: 15,
                                                  color: tablero[index] == 'X'
                                                      ? Color(0xFFFF006E)
                                                      : Color(0xFF00FFFF),
                                                ),
                                              ]
                                            : null,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  
                  // Botones después del juego
                  if (_mostrarBotonesFinales)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton.icon(
                            onPressed: reiniciarJuego,
                            icon: Icon(Icons.refresh),
                            label: Text('Reiniciar'),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: volverAlInicio,
                            icon: Icon(Icons.home),
                            label: Text('Inicio'),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                  
                  // Botón de reiniciar normal (cuando el juego está activo)
                  if (!_mostrarBotonesFinales)
                    ElevatedButton(
                      onPressed: reiniciarJuego,
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      ),
                      child: Text(
                        'Reiniciar Juego',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                ],
              ),
            ),
            
            // Banner Ad
            if (_isBannerAdLoaded && _bannerAd != null)
              Container(
                height: _bannerAd!.size.height.toDouble(),
                width: _bannerAd!.size.width.toDouble(),
                child: AdWidget(ad: _bannerAd!),
              ),
          ],
        ),
      ),
    );
  }
}
