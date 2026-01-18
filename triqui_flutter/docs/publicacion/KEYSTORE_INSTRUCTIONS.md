# 🔐 Instrucciones para Generar Keystore

## ¿Qué es un Keystore?

Es un archivo que contiene la firma digital de tu aplicación. Google Play lo usa para verificar que las actualizaciones provienen de ti.

**⚠️ IMPORTANTE:**
- Si pierdes este archivo, NUNCA podrás actualizar tu app
- Guárdalo en un lugar seguro (USB, nube, etc.)
- Anota la contraseña en un lugar seguro

---

## Paso 1: Generar el Keystore

Abre PowerShell en la carpeta raíz del proyecto y ejecuta:

```powershell
keytool -genkey -v -keystore android/app/upload-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```

### Te pedirá:

1. **Contraseña del keystore**: Elige una contraseña segura (mínimo 6 caracteres)
2. **Confirmar contraseña**
3. **Nombre y apellido**: Tu nombre
4. **Unidad organizacional**: Puedes poner "Desarrollo" o presionar Enter
5. **Organización**: Puedes poner tu nombre o presionar Enter
6. **Ciudad**: Tu ciudad
7. **Estado/Provincia**: Tu estado
8. **Código de país**: MX (México) o tu país
9. **Confirmar** con "yes"
10. **Contraseña para 'upload'**: Usa la misma contraseña (o presiona Enter)

### Ejemplo de ejecución:

```
Enter keystore password: MiPassword123
Re-enter new password: MiPassword123
What is your first and last name?
  [Unknown]:  Juan Perez
What is the name of your organizational unit?
  [Unknown]:  Desarrollo
What is the name of your organization?
  [Unknown]:  
What is the name of your City or Locality?
  [Unknown]:  Ciudad de Mexico
What is the name of your State or Province?
  [Unknown]:  CDMX
What is the two-letter country code for this unit?
  [Unknown]:  MX
Is CN=Juan Perez, OU=Desarrollo, O=Unknown, L=Ciudad de Mexico, ST=CDMX, C=MX correct?
  [no]:  yes

Generating 2,048 bit RSA key pair and self-signed certificate (SHA256withRSA) with a validity of 10,000 days
        for: CN=Juan Perez, OU=Desarrollo, O=Unknown, L=Ciudad de Mexico, ST=CDMX, C=MX
Enter key password for <upload>
        (RETURN if same as keystore password):  
[Storing android/app/upload-keystore.jks]
```

---

## Paso 2: Crear key.properties

1. **Copia** `KEY_PROPERTIES_TEMPLATE.txt` como `android/key.properties`
2. **Edita** el archivo y reemplaza:
   - `TU_PASSWORD_AQUI` con la contraseña que elegiste
   - Verifica que la ruta del `storeFile` sea correcta

Ejemplo de `android/key.properties`:

```properties
storePassword=MiPassword123
keyPassword=MiPassword123
keyAlias=upload
storeFile=C:/Users/Gizmo/Desktop/Dev/personal-projects/mobile_test/triqui_flutter/android/app/upload-keystore.jks
```

---

## Paso 3: Verificar

Verifica que el archivo fue creado:

```powershell
ls android/app/upload-keystore.jks
```

Deberías ver el archivo listado.

---

## 🔒 Seguridad

### ✅ LO QUE DEBES HACER:
- Guardar `upload-keystore.jks` en un lugar seguro (USB, Google Drive cifrado, etc.)
- Anotar la contraseña en un gestor de contraseñas o lugar seguro
- Hacer backups del keystore
- El archivo `key.properties` ya está en `.gitignore` (no se subirá a Git)

### ❌ LO QUE NO DEBES HACER:
- Subir el keystore a Git/GitHub
- Compartir la contraseña
- Perder el archivo (no podrás actualizar la app)
- Usar contraseñas débiles como "123456"

---

## ℹ️ Información Adicional

### ¿Por qué 10,000 días de validez?
Es aproximadamente 27 años. Google recomienda keystore de larga duración.

### ¿Qué es el alias "upload"?
Es el nombre identificador de la clave dentro del keystore. Puedes tener múltiples claves en un keystore.

### Si pierdo el keystore, ¿qué pasa?
Tendrás que publicar una nueva app con un nuevo package name. Perderás todas las descargas y reviews.

---

## 📝 Checklist

- [ ] Ejecuté el comando keytool
- [ ] Se creó el archivo `upload-keystore.jks`
- [ ] Anoté la contraseña en lugar seguro
- [ ] Creé el archivo `android/key.properties`
- [ ] Verifiqué que la ruta en `key.properties` es correcta
- [ ] Hice backup del keystore en lugar seguro
- [ ] Continué con las instrucciones de publicación

---

**Siguiente paso**: Configurar signing en `build.gradle.kts` (ya está en el plan)
