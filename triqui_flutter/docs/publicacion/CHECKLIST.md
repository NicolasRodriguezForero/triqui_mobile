# ✅ CHECKLIST FINAL DE PUBLICACIÓN

Este checklist te guía paso a paso para publicar tu app en Play Store.
**Tiempo estimado total: 2-3 horas**

---

## 📋 FASE 1: CONFIGURACIÓN INICIAL ✅

- [x] Nombre de la app configurado ("Triqui")
- [x] Version configurada (1.0.0+1)
- [x] Application ID configurado
- [x] Build.gradle configurado con signing
- [x] .gitignore actualizado
- [x] Documentación completa creada

**Estado: COMPLETADO ✅**

---

## 📋 FASE 2: REEMPLAZAR IDS DE ADMOB ⏳

**Tiempo: ~10 minutos**

### Paso 1: Obtener tus IDs
- [ ] Ir a https://apps.admob.google.com
- [ ] Seleccionar tu app "Triqui"
- [ ] Ir a "Unidades de anuncios"
- [ ] Copiar:
  - [ ] App ID (formato: `ca-app-pub-XXXXXXXXXXXXXXXX~YYYYYYYYYY`)
  - [ ] Banner Unit ID (formato: `ca-app-pub-XXXXXXXXXXXXXXXX/YYYYYYYYYY`)
  - [ ] Interstitial Unit ID (formato: `ca-app-pub-XXXXXXXXXXXXXXXX/ZZZZZZZZZZ`)

### Paso 2: Actualizar AndroidManifest.xml
- [ ] Abrir `android/app/src/main/AndroidManifest.xml`
- [ ] Línea 34-35: Reemplazar el `android:value` con tu **App ID real**
  ```xml
  <meta-data
      android:name="com.google.android.gms.ads.APPLICATION_ID"
      android:value="TU_APP_ID_REAL_AQUI"/>
  ```

### Paso 3: Actualizar ad_helper.dart
- [ ] Abrir `lib/ad_helper.dart`
- [ ] Reemplazar los IDs de prueba con tus **IDs reales**:
  ```dart
  static String get bannerAdUnitId {
    return 'TU_BANNER_ID_REAL';
  }

  static String get interstitialAdUnitId {
    return 'TU_INTERSTITIAL_ID_REAL';
  }
  ```

**⚠️ Importante:** Guarda los cambios y NO subas estos IDs a Git público.

---

## 📋 FASE 3: GENERAR KEYSTORE ⏳

**Tiempo: ~5 minutos**

### Paso 1: Generar el keystore
- [ ] Abrir PowerShell en la carpeta del proyecto
- [ ] Ejecutar el comando:
  ```powershell
  keytool -genkey -v -keystore android/app/upload-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload
  ```
- [ ] Responder las preguntas:
  - Contraseña (mínimo 6 caracteres): **ANOTA ESTO**
  - Nombre y apellido: Tu nombre
  - Resto: Puedes presionar Enter o completar
  - Confirmar con "yes"

### Paso 2: Crear key.properties
- [ ] Copiar `KEY_PROPERTIES_TEMPLATE.txt` como `android/key.properties`
  ```powershell
  Copy-Item KEY_PROPERTIES_TEMPLATE.txt android\key.properties
  ```
- [ ] Abrir `android/key.properties`
- [ ] Reemplazar:
  - `TU_PASSWORD_AQUI` con tu contraseña del keystore
  - Verificar que la ruta del `storeFile` sea correcta

### Paso 3: Hacer backup
- [ ] Copiar `android/app/upload-keystore.jks` a USB o nube
- [ ] Anotar la contraseña en lugar seguro
- [ ] **¡NUNCA PIERDAS ESTE ARCHIVO!**

---

## 📋 FASE 4: COMPILAR Y PROBAR ⏳

**Tiempo: ~20 minutos**

### Paso 1: Limpiar proyecto
- [ ] Ejecutar:
  ```powershell
  flutter clean
  flutter pub get
  ```

### Paso 2: Compilar APK de prueba
- [ ] Ejecutar:
  ```powershell
  flutter build apk --release
  ```
- [ ] Esperar a que compile (2-5 minutos)
- [ ] Verificar que no haya errores

### Paso 3: Probar en dispositivo
- [ ] Conectar tu teléfono Android por USB
- [ ] Habilitar "Depuración USB" en el teléfono
- [ ] Instalar el APK:
  ```powershell
  adb install build\app\outputs\flutter-apk\app-release.apk
  ```
  O copiar el APK al teléfono e instalarlo manualmente

