import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Proveedor de tema con modo claro/oscuro neón
class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  
  bool get isDarkMode => _isDarkMode;
  
  ThemeProvider() {
    _loadTheme();
  }
  
  // Cargar tema guardado
  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    notifyListeners();
  }
  
  // Cambiar tema
  Future<void> toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', _isDarkMode);
    notifyListeners();
  }
  
  // Tema claro elegante y moderno
  ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      
      // Paleta de colores elegante: Azul profundo + Dorado suave
      primaryColor: Color(0xFF1E3A8A), // Azul profundo elegante
      scaffoldBackgroundColor: Color(0xFFF8FAFC), // Blanco con toque azul muy suave
      
      // AppBar con degradado sutil
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFF1E3A8A), // Azul profundo
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
      
      // Botones elegantes con sombra
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF1E3A8A), // Azul profundo
          foregroundColor: Colors.white,
          elevation: 3,
          shadowColor: Color(0xFF1E3A8A).withOpacity(0.3),
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      
      // Esquema de colores general
      colorScheme: ColorScheme.light(
        primary: Color(0xFF1E3A8A), // Azul profundo
        secondary: Color(0xFFD97706), // Dorado/Ámbar elegante
        surface: Colors.white,
        background: Color(0xFFF8FAFC),
        error: Color(0xFFDC2626),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Color(0xFF1E293B), // Gris oscuro para texto
        onBackground: Color(0xFF1E293B),
      ),
      
      // Cards y contenedores
      cardTheme: CardThemeData(
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      
      // Tipografía elegante
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 72,
          fontWeight: FontWeight.bold,
          color: Color(0xFF1E3A8A),
          letterSpacing: -1.5,
        ),
        displayMedium: TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.w600,
          color: Color(0xFF1E293B),
        ),
        bodyLarge: TextStyle(
          color: Color(0xFF1E293B),
          fontSize: 16,
        ),
        bodyMedium: TextStyle(
          color: Color(0xFF64748B),
          fontSize: 14,
        ),
      ),
    );
  }
  
  // Tema oscuro con colores neón
  ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Color(0xFF00FFFF), // Cyan neón
      scaffoldBackgroundColor: Color(0xFF0A0E27), // Azul oscuro profundo
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFF0A0E27),
        foregroundColor: Color(0xFF00FFFF),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFFF006E), // Rosa neón
          foregroundColor: Colors.white,
        ),
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white70),
      ),
    );
  }
}