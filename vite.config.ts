import path from "path"
import react from "@vitejs/plugin-react"
import { defineConfig } from "vite"
import { inspectAttr } from 'kimi-plugin-inspect-react'

// https://vite.dev/config/
export default defineConfig({
  // Para GitHub Pages, usa el nombre de tu repositorio
  // Si tu repo se llama "yuno-inventario", cambia a: base: '/yuno-inventario/'
  // Para desarrollo local, usa: base: './'
  base: process.env.GITHUB_PAGES === 'true' ? '/yuno-inventario/' : './',
  plugins: [inspectAttr(), react()],
  resolve: {
    alias: {
      "@": path.resolve(__dirname, "./src"),
    },
  },
});
