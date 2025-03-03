# LandingDocs
# C-Project: Repositorio Oficial

Bienvenido al repositorio oficial de C-Project. Este documento describe las políticas de administración, contribución y gobernanza del proyecto.

## 📜 Política de Administración del Repositorio Git

### 📌 1. Estructura del Repositorio
El repositorio se divide en las siguientes ramas principales:

- **main (o master)**: Código estable en producción. Se actualiza solo mediante pull requests (PRs) revisadas y aprobadas.
- **develop**: Rama de desarrollo donde se integran cambios antes de fusionarlos en main.
- **feature/{nombre}**: Ramas para nuevas funcionalidades (Ejemplo: `feature/implement-pog`).
- **bugfix/{nombre}**: Ramas para corregir errores identificados (Ejemplo: `bugfix/fix-energy-validation`).
- **hotfix/{nombre}**: Ramas para correcciones críticas en main.

### 📌 2. Estrategia de Branching (Git Flow)

1️⃣ **Nuevas características o correcciones** → Crear una rama `feature/{nombre}` o `bugfix/{nombre}` desde `develop`.  
2️⃣ **Desarrollo y pruebas** → Se trabaja en la rama correspondiente y se testea el código.  
3️⃣ **Pull Request (PR) a develop** → Revisión por otros miembros antes de fusionar.  
4️⃣ **Integración en develop** → Se fusiona el cambio una vez aprobado.  
5️⃣ **Lanzamientos a producción** → Cuando `develop` está listo, se genera una versión (`release/{versión}`) y se fusiona en `main`.  
6️⃣ **Corrección urgente en main** → Se crea un `hotfix/{nombre}` desde `main`, se corrige y se fusiona en `main` y `develop`.

### 📌 3. Contribuciones y Revisiones

✔ **Reglas para contribuir:**
- Cada contribución debe ir en una rama específica (`feature/`, `bugfix/`).
- Se requiere una descripción clara en los PRs.
- Se recomienda usar commits pequeños y bien documentados.

✔ **Proceso de revisión:**
- Todo PR debe ser revisado por al menos 2 miembros antes de aprobarse.
- Se utilizan checks automáticos (CI/CD) para validar código y pruebas.
- Se permiten discusiones en los PRs antes de fusionarlos.

✔ **Estilo de commits (Convencional Commits):**
```bash
tipo(scope): descripción corta en presente
```
Ejemplos:
✅ `feat(consensus): implement Proof-of-Generation validation`
✅ `fix(api): correct energy audit timestamp format`
✅ `docs(readme): update contributing guidelines`

**Tipos de commits válidos:**
- `feat`: Nueva funcionalidad.
- `fix`: Corrección de errores.
- `docs`: Cambios en documentación.
- `style`: Ajustes en formato/código sin afectar funcionalidad.
- `refactor`: Reestructuración de código sin cambios funcionales.
- `test`: Agregar o modificar pruebas.

### 📌 4. Lanzamientos y Versionado (SemVer)

Usamos Semantic Versioning:
```bash
MAJOR.MINOR.PATCH
```
Ejemplo:  
- `1.0.0` → Primera versión estable.
- `1.1.0` → Nueva funcionalidad.
- `1.1.1` → Corrección de bug.

### 📌 5. Seguridad y Gobernanza del Repositorio

🔒 **Accesos y Roles**
- Solo miembros de la fundación pueden fusionar PRs en `main`.
- Colaboradores externos pueden hacer PRs a `develop`.
- Solo administradores tienen acceso a secrets y credenciales.

⚠ **Reglas de seguridad**
- Escaneo automático de vulnerabilidades en cada PR.
- Verificación de dependencias para evitar ataques a la cadena de suministro.
- Código de conducta para interacciones respetuosas.

## 📜 Política de Distribución y Gobernanza del Protocolo Proof of Generate

### 📌 1. Distribución de Recompensas por Bloque

Cada bloque generado en la red C-Project distribuye las recompensas así:

✅ **60% – Nodos generadores de energía**
- Se distribuye proporcionalmente según la energía aportada por cada nodo.

✅ **40% – Fondo de mantenimiento y desarrollo de la red**
- Se usa para pagar sueldos, incentivar a la comunidad y mejorar el protocolo.
- **Si no se usa en 48 horas, se quema automáticamente.**

🔥 **Mecanismo de Quema de Tokens**
- Los fondos no utilizados se eliminan para evitar inflación.
- Esto mantiene el equilibrio entre emisión de tokens y generación de energía.

### 📌 2. Gobernanza del Fondo de Mantenimiento

🛠 **Asignación de Recursos**
- Recompensas por contribuciones técnicas (`bugfix/`, `performance/`, `feature/`, `docs/`).
- Sueldos para desarrolladores clave y mantenimiento de la infraestructura.
- Incentivos para adopción (`hackathons`, `grants`, `bounties`).

🎙 **Proceso de Decisión**
- Propuestas de mejoras y financiamiento por votación comunitaria en GitHub/Governance DAO.
- Transparencia total sobre fondos disponibles y gastos.

### 📌 3. Integración con la Estrategia de Administración del Repositorio

- Cada contribución significativa puede recibir recompensas.
- Las solicitudes de financiamiento se hacen mediante `funding-request/{nombre}` en GitHub.
- Si los tokens no se asignan en 48 horas, se queman.

🎯 **Impacto de Esta Estrategia**
✅ Incentiva a los nodos a contribuir con generación de energía.
✅ Promueve mejoras continuas en el protocolo.
✅ Mantiene el valor del token sin inflación descontrolada.
✅ Fomenta una comunidad activa y alineada con los intereses del proyecto.

---

🚀 ¡Gracias por contribuir a C-Project! Para más información, consulta la documentación o únete a nuestras discusiones en Discord/GitHub.
