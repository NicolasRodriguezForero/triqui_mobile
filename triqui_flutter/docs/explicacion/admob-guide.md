# 💰 Guía de Integración AdMob - Paso a Paso

## 🎯 Objetivo

Integrar anuncios de Google AdMob en tu juego de triqui para generar ingresos.

---

## 📋 Paso 1: Crear Cuenta de AdMob

### 1.1 Acceder a AdMob

1. Ve a: https://admob.google.com
2. Click en **"Comenzar"** o **"Sign In"**
3. Usa tu cuenta de Google (la misma que usarás para Play Store)

### 1.2 Aceptar Términos

1. Lee y acepta los términos y condiciones
2. Selecciona tu país
3. Acepta las políticas de AdMob

### 1.3 Completar Información

1. **Nombre de la cuenta**: Tu nombre o nombre de tu empresa
2. **Zona horaria**: Selecciona tu zona
3. **Moneda**: USD o tu moneda local

**IMPORTANTE**: 
- La moneda NO se puede cambiar después
- Los pagos se hacen cuando acumulas $100 USD
- Necesitarás configurar método de pago después

---

## 📱 Paso 2: Registrar tu Aplicación

### 2.1 Agregar una App

1. En el dashboard de AdMob, click en **"Apps"** en el menú
2. Click en **"Agregar app"** o **"Add app"**
3. Selecciona la plataforma: **Android**

### 2.2 Información de la App

**¿Tu app ya está publicada en Play Store?**
- Selecciona **"No"** (aún no la has publicado)

**Nombre de la app:**
- Escribe: `Triqui` (o el nombre que quieras)

**Habilitar análisis de usuarios:**
- Activa esta opción (recomendado)

Click en **"Agregar"**

### 2.3 Obtener App ID

Después de crear la app, verás algo como:

```
App ID: ca-app-pub-1234567890123456~0987654321
```

**¡GUARDA ESTE ID!** Lo necesitarás después.

---

## 🎨 Paso 3: Crear Bloques de Anuncios

Necesitas crear 2 tipos de anuncios:

### 3.1 Banner Ad (Anuncio de Banner)

1. En tu app en AdMob, ve a **"Ad units"** (Bloques de anuncios)
2. Click en **"Agregar bloque de anuncios"**
3. Selecciona **"Banner"**
4. Configuración:
   - **Nombre**: `Triqui Banner`
   - Deja las demás opciones por defecto
5. Click en **"Crear bloque de anuncios"**

Obtendrás un **Unit ID** como:
```
ca-app-pub-1234567890123456/1234567890
```

**¡GUARDA ESTE ID!**

### 3.2 Interstitial Ad (Anuncio Intersticial)

1. Click nuevamente en **"Agregar bloque de anuncios"**
2. Selecciona **"Interstitial"** (pantalla completa)
3. Configuración:
   - **Nombre**: `Triqui Interstitial`
   - Deja las demás opciones por defecto
4. Click en **"Crear bloque de anuncios"**

Obtendrás otro **Unit ID** como:
```
ca-app-pub-1234567890123456/0987654321
```

**¡GUARDA ESTE ID!**

---

## 📝 Resumen de IDs

Al final deberías tener 3 IDs:

```
App ID:              ca-app-pub-XXXXXXXXXXXXXXXX~YYYYYYYYYY
Banner Unit ID:      ca-app-pub-XXXXXXXXXXXXXXXX/1111111111
Interstitial Unit ID: ca-app-pub-XXXXXXXXXXXXXXXX/2222222222
```

**Copia estos IDs a un archivo de texto** para usarlos después.

---

## 🔧 Paso 4: Integrar SDK en Flutter

### 4.1 Agregar Dependencia

Abre `pubspec.yaml` y agrega la dependencia de AdMob:

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
  google_mobile_ads: ^5.1.0  # ← AGREGAR ESTA LÍNEA
