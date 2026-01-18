# 🎮 Triqui - Juego Clásico para Android

![Version](https://img.shields.io/badge/version-1.0.0-blue)
![Flutter](https://img.shields.io/badge/Flutter-3.38.5-02569B?logo=flutter)
![Platform](https://img.shields.io/badge/platform-Android-green)
![License](https://img.shields.io/badge/license-MIT-orange)

Juego clásico de Triqui (Tic-Tac-Toe) para Android desarrollado con Flutter.

## ✨ Características

- 🎯 **Modo 2 Jugadores** - Juega con amigos en el mismo dispositivo
- 📊 **Estadísticas Persistentes** - Lleva el registro de victorias y empates
- 🎨 **Dos Temas Elegantes** - Modo claro profesional y modo oscuro con efectos neón
- ✨ **Animaciones** - Línea ganadora con efectos visuales
- 📳 **Vibración Táctil** - Feedback háptico nativo en cada jugada
- 🎵 **Efectos de Sonido** - Sonidos inmersivos durante el juego
- 💰 **Monetización** - Integración con Google AdMob (Banner + Interstitial)
- 🚀 **Interfaz Moderna** - Diseño fluido con Material Design 3

## 📱 Capturas de Pantalla

*(Agregar capturas de pantalla aquí)*

## 🚀 Estado del Proyecto

**Versión actual:** 1.0.0  
**Estado:** 90% completado  
**Próximo hito:** Publicación en Play Store

### Progreso:
- ✅ Desarrollo completo (100%)
- ✅ Monetización implementada (100%)
- ✅ Mejoras y pulido (100%)
- ⏳ Publicación (40%)

## 🛠️ Tecnologías Utilizadas

- **Framework:** Flutter 3.38.5
- **Lenguaje:** Dart 3.10.4
- **Plataforma:** Android (minSdk 21 - Lollipop)
- **Dependencias principales:**
  - `google_mobile_ads` - Anuncios
  - `shared_preferences` - Almacenamiento local
  - `audioplayers` - Efectos de sonido
  - `provider` - Gestión de estado

## 📦 Instalación para Desarrollo

### Prerrequisitos

- Flutter SDK 3.38.5 o superior
- Android SDK (API 21+)
- Android Studio o VS Code
- Git

### Pasos

```bash
# Clonar el repositorio
git clone https://github.com/TU_USUARIO/triqui_flutter.git

# Navegar al proyecto
cd triqui_flutter

# Instalar dependencias
flutter pub get

# Ejecutar en modo debug
flutter run

# O ejecutar en modo release
flutter run --release
```

## 🏗️ Compilar para Producción

### APK de Release

```bash
# Limpiar proyecto
flutter clean

# Obtener dependencias
flutter pub get

# Compilar APK
flutter build apk --release
```

El APK estará en: `build/app/outputs/flutter-apk/app-release.apk`

### Android App Bundle (AAB)

```bash
# Compilar AAB para Play Store
flutter build appbundle --release
```

El AAB estará en: `build/app/outputs/bundle/release/app-release.aab`

## 🔐 Firma de la Aplicación

Para compilar en modo release, necesitas un keystore. Ver instrucciones completas en:

- **[KEYSTORE_INSTRUCTIONS.md](KEYSTORE_INSTRUCTIONS.md)** - Cómo generar el keystore
- **[BUILD_COMMANDS.md](BUILD_COMMANDS.md)** - Lista completa de comandos

## 📚 Documentación

- **[PUBLISHING_GUIDE.md](PUBLISHING_GUIDE.md)** - Guía completa de publicación
- **[ICON_GUIDE.md](ICON_GUIDE.md)** - Cómo crear el ícono de la app
- **[PLAY_STORE_CONTENT.md](PLAY_STORE_CONTENT.md)** - Plantillas de texto
- **[docs/plan.md](docs/plan.md)** - Plan del proyecto
- **[docs/explain.md](docs/explain.md)** - Explicación detallada de Flutter

## 🎮 Cómo Jugar

1. Los jugadores se turnan colocando **X** y **O** en el tablero 3x3
2. El objetivo es alinear 3 símbolos iguales en:
   - Una fila horizontal
   - Una columna vertical
   - Una diagonal
3. El primer jugador en lograrlo gana la partida
4. Si el tablero se llena sin ganador, es empate

## 📊 Estructura del Proyecto

```
triqui_flutter/
├── android/                 # Código nativo Android
│   └── app/
│       ├── src/main/
│       │   └── AndroidManifest.xml
│       └── build.gradle.kts
├── assets/
│   └── sounds/             # Efectos de sonido
├── docs/                   # Documentación
│   ├── plan.md
│   ├── explain.md
│   └── COMPARACION_JS_DART.md
├── lib/                    # Código Dart
│   ├── main.dart          # Punto de entrada
│   ├── ad_helper.dart     # Configuración de AdMob
│   ├── theme_provider.dart # Gestión de temas
│   ├── game_stats.dart    # Estadísticas
│   └── sound_helper.dart  # Efectos de sonido
├── test/                  # Pruebas
├── pubspec.yaml          # Dependencias
└── README.md
```

## 🎨 Temas

### Modo Claro
- Paleta azul profundo profesional
- Material Design 3
- Acentos dorados

### Modo Oscuro
- Gradiente neón (cian + magenta)
- Efectos de resplandor
- Estilo cyberpunk

## 💰 Monetización

La aplicación incluye dos tipos de anuncios:

1. **Banner Ads** - En la parte inferior durante el juego
2. **Interstitial Ads** - Al finalizar cada partida

Para configurar tus propios IDs de AdMob:
1. Edita `android/app/src/main/AndroidManifest.xml`
2. Edita `lib/ad_helper.dart`

Ver [PUBLISHING_GUIDE.md](PUBLISHING_GUIDE.md) para más detalles.

## 🔒 Privacidad

La aplicación:
- ✅ No recopila información personal
- ✅ Guarda estadísticas solo localmente
- ✅ Usa Google AdMob para anuncios
- ✅ Cumple con políticas de privacidad

Ver [privacy-policy.html](privacy-policy.html) para la política completa.

## 🚀 Próximos Pasos

- [ ] Reemplazar IDs de prueba de AdMob
- [ ] Generar keystore de producción
- [ ] Crear ícono definitivo
- [ ] Tomar capturas de pantalla
- [ ] Publicar en Google Play Store

## 🤝 Contribuciones

Este es un proyecto de aprendizaje personal. Las sugerencias son bienvenidas.

## 📝 Licencia

Este proyecto está bajo la licencia MIT. Ver archivo `LICENSE` para más detalles.

## 👤 Autor

**[Tu Nombre]**

- GitHub: [@TU_USUARIO](https://github.com/TU_USUARIO)
- Email: tu_email@ejemplo.com

## 🙏 Agradecimientos

- Flutter Team por el excelente framework
- Google AdMob por la plataforma de monetización
- Comunidad de Flutter por los recursos

## 📱 Descargar

*(Una vez publicado, agregar link de Play Store)*

[![Get it on Google Play](https://play.google.com/intl/en_us/badges/static/images/badges/es_badge_web_generic.png)](https://play.google.com/store/apps/details?id=com.example.triqui_flutter)

---

**Hecho con ❤️ y Flutter**
