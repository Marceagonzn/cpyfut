#!/bin/bash

set -e

INSTALL_DIR="/usr/local/share/cpyfut"
BIN_DIR="/usr/local/bin"

echo "=================================="
echo "      Instalando CPYFut"
echo "=================================="

echo "Creando directorios..."
mkdir -p "$INSTALL_DIR"

echo "Copiando assets..."
cp -r assets "$INSTALL_DIR/"

echo "Copiando librerías..."
cp -r src/lib "$INSTALL_DIR/"

echo "Instalando ejecutable..."
cp src/cpyfut "$BIN_DIR/cpyfut"

chmod +x "$BIN_DIR/cpyfut"

echo
echo "✅ Instalación completada."
echo
echo "Prueba ejecutando:"
echo
echo "    cpyfut olimpia"
echo "    cpyfut cerro"
echo "    cpyfut --carousel"
echo "    cpyfut --carousel --colors"