```

Luego ejecuta:
```bash
flutter pub get
```

### 4.2 Configurar AndroidManifest.xml

Abre `android/app/src/main/AndroidManifest.xml` y agrega tu App ID:

```xml
<manifest>
    <application>
        <!-- Configuración existente... -->
        
        <!-- AGREGAR ESTO (antes de </application>): -->
        <meta-data
            android:name="com.google.android.gms.ads.APPLICATION_ID"
            android:value="ca-app-pub-XXXXXXXXXXXXXXXX~YYYYYYYYYY"/>
        <!-- Reemplaza con tu App ID real -->
        
    </application>
</manifest>
```

**IMPORTANTE**: Reemplaza `ca-app-pub-XXXXXXXXXXXXXXXX~YYYYYYYYYY` con tu App ID real.

---

## 🚀 Paso 5: Inicializar AdMob en tu App

### 5.1 Modificar main.dart

Actualiza tu `lib/main.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';  // ← IMPORTAR

void main() {
  WidgetsFlutterBinding.ensureInitialized();  // ← AGREGAR
  MobileAds.instance.initialize();             // ← INICIALIZAR ADMOB
  
  runApp(TriquiApp());
}

// ... resto del código
```

---

## 📊 Paso 6: Implementar Banner Ad

### 6.1 Crear Archivo de Constantes

Crea un nuevo archivo `lib/ad_helper.dart`:

```dart
import 'dart:io';

class AdHelper {
  // IDs de prueba (úsalos primero para probar)
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
  
  // DESPUÉS de probar, reemplaza con tus IDs reales:
  // return 'ca-app-pub-XXXXXXXXXXXXXXXX/1111111111';
}
```

### 6.2 Agregar Banner al Juego

Modifica tu `lib/main.dart` para incluir el banner.

---

## 🎮 Paso 7: Implementar Interstitial Ad

Los anuncios intersticiales se mostrarán al terminar cada partida.

---

## ✅ Paso 8: Probar los Anuncios

### 8.1 Ejecutar en Emulador

```bash
flutter run
```

### 8.2 Verificar que Funcionen

- **Banner**: Debe aparecer en la parte inferior
- **Interstitial**: Debe aparecer al terminar una partida

### 8.3 IDs de Prueba

**IMPORTANTE**: Usa los IDs de prueba que proporciona Google:

- Banner de prueba: `ca-app-pub-3940256099942544/6300978111`
- Interstitial de prueba: `ca-app-pub-3940256099942544/1033173712`

**NUNCA** hagas click en tus propios anuncios reales (puedes ser baneado).

---

## ⚠️ Advertencias Importantes

### ❌ NO hagas esto:
1. **No hagas click en tus propios anuncios** (banean tu cuenta)
2. **No pidas a amigos/familia que hagan click** (Google lo detecta)
3. **No uses tus IDs reales durante desarrollo** (usa IDs de prueba)

### ✅ SÍ haz esto:
1. **Usa IDs de prueba** durante desarrollo
2. **Cambia a IDs reales** solo cuando publiques
3. **Lee las políticas de AdMob** para evitar infracciones

---

## 📈 Paso 9: Cambiar a IDs Reales

Cuando estés listo para publicar:

1. En `lib/ad_helper.dart`, cambia los IDs de prueba por tus IDs reales
2. Recompila la app: `flutter build appbundle`
3. Sube a Play Store
4. Espera 24-48 horas para que los anuncios se activen

---

## 💰 Pagos de AdMob

### ¿Cuándo te pagan?

- **Mínimo**: $100 USD acumulados
- **Frecuencia**: Mensual (si alcanzaste el mínimo)
- **Método**: Transferencia bancaria, cheque, etc.

### ¿Cuánto se gana?

Depende de:
- **Impresiones**: Cuántas veces se muestra el anuncio
- **Clicks**: Cuántos clicks reciben
- **CPM**: Costo por mil impresiones (varía por país)

**Estimación promedio**:
- 1,000 usuarios activos diarios = $5-20 USD/día (muy variable)

---

## 🎓 Próximos Pasos

1. ✅ Crear cuenta de AdMob
2. ✅ Registrar la app
3. ✅ Obtener IDs
4. ⏳ Modificar código (siguiente paso)
5. ⏳ Probar anuncios
6. ⏳ Publicar en Play Store

---

**Cuando tengas tus IDs de AdMob, avísame para continuar con la implementación en el código.**
