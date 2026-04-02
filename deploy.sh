#!/bin/bash

# Script para deploy manual a GitHub Pages
# Uso: ./deploy.sh

echo "🚀 Iniciando deploy a GitHub Pages..."

# Verificar si git está inicializado
if [ ! -d ".git" ]; then
    echo "❌ Error: No se encontró repositorio git."
    echo "💡 Primero inicializa git: git init"
    exit 1
fi

# Verificar si hay cambios sin commitear
if [ -n "$(git status --porcelain)" ]; then
    echo "⚠️  Hay cambios sin commitear."
    read -p "¿Deseas hacer commit de los cambios? (s/n): " answer
    if [ "$answer" = "s" ] || [ "$answer" = "S" ]; then
        read -p "Mensaje del commit: " message
        git add .
        git commit -m "${message:-Actualizar proyecto}"
        git push
    fi
fi

# Instalar dependencias si es necesario
if [ ! -d "node_modules" ]; then
    echo "📦 Instalando dependencias..."
    npm install
fi

# Build para GitHub Pages
echo "🔨 Compilando para producción..."
GITHUB_PAGES=true npm run build

# Deploy con gh-pages
echo "📤 Subiendo a GitHub Pages..."
npx gh-pages -d dist

echo "✅ Deploy completado!"
echo "🌐 Tu sitio estará disponible en: https://$(git remote get-url origin | sed 's/.*github.com\///' | sed 's/\.git$//' | sed 's/\//.github.io\//').github.io/"
