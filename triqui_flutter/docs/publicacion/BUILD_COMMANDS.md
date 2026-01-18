# 🚀 Script de Comandos para Publicación

Este archivo contiene todos los comandos necesarios para el proceso de publicación.
Copia y pega en PowerShell según necesites.

---

## 🔐 Paso 1: Generar Keystore

```powershell
# Navega a la carpeta del proyecto
cd C:\Users\Gizmo\Desktop\Dev\personal-projects\mobile_test\triqui_flutter

# Genera el keystore (te pedirá información)
keytool -genkey -v -keystore android/app/upload-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```

**Importante:** Anota la contraseña que uses en un lugar seguro.

---

## 📝 Paso 2: Crear key.properties

```powershell
# Copia la plantilla
Copy-Item KEY_PROPERTIES_TEMPLATE.txt android\key.properties

# Edita el archivo (se abrirá en Notepad)
notepad android\key.properties
```

**Reemplaza:**
- `TU_PASSWORD_AQUI` con tu contraseña del keystore
- Verifica que la ruta sea correcta

---

## 🧹 Paso 3: Limpiar Proyecto

```powershell
# Limpia el cache de Flutter
flutter clean

# Descarga dependencias
flutter pub get
```

---

## 📱 Paso 4: Compilar APK de Prueba

```powershell
# Compila APK de release
flutter build apk --release

# El APK estará en:
# build\app\outputs\flutter-apk\app-release.apk

# Para instalarlo en tu teléfono conectado:
flutter install
```

---

## 📦 Paso 5: Compilar AAB para Play Store

```powershell
# Compila Android App Bundle (AAB)
flutter build appbundle --release

# El AAB estará en:
# build\app\outputs\bundle\release\app-release.aab
```

---

## 🔍 Paso 6: Verificar Archivos Compilados

```powershell
# Ver el APK generado
ls build\app\outputs\flutter-apk\app-release.apk

# Ver el AAB generado
ls build\app\outputs\bundle\release\app-release.aab

# Ver tamaño de los archivos
ls -l build\app\outputs\bundle\release\app-release.aab
```

---

## 📊 Paso 7: Analizar el APK (Opcional)

```powershell
# Ver información del APK
flutter build apk --release --analyze-size

# O usa bundletool (si lo tienes instalado)
bundletool build-apks --bundle=build\app\outputs\bundle\release\app-release.aab --output=app.apks
```

---

## 🧪 Paso 8: Probar en Dispositivo

```powershell
# Ver dispositivos conectados
flutter devices

# Instalar APK en dispositivo conectado
adb install build\app\outputs\flutter-apk\app-release.apk

# O directamente con Flutter
flutter install
```

---

## 🎨 Paso 9: Generar Ícono (si usas flutter_launcher_icons)

```powershell
# Primero, agrega la dependencia en pubspec.yaml:
# dev_dependencies:
#   flutter_launcher_icons: ^0.13.1
#
# flutter_launcher_icons:
#   android: true
#   image_path: "assets/icon/icon.png"

# Descarga la dependencia
flutter pub get

# Genera los íconos
flutter pub run flutter_launcher_icons
```

---

## 📸 Paso 10: Tomar Capturas de Pantalla

```powershell
# Ejecuta la app en el emulador
flutter run

# En otra terminal, toma screenshots
flutter screenshot

# Los guardará en la carpeta raíz del proyecto
```

---

## 🔄 Comandos Útiles Durante Desarrollo

```powershell
# Ver versión de Flutter
flutter --version

# Ver información del sistema
flutter doctor

# Ejecutar en modo release (más rápido)
flutter run --release

# Ver logs en tiempo real
flutter logs

# Limpiar y reconstruir todo
flutter clean && flutter pub get && flutter run
```

---

## 📋 Checklist Rápido

```powershell
# Ejecuta estos comandos en orden:

# 1. Generar keystore
keytool -genkey -v -keystore android/app/upload-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload

# 2. Crear y editar key.properties
Copy-Item KEY_PROPERTIES_TEMPLATE.txt android\key.properties
notepad android\key.properties

# 3. Limpiar y preparar
flutter clean
flutter pub get

# 4. Compilar AAB
flutter build appbundle --release

# 5. Verificar
ls build\app\outputs\bundle\release\app-release.aab
```

---

## 🆘 Solución de Problemas

### Error: "keytool not found"
```powershell
# Verifica que Java esté instalado
java -version

# Si no está, descarga JDK desde:
# https://adoptium.net/
```

### Error: "Flutter SDK not found"
```powershell
# Verifica instalación
flutter doctor

# Verifica PATH
echo $env:PATH
```

### Error: "Gradle build failed"
```powershell
# Limpia el proyecto Android
cd android
.\gradlew clean
cd ..

# Luego limpia Flutter
flutter clean
flutter pub get

# Intenta de nuevo
flutter build appbundle --release
```

### Error: "Execution failed for task ':app:signReleaseBundle'"
```powershell
# Verifica que key.properties exista
ls android\key.properties

# Verifica que el keystore exista
ls android\app\upload-keystore.jks

# Verifica que las rutas y contraseñas sean correctas
notepad android\key.properties
```

### Error: "INSTALL_FAILED_UPDATE_INCOMPATIBLE"
```powershell
# Desinstala la versión anterior primero
adb uninstall com.example.triqui_flutter

# Luego instala la nueva
adb install build\app\outputs\flutter-apk\app-release.apk
```

---

## 📂 Estructura de Archivos Después de Compilar

```
triqui_flutter/
├── android/
│   ├── app/
│   │   └── upload-keystore.jks          ← Tu keystore (GUARDAR)
│   └── key.properties                    ← Configuración (NO subir a Git)
├── build/
│   └── app/
│       └── outputs/
│           ├── flutter-apk/
│           │   └── app-release.apk       ← Para probar
│           └── bundle/
│               └── release/
│                   └── app-release.aab   ← Para Play Store
└── ...
```

---

## 📤 Subir a Play Store

1. Ve a: https://play.google.com/console
2. Crea nueva aplicación
3. Completa todos los datos
4. En "Producción" > "Crear versión"
5. Sube: `build\app\outputs\bundle\release\app-release.aab`
6. Completa notas de la versión
7. Envía a revisión

---

## 🔒 Seguridad - Backup del Keystore

```powershell
# Crea backup del keystore
Copy-Item android\app\upload-keystore.jks "$env:USERPROFILE\Desktop\BACKUP_KEYSTORE_TRIQUI.jks"

# O cópialo a una USB o nube
# ¡NUNCA LO PIERDAS!
```

---

## 📊 Ver Tamaño de la App

```powershell
# Ver tamaño del APK
(Get-Item build\app\outputs\flutter-apk\app-release.apk).Length / 1MB

# Ver tamaño del AAB
(Get-Item build\app\outputs\bundle\release\app-release.aab).Length / 1MB
```

---

## 🎯 Siguiente Paso

Después de compilar exitosamente:
1. Prueba el APK en tu dispositivo
2. Verifica que los anuncios funcionen (si cambiaste los IDs)
3. Crea ícono de 512x512
4. Toma capturas de pantalla
5. Sube a Play Store

---

**¡Buena suerte con la publicación!** 🚀
