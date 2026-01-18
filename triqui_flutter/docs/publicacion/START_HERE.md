# 🚀 INICIO RÁPIDO - Publicación en Play Store

**¿Listo para publicar tu app? Sigue estos pasos.**

---

## 📚 PASO 0: Lee la documentación (5 minutos)

Antes de empezar, lee rápidamente:
- **CHECKLIST.md** ← EMPIEZA AQUÍ (este archivo con todo el proceso)
- **PUBLISHING_GUIDE.md** ← Guía detallada completa
- **BUILD_COMMANDS.md** ← Lista de comandos útiles

---

## ⚡ PASOS RÁPIDOS

### 1️⃣ Reemplazar IDs de AdMob (10 min)

```powershell
# Edita estos dos archivos:
code android\app\src\main\AndroidManifest.xml  # Línea 34-35
code lib\ad_helper.dart                          # Toda la clase
```

Reemplaza los IDs de prueba con tus IDs reales de AdMob.

---

### 2️⃣ Generar Keystore (5 min)

```powershell
# Genera el keystore
keytool -genkey -v -keystore android/app/upload-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload

# Crea key.properties
Copy-Item KEY_PROPERTIES_TEMPLATE.txt android\key.properties
code android\key.properties  # Edita con tus datos
```

**⚠️ IMPORTANTE:** Guarda backup del keystore y anota la contraseña.

---

### 3️⃣ Compilar (20 min)

```powershell
# Limpia y compila
flutter clean
flutter pub get
flutter build apk --release

# Prueba en tu teléfono
adb install build\app\outputs\flutter-apk\app-release.apk

# Si funciona, compila AAB
flutter build appbundle --release
```

El AAB estará en: `build\app\outputs\bundle\release\app-release.aab`

---

### 4️⃣ Crear Assets (60 min)

1. **Ícono (512x512):**
   - Usa Canva: https://www.canva.com
   - Sigue ICON_GUIDE.md
   - Descarga como PNG

2. **Capturas:**
   - Ejecuta la app
   - Toma 2-4 screenshots

3. **Textos:**
   - Copia de PLAY_STORE_CONTENT.md
   - Personaliza si quieres

---

### 5️⃣ Política de Privacidad (15 min)

```powershell
# Edita el archivo
code privacy-policy.html  # Reemplaza [FECHA], [EMAIL], [NOMBRE]
```

Sube a GitHub Pages o cualquier hosting y **guarda la URL**.

---

### 6️⃣ Cuenta de Play Developer (10 min + $25)

1. Ve a: https://play.google.com/console
2. Crea cuenta de desarrollador
3. Paga $25 USD (pago único)

---

### 7️⃣ Subir a Play Store (30 min)

1. Click "Crear aplicación"
2. Completa toda la información
3. Sube el AAB: `app-release.aab`
4. Envía a revisión
5. ¡Espera 1-7 días!

---

## ✅ CHECKLIST ULTRA-RÁPIDO

```
[ ] Cambié IDs de AdMob
[ ] Generé keystore
[ ] Creé key.properties
[ ] Hice backup del keystore
[ ] Compilé APK y probé
[ ] Compilé AAB
[ ] Creé ícono 512x512
[ ] Tomé capturas de pantalla
[ ] Subí política de privacidad
[ ] Creé cuenta de Play Developer ($25)
[ ] Subí app a Play Console
[ ] Completé toda la información
[ ] Envié a revisión
```

---

## 📂 ARCHIVOS CLAVE

| Archivo | Descripción |
|---------|-------------|
| `CHECKLIST.md` | Lista completa paso a paso |
| `PUBLISHING_GUIDE.md` | Guía detallada |
| `BUILD_COMMANDS.md` | Comandos útiles |
| `KEYSTORE_INSTRUCTIONS.md` | Ayuda con keystore |
| `ICON_GUIDE.md` | Cómo hacer el ícono |
| `PLAY_STORE_CONTENT.md` | Plantillas de texto |
| `privacy-policy.html` | Política de privacidad |

---

## 🆘 PROBLEMAS COMUNES

**"keytool not found"**
```powershell
java -version  # Verifica Java
# Si no está, instala desde: https://adoptium.net/
```

**"Gradle build failed"**
```powershell
cd android
.\gradlew clean
cd ..
flutter clean
flutter pub get
flutter build appbundle --release
```

**"Wrong password"**
- Verifica `android\key.properties`
- Usa la misma contraseña que pusiste al crear el keystore

---

## 🎯 PRÓXIMO PASO

**→ Abre CHECKLIST.md y empieza con la Fase 2**

```powershell
code CHECKLIST.md
```

---

**¡Éxito! 🚀**
