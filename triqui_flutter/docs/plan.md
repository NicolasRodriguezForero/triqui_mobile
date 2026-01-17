# 📋 Plan de Proyecto - Juego de Triqui Móvil

## 🎯 Objetivos del Proyecto

Aprender el ciclo completo de desarrollo móvil:
1. ✅ Programar un juego para móviles
2. ⏳ Integrar anuncios (monetización)
3. ⏳ Publicar en Play Store

---

## ✅ Fase 1: Desarrollo (COMPLETADA)

### Lo que hicimos:

#### 1.1 Configuración del Entorno
- ✅ Instalamos Flutter SDK (v3.38.5) con Chocolatey
- ✅ Instalamos Dart (v3.10.4) - viene incluido con Flutter
- ✅ Instalamos Android Studio
- ✅ Configuramos Android SDK (v36.1.0)
- ✅ Instalamos cmdline-tools
- ✅ Aceptamos todas las licencias de Android

#### 1.2 Creación del Proyecto
- ✅ Creamos la estructura del proyecto Flutter
- ✅ Configuramos `pubspec.yaml` (dependencias)
- ✅ Ejecutamos `flutter create .` para inicializar
- ✅ Ejecutamos `flutter pub get` para descargar dependencias

#### 1.3 Desarrollo del Juego
- ✅ Escribimos el juego de triqui en Dart
- ✅ Implementamos toda la lógica:
  - Tablero 3x3 con `GridView`
  - Turnos alternados (X y O)
  - Detección de ganador
  - Detección de empate
  - Botón de reinicio
- ✅ Diseñamos la interfaz con Material Design

#### 1.4 Testing
- ✅ Creamos un emulador Android (Pixel 6, API 36)
- ✅ Ejecutamos la app en el emulador
- ✅ Probamos todas las funcionalidades
- ✅ Verificamos que funciona correctamente

### Aprendimos:
- ✅ Qué es Flutter y Dart
- ✅ Diferencias entre JavaScript y Dart
- ✅ Concepto de Widgets (StatelessWidget y StatefulWidget)
- ✅ Uso de setState() para actualizar la UI
- ✅ Hot Reload para desarrollo rápido
- ✅ Estructura de un proyecto Flutter
- ✅ Emuladores Android

---

## ✅ Fase 2: Monetización (COMPLETADA)

### Objetivos:
Integrar Google AdMob para generar ingresos con anuncios.

### Lo que hicimos:

#### 2.1 Configurar AdMob
- ✅ Crear cuenta de Google AdMob
- ✅ Registrar la aplicación en AdMob
- ✅ Obtener App ID de AdMob
- ✅ Obtener Unit IDs para los anuncios (banner + interstitial)

#### 2.2 Integrar SDK de AdMob
- ✅ Agregar dependencia `google_mobile_ads: ^5.1.0` en `pubspec.yaml`
- ✅ Configurar App ID en `AndroidManifest.xml`
- ✅ Inicializar MobileAds en la app (`main()`)
- ✅ Crear `ad_helper.dart` con IDs de prueba

#### 2.3 Implementar Anuncios
- ✅ **Banner Ads**: En la parte inferior del juego (siempre visible)
- ✅ **Interstitial Ads**: Al terminar cada partida (ganador o empate)
- ✅ Implementar manejo de errores y callbacks
- ✅ Configurar recarga automática de interstitial

#### 2.4 Testing de Anuncios
- ✅ Probar en dispositivo físico (NAM LX9)
- ✅ Verificar que funcionan correctamente
- ✅ Confirmar que no afectan la experiencia del usuario

### Aprendimos:
- ✅ Cómo funciona Google AdMob
- ✅ Diferencia entre IDs de prueba y producción
- ✅ Implementación de Banner e Interstitial Ads
- ✅ Manejo del ciclo de vida de anuncios
- ✅ Testing con anuncios de prueba

### Tipos de Anuncios a Usar:

1. **Banner Ads** (Menos intrusivos)
   - Siempre visibles en la parte inferior
   - Ingresos constantes pero menores

2. **Interstitial Ads** (Más rentables)
   - Se muestran al finalizar cada partida
   - Mayor CPM (costo por mil impresiones)
   - No interrumpen el juego

3. **Rewarded Ads** (Opcional - futuro)
   - Usuario ve anuncio para obtener beneficio
   - Ejemplo: Ver anuncio para deshacer jugada

### Recursos:
- Documentación: https://developers.google.com/admob/flutter/quick-start
- Paquete: https://pub.dev/packages/google_mobile_ads

---

## ⏳ Fase 3: Publicación (PENDIENTE)

### Objetivos:
Publicar la app en Google Play Store para que cualquiera pueda descargarla.

### Pasos a seguir:

#### 3.1 Preparar la Aplicación
- [ ] Cambiar nombre de la app (de "triqui_flutter" a "Triqui")
- [ ] Cambiar package name (com.tunombre.triqui)
- [ ] Crear un ícono profesional para la app
- [ ] Configurar versión (versionCode y versionName)
- [ ] Escribir descripción de la app

#### 3.2 Generar Keystore (Firma Digital)
- [ ] Crear un keystore para firmar la app
- [ ] Configurar signing en build.gradle
- [ ] Guardar el keystore en lugar seguro (¡nunca lo pierdas!)

