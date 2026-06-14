#!/bin/bash

# ============================================================
# INSPECTOR DE LOGS - Robot de alertas automatizado
# Proyecto 2.5: Tu primer robot inspector
# ============================================================
# Este script escanea un archivo de logs de servidor, filtra
# las lineas que contienen ERROR y CRITICAL, y genera un
# reporte limpio con marca de tiempo y usuario responsable.
# ============================================================

# --- VARIABLES DE ENTORNO ---
# Archivo de entrada (el log que queremos analizar)
LOG_FILE="servidor.log"

# Archivo de salida (el reporte que vamos a generar)
# NOTA: Usamos > en vez de >> para SOBREESCRIBIR el archivo
# cada vez que se ejecuta el script. Si quisieramos acumular
# reportes de varios dias, usariamos >> para APPEND.
OUTPUT_FILE="alerta_de_hoy.txt"

# --- RECOLECTAR DATOS DE CONTEXTO ---
# whoami devuelve el nombre del usuario que ejecuta el script
USUARIO=$(whoami)

# date +"%d/%m/%Y %H:%M:%S" devuelve fecha y hora exacta
FECHA=$(date +"%d/%m/%Y a las %H:%M:%S")

# --- VERIFICAR QUE EL ARCHIVO DE LOGS EXISTE ---
if [ ! -f "$LOG_FILE" ]; then
    echo "[ERROR] No se encontro el archivo '$LOG_FILE'."
    echo "Asegurate de tener un archivo de logs en la misma carpeta que este script."
    exit 1
fi

# --- FILTRADO DE LINEAS ---
# grep busca lineas que contengan los patrones "ERROR:" o "CRITICAL:"
# La opcion -E activa expresiones regulares extendidas
ERRORES=$(grep -E "ERROR:|CRITICAL:" "$LOG_FILE")
TOTAL_ERRORES=$(echo "$ERRORES" | grep -c "ERROR:")
TOTAL_CRITICALS=$(echo "$ERRORES" | grep -c "CRITICAL:")

# --- GENERAR EL REPORTE ---
# El > sobreescribe alerta_de_hoy.txt con un reporte nuevo cada vez
{
    echo "======================================"
    echo "  REPORTE DE ALERTAS - INSPECTOR LOG"
    echo "======================================"
    echo "Generado por  : $USUARIO"
    echo "Fecha y hora  : $FECHA"
    echo "Archivo       : $LOG_FILE"
    echo "======================================"
    echo ""
    echo "--- ERRORES ENCONTRADOS ---"
    echo "$ERRORES" | grep "ERROR:"
    echo ""
    echo "--- ALERTAS CRITICAS ---"
    echo "$ERRORES" | grep "CRITICAL:"
    echo ""
    echo "======================================"
    echo "  RESUMEN"
    echo "======================================"
    echo "Total ERRORES   : $TOTAL_ERRORES"
    echo "Total CRITICALS : $TOTAL_CRITICALS"
    echo "Total alertas   : $((TOTAL_ERRORES + TOTAL_CRITICALS))"
    echo "======================================"
    echo "  Reporte guardado en: $OUTPUT_FILE"
    echo "======================================"
} > "$OUTPUT_FILE"

# --- MOSTRAR CONFIRMACION EN PANTALLA ---
echo ""
echo "[OK] Reporte generado exitosamente."
echo "Usuario: $USUARIO | Fecha: $FECHA"
echo "Se encontraron $TOTAL_ERRORES errores y $TOTAL_CRITICALS alertas criticas."
echo "Reporte guardado en: $OUTPUT_FILE"
echo ""
