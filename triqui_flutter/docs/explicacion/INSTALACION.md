# 📲 Guía de Instalación de Flutter

## Paso 1: Descargar Flutter

1. Ve a: https://docs.flutter.dev/get-started/install/windows
2. Descarga el archivo ZIP del Flutter SDK
3. Extrae el archivo en `C:\src\flutter` (o donde prefieras, SIN espacios en la ruta)

## Paso 2: Agregar Flutter al PATH

### Opción A: Interfaz Gráfica
1. Presiona `Windows + R`, escribe `sysdm.cpl` y Enter
2. Ve a la pestaña **"Opciones avanzadas"**
3. Click en **"Variables de entorno"**
4. En "Variables del sistema", busca **Path** y haz doble click
5. Click en **"Nuevo"**
6. Agrega: `C:\src\flutter\bin` (o donde instalaste Flutter)
7. Click **"Aceptar"** en todas las ventanas
8. **Reinicia** tu terminal/PowerShell

### Opción B: PowerShell (Administrador)
```powershell
[Environment]::SetEnvironmentVariable(
    "Path",
    [Environment]::GetEnvironmentVariable("Path", "User") + ";C:\src\flutter\bin",
    "User"
)
```

## Paso 3: Verificar Instalación

Abre una **NUEVA** terminal PowerShell y ejecuta:

```bash
flutter doctor
```

Deberías ver algo como:

```
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.x.x)
[✗] Android toolchain - develop for Android devices
    ✗ Unable to locate Android SDK
[✗] Chrome - develop for the web (Not installed)
[✓] Visual Studio - develop for Windows
```

## Paso 4: Instalar Android Studio (para Android)

### ¿Por qué Android Studio?
Necesitas el **Android SDK** y emuladores para probar apps Android.

1. Descarga: https://developer.android.com/studio
2. Instala Android Studio (acepta todo por defecto)
3. Abre Android Studio
4. Ve a **"More Actions" > "SDK Manager"**
5. Instala:
   - ✅ Android SDK Platform-Tools
   - ✅ Android SDK Build-Tools
   - ✅ Android SDK (al menos API 30+)
6. Ve a **"More Actions" > "Virtual Device Manager"**
7. Crea un dispositivo virtual (ej: Pixel 6 con API 33)

## Paso 5: Configurar Flutter con Android

Ejecuta:

```bash
flutter doctor --android-licenses
```

Acepta todas las licencias (escribe `y` y Enter).

Verifica nuevamente:

```bash
flutter doctor
```

Ahora deberías ver:

```
[✓] Flutter
[✓] Android toolchain - develop for Android devices
[✓] Visual Studio - develop for Windows
```

## Paso 6: Ejecutar el Proyecto

```bash
# Ve a la carpeta del proyecto
cd C:\Users\Gizmo\Desktop\Dev\personal-projects\mobile_test\triqui_flutter

# Obtén las dependencias
flutter pub get

# Inicia el emulador Android (desde Android Studio)
# O ejecuta:
flutter emulators --launch <emulator_id>

# Ejecuta la app
flutter run
```

---

## 🎯 Comandos Útiles

```bash
# Ver información de Flutter
flutter doctor -v

# Listar dispositivos conectados
flutter devices

# Listar emuladores disponibles
flutter emulators

# Ejecutar en Chrome (para probar rápido)
flutter run -d chrome

# Limpiar cache del proyecto
flutter clean

# Actualizar Flutter
flutter upgrade
```

---

## ⚡ Atajos Durante la Ejecución

Cuando ejecutes `flutter run`, puedes usar:

- `r` - Hot reload (recarga rápida)
- `R` - Hot restart (reinicio completo)
- `p` - Mostrar grid de construcción
- `o` - Cambiar entre Android e iOS
- `q` - Salir

---

## 🐛 Problemas Comunes

### Error: "flutter no se reconoce"
- **Solución**: Reinicia la terminal después de agregar al PATH

### Error: "Android SDK not found"
- **Solución**: Instala Android Studio y configura el SDK

### Error: "No devices available"
- **Solución**: Inicia un emulador desde Android Studio o conecta un dispositivo físico

### Error al ejecutar `flutter doctor`
- **Solución**: Asegúrate de que la ruta de Flutter esté correctamente en PATH

---

## 📱 Ejecutar en Dispositivo Físico

### Android:
1. Activa **"Opciones de desarrollador"** en tu teléfono
   - Ve a Configuración > Acerca del teléfono
   - Toca 7 veces en "Número de compilación"
2. Activa **"Depuración USB"**
3. Conecta el teléfono por USB
4. Acepta el mensaje de depuración en el teléfono
5. Ejecuta: `flutter devices` (debería aparecer tu teléfono)
6. Ejecuta: `flutter run`

---

## ✅ Checklist Final

- [ ] Flutter instalado (`flutter --version` funciona)
- [ ] `flutter doctor` muestra Flutter ✓
- [ ] Android Studio instalado
- [ ] `flutter doctor` muestra Android toolchain ✓
- [ ] Emulador creado en Android Studio
- [ ] `flutter pub get` ejecutado en el proyecto
- [ ] App ejecutándose: `flutter run`

---

¡Una vez que tengas todo esto, estarás listo para desarrollar apps móviles! 🚀
