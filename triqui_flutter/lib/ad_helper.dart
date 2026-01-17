import 'dart:io';

class AdHelper {
  // IDs de PRUEBA de Google (usa estos primero para probar)
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111'; // ID de prueba
    } else {
      throw UnsupportedError('Plataforma no soportada');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/1033173712'; // ID de prueba
    } else {
      throw UnsupportedError('Plataforma no soportada');
    }
  }
  
  // TODO: Cuando publiques la app, reemplaza con tus IDs reales:
  // Ejemplo:
  // return 'ca-app-pub-XXXXXXXXXXXXXXXX/1111111111';
}
