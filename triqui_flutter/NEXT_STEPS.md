# 🚀 PRÓXIMOS PASOS - Publicación Play Store

## ✅ DECISIONES TOMADAS

1. **Estructura de archivos:** Mantener todo como está
   - `triqui.html` → Versión web (no tocar)
   - `triqui_flutter/` → App móvil (trabajar aquí)

2. **Cuenta de Google:** Usar cuenta personal existente
   - AdMob: Cuenta personal ✅
   - Play Developer: Misma cuenta ✅

---

## 📋 CHECKLIST DE PUBLICACIÓN

### PASO 1: Obtener IDs de AdMob (10 min)

1. Ve a https://apps.admob.google.com (con tu cuenta personal)
2. Selecciona tu app "Triqui" 
3. Ve a "Unidades de anuncios"
4. Copia estos 3 IDs:

```
App ID: ca-app-pub-XXXXXXXXXXXXXXXX~YYYYYYYYYY
Banner Unit ID: ca-app-pub-XXXXXXXXXXXXXXXX/YYYYYYYYYY
Interstitial Unit ID: ca-app-pub-XXXXXXXXXXXXXXXX/ZZZZZZZZZZ
```

5. **Editar archivo 1:**
```powershell
code android\app\src\main\AndroidManifest.xml
```
Línea 35, reemplazar:
```xml
android:value="ca-app-pub-3677224488014449~3442643211"/>
```
Con tu App ID real.

6. **Editar archivo 2:**
```powershell
code lib\ad_helper.dart
```
Reemplazar ambos IDs con tus IDs reales.

---

### PASO 2: Generar Keystore (5 min)

```powershell
# En PowerShell, dentro de triqui_flutter/
keytool -genkey -v -keystore android/app/upload-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```

**Te preguntará:**
- Contraseña: Elige una (mínimo 6 caracteres) - **ANÓTALA**
- Nombre: Tu nombre
- Resto: Puedes dar Enter o completar
- Confirmar: "yes"

**Crear key.properties:**
```powershell
# Copia la plantilla
Copy-Item KEY_PROPERTIES_TEMPLATE.txt android\key.properties

# Edita con tus datos
code android\key.properties
```

Reemplaza:
- `TU_PASSWORD_AQUI` → tu contraseña
- Verifica la ruta del `storeFile`

**Hacer backup:**
```powershell
# Copia a tu escritorio o USB
Copy-Item android\app\upload-keystore.jks "$env:USERPROFILE\Desktop\BACKUP_triqui_keystore.jks"
```

---

### PASO 3: Compilar y Probar (20 min)

```powershell
# Limpiar
flutter clean
flutter pub get

# Compilar APK de prueba
flutter build apk --release

# Instalar en tu teléfono (conectado por USB)
adb install build\app\outputs\flutter-apk\app-release.apk
```

**Probar en el teléfono:**
- ✅ El juego funciona
- ✅ Aparecen los anuncios REALES
- ✅ Estadísticas se guardan
- ✅ No hay crashes

**Si todo funciona, compilar AAB:**
```powershell
flutter build appbundle --release
```

El AAB estará en: `build\app\outputs\bundle\release\app-release.aab`

---

### PASO 4: Crear Ícono (30-60 min)

**Opción 1: Canva (Gratis, fácil)**
1. Ve a https://www.canva.com
2. Crear diseño 512x512 px
3. Diseña con tablero 3x3, X y O
4. Exportar PNG

**Opción 2: Icon Kitchen (Automático)**
1. Ve a https://icon.kitchen
2. Sube una imagen
3. Ajusta colores
4. Descargar

**Instalar el ícono:**
1. Ve a https://romannurik.github.io/AndroidAssetStudio/icons-launcher.html
2. Sube tu PNG 512x512
3. Descargar zip
4. Copiar carpetas `mipmap-*` a `android/app/src/main/res/`

---

### PASO 5: Tomar Capturas (10 min)

Necesitas mínimo 2 capturas:
- Pantalla de inicio
- Juego en progreso

---

### PASO 6: Editar Política de Privacidad (10 min)

```powershell
code privacy-policy.html
```

Reemplazar: `[FECHA]`, `[TU_EMAIL]`, `[TU_NOMBRE]`

**Subirlo:** GitHub Pages o Google Drive y copiar URL

---

### PASO 7: Cuenta Play Developer ($25)

1. Ve a https://play.google.com/console
2. Usa tu cuenta personal de Google
3. Crear cuenta de desarrollador:
   - Tipo: **Individual** (no Organización)
   - Nombre de desarrollador: **"Gizmo Games"** (o el que prefieras)
     * Este nombre aparecerá en Play Store
     * Puede ser un nombre artístico/profesional
     * No necesitas empresa registrada
   - Email: Tu email personal
   - Teléfono: Tu teléfono
4. Pagar $25 USD

---

### PASO 8: Subir a Play Store (30 min)

1. Crear aplicación "Triqui"
2. Completar toda la información
3. Subir AAB
4. Enviar a revisión

---

## ⏰ TIEMPO TOTAL: 2.5 horas + $25 USD

---

## 🎯 EMPIEZA AHORA

```powershell
# Ve a AdMob
start https://apps.admob.google.com
```

**¡Éxito! 🚀**
