# 🐰 Yuno - Sistema de Gestión de Inventario

Aplicación web moderna para gestionar inventario de productos con control de comisiones y cálculo de ganancias.

![Yuno Logo](./public/logo-yuno.png)

## ✨ Características

- 📦 **Gestión de Productos**: Agrega, edita y elimina productos
- 🖼️ **Galería de Fotos**: Hasta 3 fotos por producto
- 💰 **Control de Precios**: Costo, precio de venta y precio mínimo
- 📊 **Dashboard**: Estadísticas de inventario y ventas
- 💵 **Sistema de Comisiones**: Calcula comisiones para vendedores/ayudantes
- 📱 **Responsive**: Funciona en móvil y desktop

## 🚀 Cómo usar localmente

### Opción 1: Descargar y ejecutar

1. **Descarga el proyecto** como ZIP y extráelo

2. **Instala Node.js** (versión 18 o superior): https://nodejs.org/

3. **Abre la terminal** en la carpeta del proyecto:
   ```bash
   cd yuno-inventario
   ```

4. **Instala las dependencias**:
   ```bash
   npm install
   ```

5. **Inicia el servidor de desarrollo**:
   ```bash
   npm run dev
   ```

6. **Abre tu navegador** en: http://localhost:5173

---

### Opción 2: Subir a GitHub Pages (Gratis)

#### Paso 1: Crear repositorio en GitHub

1. Ve a https://github.com/new
2. Nombra tu repositorio: `yuno-inventario`
3. Selecciona **Público**
4. Haz clic en **Create repository**

#### Paso 2: Subir el código

1. **Inicializa Git** en la carpeta del proyecto:
   ```bash
   git init
   ```

2. **Configura tu repositorio remoto** (reemplaza `TU_USUARIO` con tu nombre de usuario):
   ```bash
   git remote add origin https://github.com/TU_USUARIO/yuno-inventario.git
   ```

3. **Sube el código**:
   ```bash
   git add .
   git commit -m "Primer commit - Yuno Inventario"
   git branch -M main
   git push -u origin main
   ```

#### Paso 3: Configurar GitHub Pages

1. Ve a tu repositorio en GitHub
2. Haz clic en **Settings** (Configuración)
3. En el menú lateral, selecciona **Pages**
4. En **Source**, selecciona **GitHub Actions**

#### Paso 4: Crear el workflow de deploy

1. En tu repositorio, crea la carpeta `.github/workflows/`
2. Dentro crea el archivo `deploy.yml` con este contenido:

```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches: [main]
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

concurrency:
  group: pages
  cancel-in-progress: false

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Setup Node
        uses: actions/setup-node@v4
        with:
          node-version: 20

      - name: Install dependencies
        run: npm install

      - name: Build
        run: npm run build

      - name: Setup Pages
        uses: actions/configure-pages@v4

      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: ./dist

  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    needs: build
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
```

3. **Commit y push**:
   ```bash
   git add .
   git commit -m "Agregar workflow de GitHub Pages"
   git push
   ```

#### Paso 5: Ver tu sitio online

1. Ve a **Settings > Pages** en tu repositorio
2. Espera unos minutos a que el deploy termine
3. Tu sitio estará disponible en: `https://TU_USUARIO.github.io/yuno-inventario/`

---

## 📁 Estructura del proyecto

```
yuno-inventario/
├── .github/
│   └── workflows/
│       └── deploy.yml      # Configuración de GitHub Pages
├── public/
│   └── logo-yuno.png       # Logo de la app
├── src/
│   ├── components/ui/      # Componentes de UI (shadcn)
│   ├── hooks/
│   │   └── useInventory.tsx # Estado global del inventario
│   ├── sections/
│   │   ├── Dashboard.tsx   # Panel principal
│   │   ├── Products.tsx    # Lista de productos
│   │   ├── ProductDetail.tsx # Detalle del producto
│   │   ├── ProductForm.tsx # Formulario de producto
│   │   ├── SaleForm.tsx    # Formulario de venta
│   │   └── Commissions.tsx # Panel de comisiones
│   ├── types/
│   │   └── index.ts        # Tipos de TypeScript
│   ├── App.tsx             # Componente principal
│   └── main.tsx            # Punto de entrada
├── index.html
├── package.json
├── README.md
├── tsconfig.json
└── vite.config.ts
```

---

## 🛠️ Comandos disponibles

| Comando | Descripción |
|---------|-------------|
| `npm install` | Instala las dependencias |
| `npm run dev` | Inicia servidor de desarrollo |
| `npm run build` | Compila para producción |
| `npm run preview` | Previsualiza el build de producción |

---

## 📝 Notas importantes

- **Datos**: Los datos se guardan en memoria durante la sesión. Al recargar la página, los productos de ejemplo se restablecen.
- **Fotos**: Las fotos se almacenan como base64 en el navegador.
- **PWA**: Puedes instalar la app en tu móvil desde el navegador.

---

## 🐰 Creado con

- React + TypeScript
- Vite
- Tailwind CSS
- shadcn/ui
- Framer Motion

---

**¡Disfruta usando Yuno!** 🎉