#### 3.3 Compilar APK/AAB de Release
- [ ] Ejecutar `flutter build apk --release` (APK)
- [ ] O `flutter build appbundle` (AAB - recomendado)
- [ ] Probar el APK en dispositivo físico

#### 3.4 Crear Cuenta de Google Play Developer
- [ ] Pagar $25 USD (pago único de por vida)
- [ ] Completar perfil de desarrollador
- [ ] Aceptar términos y condiciones

#### 3.5 Subir la Aplicación
- [ ] Crear nueva aplicación en Google Play Console
- [ ] Subir el archivo AAB
- [ ] Completar la ficha de la tienda:
  - Capturas de pantalla (mínimo 2)
  - Ícono de alta resolución (512x512)
  - Banner destacado
  - Descripción corta y larga
  - Categoría: Juegos > Casual
- [ ] Configurar clasificación de contenido
- [ ] Configurar países donde estará disponible

#### 3.6 Revisión y Publicación
- [ ] Enviar a revisión
- [ ] Esperar aprobación (1-7 días)
- [ ] ¡Publicado!

### Requisitos:
- Cuenta de Google Play Developer ($25 USD)
- Capturas de pantalla de la app
- Ícono de 512x512 px
- Descripción atractiva
- Política de privacidad (si usas anuncios)

### Recursos:
- Documentación: https://docs.flutter.dev/deployment/android
- Play Console: https://play.google.com/console

---

## 📊 Estado General del Proyecto

```
Desarrollo      ████████████████████  100% ✅
Monetización    ████████████████████  100% ✅
Publicación     ░░░░░░░░░░░░░░░░░░░░    0% ⏳
                ────────────────────
Total           █████████████░░░░░░░   67%
```

---

## 🎯 Próximos Pasos Inmediatos

1. **¡Ya casi terminamos!** Solo falta la **Fase 3: Publicación**
2. **Antes de publicar**:
   - Reemplazar IDs de prueba con tus IDs reales en `ad_helper.dart`
   - Opcional: Mejorar diseño/agregar funcionalidades
3. **Publicar en Play Store**:
   - Preparar la app (nombre, ícono, descripción)
   - Generar keystore y compilar AAB
   - Crear cuenta de Google Play Developer ($25 USD)
   - Subir y publicar

---

## 💡 Ideas de Mejoras Futuras

### Funcionalidades:
- [ ] Modo de 2 jugadores (mismo dispositivo)
- [ ] Contador de victorias (X vs O)
- [ ] Diferentes niveles de dificultad vs IA
- [ ] Sonidos al hacer click
- [ ] Animaciones al ganar
- [ ] Vibración al hacer jugada
- [ ] Temas (modo oscuro/claro)
- [ ] Diferentes tamaños de tablero (4x4, 5x5)

### Técnicas:
- [ ] Implementar IA simple para jugar contra la máquina
- [ ] Guardar estadísticas localmente (shared_preferences)
- [ ] Agregar pantalla de inicio
- [ ] Agregar pantalla de configuración
- [ ] Implementar sistema de logros

---

## 📚 Recursos de Aprendizaje

### Documentación Oficial:
- Flutter: https://flutter.dev
- Dart: https://dart.dev
- AdMob: https://admob.google.com

### Tutoriales Recomendados:
- Flutter Codelabs: https://docs.flutter.dev/codelabs
- Dart Language Tour: https://dart.dev/guides/language/language-tour
- Flutter Widget of the Week: https://www.youtube.com/playlist?list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG

### Comunidades:
- Flutter Community: https://flutter.dev/community
- Stack Overflow: https://stackoverflow.com/questions/tagged/flutter
- Reddit: r/FlutterDev

---

## ✅ Checklist de Aprendizaje

### Conceptos Básicos:
- [x] Qué es Flutter
- [x] Qué es Dart
- [x] Diferencia entre StatelessWidget y StatefulWidget
- [x] Cómo usar setState()
- [x] Qué es Hot Reload
- [x] Estructura de un proyecto Flutter

### Próximos Conceptos:
- [ ] Navegación entre pantallas
- [ ] Manejo de estado avanzado (Provider, Riverpod)
- [ ] Persistencia de datos (SharedPreferences, SQLite)
- [ ] Integración de paquetes externos
- [ ] Testing (unit tests, widget tests)
- [ ] Optimización de rendimiento

---

## 🎓 Lo Que Ya Sabes

Hasta ahora has aprendido a:
1. **Configurar** un entorno de desarrollo móvil completo
2. **Programar** en Dart (nuevo lenguaje)
3. **Crear** interfaces con Flutter Widgets
4. **Manejar** estado con StatefulWidget
5. **Compilar** y ejecutar apps en Android
6. **Usar** emuladores de Android
7. **Depurar** apps con Hot Reload

**¡Esto es mucho!** Muchas personas tardan semanas en llegar hasta aquí.

---

## 🚀 Motivación

```
"El viaje de mil millas comienza con un solo paso"
                                        - Lao Tzu

Ya diste el primer paso. ¡Sigue adelante! 💪
```

---

**Última actualización**: 15 de enero, 2026
**Progreso general**: 67% completado
**Siguiente hito**: Publicar en Play Store
