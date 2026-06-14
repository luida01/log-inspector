# Robot Inspector de Logs

**Proyecto 2.5 — Tu Primer Robot Inspector (DevOps & AIOps)**

---

## ¿Qué problema resuelve este robot?

Los servidores generan miles de lineas de log cada minuto. Un ingeniero DevOps no puede leerlas todas manualmente. Este robot actua como un **filtro inteligente**: escanea el archivo de logs, extrae solo las alertas importantes (ERROR y CRITICAL) y genera un reporte limpio con fecha, hora y usuario responsable.

Es el primer paso hacia **AIOps**: recolectar datos relevantes del sistema para que una IA pueda analizarlos y tomar decisiones estrategicas.

---

## Estructura del proyecto

```
log-inspector/
├── inspector.sh                  # El robot: script Bash que filtra y reporta
├── servidor.log                  # Archivo de logs de prueba (10 lineas)
├── alerta_de_hoy.txt             # Reporte generado automaticamente
├── preguntas_investigacion.md    # Respuestas a las preguntas del challenge
└── README.md                     # Este archivo
```

---

## Requisitos

- **Git Bash** (Windows), **Terminal** (macOS) o cualquier terminal Linux
- Bash 4.0 o superior
- Comandos: `grep`, `whoami`, `date` (vienen preinstalados en Git Bash/macOS/Linux)

---

## Instrucciones de uso

### 1. Prepara tu archivo de logs

El script analiza un archivo llamado `servidor.log` en la misma carpeta. Tu archivo debe tener lineas con los prefijos `INFO:`, `ERROR:` y `CRITICAL:`.

Ejemplo de formato valido:
```
INFO: Servidor iniciado en puerto 8080
ERROR: Fallo al conectar con base de datos
CRITICAL: Disco al 98% de capacidad
```

> **Nota**: El proyecto ya incluye un `servidor.log` de prueba con 10 lineas. Puedes reemplazarlo con tus propios logs reales.

### 2. Ejecuta el robot

Abre Git Bash en la carpeta del proyecto y ejecuta:

```bash
bash inspector.sh
```

### 3. Revisa el resultado

El script genera dos salidas:

| Salida | Descripcion |
|--------|-------------|
| **Pantalla** | Resumen rapido: cuantos errores y criticos se encontraron |
| **alerta_de_hoy.txt** | Reporte completo con encabezado, fecha, usuario y listado detallado |

### 4. Ejemplo de salida del reporte (`alerta_de_hoy.txt`)

```
======================================
  REPORTE DE ALERTAS - INSPECTOR LOG
======================================
Generado por  : luisd
Fecha y hora  : 14/06/2026 a las 15:30:45
Archivo       : servidor.log
======================================

--- ERRORES ENCONTRADOS ---
ERROR: Fallo al conectar con la base de datos MySQL
ERROR: Timeout en API de pasarela de pago VisaNet
ERROR: Certificado SSL expirado - conexiones inseguras

--- ALERTAS CRITICAS ---
CRITICAL: Disco duro al 98% de capacidad - riesgo de colapso
CRITICAL: Memoria RAM agotada - servidor no responde

======================================
  RESUMEN
======================================
Total ERRORES   : 3
Total CRITICALS : 2
Total alertas   : 5
======================================
  Reporte guardado en: alerta_de_hoy.txt
======================================
```

---

## Reflexion: ¿Como ayuda este script a la Inteligencia Artificial (AIOps)?

Este proyecto no es solo un filtro de texto; es el **cimiento de AIOps**, la aplicacion de Inteligencia Artificial a las operaciones de IT.

### El rol del script en un ecosistema de IA:

```
[Servidores] --> [MILES de logs] --> [INSPECTOR.SH] --> [DATOS LIMPIOS] --> [IA/AIOps] --> [DECISIONES]
                                           ^                                                      |
                                           |_____ Este proyecto ___________________________________|
```

**Analogia medica**: Si un paciente llega a emergencias, el medico no lee sus 500 paginas de historial. Le pregunta: "¿Que te duele, desde cuando, que tan fuerte?". Nuestro script hace exactamente eso con el servidor: extrae los sintomas relevantes.

### Tres formas en que este script potencia la IA:

1. **Reduccion de ruido**: Un sistema de IA no puede procesar 1 millon de lineas de log eficientemente. Nuestro script le entrega solo las 50 lineas que realmente importan (errores y criticos).

2. **Datos estructurados**: La IA necesita datos limpios, con marcas de tiempo y metadatos (usuario, servidor). Nuestro reporte ya incluye todo eso en un formato consistente.

3. **Deteccion temprana de patrones**: Si el script se ejecuta cada hora (automatizado con cron), una IA puede aprender que `CRITICAL: Disco al 98%` a las 2 PM siempre precede a `ERROR: BD caida` a las 3 PM. Con ese aprendizaje, la IA puede **predecir** fallos antes de que ocurran.

### El futuro de este proyecto:
- Conectar el script a un dashboard como Grafana para visualizacion en tiempo real
- Integrar con sistemas de alerta (Slack, Telegram, email)
- Alimentar modelos de machine learning para **mantenimiento predictivo**

---

## Preguntas de investigacion

Todas las preguntas del challenge (diferencia entre `>` y `>>`, `whoami` y `date`, automatizacion, escalabilidad, Root Cause Analysis y seguridad) estan respondidas en detalle en:

**[preguntas_investigacion.md](preguntas_investigacion.md)**

---

## Autor

Proyecto parte del programa Antigravity — Ingenieria DevOps & AIOps.

---

> "Un buen DevOps no lee logs. Escribe robots que los lean por el."
