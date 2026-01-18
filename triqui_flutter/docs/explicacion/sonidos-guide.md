# 🔊 Guía para Agregar Sonidos Reales

## 📁 Estructura Actual

```
triqui_flutter/
├── assets/
│   └── sounds/
│       ├── victory.mp3  ← NECESITAS CREAR ESTE
│       ├── draw.mp3     ← NECESITAS CREAR ESTE
│       └── click.mp3    ← NECESITAS CREAR ESTE (opcional)
```

---

## 🎵 Dónde Descargar Sonidos Gratis

### 1. **Freesound.org** (Recomendado)
- URL: https://freesound.org/
- Requiere registro gratuito
- Miles de sonidos con licencia Creative Commons
- Busca por:
  - "victory fanfare" o "win sound"
  - "draw" o "tie game"
  - "click" o "tap"

### 2. **Zapsplat.com**
- URL: https://www.zapsplat.com/
- Registro gratuito
- Sonidos de alta calidad
- Categoría: Game Sounds

### 3. **Mixkit.co**
- URL: https://mixkit.co/free-sound-effects/
- No requiere registro
- Menos variedad pero muy fácil

### 4. **Pixabay Sound Effects**
- URL: https://pixabay.com/sound-effects/
- Sonidos libres de derechos
- Sin registro necesario

---

## 📥 Cómo Agregar los Sonidos

### Paso 1: Descargar
1. Ve a cualquiera de los sitios arriba
2. Busca los sonidos que necesitas
3. Descarga en formato `.mp3` o `.wav`
4. Renombra los archivos a:
   - `victory.mp3`
   - `draw.mp3`
   - `click.mp3`

### Paso 2: Colocar en el Proyecto
1. Copia los archivos descargados
2. Pégalos en: `triqui_flutter/assets/sounds/`
3. Los archivos ya están configurados en `pubspec.yaml`

### Paso 3: Probar
1. Ejecuta `flutter pub get` (si no lo has hecho)
2. Ejecuta tu app
3. Los sonidos deberían reproducirse automáticamente

---

## 🎼 Recomendaciones de Sonidos

### Para Victoria:
- **Búsqueda**: "victory fanfare", "level complete", "win chime"
- **Duración**: 1-3 segundos
- **Estilo**: Alegre, triunfante

### Para Empate:
- **Búsqueda**: "neutral tone", "draw sound", "stalemate"
- **Duración**: 1-2 segundos
- **Estilo**: Neutro, sin emoción fuerte

### Para Click:
- **Búsqueda**: "button click", "tap", "UI click"
- **Duración**: < 0.5 segundos
- **Estilo**: Sutil, no intrusivo

---

## 🛠️ Alternativa Rápida: Generar con IA

Si quieres algo rápido, puedes usar generadores de IA:

1. **ElevenLabs Sound Effects** (nuevo)
2. **Soundraw.io**
3. O simplemente buscar "royalty free game sounds"

---

## ⚠️ Si NO Quieres Agregar Sonidos Ahora

La app funcionará perfectamente sin los archivos de sonido. Simplemente:
- No se reproducirán sonidos
- Se imprimirán mensajes en la consola
- El juego seguirá funcionando normal

---

## 🔧 Troubleshooting

### Error: "Unable to load asset"
**Solución**: 
1. Verifica que los archivos estén en `assets/sounds/`
2. Ejecuta `flutter clean`
3. Ejecuta `flutter pub get`
4. Vuelve a ejecutar la app

### Error: "AudioPlayer error"
**Solución**:
1. Verifica que los archivos sean `.mp3` válidos
2. Intenta con archivos más pequeños (< 1MB)
3. Asegúrate de que estén en el formato correcto

### Los sonidos no se escuchan
**Solución**:
1. Verifica el volumen del dispositivo
2. Verifica que la app tenga permisos de audio
3. Prueba con archivos diferentes

---

## 📝 Ejemplo de Nombres de Archivos Válidos

```
✅ CORRECTO:
- victory.mp3
- draw.mp3
- click.mp3

❌ INCORRECTO:
- Victory.mp3 (mayúscula)
- victory sound.mp3 (espacio)
- victory.MP3 (extensión en mayúscula)
- victory.wav (formato diferente, aunque funcionaría)
```

---

## 🎯 Sugerencias Específicas de Freesound

Algunos sonidos específicos que funcionan bien:

1. **Victory**: Busca ID `270404` - "Success Jingle"
2. **Draw**: Busca ID `341695` - "Neutral Beep"
3. **Click**: Busca ID `140774` - "Click Sound"

---

**Nota**: El código ya está listo para usar los sonidos. Solo necesitas colocar los archivos en la carpeta correcta.
