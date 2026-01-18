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

## ⏳ Fase 3: Publicación (EN PROGRESO)

### Objetivos:
Publicar la app en Google Play Store para que cualquiera pueda descargarla.

### Lo que hemos hecho:

#### 3.1 Preparación Inicial (COMPLETADO)
- ✅ Configurado nombre de la app ("Triqui")
- ✅ Configurado version (1.0.0+1)
- ✅ Configurado Application ID (com.example.triqui_flutter)
- ✅ Configurado versionCode y versionName en build.gradle.kts
- ✅ Configurado minSdk (21 - Android 5.0)
- ✅ Actualizado .gitignore para proteger keystore

#### 3.2 Sistema de Firma (COMPLETADO)
- ✅ Creado KEY_PROPERTIES_TEMPLATE.txt con plantilla
- ✅ Creado KEYSTORE_INSTRUCTIONS.md con guía completa
- ✅ Configurado signing automático en build.gradle.kts
- ✅ Sistema de firma condicional (usa debug si no hay key.properties)

#### 3.3 Documentación Creada (COMPLETADO)
- ✅ **PUBLISHING_GUIDE.md** - Guía completa paso a paso
- ✅ **KEYSTORE_INSTRUCTIONS.md** - Instrucciones para keystore
- ✅ **ICON_GUIDE.md** - Guía para crear el ícono
- ✅ **PLAY_STORE_CONTENT.md** - Plantillas de texto y descripciones
- ✅ **privacy-policy.html** - Política de privacidad lista
- ✅ **BUILD_COMMANDS.md** - Todos los comandos necesarios

### Pasos pendientes (en orden):

#### 3.4 Preparar AdMob (PENDIENTE)
- [ ] Obtener IDs reales de AdMob (App ID, Banner ID, Interstitial ID)
- [ ] Reemplazar en AndroidManifest.xml el App ID
- [ ] Reemplazar en lib/ad_helper.dart los Unit IDs
- [ ] Probar que los anuncios funcionen

#### 3.5 Generar Keystore (PENDIENTE)
- [ ] Ejecutar comando keytool para crear keystore
- [ ] Crear archivo android/key.properties con contraseñas
- [ ] Guardar keystore en lugar seguro (USB, nube)
- [ ] Anotar contraseñas en lugar seguro

#### 3.6 Compilar y Probar (PENDIENTE)
- [ ] Ejecutar flutter clean
- [ ] Ejecutar flutter pub get
- [ ] Compilar APK: flutter build apk --release
- [ ] Instalar APK en dispositivo físico y probar
- [ ] Verificar que funcione correctamente
- [ ] Compilar AAB: flutter build appbundle --release

#### 3.7 Crear Assets (PENDIENTE)
- [ ] Diseñar ícono de 512x512 px (PNG)
- [ ] Instalar ícono en la app
- [ ] Tomar mínimo 2 capturas de pantalla
- [ ] Escribir descripción corta (80 caracteres)
- [ ] Escribir descripción larga
- [ ] Crear gráfico destacado 1024x500 (opcional)

#### 3.8 Política de Privacidad (PENDIENTE)
- [ ] Editar privacy-policy.html con tu información
- [ ] Reemplazar [FECHA], [TU_EMAIL], [TU_NOMBRE]
- [ ] Subir a hosting (GitHub Pages, o cualquier servidor)
- [ ] Obtener URL pública

#### 3.9 Cuenta de Google Play (PENDIENTE)
- [ ] Crear cuenta de Google Play Developer ($25 USD)
- [ ] Completar perfil de desarrollador
- [ ] Aceptar términos y condiciones

#### 3.10 Crear Aplicación en Play Console (PENDIENTE)
- [ ] Crear nueva aplicación
- [ ] Completar ficha de la tienda:
  - Nombre: Triqui
  - Descripción corta
  - Descripción larga
  - Ícono 512x512
  - Capturas de pantalla (mínimo 2)
  - Categoría: Juegos > Casual
  - Política de privacidad (URL)
- [ ] Completar clasificación de contenido
- [ ] Seleccionar países donde estará disponible

#### 3.11 Subir y Publicar (PENDIENTE)
- [ ] Ir a Producción > Crear versión
- [ ] Subir app-release.aab
- [ ] Agregar notas de la versión
- [ ] Revisar que todo esté completo
- [ ] Enviar a revisión
- [ ] Esperar aprobación (1-7 días)
- [ ] ¡Publicado!

### Recursos creados:
- ✅ Guía completa de publicación (PUBLISHING_GUIDE.md)
- ✅ Instrucciones de keystore (KEYSTORE_INSTRUCTIONS.md)
- ✅ Guía para crear ícono (ICON_GUIDE.md)
- ✅ Plantillas de contenido (PLAY_STORE_CONTENT.md)
- ✅ Política de privacidad (privacy-policy.html)
- ✅ Lista de comandos (BUILD_COMMANDS.md)

### Herramientas recomendadas:
- **Diseño de ícono:** Canva, Figma, Icon Kitchen
- **Hosting de política:** GitHub Pages (gratis)
- **Capturas:** Emulador Android Studio o dispositivo real

---

## 📊 Estado General del Proyecto

