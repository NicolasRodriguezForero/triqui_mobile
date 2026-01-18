# 📱 Guía Completa de Publicación en Play Store

## 📋 Checklist General

### Antes de Compilar:
- [x] Nombre de la app configurado ("Triqui")
- [x] Version configurada (1.0.0+1)
- [x] Application ID configurado (com.example.triqui_flutter)
- [ ] IDs de AdMob cambiados a producción
- [ ] Keystore generado
- [ ] key.properties configurado
- [ ] build.gradle.kts configurado para signing
- [ ] Permisos de Internet en AndroidManifest.xml

### Compilación:
- [ ] `flutter clean` ejecutado
- [ ] `flutter pub get` ejecutado
- [ ] APK de release compilado y probado
- [ ] AAB de release compilado

### Para Play Store:
- [ ] Cuenta de Play Developer creada ($25 USD)
- [ ] Ícono de 512x512 px creado
- [ ] Mínimo 2 capturas de pantalla tomadas
- [ ] Descripción corta escrita (80 caracteres max)
- [ ] Descripción larga escrita
- [ ] Política de privacidad creada
- [ ] Clasificación de contenido completada

---

## 🔧 Paso 1: Reemplazar IDs de AdMob

Actualmente tienes IDs de prueba. Necesitas cambiarlos por tus IDs reales de AdMob.

### 1.1 Obtener tus IDs reales

1. Ve a https://apps.admob.google.com
2. Selecciona tu app "Triqui"
3. Ve a "Unidades de anuncios"
4. Copia:
   - **App ID** (formato: `ca-app-pub-XXXXXXXXXXXXXXXX~YYYYYYYYYY`)
   - **Banner Ad Unit ID** (formato: `ca-app-pub-XXXXXXXXXXXXXXXX/YYYYYYYYYY`)
   - **Interstitial Ad Unit ID** (formato: `ca-app-pub-XXXXXXXXXXXXXXXX/ZZZZZZZZZZ`)

### 1.2 Actualizar AndroidManifest.xml

Edita `android/app/src/main/AndroidManifest.xml`:

```xml
<meta-data
    android:name="com.google.android.gms.ads.APPLICATION_ID"
    android:value="TU_APP_ID_REAL_AQUI"/>
```

### 1.3 Actualizar ad_helper.dart

Edita `lib/ad_helper.dart` y reemplaza con tus IDs reales:

```dart
class AdHelper {
  static String get bannerAdUnitId {
    return 'ca-app-pub-XXXXXXXXXXXXXXXX/YYYYYYYYYY';
  }

  static String get interstitialAdUnitId {
    return 'ca-app-pub-XXXXXXXXXXXXXXXX/ZZZZZZZZZZ';
  }
}
```

---

## 🔐 Paso 2: Generar Keystore

Sigue las instrucciones en `KEYSTORE_INSTRUCTIONS.md`.

**Resumen rápido:**
```powershell
keytool -genkey -v -keystore android/app/upload-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```

---

## ⚙️ Paso 3: Configurar Signing

Ya está configurado automáticamente, solo verifica que exista `android/key.properties`.

---

## 🏗️ Paso 4: Compilar la App

### 4.1 Limpiar proyecto

```powershell
flutter clean
flutter pub get
```

### 4.2 Compilar APK de prueba (opcional)

Para probar en tu dispositivo antes de subir:

```powershell
flutter build apk --release
```

El APK estará en: `build/app/outputs/flutter-apk/app-release.apk`

**Instálalo en tu teléfono y prueba:**
- Que funcione el juego
- Que aparezcan los anuncios reales
- Que no haya crashes

### 4.3 Compilar AAB para Play Store

```powershell
flutter build appbundle --release
```

El AAB estará en: `build/app/outputs/bundle/release/app-release.aab`

**Este es el archivo que subirás a Play Store.**

---

## 🎨 Paso 5: Preparar Assets

### 5.1 Ícono de App (512x512 px)

Necesitas un ícono cuadrado de 512x512 px en PNG.

**Opciones:**
1. Diseñar en Canva: https://www.canva.com
2. Usar generador de íconos: https://icon.kitchen
3. Contratar en Fiverr (desde $5 USD)

**Recomendaciones:**
- Fondo sólido o degradado
- Símbolo simple y reconocible (X y O del triqui)
- Sin texto (o texto mínimo)
- Formato PNG con fondo no transparente

