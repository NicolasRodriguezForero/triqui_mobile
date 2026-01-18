import 'package:shared_preferences/shared_preferences.dart';

// Clase para manejar estadísticas del juego
class GameStats {
  static const String _xWinsKey = 'x_wins';
  static const String _oWinsKey = 'o_wins';
  static const String _drawsKey = 'draws';
  
  // Obtener victorias de X
  static Future<int> getXWins() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_xWinsKey) ?? 0;
  }
  
  // Obtener victorias de O
  static Future<int> getOWins() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_oWinsKey) ?? 0;
  }
  
  // Obtener empates
  static Future<int> getDraws() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_drawsKey) ?? 0;
  }
  
  // Incrementar victorias de X
  static Future<void> incrementXWins() async {
    final prefs = await SharedPreferences.getInstance();
    int current = prefs.getInt(_xWinsKey) ?? 0;
    await prefs.setInt(_xWinsKey, current + 1);
  }
  
  // Incrementar victorias de O
  static Future<void> incrementOWins() async {
    final prefs = await SharedPreferences.getInstance();
    int current = prefs.getInt(_oWinsKey) ?? 0;
    await prefs.setInt(_oWinsKey, current + 1);
  }
  
  // Incrementar empates
  static Future<void> incrementDraws() async {
    final prefs = await SharedPreferences.getInstance();
    int current = prefs.getInt(_drawsKey) ?? 0;
    await prefs.setInt(_drawsKey, current + 1);
  }
  
  // Resetear estadísticas
  static Future<void> resetStats() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_xWinsKey, 0);
    await prefs.setInt(_oWinsKey, 0);
    await prefs.setInt(_drawsKey, 0);
  }
}