```
Desarrollo      ████████████████████  100% ✅
Monetización    ████████████████████  100% ✅
Mejoras v2.0    ████████████████████  100% ✅
Mejoras v2.1    ████████████████████  100% ✅
Pulido Final    ████████████████████  100% ✅
Publicación     ████████░░░░░░░░░░░░   40% ⏳ (EN PROGRESO)
                ────────────────────
Total           ████████████████████   90%
```

**Fase 3 - Desglose:**
```
Preparación     ████████████████████  100% ✅
Documentación   ████████████████████  100% ✅
AdMob IDs       ░░░░░░░░░░░░░░░░░░░░    0% ⏳
Keystore        ░░░░░░░░░░░░░░░░░░░░    0% ⏳
Compilación     ░░░░░░░░░░░░░░░░░░░░    0% ⏳
Assets          ░░░░░░░░░░░░░░░░░░░░    0% ⏳
Play Store      ░░░░░░░░░░░░░░░░░░░░    0% ⏳
```

---

## 🎯 Próximos Pasos Inmediatos

### 📝 Lo que acabamos de hacer:
1. ✅ Configurado nombre e identidad de la app
2. ✅ Configurado versiones en build.gradle.kts
3. ✅ Configurado sistema de firma con keystore
4. ✅ Creado toda la documentación necesaria:
   - PUBLISHING_GUIDE.md (guía completa)
   - KEYSTORE_INSTRUCTIONS.md (generación de keystore)
   - ICON_GUIDE.md (creación de ícono)
   - PLAY_STORE_CONTENT.md (plantillas de texto)
   - privacy-policy.html (política de privacidad)
   - BUILD_COMMANDS.md (comandos útiles)
5. ✅ Actualizado .gitignore para proteger keystore

### 🚀 Próximos pasos (en orden):

**PASO 1: Reemplazar IDs de AdMob** ⏳
- Ve a https://apps.admob.google.com
- Copia tus IDs reales
- Edita `android/app/src/main/AndroidManifest.xml` (línea 34)
- Edita `lib/ad_helper.dart`

**PASO 2: Generar Keystore** ⏳
- Abre PowerShell en la carpeta del proyecto
- Ejecuta el comando de `BUILD_COMMANDS.md`
- Crea archivo `android/key.properties`
- Guarda backup del keystore

**PASO 3: Compilar y Probar** ⏳
```powershell
flutter clean
flutter pub get
flutter build apk --release
# Prueba en tu teléfono
flutter build appbundle --release
```

**PASO 4: Crear Assets** ⏳
- Diseña ícono 512x512 (usa Canva o Icon Kitchen)
- Toma capturas de pantalla (mínimo 2)
- Escribe descripciones (usa plantillas en PLAY_STORE_CONTENT.md)

**PASO 5: Subir a Play Store** ⏳
- Crea cuenta de Google Play Developer ($25 USD)
- Sube el AAB
- Completa toda la información
- Envía a revisión

### 📚 Archivos de referencia creados:
- `PUBLISHING_GUIDE.md` - **Lee este primero** (guía paso a paso completa)
- `BUILD_COMMANDS.md` - Todos los comandos que necesitas
- `KEYSTORE_INSTRUCTIONS.md` - Cómo generar el keystore
- `ICON_GUIDE.md` - Cómo crear el ícono
- `PLAY_STORE_CONTENT.md` - Plantillas de texto listas
- `privacy-policy.html` - Política de privacidad (editar con tus datos)

### ⏱️ Tiempo estimado restante:
- Cambiar IDs de AdMob: 10 minutos
- Generar keystore: 5 minutos
- Compilar y probar: 20 minutos
- Crear ícono: 30-60 minutos
- Tomar capturas: 10 minutos
- Subir a Play Store: 30 minutos
- **Total: ~2-3 horas**

---

## 💡 Ideas de Mejoras Futuras

### ✅ Funcionalidades Implementadas (v2.1 FINAL):
- [x] Modo oscuro con colores neón
- [x] Modo claro elegante y profesional (Material 3)
- [x] Pantalla de inicio profesional
- [x] Navegación entre pantallas
- [x] Contador de victorias (X vs O) persistente
- [x] Sistema de sonidos completo (archivos agregados)
- [x] Botones "Reiniciar" e "Inicio" después del anuncio
- [x] Estadísticas persistentes con actualización automática
- [x] Animación de línea ganadora (brillo dorado en celdas)
- [x] Vibración con HapticFeedback nativo (3 patrones diferentes)
- [x] Delay de 1 segundo antes del anuncio intersticial
- [x] Tema claro mejorado con paleta azul profundo + dorado

### Funcionalidades Pendientes:
- [ ] Temas adicionales (más paletas de colores)
- [ ] Diferentes tamaños de tablero (4x4, 5x5)
- [ ] Modo contra IA (inteligencia artificial)
- [ ] Botón para resetear estadísticas en la UI

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

**Última actualización**: 18 de enero, 2026
**Progreso general**: 90% completado
**Versión actual**: 2.1 FINAL
**Fase actual**: Publicación (40% - Preparación completada)
**Siguiente hito**: Generar keystore y compilar AAB
**Estado**: Documentación de publicación completa, listo para iniciar deployment
