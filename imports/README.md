# Imports de campaña

Generado desde los exports de Notion y `Ham bre.xlsx`.

- `notion-local-import.json`: datos para modo demo/local. Incluye eventos, lore, vinculos y tabla de hambre d100.
- `local-import-loader.js`: abre la app local, inicia como DM demo y pega este script en la consola del navegador para fusionar el import en `localStorage`.
- `supabase-import.sql`: ejecutalo en el SQL Editor de Supabase despues de `supabase/schema.sql`; tambien inserta las 100 entradas de hambre en `hunger_table_entries`.

El import conserva el Markdown completo en `description` para no perder detalles. Las referencias de imagen de Notion quedan en `details.image_refs`; para Supabase conviene subir esas imagenes desde la app usando los campos de carga.