### 5.2 Capturas de Pantalla

Necesitas mínimo 2 capturas (máximo 8).

**Cómo tomarlas:**

1. Ejecuta tu app en el emulador o dispositivo real
2. Toma screenshots de:
   - Pantalla de inicio
   - Juego en modo claro
   - Juego en modo oscuro
   - Estadísticas

**Dimensiones recomendadas:**
- 1080 x 1920 px (portrait)
- O las dimensiones nativas de tu dispositivo

**En Android Studio:**
- Botón de cámara en el panel del emulador
- O usa `Win + Print Screen` y recorta

### 5.3 Descripción Corta (80 caracteres)

Ejemplo:
```
Clásico juego de Triqui para 2 jugadores. ¡Compite y gana!
```

### 5.4 Descripción Larga (4000 caracteres max)

Ejemplo:

```
🎮 TRIQUI - El Clásico Juego de Estrategia

¡Disfruta del juego de Triqui (Tic-Tac-Toe) más divertido y elegante para Android!

✨ CARACTERÍSTICAS:
• 🎯 Modo para 2 jugadores en el mismo dispositivo
• 📊 Estadísticas persistentes (victorias X, victorias O, empates)
• 🎨 Dos temas elegantes: Modo Claro y Modo Oscuro con efectos neón
• ✨ Animación de línea ganadora con efectos visuales
• 📳 Vibración táctil en cada jugada
• 🎵 Efectos de sonido inmersivos
• 🚀 Interfaz fluida y moderna

🎲 CÓMO JUGAR:
1. Los jugadores se turnan colocando X y O en el tablero 3x3
2. El primer jugador en alinear 3 símbolos en fila, columna o diagonal gana
3. Si el tablero se llena sin ganador, es empate

🏆 ESTADÍSTICAS:
Lleva el registro de todas tus victorias y desafía a tus amigos a superarte.

📱 DISEÑO ELEGANTE:
• Modo Claro: Diseño profesional con Material Design
• Modo Oscuro: Efectos neón futuristas en azul cian y magenta

🎯 PERFECTO PARA:
• Pasar el tiempo con amigos
• Desarrollar estrategia y pensamiento lógico
• Todas las edades (niños, jóvenes, adultos)

¡Descarga TRIQUI ahora y comienza a jugar! 🎉

---

NOTA: Contiene anuncios.
```

---

## 🌐 Paso 6: Crear Política de Privacidad

Como tu app usa anuncios (AdMob), Google **requiere** una política de privacidad.

### Opción 1: Usar generador automático

1. Ve a: https://www.freeprivacypolicy.com/free-privacy-policy-generator/
2. Completa:
   - Nombre de la app: Triqui
   - Plataforma: Mobile App (Android)
   - Servicios: Google AdMob
3. Genera y copia el texto

### Opción 2: Usar GitHub Pages (gratis)

1. Crea un repositorio en GitHub (puede ser privado)
2. Sube un archivo `privacy-policy.html`
3. Activa GitHub Pages en Settings > Pages
4. Usa la URL generada

### Contenido mínimo:

```markdown
# Política de Privacidad - Triqui

Última actualización: [FECHA]

Esta aplicación ("Triqui") no recopila, almacena ni comparte información personal de los usuarios.

## Anuncios

Esta aplicación muestra anuncios mediante Google AdMob. AdMob puede recopilar información del dispositivo como:
- Identificador de publicidad
- Dirección IP
- Información del dispositivo

Para más información sobre cómo Google usa estos datos, visita:
https://policies.google.com/privacy

## Datos Locales

La aplicación almacena estadísticas de juego (victorias, empates) únicamente en tu dispositivo. Estos datos no se comparten.

## Contacto

Para consultas sobre esta política, contacta: tuemail@ejemplo.com
```

---

## 🏪 Paso 7: Publicar en Play Store

### 7.1 Crear cuenta de Play Developer

1. Ve a: https://play.google.com/console
2. Crea cuenta ($25 USD, pago único)
3. Completa tu perfil de desarrollador

### 7.2 Crear nueva aplicación

1. Click en "Crear aplicación"
2. Completa:
   - Nombre: **Triqui**
   - Idioma predeterminado: **Español (España) - es-ES**
   - Tipo: **Aplicación**
   - Gratis o de pago: **Gratis**
