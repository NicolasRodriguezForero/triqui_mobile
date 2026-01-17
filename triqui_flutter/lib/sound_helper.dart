import 'package:audioplayers/audioplayers.dart';

// Helper para reproducir sonidos
class SoundHelper {
  static final AudioPlayer _audioPlayer = AudioPlayer();
  
  // Reproducir sonido de victoria
  static Future<void> playVictory() async {
    try {
      // Usar sonidos del sistema o URL
      // Por ahora usamos beep simple
      await _audioPlayer.play(AssetSource('sounds/victory.mp3'));
    } catch (e) {
      print('Error reproduciendo sonido de victoria: $e');
      // Si falla, al menos imprimir
      print('🎵 ¡VICTORIA!');
    }
  }
  
  // Reproducir sonido de empate
  static Future<void> playDraw() async {
    try {
      await _audioPlayer.play(AssetSource('sounds/draw.mp3'));
    } catch (e) {
      print('Error reproduciendo sonido de empate: $e');
      print('🎵 Empate');
    }
  }
  
  // Reproducir sonido de click
  static Future<void> playClick() async {
    try {
      await _audioPlayer.play(AssetSource('sounds/click.mp3'));
    } catch (e) {
      print('Error reproduciendo sonido de click: $e');
    }
  }
  
  // Detener todos los sonidos
  static Future<void> stopAll() async {
    await _audioPlayer.stop();
  }
}
