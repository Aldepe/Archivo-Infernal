# Archivo Infernal

App estatica en JavaScript para una campana de DnD infernal con login/signup, linea temporal, lore vinculado y secreto por personaje, apuntes privados, tracking de stats, inventario, pactos, bazar demoniaco, crafting, maldicion de hambre, campo de batalla con iniciativas, editor simple de mapa y sala de dados compartida.

## Ejecutar en local

Abre la carpeta con un servidor estatico:

```bash
python -m http.server 4173
```

Luego entra en `http://localhost:4173`.

Si `src/config.js` esta vacio, la app usa modo demo local. Puedes entrar con `dm@demo.local` y cualquier contrasena de 6+ caracteres.

## Conectar Supabase

1. Crea un proyecto en Supabase.
2. Copia el contenido de `supabase/schema.sql` en el SQL Editor y ejecutalo.
3. Crea una cuenta desde la app.
4. En el SQL Editor, convierte esa cuenta en DM:

```sql
update public.profiles
set role = 'dm'
where email = 'tu-email@example.com';
```

5. Edita `src/config.js`:

```js
export const SUPABASE_URL = "https://TU-PROYECTO.supabase.co";
export const SUPABASE_ANON_KEY = "TU-ANON-KEY";
```

La anon key puede estar en una app estatica siempre que Row Level Security siga activado. El SQL incluido deja a los players leyendo timeline/lore permitido, viendo solo sus apuntes y su ficha de stats, enviando su iniciativa y creando sus propias tiradas. El DM gestiona lore, secretos, cronograma, stats, criaturas, turnos, visibilidad del mapa y estado del combate.

El SQL tambien crea el bucket publico `campaign-images` para subir retratos e imagenes de lore desde la propia app.

## Importar tus apuntes

En `imports/` hay tres archivos generados desde tus exports:

- `notion-local-import.json`: eventos, lore, vinculos y tabla d100 de hambre para modo local.
- `local-import-loader.js`: script para fusionar ese JSON en el demo local.
- `supabase-import.sql`: SQL listo para ejecutar en Supabase tras `supabase/schema.sql`.

El import conserva el Markdown completo en las descripciones para no perder detalles. Las imagenes quedan referenciadas en `details.image_refs`; en la app las fotos nuevas se cargan como archivo, sin campos de link.

## GitHub Pages

Sube esta carpeta a un repositorio y sirve `index.html` desde GitHub Pages. Si la carpeta esta dentro de un repo mayor, puedes mover `infernal-dm-app` a la raiz o configurar Pages para publicar desde esa carpeta.

## Archivos principales

- `index.html`: entrada de la SPA.
- `src/app.js`: estado, pantallas, CRUD y llamada RPC para stress.
- `src/styles.css`: interfaz visual infernal.
- `src/config.js`: credenciales publicas de Supabase.
- `supabase/schema.sql`: tablas, politicas RLS y `apply_stress_roll`.
- `assets/infernal-archive.png`: fondo generado para la UI.

## Notas de implementacion

- El cliente usa `@supabase/supabase-js` v2 desde CDN.
- La funcion `apply_stress_roll(target_user, die_size)` valida que el usuario actual sea DM, tira 1d4 en Postgres, suma el resultado al stress y registra la tirada.
- Las fichas de lore aceptan datos ricos mediante columnas fijas y `details` JSONB para ampliar campos sin migraciones pequenas.
- La pestaña Campo batalla mantiene combatientes, iniciativa, turno activo, ronda, HP/AC, condiciones y una cuadricula tactica con tokens.
- El DM puede tener varios mapas, ocultarlos mientras los prepara, cambiar tamano, subir fondo, mover fichas con el raton, numerar casillas, pintar paredes/obstaculos/objetos/trampas/efectos y colocar areas visuales de circulo, cono, cubo o linea con sentido.
- Cada ficha de combate puede tener foto, condiciones DnD 5e y visibilidad para players.
- Inventario soporta imagen, rareza con borde de color, monedas de alma y vinculos a lore. El bazar demoniaco renueva 3 objetos cada 24h y solo el DM ve la maldicion.
- La pestaña Dados guarda tiradas compartidas para todos los usuarios autenticados. En Supabase la vista de dados y combate se refresca cada pocos segundos si no estas editando un formulario.
