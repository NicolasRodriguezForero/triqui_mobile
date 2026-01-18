import 'dart:io';

class AdHelper {
  // IDs de PRUEBA de Google (usa estos primero para probar)
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3677224488014449/2576284102'; // ID de prueba
    } else {
      throw UnsupportedError('Plataforma no soportada');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3677224488014449/2141988074'; // ID de prueba
    } else {
      throw UnsupportedError('Plataforma no soportada');
    }
  }
}