3. Acepta las políticas

### 7.3 Completar la ficha de la tienda

**Panel izquierdo > Presencia en Store > Ficha de Play Store principal**

1. **Detalles de la aplicación:**
   - Nombre: Triqui
   - Descripción corta: (tu descripción de 80 caracteres)
   - Descripción completa: (tu descripción larga)

2. **Gráficos:**
   - Ícono de la app: 512x512 px (PNG)
   - Gráfico destacado: 1024x500 px (opcional pero recomendado)
   - Capturas de pantalla del teléfono: Mínimo 2 (máximo 8)

3. **Categorización:**
   - Aplicación o juego: **Juego**
   - Categoría: **Casual** o **Puzzle**
   - Etiquetas: triqui, tic tac toe, juego de mesa, estrategia

4. **Datos de contacto:**
   - Email: tu email
   - Sitio web: (opcional)
   - Política de privacidad: URL de tu política

### 7.4 Clasificación de contenido

**Panel izquierdo > Clasificación de contenido**

1. Click en "Iniciar cuestionario"
2. Categoría: **Juegos**
3. Completa el cuestionario:
   - ¿Violencia? No
   - ¿Contenido sexual? No
   - ¿Lenguaje ofensivo? No
   - ¿Contenido para adultos? No
   - ¿Sustancias controladas? No
   - ¿Apuestas simuladas? No
4. Enviar

### 7.5 Público objetivo

**Panel izquierdo > Público objetivo y contenido**

1. Grupo de edad: **Todas las edades** (o específico)
2. ¿App dirigida a niños? **No** (si usas anuncios)

### 7.6 Subir el AAB

**Panel izquierdo > Producción**

1. Click en "Crear versión"
2. Sube `app-release.aab`
3. Agrega notas de la versión:
   ```
   - Versión inicial
   - Juego de Triqui para 2 jugadores
   - Dos temas (claro y oscuro)
   - Estadísticas persistentes
   - Efectos de sonido y vibración
   ```
4. Guardar y continuar

### 7.7 Países y regiones

Selecciona los países donde estará disponible (puedes elegir todos).

### 7.8 Enviar a revisión

1. Revisa que todo esté completo
2. Click en "Enviar a revisión"
3. Espera aprobación (1-7 días)

---

## ⏰ Línea de Tiempo

| Tarea | Tiempo Estimado |
|-------|-----------------|
| Generar keystore | 5 minutos |
| Configurar signing | 10 minutos |
| Cambiar IDs de AdMob | 10 minutos |
| Compilar AAB | 5 minutos |
| Crear ícono | 30-60 minutos |
| Tomar capturas | 10 minutos |
| Escribir descripciones | 20 minutos |
| Crear política de privacidad | 15 minutos |
| Crear cuenta Play Developer | 10 minutos |
| Completar ficha de tienda | 30 minutos |
| **TOTAL** | **~3 horas** |

---

## 🆘 Problemas Comunes

### "Keystore not found"
- Verifica la ruta en `key.properties`
- Usa rutas absolutas

### "Wrong password"
- Verifica las contraseñas en `key.properties`
- Regenera el keystore si olvidaste la contraseña

### "Build failed"
```powershell
flutter clean
flutter pub get
flutter build appbundle --release
```

### "App no instalada" al probar APK
- Desinstala versión anterior primero
- Verifica que el APK esté firmado

---

## 📚 Recursos

- Play Console: https://play.google.com/console
- Flutter Deployment: https://docs.flutter.dev/deployment/android
- AdMob: https://admob.google.com
- Material Design Icons: https://fonts.google.com/icons

---

## ✅ Checklist Final Antes de Publicar

- [ ] App probada en dispositivo real
- [ ] Anuncios funcionando correctamente
- [ ] No hay crashes ni bugs evidentes
- [ ] Todos los textos están en español correcto
- [ ] Ícono se ve bien
- [ ] Capturas de pantalla son atractivas
- [ ] Descripción es clara y atractiva
- [ ] Política de privacidad está accesible
- [ ] AAB compilado exitosamente
- [ ] Keystore guardado en lugar seguro
- [ ] Contraseñas anotadas en lugar seguro

---

**¡Buena suerte con tu publicación! 🚀**

Después de publicar, comparte el link de Play Store con amigos y familiares para conseguir las primeras descargas.