### Paso 4: Verificar funcionamiento
- [ ] Abrir la app en el teléfono
- [ ] Jugar una partida completa
- [ ] Verificar que aparezca el **banner ad** en la parte inferior
- [ ] Terminar la partida
- [ ] Verificar que aparezca el **interstitial ad**
- [ ] Verificar que las **estadísticas** se guarden
- [ ] Cambiar entre **modo claro y oscuro**
- [ ] Verificar **sonidos y vibración**
- [ ] Confirmar que no hay crashes

### Paso 5: Compilar AAB final
- [ ] Si todo funciona, compilar AAB para Play Store:
  ```powershell
  flutter build appbundle --release
  ```
- [ ] El AAB estará en: `build\app\outputs\bundle\release\app-release.aab`
- [ ] **Este es el archivo que subirás a Play Store**

---

## 📋 FASE 5: CREAR ASSETS ⏳

**Tiempo: ~45-60 minutos**

### Ícono de la App (512x512 px)
- [ ] Abrir https://www.canva.com o usar otra herramienta
- [ ] Crear diseño de 512x512 px
- [ ] Diseñar ícono con:
  - Tablero 3x3
  - X y O visibles
  - Colores atractivos (ver ICON_GUIDE.md)
- [ ] Exportar como PNG (512x512)
- [ ] Guardar como `icon-512x512.png`

### Instalar el ícono
- [ ] Ir a https://romannurik.github.io/AndroidAssetStudio/icons-launcher.html
- [ ] Subir tu ícono
- [ ] Descargar el zip generado
- [ ] Copiar carpetas `mipmap-*` a `android/app/src/main/res/`

### Capturas de Pantalla (mínimo 2)
- [ ] Ejecutar la app en el emulador o dispositivo
- [ ] Tomar screenshots de:
  - [ ] Pantalla de inicio
  - [ ] Juego en modo claro
  - [ ] Juego en modo oscuro (opcional)
  - [ ] Estadísticas (opcional)
- [ ] Guardar en carpeta `screenshots/`

### Textos para Play Store
- [ ] Copiar descripción corta de `PLAY_STORE_CONTENT.md`
- [ ] Copiar descripción larga de `PLAY_STORE_CONTENT.md`
- [ ] Personalizarlas si quieres

---

## 📋 FASE 6: POLÍTICA DE PRIVACIDAD ⏳

**Tiempo: ~15 minutos**

### Opción A: Editar el archivo existente
- [ ] Abrir `privacy-policy.html`
- [ ] Reemplazar:
  - `[FECHA]` con la fecha actual
  - `[TU_EMAIL]` con tu email
  - `[TU_NOMBRE]` con tu nombre
- [ ] Guardar

### Opción B: Usar generador
- [ ] Ir a https://www.freeprivacypolicy.com/free-privacy-policy-generator/
- [ ] Completar el formulario
- [ ] Generar y copiar el HTML

### Subir a hosting
- [ ] **Opción 1 - GitHub Pages (GRATIS):**
  - Crear repo en GitHub
  - Subir `privacy-policy.html`
  - Activar GitHub Pages
  - Copiar URL generada
  
- [ ] **Opción 2 - Google Drive:**
  - Subir el HTML
  - Compartir con "cualquiera con el enlace"
  - Copiar URL
  
- [ ] **Opción 3 - Tu propio hosting**

- [ ] **GUARDAR LA URL** - La necesitarás para Play Store

---

## 📋 FASE 7: CREAR CUENTA DE PLAY DEVELOPER ⏳

**Tiempo: ~10 minutos + $25 USD**

- [ ] Ir a https://play.google.com/console
- [ ] Iniciar sesión con tu cuenta de Google
- [ ] Click en "Crear cuenta de desarrollador"
- [ ] Completar formulario:
  - [ ] Tipo de cuenta: Individual
  - [ ] Nombre de desarrollador: Tu nombre
  - [ ] Email de contacto
  - [ ] Teléfono
  - [ ] Dirección
- [ ] Aceptar términos y condiciones
- [ ] **Pagar $25 USD** (tarjeta de crédito/débito)
- [ ] Esperar confirmación (instantáneo)

---

## 📋 FASE 8: SUBIR A PLAY STORE ⏳

**Tiempo: ~30 minutos**

### Paso 1: Crear nueva aplicación
- [ ] En Play Console, click "Crear aplicación"
- [ ] Completar:
  - Nombre: **Triqui**
  - Idioma predeterminado: **Español (España)**
  - Tipo: **Aplicación**
  - Gratis o de pago: **Gratis**
- [ ] Aceptar políticas
- [ ] Click "Crear aplicación"

