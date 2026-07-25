#!/bin/bash

set -e

INSTALL_DIR="/usr/local/share/cpyfut"
BIN_FILE="/usr/local/bin/cpyfut"

echo "=================================="
echo "     Desinstalando CPYFut"
echo "=================================="

echo "Eliminando ejecutable..."
rm -f "$BIN_FILE"

echo "Eliminando archivos..."
rm -rf "$INSTALL_DIR"

echo
echo "✅ CPYFut fue desinstalado correctamente."