### Paso 2: Completar "Presencia en Store"
- [ ] Panel izquierdo > **Presencia en Store** > **Ficha principal**
- [ ] **Detalles de la aplicación:**
  - [ ] Nombre: Triqui
  - [ ] Descripción corta (80 caracteres)
  - [ ] Descripción completa
- [ ] **Gráficos:**
  - [ ] Ícono: Subir icon-512x512.png
  - [ ] Gráfico destacado 1024x500 (opcional, puedes saltarlo)
  - [ ] Capturas de pantalla: Subir mínimo 2
- [ ] **Categorización:**
  - [ ] Tipo: Juego
  - [ ] Categoría: Casual (o Puzzle)
  - [ ] Etiquetas: triqui, tic tac toe, estrategia
- [ ] **Datos de contacto:**
  - [ ] Email de contacto
  - [ ] Sitio web (opcional)
  - [ ] Política de privacidad: **TU URL AQUÍ**
- [ ] Guardar

### Paso 3: Clasificación de contenido
- [ ] Panel izquierdo > **Clasificación de contenido**
- [ ] Click "Iniciar cuestionario"
- [ ] Email: Tu email
- [ ] Categoría: **Juegos**
- [ ] Responder cuestionario (todo "No"):
  - [ ] Violencia: No
  - [ ] Sexualidad: No
  - [ ] Lenguaje: No
  - [ ] Sustancias: No
  - [ ] Apuestas: No
- [ ] Calcular clasificación
- [ ] Enviar

### Paso 4: Público objetivo
- [ ] Panel izquierdo > **Público objetivo y contenido**
- [ ] Grupo de edad: **Todas las edades**
- [ ] ¿Dirigida a niños?: **No** (porque tiene anuncios)
- [ ] Guardar

### Paso 5: Subir el AAB
- [ ] Panel izquierdo > **Producción**
- [ ] Click "Crear versión"
- [ ] Subir archivo: `build\app\outputs\bundle\release\app-release.aab`
- [ ] Esperar a que se procese
- [ ] **Notas de la versión:**
  ```
  🎉 Versión inicial de Triqui

  ✨ Incluye:
  • Juego completo para 2 jugadores
  • Dos temas elegantes (claro y oscuro)
  • Sistema de estadísticas persistente
  • Animación de línea ganadora
  • Efectos de sonido y vibración
  • Interfaz moderna y fluida
  ```
- [ ] Guardar

### Paso 6: Configurar países
- [ ] **Países y regiones:** Seleccionar países
  - Recomendado: Todos los países hispanohablantes
  - O simplemente "Todos los países"

### Paso 7: Revisar y enviar
- [ ] Revisar que todas las secciones estén completas (✓ verde)
- [ ] Resolver cualquier advertencia o error
- [ ] Click **"Enviar a revisión"**
- [ ] Confirmar

---

## 📋 FASE 9: ESPERAR APROBACIÓN ⏳

**Tiempo: 1-7 días**

- [ ] Recibirás un email cuando sea aprobada
- [ ] Revisa el estado en Play Console
- [ ] Una vez aprobada, estará disponible en Play Store
- [ ] Comparte el link con amigos y familia

**Link de tu app será:**
```
https://play.google.com/store/apps/details?id=com.example.triqui_flutter
```

---

## 🎉 ¡PUBLICADO!

### Después de publicar:
- [ ] Compartir en redes sociales
- [ ] Pedir a amigos que descarguen y dejen reseña
- [ ] Monitorear estadísticas en Play Console
- [ ] Responder a reseñas de usuarios
- [ ] Planear futuras actualizaciones

---

## 📊 RESUMEN DE PROGRESO

```
[x] Fase 1: Configuración inicial      (100%)
[ ] Fase 2: IDs de AdMob                (  0%)
[ ] Fase 3: Keystore                    (  0%)
[ ] Fase 4: Compilar y probar           (  0%)
[ ] Fase 5: Assets                      (  0%)
[ ] Fase 6: Política de privacidad      (  0%)
[ ] Fase 7: Cuenta de desarrollador     (  0%)
[ ] Fase 8: Subir a Play Store          (  0%)
[ ] Fase 9: Aprobación                  (  0%)
```

---

## 🆘 SI TIENES PROBLEMAS

Consulta estos archivos:
- **PUBLISHING_GUIDE.md** - Guía detallada completa
- **BUILD_COMMANDS.md** - Todos los comandos
- **KEYSTORE_INSTRUCTIONS.md** - Ayuda con keystore
- **ICON_GUIDE.md** - Ayuda con el ícono

O busca el error específico en:
- Stack Overflow
- Flutter Discord
- Documentación oficial de Flutter

---

**¡Buena suerte con tu publicación! 🚀**

Recuerda: Es normal encontrar pequeños obstáculos. ¡No te rindas!
