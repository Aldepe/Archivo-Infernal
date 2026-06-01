-- Import generado desde exports de Notion + Ham bre.xlsx

begin;

insert into public.timeline_events (id, title, date_label, description, sort_order)
values ('4683a317-0bcc-a73a-37d1-ab7e7f432946'::uuid, 'Sesión #1: Inicio', 'Sesion 1', '- Figura encapuchada, esta dando la bienvenida a una nueva alma
- Se para todo, las almas caen (se convierten en lodos negros), el encapuchado comenta que han llegado antes de tiempo, que curioso
- Isaac se materializa, se arranca una hacha del cuello y empieza a correr detras del artefacto
- Raul aparece señala a Carlos y hace corte de manga
- Un monton de Arnaus no paran de materializarse e irse caminando hacia atrás
- Al fondo aparece un César llevando una tiefling de la mano
- Varios Lazcanos se dejan llevar y salen volando
- Aparecen en el infierno
- Lazcano tiene cortes en el brazo, en ellos hay las siguientes frases: "Traidor" "Robot" "NO"  (mas reciente, esta recién sangrando) "Yo?”
- Arnau tiene una nueva forma: constelacion del bebe
- Si entra se encontrara con un bebe siendo gestado y aparecera su dios, este le dice que no puede darle mucha información, ya que su interacción directa se vería castigada, de momento le da una bendición que le protegera, si la quiere usar y le dice que mate al bebe. Un acto reflejo le hace bajar el arma, el dios se impresiona, ve que ha podido engañar al mismisimo contrato y traer mas informacion, de momento no hace falta que lo mate.
- Isaac obtiene bless, calor del sol
- Raul mensaje de su diosa: “No sé que pretendes exactamente con esto, esto es una herejía… Pero bueno, me serás útil, quedate a la espera de nuevas instrucciones… Cuidado con el Warforged”
- Carlos mensaje de su dios: “Mmm… que interesante… ¿No recuerdas nada, no? No te preocupes, puedo solucionarlo, es importante que protejas a tu creación, intentarán arrebatartelo, acude a la avanzadilla de los demiurgos en el rio Styx”
- Aparece otra vez el encapuchado, esta dejando caer todo el rato un dado de seis caras pero nunca llega a dar resultado y vuelve a su mano. El le pregunta a lazcano que opina de la paradoja del hijo que mata al padre en el tiempo. El dice que tiene una respuesta, y es que hay dos teorias o bien que un tiempo rescribe el otro y por lo tanto el ya no puede volver a su pasado o bien se crea una rama paralela, el dice que al igual que algunos perros no perciben todos los colores, los humanos pueden percibir el espacio pero no el tiempo,...', 1024)
on conflict (id) do update set
  title = excluded.title,
  date_label = excluded.date_label,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.timeline_events (id, title, date_label, description, sort_order)
values ('a9f97f25-79c0-95c9-8a8f-b58786188131'::uuid, 'Sesion #2: Campo de Batalla', 'Sesion 2', 'El terreno no es tierra, sino una mezcla compactada de ceniza negra, escoria vitrificada y barro rojizo. Cada pisada hace un sonido húmedo, como si el suelo estuviera saturado de algo más denso que agua: una papilla de sangre, grasa y limo infernal. Donde la batalla fue más intensa, el suelo está fundido en placas de vidrio oscuro, y en esas placas se ven burbujas detenida.
El aire es una agresión constante. Huele a hierro, a azufre y a un perfume agrio, casi dulce, que recuerda a carne demasiado tiempo al sol… cielo de humo con relámpagos silenciosos que iluminan por un segundo el horizonte y luego lo devuelven a la penumbra. Cada vez que cae uno de esos destellos, las sombras de los postes, las cuchillas rotas y los cadáveres se estiran como garras.
Las trincheras cortan la llanura como cicatrices. No son líneas limpias: están hechas a mordiscos, como si el terreno hubiese sido excavado con uñas, mandíbulas y magia. Los bordes están reforzados con placas de metal ennegrecido, fragmentos de escudos remachados, y—en algunos tramos—con huesos largos usados como estacas. Dentro, el barro llega a los tobillos y tiene una textura aceitosa. Hay tablones podridos que no son madera: son algo parecido a costillas ensambladas y clavadas con clavos al rojo. De tanto en tanto sobresalen pinchos con marcas legales infernales grabadas.
Entre una trinchera y otra se abre la tierra de nadie: un campo de obstáculos brutal. Alambre hecho de filamentos metálicos. Erizos defensivos clavados en el suelo, algunos aún humeantes. Cráteres de impacto llenos de un líquido oscuro donde flotan restos de armadura como barcos hundidos. En un par de agujeros más profundos se acumula una niebla caliente que sube en suspiros, como si el infierno exhalara por heridas.
Los cadáveres están por todas partes, hay cuerpos desmembrados con garras todavía aferradas a una espada rota; torsos atravesados por lanzas que no se han soltado porque la carne se ha carbonizado alrededor del metal; mandíbulas abiertas en muecas que parecen rezos o blasfemias.
1–5) Bolsa con monedas (5d10 × 10 po)
Una bolsa de cuero oscuro, endurecida por calor y humo, con el cordón sellado por cera negra. Al abrirla suena...', 2048)
on conflict (id) do update set
  title = excluded.title,
  date_label = excluded.date_label,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.timeline_events (id, title, date_label, description, sort_order)
values ('3c041bc5-ef1e-4f16-2334-8404902cebd7'::uuid, 'Sesion #3: Ciudad de Bronce', 'Sesion 3', 'Lazcano va a escuchar como una voz suena en su cabeza: "¿Hermano, estás ahí? Tengo mucho miedo, aquí está muy oscuro y hace frío”
Delante se haya levantado un campamento áspero y funcional, varias tiendas y lo que parece ser un almancen de troncos y piedras, todo reunido alrededor de un mangonel:
- Mangonel:
- Estructura y materiales: todo el armazón principal parece de metal oscuro (acero ennegrecido), construido con planchas remachadas y refuerzos angulares. Encima tiene muchísimos herrajes y bandas de bronce: cantoneras, abrazaderas, placas decorativas y remates en los bordes.
- Ruedas: va montada sobre cuatro ruedas grandes con radios, también metálicas, con aros de bronce y detalles agresivos (tornillos, puntas y espigas).
- Brazos y mecanismo: el brazo/lanza central es enorme, con un “cucharón” en la parte superior (donde iría el proyectil). Se ven cadenas colgando y un ensamblaje que sugiere un mecanismo robusto, más “industrial”.
- Iconografía demoníaca: el frontal está decorado con una máscara demoníaca cornuda a modo de mascarón, con ojos brillantes, y pinchos alrededor.
- Runas: sobre varias planchas aparecen glifos/runes rojas como grabadas o pintadas y parecen que esten “apagadas”. Da la sensación de que la máquina estaba imbuida.
Junto al fuego, una dotación de 12 figuras descansa. Un tiefling destaca por encima de los demás, tiene el porte de alguien acostumbrado a mandar sin levantar la voz: hombros rectos, manos manchadas de tinta y cal, una vara apoyada cerca de la rodilla y una cuerda con varios nudos presentes a lo largo de esta enrollada como una serpiente domesticada. Más atrás, otro tiefling más tosco y fuerte parece hecho de aristas: mirada dura, mandíbula apretada, la espalda rígida incluso sentado. Lleva un látigo recogido y, colgando del cinto, conjuntamente con un juego de llaves de grilletes y lo que parece ser sello de carmesí de cera.
Varios esclavos tiefling se agrupan cerca de los pertrechos: ropa reforzada, guantes gruesos, manos llenas de rozaduras y dedos vendados; algunos tienen la piel marcada por cicatrices antiguas, otros la mirada hundida. Entre ellos, destaca con violencia visual un tiefling azul. Su piel intensa...', 3072)
on conflict (id) do update set
  title = excluded.title,
  date_label = excluded.date_label,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.timeline_events (id, title, date_label, description, sort_order)
values ('d60f7998-1089-98ed-6a15-6bef4089a941'::uuid, 'Sesion #4: Ciudad', 'Sesion 4', 'Lazcano va a escuchar una voz en su cabeza: “Hermano, ¿estoy como en una especie de prisión? Puedo oír y ver tu alrededor”
La Cárcel Mamertina
War Toll
Aparecera
Corpse Eaters + Vrocks (1d4 +1)
Dragon Queen’s Patrol
Flying Fortress
Hellwasps
Nightmares
Gnoll Pack Yeenoghu
Monkey Business (Barlguras)', 4096)
on conflict (id) do update set
  title = excluded.title,
  date_label = excluded.date_label,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.timeline_events (id, title, date_label, description, sort_order)
values ('ec90d2b4-37c9-dcb3-3bc3-5c6ae8b5ed19'::uuid, 'Sesion: Barco', 'Sesion 5', 'Barco: Unus mundus: “s un término que se refiere al concepto de una realidad subyacente unificada a partir de la cual todo emerge y a la cual todo retorna.”', 54096)
on conflict (id) do update set
  title = excluded.title,
  date_label = excluded.date_label,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.lore_entries (id, type, title, subtitle, image_url, parent_id, summary, description, details)
values ('918f00f6-4e8c-4c5b-d984-359f8d625571'::uuid, 'character', 'Asmodeus', 'Auxiliar importado de Notion', '', null, 'Tipo de acción Fórmula para ~1/6 éxito Ataque físico (d20 + bonus) CA Bonus de Ataque + 18 Chequeo de habilidad (d20 + mod) DC Modificador + 18 Presentacion: Deja caer un dado y siempre vuelve a su mano, nunca dando resultado Anything with a 1/6 probability or less will never occur within its area of effect. Stand tells the user the exact probability of any event. Conjure Barrage / Conjure Volley No duplica la flecha física, pero genera múltiples proyectiles mágicos que impactan simultáneamente. Perfecto para...', '| Tipo de acción | Fórmula para ~1/6 éxito |
| --- | --- |
| Ataque físico (d20 + bonus) | CA = Bonus de Ataque + 18 |
| Chequeo de habilidad (d20 + mod) | DC = Modificador + 18 |
Presentacion: Deja caer un dado y siempre vuelve a su mano, nunca dando resultado
Anything with a 1/6 probability or less will never occur within its area of effect. Stand tells the user the exact probability of any event.
- Conjure Barrage / Conjure Volley
- No duplica la flecha física, pero genera múltiples proyectiles mágicos que impactan simultáneamente.
- Perfecto para “dividir un ataque” y forzar probabilidades: 6 proyectiles → el más letal es 1/6 → stand anula.
- Suggestion / Mass Suggestion
- Obliga a los héroes a elegir acciones entre varias opciones sugeridas.
- La acción que llevaría al éxito puede ser la única con probabilidad 1/6 → el villano anula.
- Confusion
- Los héroes lanzan acciones al azar; el resultado crítico de 1/6 puede ser anulado. El efecto de atacar random
- Maze
- Separar un objetivo del combate temporalmente.
- Si hay 6 posibles salidas o rutas de escape, el stand puede anular la que los héroes elegirían con probabilidad 1/6.
- Hallucinatory Terrain
- Crear 6 caminos que parezcan iguales; el real es anulado al intentar cruzarlo → fuerza que los héroes fallen.
1️⃣ Copias/ilusiones para confundir y protegerse
- 5 ilusiones exactas de sí mismo que se mueven como él, incluso lanzan gestos de hechizo.
- Los enemigos nunca saben cuál es real, y cualquier ataque que impacte al original tiene 1/6 de probabilidad de acertar → el stand anula automáticamente el golpe.
- Variante: las ilusiones incluso reaccionan al ataque (simulan esquivar, lanzar un hechizo) para reforzar la confusión.
- Falsas acciones coordinadas: por ejemplo, todos los clones “disparan flechas hacia el enemigo”, pero son ilusiones. Los jugadores dudan: ¿dónde está el verdadero ataque?
2️⃣ “Anulación mediante sobrecarga”
- El villano puede forzar la situación para que cualquier ataque que vaya a matarlo sea anulado. Ejemplos:
- Si alguien apunta una flecha al pecho, él dispara 5 flechas hacia sí mismo en el mismo instante, haciendo que el ataque crítico que iba a matarlo quede “compartido” entre...', '{"source_path":"export-a\\Auxiliar\\Asmodeus 25e1744335cf80c5b0abe0cbdd128a1b.md","image_refs":["Asmodeus/Imagen_de_WhatsApp_2025-08-13_a_las_16.03.44_29f6d2d6.jpg","Asmodeus/image.png","Asmodeus/image 1.png","Asmodeus/image 2.png","Asmodeus/image 3.png","Asmodeus/image 4.png","Asmodeus/image 5.png","Asmodeus/image 6.png","Asmodeus/image 7.png"],"imported_from":"Notion export","dm_source_markdown":"| Tipo de acción | Fórmula para ~1/6 éxito |\n| --- | --- |\n| Ataque físico (d20 + bonus) | CA = Bonus de Ataque + 18 |\n| Chequeo de habilidad (d20 + mod) | DC = Modificador + 18 |\n\nPresentacion: Deja caer un dado y siempre vuelve a su mano, nunca dando resultado\n\nAnything with a 1/6 probability or less will never occur within its area of effect. Stand tells the user the exact probability of any event.\n\n- Conjure Barrage / Conjure Volley\n    - No duplica la flecha física, pero genera múltiples proyectiles mágicos que impactan simultáneamente.\n    - Perfecto para “dividir un ataque” y forzar probabilidades: 6 proyectiles → el más letal es 1/6 → stand anula.\n- Suggestion / Mass Suggestion\n    - Obliga a los héroes a elegir acciones entre varias opciones sugeridas.\n    - La acción que llevaría al éxito puede ser la única con probabilidad 1/6 → el villano anula.\n- Confusion\n    - Los héroes lanzan acciones al azar; el resultado crítico de 1/6 puede ser anulado. El efecto de atacar random\n- Maze\n    - Separar un objetivo del combate temporalmente.\n    - Si hay 6 posibles salidas o rutas de escape, el stand puede anular la que los héroes elegirían con probabilidad 1/6.\n- Hallucinatory Terrain\n    - Crear 6 caminos que parezcan iguales; el real es anulado al intentar cruzarlo → fuerza que los héroes fallen.\n\n## 1️⃣ Copias/ilusiones para confundir y protegerse\n\n- 5 ilusiones exactas de sí mismo que se mueven como él, incluso lanzan gestos de hechizo.\n    - Los enemigos nunca saben cuál es real, y cualquier ataque que impacte al original tiene 1/6 de probabilidad de acertar → el stand anula automáticamente el golpe.\n    - Variante: las ilusiones incluso reaccionan al ataque (simulan esquivar, lanzar un hechizo) para reforzar la confusión.\n- Falsas acciones coordinadas: por ejemplo, todos los clones “disparan flechas hacia el enemigo”, pero son ilusiones. Los jugadores dudan: ¿dónde está el verdadero ataque?\n\n---\n\n## 2️⃣ “Anulación mediante sobrecarga”\n\n- El villano puede forzar la situación para que cualquier ataque que vaya a matarlo sea anulado. Ejemplos:\n    - Si alguien apunta una flecha al pecho, él dispara 5 flechas hacia sí mismo en el mismo instante, haciendo que el ataque crítico que iba a matarlo quede “compartido” entre varias acciones → el stand anula la más peligrosa.\n    - Lo mismo con hechizos: si un mago lanza Fireball, él activa simultáneamente 6 hechizos menores de fuego en el mismo punto para que el stand anule el proyectil más dañino.\n- Esto convierte su poder en algo activo y táctico, no solo defensivo pasivo.\n\n---\n\n## 3️⃣ Manipulación del entorno\n\n- Seis caminos, seis trampas, seis posibles opciones: el villano hace que la opción correcta de los héroes quede anulada.\n    - Ejemplo: los héroes deben elegir un camino entre seis; él hace que los demás sean trampas y anula el camino seguro, forzando a los héroes a improvisar.\n    - Si lanzan una bomba o hechizo al azar, puede preparar 5 zonas falsas donde el efecto real nunca ocurre.\n- Proyectos múltiples: si un héroe trata de destruir una puerta, él “crea” 5 puertas falsas en su lugar, de manera que incluso acertar la correcta sería 1/6 → anulación instantánea.\n\n---\n\n## 4️⃣ Futuro alternativo / predicción de movimientos\n\n- El villano lee probabilidades de los próximos seis movimientos de los enemigos y elige la acción a anular.\n    - Ejemplo: sabe que el guerrero planea lanzar su ataque más fuerte a un punto crítico; él actúa para hacer que esa opción deje de ser viable (el golpe falla, la espada resbala, el ataque se desincroniza).\n    - Puede anticipar hechizos, emboscadas o ataques coordinados y “marcar” la única opción que tendría éxito.\n- Futuro forzado: ante decisiones tácticas de grupo, él puede guiar la situación para que los héroes elijan la acción que será anulada. Una especie de “trampa psicológica + habilidad”.\n- Mirror Image → genera clones automáticos que protegen y distraen.\n- Silent Image / Major Image → crear copias visuales exactas para confundir.\n\n---\n\n# Soberbia/Orgullo/Vanidad\n\nSiempre de espaldas, ve a la gente a través de su espejo\n\n> “Soy más [Fuerza / Destreza / Constitución / Inteligencia / Sabiduría / Carisma] que tú.”\n>\n- Acción de activación: Bonus Action para declarar la apuesta.\n- Alcance: 60 ft. (línea de visión).\n- Duración del efecto: 1 minuto; requiere mantener atención (similar a concentración: si quedas incapacitado, cae).\n- Límite: 1 apuesta activa a la vez. Puedes iniciar un número de apuestas por descanso largo igual a tu bono de competencia (mín. 1). No puedes apostar el mismo stat contra la misma criatura más de una vez por descanso corto.\n- Ruptura: Si pierdes visión del objetivo durante 1 asalto completo, la apuesta finaliza de inmediato.\n- Etiqueta de efecto: no es un “charm” ni “frighten”; es un vínculo de orgullo (afecta a criaturas con INT 3+ que entiendan un idioma).\n\n---\n\n## Procedimiento de la Apuesta (paso a paso)\n\n1. Declaración: indicas el stat (STR/DEX/CON/INT/WIS/CHA).\n2. Compulsión a aceptar (si se niega): si la criatura se niega, debe superar una Salvación de Sabiduría contra tu CD de stand (8 + competencia + Carisma o Sabiduría; elige al crear el stand).\n    - Si falla, debe aceptar la apuesta.\n    - Si tiene Resistencia Legendaria, puede gastarla para ignorar la compulsión (sufre 2d6 psíquico por rechazo del orgullo).\n3. Definir la “demostración”: ambos acuerdan cómo se “demuestra” ese stat en ≤ 6 segundos (1 asalto). Si no hay acuerdo, aplica el método base (abajo por atributo).\n    - Cada parte puede realizar 1 Acción y 1 Acción Bonus normales (sin lanzar conjuros de >1 acción, ni combos multiasalto).\n    - Ayuda (Help), aliados y objetos: permitidos solo si están explícitamente incluidos en la definición (“mi equipo me hace más carismático que tú”, etc.). Si no se menciona, no cuentan.\n4. Resolución: normalmente es tirada enfrentada de habilidad/atributo (o los métodos base indicados). Aplica ventaja/desventaja y rasgos como Reliable Talent si correspondiera por reglas.\n5. Resultado de la apuesta:\n    - Ganas: tu stat apostado = 20; el del objetivo = 1, indefinidamente.\n    - Pierdes: recibes 1 nivel de agotamiento y no puedes apostar ese mismo stat contra esa criatura por 24 h.\n    - Empate: ambos sufren 2d6 psíquico (humillación compartida) y la apuesta queda sin efecto (puedes reintentar gastando otro uso).\n\nNota: Subir/bajar a 20/1 reemplaza el valor actual (no es bonus). No puede reducir por debajo de 1, ni subir por encima de 20. Afecta checks, saves y DCs derivados del atributo.\n\n---\n\n## Métodos Base por Atributo (si no se acuerda otra cosa)\n\n> Puedes proponer algo más creativo; si el otro lo acepta, se usa eso. Si no, método base.\n>\n- Fuerza (STR): Contienda de Atletismo (Grapple o Empujar).\n- Destreza (DEX): Iniciativa enfrentada (el más alto “es más rápido”); si ya tirada, repetís solo para la apuesta.\n- Constitución (CON): Chequeo de Constitución para resistir un estresor (p.ej., aguantar la respiración 1 asalto, beber un veneno no letal, mantenerse firme en zona dañina leve).\n- Inteligencia (INT): Arcana/Historia/Investigación (una sola habilidad a elección del retador) frente a la misma del rival, con un micro-enigma del DM (6 segundos, pista única).\n- Sabiduría (WIS): Percepción o Perspicacia enfrentada (detectar una ilusión menor o leer una intención real en 6 s).\n- Carisma (CHA): Persuasión o Intimidación enfrentada ante un observador (PNJ neutral creado por el DM) que decide a quién “cree”/“teme” durante ese instante.\n\n---\n\n## Límites, Interacciones y Casos Especiales\n\n- Conjuros y efectos previos: si estabas ya bajo Enhance Ability u otro buff, cuentan (Soberbia premia la preparación); pero no puedes empezar un conjuro de 1 minuto en medio: todo debe resolverse en 1 asalto.\n- Ilusiones: válidas si superan la Percepción/Salvación del rival en ese momento. Si el otro las descubre durante la resolución, gana ventaja en la tirada de la apuesta.\n- Inmunidades / Resistencias: no hay inmunidad a “orgullo” por tipo de criatura; sí se aplican ventajas propias (p.ej., envenenamiento contra CON).\n- Criaturas sin un stat significativo: usa su modificador normal. Si carecen de habilidad pertinente, tiran atributo puro.\n- Forma salvaje / Polimorfia: se usa el stat actual de la forma que ocupa en ese instante. Si gana el shapeshifter, el 20 se aplica a la forma actual; si cambia de forma, el ajuste permanece (aplicado al nuevo puntaje del mismo atributo).\n- Finalización: si quedas incapacitado, pierdes línea de visión por un asalto completo, o el objetivo sale de 60 ft. durante un asalto, la apuesta termina.\n- Descubrir trampa flagrante: si rompes las condiciones explícitas que acordaste (p.ej., dijiste “sin magia” y lanzas magia), pierdes automáticamente la apuesta.\n- Maldición de soberbia, versión letal: si te matan sin haberte vencido antes mediante una apuesta sobre ese mismo stat, ese atributo del asesino queda en 1 de forma permanente (solo una Wish o intervención divina lo restaura)\n\n---\n\n## Cómo “ganar” cada duelo con engaños o trampas (legales dentro de Soberbia)\n\n> El truco es definir la demostración para que favorezca tus ventajas reales y mine las del rival, sin romper lo pactado.\n>\n\n### Fuerza (STR)\n\n- Define la prueba como Tira y afloja en zona con Grease o terreno difícil (tu Atleta con Enhance Ability (Bull’s Strength) vs. su desventaja de equilibrio).\n- Reducción del rival: Enlarge/Reduce (Reduce al rival antes de la apuesta), o Ray of Enfeeblement justo antes del chequeo.\n\n### Destreza (DEX)\n\n- Iniciativa a tu favor: activa Alert, Foresight o Gift of Alacrity antes de retar.\n- Demostración de “puntería”: definir como ataque a distancia a un blanco minúsculo; lanza Faerie Fire sobre el blanco (ventaja para ti, no para él si no está en el área).\n\n### Constitución (CON)\n\n- Prueba de aguante: “quién resiste más el veneno suave X” → tú eres enano o llevas Heroism/Protection from Poison; él no.\n\n### Inteligencia (INT)\n\n- Define el terreno: “el que descifre antes este glifo” y tú ya conoces el glifo (Arcana alta) o traes Comprehend Languages.\n- Metajuego legal: trae un enigma cuya respuesta solo tú sabes por trasfondo (historia local), y que el rival podría saber por Historia (no es imposible)\n\n### Sabiduría (WIS)\n\n- Naturaleza: “reconocer huellas” en un suelo que tú preparaste con patrones engañosos (Ventaja para ti por Survival).\n\n### Carisma (CHA)\n\n- Eres el showrunner: declara que el juez será el PNJ que mejor te conozca o que más odie al rival (si el DM lo permite por ficción).\n- Buffs limpios: Enhance Ability (Eagle’s Splendor), Glibness (nivel alto), Friends (ojo al backlash luego), Mantle of Inspiration (Bardo).\n- Derrumbe del rival: súmale desventaja con Bane antes de la apuesta (si no lo prohibiste).\n- Escena preparada: luces, música (Instrumentos con competencia), vestuario → el DM puede otorgar Help o ventaja por “producción”.\n\n---\n\n## Ejemplos rápidos en mesa\n\n- “Soy más fuerte que tú”: declaras Grapple sobre una pasarela engrasada (Grease ya activo). Tiras Atletismo con ventaja por Bull’s Strength; él tira con desventaja por el terreno. Ganas → tu STR=20, su STR=1 por 1 min.\n- “Soy más rápido que tú”: definís “quien golpee primero una campana a 30 ft.”. Tenías Gift of Alacrity y Alert, ganas la Iniciativa → DEX 20 vs DEX 1.\n- “Soy más sabio que tú”: colocas una Silent Image de un guardia. Nadie avisó de “sin magia”. Él falla Percepción → tú aciertas Insight sobre sus dudas; WIS 20/1.\n- Se niega a aceptar: falla su Salvación de WIS → obligado a jugar.\n- Te pillan haciendo trampa fuera de lo pactado: perdiste automáticamente esa apuesta.\n\n# Avaricia\n\nmetodo ingenioso con el que ocultarse\nCuando te toca convierte tu edad en monedas, si vendes monedas por algo correcto por su valor, el objetivo pierde la edad equivalente, touch casteo, luego debes permanecer a 150 ft. del objetivo\n\n---\n\n# Lujuria\n\n- Cada vez que una criatura acepta algo que ofreces, pierde la capacidad de negarse a ti en el futuro mientras sigas a 60 ft. de ella.\n- Si intentan resistirse, su cuerpo empieza a arder en placer/dolor (daño psíquico 1d10 por turno).\n- El ataque inicial empieza con breve oferta, y luego lo encadena con sus ordenes para producir en ti más necesidades para que tengas que pedir más.\n\n---\n\n# Envidia e Ira\n\nEl usuario le quita una habilidad al enemigo, y por lo tanto atacara a la persona más cercana que tenga una habilidad parecida, por ejemplo si quitas un spell atacara al spellcaster más cercano, si quitas una arma, a la persona más cercana con arma\n\n---\n\n# Herejia\n\n- Puede hacer overwrite de una regla universal por turno\n\n---\n\n# Violencia y Pereza\n\nTodos los enemigos en el rango deben de atacar a alguien produciendo daño letal, sino lo hacen reciben daño, asi mismo, existe una aura de pereza que elimina todos los proyectiles y redice la velocidad de todos los aplicados en mucho, para asi obligarlos a que se tengan que pelear entre ellos. El usuario tiene un rango limitado y debe permanecer cerca de ellos, pero es su aura de pereza lo que le permite seguir vivo\n\n---\n\n# Fraude\n\nEl usuario es capaz de generar una copia casi exacta de un objeto o persona, pero con una diferencia, solo si el usuario es capaz de identificar el error podra evitar el daño, si falla quedara fuera de combate.\n\nLa idea es que lo haga con una moneda, un cuadro y una persona, dame ejemplos de cosas que no pueden ser falsificadas en cada caso\n\n---\n\n# Traición\n\n- El usuario y el objetivo, ambos pueden desvelar un dato de un aliado, si lo hacen un cuchillo plateado sale lanzado hacia la espalad del enemigo, dependiendo de la traicion: baja, media o elevada, el cuchillo hara más daño, es imposible de bloquear el cuchillo\n\n---"}'::jsonb)
on conflict (id) do update set
  type = excluded.type,
  title = excluded.title,
  subtitle = excluded.subtitle,
  image_url = excluded.image_url,
  parent_id = excluded.parent_id,
  summary = excluded.summary,
  description = excluded.description,
  details = excluded.details,
  updated_at = now();

insert into public.lore_entries (id, type, title, subtitle, image_url, parent_id, summary, description, details)
values ('95d13df4-5d46-b799-3bf6-cbfd1cbf0f48'::uuid, 'faction', 'Ejercito Bel', 'Auxiliar importado de Notion', '', '2e92c44c-9746-47d1-22cb-193953bb1c50'::uuid, 'Ciudad con espias / asediada: Bel aparece en medio de la ciudad, ya es suya, pero simplemente quieres hacerles sufrir, delante de la party Espias Seduccion Objetivo: explotar pasiones de nobles, oficiales o sacerdotes. Agentes necesarios: 1 espía atractivo por objetivo. Método: amantes secretos, hijos bastardos, chantaje con cartas o favores. (relacion incestuosa con supuesto hijo y la amante, su madre) Efecto: traiciones internas, filtración de secretos, chantaje emocional. Riesgo: alto, depende de la discreción...', 'Ciudad con espias / asediada:
Bel aparece en medio de la ciudad, ya es suya, pero simplemente quieres hacerles sufrir, delante de la party
- Espias
- Seduccion
- Objetivo: explotar pasiones de nobles, oficiales o sacerdotes.
- Agentes necesarios: 1 espía atractivo por objetivo.
- Método: amantes secretos, hijos bastardos, chantaje con cartas o favores. (relacion incestuosa con supuesto hijo y la amante, su madre)
- Efecto: traiciones internas, filtración de secretos, chantaje emocional.
- Riesgo: alto, depende de la discreción y carisma del espía.
- Intentara ligar con raul, orden de asmodeus
- Rumores
- Objetivo: quebrar la confianza interna.
- Agentes necesarios: tantos como ciudadanos comunes (20–50 en ciudades grandes).
- Método: sembrar historias falsas en mercados, tabernas y templos.
- Efecto: paranoia, linchamientos, pérdida de fe en líderes.
- Riesgo: bajo, difícil de rastrear el origen.
- odios raciales disputa religiosa
- Objetivo: fomentar conflictos étnicos.
- Agentes necesarios: 5–10 agitadores visibles.
- Método: asesinatos selectivos atribuidos a minorías, panfletos incendiarios, rumores.
- Efecto: guerra civil interna, motines, segregación que debilita su fuerza.
- Riesgo: medio, puede volverse impredecible.
- Changeling
- Objetivo: dividir la fe del enemigo.
- Agentes necesarios: 2–3 falsos sacerdotes + espías entre fieles.
- Método: introducir herejías, falsos milagros, acusar clérigos de corrupción.
- Efecto: pérdida de moral, ruptura de la unidad espiritual, guerras internas.
- Riesgo: medio-alto, depende de fanatismo religioso.
- campeon ejecutado publicamente
- Objetivo: destruir símbolos de esperanza.
- Agentes necesarios: 20–30 (para captura), 1...', '{"source_path":"export-a\\Auxiliar\\Averno\\Ejercito Bel 25a1744335cf8046a06efba0c3264ae0.md","image_refs":["Ejercito Bel/image.png","Ejercito Bel/image 1.png","Ejercito Bel/image 2.png","Ejercito Bel/image 3.png","Ejercito Bel/image 4.png","Ejercito Bel/image 5.png","Ejercito Bel/image 6.png","Ejercito Bel/image 7.png","Ejercito Bel/image 8.png","Ejercito Bel/image 9.png","Ejercito Bel/image 10.png","Ejercito Bel/image 11.png","Ejercito Bel/image 12.png","Ejercito Bel/image 13.png","Ejercito Bel/image 14.png","Ejercito Bel/image 15.png","Ejercito Bel/image 16.png","Ejercito Bel/image 17.png"],"imported_from":"Notion export","dm_source_markdown":"Ciudad con espias / asediada:\n\nBel aparece en medio de la ciudad, ya es suya, pero simplemente quieres hacerles sufrir, delante de la party\n\n- Espias\n    - Seduccion\n        - Objetivo: explotar pasiones de nobles, oficiales o sacerdotes.\n        - Agentes necesarios: 1 espía atractivo por objetivo.\n        - Método: amantes secretos, hijos bastardos, chantaje con cartas o favores. (relacion incestuosa con supuesto hijo y la amante, su madre)\n        - Efecto: traiciones internas, filtración de secretos, chantaje emocional.\n        - Riesgo: alto, depende de la discreción y carisma del espía.\n        - Intentara ligar con raul, orden de asmodeus\n    - Rumores\n        - Objetivo: quebrar la confianza interna.\n        - Agentes necesarios: tantos como ciudadanos comunes (20–50 en ciudades grandes).\n        - Método: sembrar historias falsas en mercados, tabernas y templos.\n        - Efecto: paranoia, linchamientos, pérdida de fe en líderes.\n        - Riesgo: bajo, difícil de rastrear el origen.\n    - odios raciales disputa religiosa\n        - Objetivo: fomentar conflictos étnicos.\n        - Agentes necesarios: 5–10 agitadores visibles.\n        - Método: asesinatos selectivos atribuidos a minorías, panfletos incendiarios, rumores.\n        - Efecto: guerra civil interna, motines, segregación que debilita su fuerza.\n        - Riesgo: medio, puede volverse impredecible.\n        - Changeling\n        - Objetivo: dividir la fe del enemigo.\n        - Agentes necesarios: 2–3 falsos sacerdotes + espías entre fieles.\n        - Método: introducir herejías, falsos milagros, acusar clérigos de corrupción.\n        - Efecto: pérdida de moral, ruptura de la unidad espiritual, guerras internas.\n        - Riesgo: medio-alto, depende de fanatismo religioso.\n    - campeon ejecutado publicamente\n        - Objetivo: destruir símbolos de esperanza.\n        - Agentes necesarios: 20–30 (para captura), 1 verdugo.\n        - Método: secuestro del héroe, falsa promesa de clemencia, ejecución ante multitudes.\n        - Efecto: desesperanza total, humillación colectiva, fractura del espíritu de lucha.\n        - Riesgo: alto, puede fallar y volverse mártir.\n        - les salva al principio, aparece el siguiente dia en la plaza destrozado\n\n    - competicion de nobles\n        - Objetivo: sembrar rivalidad entre aristócratas.\n        - Agentes necesarios: 1–2 espías cortesanos infiltrados.\n        - Método: sobornos, rumores de favoritismo, falsificación de cartas, inflar egos.\n        - Efecto: traiciones internas, disputas por recursos, nobles debilitando su propio reino.\n        - Riesgo: medio, lento pero duradero.\n\nCiudad conquistada:\n\n- Ejecucion Publica, se salva a uno de los de la ejecucion\n- Despues de conquistar se saquea y viola a sus mujeres\n- industria de guerra\n- Quemado grano porque no le sirve al ejercito\n- Al borde de la ambruna\n- efijes de cadaveres a la entrada\n\nPacto:\n\n- Tiamat:\n    - Proteje el acceso a dis, a cambio buscan una manera de liberarla\n    - No quieren, quieren derrotarla\n    - kobold y un dragon verde adulto\n\n- Abismo:\n    - joder a mephistopheles\n    - dretch quassit, tiefling negro\n\nEjercito:\n\ncambion\n\nbearded evil (fake odio) rabioso, stand del pelo de jojo\n\nspined devil (fake amor) acupuntura, monk no le hace nada\n\nimp\n\ntieflings\n\nnightmares\n\npit fiends\n\nsir ursas\n\nbotín, venganza, gloria\n\nno importa nadie\n\ndesertar morir\n\nenemigo imaginario\n\nse les obliga a matar a diario\n\nse muestran los soldados caidos como efijies\n\nejecucion publica diaria (normalmente inventada)\n\nse les emborracha antes del combate (infernal wine, Gughalaki halucinogeno Maladomini from fiendish giant centipedes Phlegethos from fire grapes, Screecher empanar\n\nse les da premios a los generales publicamente\n\nse desplazan sin comer\n\nDesvía ríos para inundar sus pasos, quema los bosques por donde deben cruzar, salpica los caminos con trampas\n\ntrampero\n\nleñador\n\nobrero\n\nAyer fuiste piadoso, hoy despiadado; ayer diste botín, hoy negaste pan; ayer huiste, hoy arrasas.\n\npantanos, montañas y desiertos\n\n- Carne de cañon (debiles al frente):\n    - Esclavos (Enemigos)\n    - Abyss\n    - Tiamat\n- Capitanes\n    - A sueldo\n    - Fingue odias\n    - Fingue amor\n    - han bajado los pagos devido a la falta de almas\n- Ataques de falsa bandera\n- Escuadrones suicidas (para deshacerse de capitanes corruptos)\n\nCombates:\n\n- Terreno de dispersión (cerca de casa, fácil retirarse).\n    - Aquí no mates: hazlos desertar. Difunde rumores de derrota, reparte sobornos y siembra discordia. No necesitan caer por tu espada, sino abandonar por sí mismos la causa.\n- Terreno ligero (entrada a tierra enemiga).\n    - Avanza rápido y roba todo. No te quedes: saquea aldeas, quema campos y deja hambre como herencia. Haz que el enemigo odie a su propio suelo por no poder protegerlo.\n- Terreno de disputa (ambas partes pueden tomar ventaja).\n    - Nunca luches limpio aquí. Traiciona, envenena pozos, coloca trampas, incendia los bosques. Que el enemigo tema la tierra más que a tu ejército.\n- Terreno de intersección (muchos caminos convergen).\n    - Conviértelo en un teatro de terror. Cuelga cadáveres en las rutas, deja mutilados vivos como advertencia. Haz que cada viajero lleve tu mensaje de horror a los cuatro vientos.\n- Terreno de comunicación (puertas entre reinos).\n    - Domínalo con sobornos y espionaje. Corrumpe a mercaderes, prostituye a mensajeros, falsifica edictos. Una orden falsa abre más puertas que un ariete.\n        - fake comerciante\n\n- Terreno serio (profundo en tierras enemigas).\n    - Aquí no hay regreso: devora lo que encuentres y destruye lo que no uses. Que tus soldados sepan que solo avanzando sobrevivirán. Quema la idea de retirada.\n- Terreno difícil (pantanos, montañas, desiertos).\n    - Empuja al enemigo a luchar contra el paisaje: hambre, peste, frío, calor. Aquí el terreno es tu ejército invisible; tú solo debes esperar a recoger cadáveres.\n\n        - tifling de desierto\n\n        - tiefling de pantano\n\n        - tiefling de montaña\n- Terreno cercado (salidas limitadas).\n    - Déjales una única vía de escape y clava trampas en ella. Que huyan desesperados hacia una muerte segura. Nada destruye más un ejército que ver morir a sus compañeros en la única puerta que les quedaba.\n- Terreno de muerte (donde no hay salida).\n    - Coloca a los tuyos aquí a propósito. La desesperación convierte a los hombres en monstruos. Lucharán como demonios porque saben que no hay salvación. Quien sobrevive a este infierno será tu herramienta más temible."}'::jsonb)
on conflict (id) do update set
  type = excluded.type,
  title = excluded.title,
  subtitle = excluded.subtitle,
  image_url = excluded.image_url,
  parent_id = excluded.parent_id,
  summary = excluded.summary,
  description = excluded.description,
  details = excluded.details,
  updated_at = now();

insert into public.lore_entries (id, type, title, subtitle, image_url, parent_id, summary, description, details)
values ('4c827c69-0db6-3072-b70d-a5789cd768e3'::uuid, 'faction', 'Ejercito de Zariel', 'Auxiliar importado de Notion', '', '2e92c44c-9746-47d1-22cb-193953bb1c50'::uuid, 'Primera jerarquía (más cercana a Dios, contemplación y adoración) 1. Serafines Nombre significa “ardientes”. Representan el fuego del amor divino y la adoración continua a Dios. Aparecen en Isaías 6:2 3. Flotan en el aire, dan de bufo a todos los creyentes: 2. Querubines Simbolizan plenitud de conocimiento y sabiduría divina. Guardan los misterios de Dios (Génesis 3:24, Ezequiel 10). Archivo en la ciudadela de zariel 3. Tronos Representan la estabilidad y la justicia de Dios. Se los ve como portadores de su...', 'Primera jerarquía (más cercana a Dios, contemplación y adoración)
1. Serafines
- Nombre significa “ardientes”.
- Representan el fuego del amor divino y la adoración continua a Dios.
- Aparecen en Isaías 6:2-3.
- Flotan en el aire, dan de bufo a todos los creyentes:
2. Querubines
- Simbolizan plenitud de conocimiento y sabiduría divina.
- Guardan los misterios de Dios (Génesis 3:24, Ezequiel 10).
- Archivo en la ciudadela de zariel
3. Tronos
- Representan la estabilidad y la justicia de Dios.
- Se los ve como portadores de su presencia y voluntad.
- Protectores da la ciudadel
Segunda jerarquía (gobierno del cosmos y mediación del poder divino)
1. Dominaciones (Dominions)
- Regulan las funciones de los ángeles inferiores y velan por el orden universal.
- teniente
2. Virtudes
- Asociados a milagros, fortaleza y energías divinas que sostienen la creación.
- encounter random
3. Potestades (Powers)
- Guardianes del orden cósmico, luchan contra las fuerzas del mal y la tentación.
- Ataca en el plano del bebe, solo arnau puede luchar
Tercera jerarquía (más cercana a los hombres, protectores y mensajeros)
1. Principados
- Custodios de naciones, pueblos o comunidades.
- Se relacionan con guiar a líderes y reinos.
- hay uno con cada principe del infierno
2. Arcángeles
- Mensajeros especiales en misiones decisivas.
- Los más conocidos: Miguel, Gabriel y Rafael (nombrados en Biblia y tradición).
3. 6Ángeles
- Los más cercanos al ser humano.
- Incluyen a los ángeles custodios o guardianes, que acompañan y protegen a cada persona.
- tieflings de zariel
Jardin corrupto
con serpientes
archivo
ciudad
empireo, trono', '{"source_path":"export-a\\Auxiliar\\Averno\\Ejercito de Zariel 25b1744335cf80f08cc2c610d5f7602b.md","image_refs":["Ejercito de Zariel/image.png","Ejercito de Zariel/image 1.png","Ejercito de Zariel/image 2.png","Ejercito de Zariel/image 3.png","Ejercito de Zariel/image 4.png","Ejercito de Zariel/image 5.png","Ejercito de Zariel/image 6.png","Ejercito de Zariel/image 7.png","Ejercito de Zariel/image 8.png","Ejercito de Zariel/image 9.png","Ejercito de Zariel/image 10.png"],"imported_from":"Notion export","dm_source_markdown":"### Primera jerarquía (más cercana a Dios, contemplación y adoración)\n\n1. Serafines\n    - Nombre significa “ardientes”.\n    - Representan el fuego del amor divino y la adoración continua a Dios.\n    - Aparecen en Isaías 6:2-3.\n    - Flotan en el aire, dan de bufo a todos los creyentes:\n\n2. Querubines\n    - Simbolizan plenitud de conocimiento y sabiduría divina.\n    - Guardan los misterios de Dios (Génesis 3:24, Ezequiel 10).\n    - Archivo en la ciudadela de zariel\n\n3. Tronos\n    - Representan la estabilidad y la justicia de Dios.\n    - Se los ve como portadores de su presencia y voluntad.\n    - Protectores da la ciudadel\n\n---\n\n### Segunda jerarquía (gobierno del cosmos y mediación del poder divino)\n\n1. Dominaciones (Dominions)\n    - Regulan las funciones de los ángeles inferiores y velan por el orden universal.\n    - teniente\n\n2. Virtudes\n    - Asociados a milagros, fortaleza y energías divinas que sostienen la creación.\n    - encounter random\n\n3. Potestades (Powers)\n    - Guardianes del orden cósmico, luchan contra las fuerzas del mal y la tentación.\n    - Ataca en el plano del bebe, solo arnau puede luchar\n\n---\n\n### Tercera jerarquía (más cercana a los hombres, protectores y mensajeros)\n\n1. Principados\n    - Custodios de naciones, pueblos o comunidades.\n    - Se relacionan con guiar a líderes y reinos.\n    - hay uno con cada principe del infierno\n\n2. Arcángeles\n    - Mensajeros especiales en misiones decisivas.\n    - Los más conocidos: Miguel, Gabriel y Rafael (nombrados en Biblia y tradición).\n\n3. 6Ángeles\n    - Los más cercanos al ser humano.\n    - Incluyen a los ángeles custodios o guardianes, que acompañan y protegen a cada persona.\n\n- tieflings de zariel\n\nJardin corrupto\n\ncon serpientes\narchivo\n\nciudad\n\nempireo, trono"}'::jsonb)
on conflict (id) do update set
  type = excluded.type,
  title = excluded.title,
  subtitle = excluded.subtitle,
  image_url = excluded.image_url,
  parent_id = excluded.parent_id,
  summary = excluded.summary,
  description = excluded.description,
  details = excluded.details,
  updated_at = now();

insert into public.lore_entries (id, type, title, subtitle, image_url, parent_id, summary, description, details)
values ('47d43de6-13cf-eba3-71a2-df304c9fdb23'::uuid, 'other', 'El Arte de la Guerra by Aldepe', 'Auxiliar importado de Notion', '', '2e92c44c-9746-47d1-22cb-193953bb1c50'::uuid, 'Planes iniciales (計篇, Jì Piān) La guerra no se gana con honor, sino con ventaja. Olvida la justicia: el único juicio válido es la victoria. Quien controla la mentira, controla la guerra. Inunda al enemigo de falsos informes, rumores y traiciones. La confusión mata más que las lanzas. El oro vence antes que la espada. Compra la lealtad de sus capitanes, soborna a sus sacerdotes, siembra discordia en su pueblo. La corrupción abre más murallas que los arietes. La moral de los tuyos es un recurso, no un deber. Si...', '- Planes iniciales (計篇, Jì Piān)
- La guerra no se gana con honor, sino con ventaja.
- Olvida la justicia: el único juicio válido es la victoria.
- Quien controla la mentira, controla la guerra.
- Inunda al enemigo de falsos informes, rumores y traiciones. La confusión mata más que las lanzas.
- El oro vence antes que la espada.
- Compra la lealtad de sus capitanes, soborna a sus sacerdotes, siembra discordia en su pueblo. La corrupción abre más murallas que los arietes.
- La moral de los tuyos es un recurso, no un deber.
- Si deben odiarte para temerte, permite que te odien. Si deben amarte para obedecerte, finge amor. Solo importa que marchen cuando ordenes.
- El hambre es un arma más aguda que el acero.
- Envenena sus pozos, quema sus campos, roba sus reservas. Un ejército sin pan se derrota solo.
- Usa la piedad como trampa.
- Finge clemencia con algunos prisioneros para que lleven esperanza al enemigo. Así se mantendrán luchando por una salvación que nunca llegará.
- Las alianzas son cuchillos envainados.
- Haz pactos sabiendo que romperás todos. La lealtad es un disfraz; la traición, una herramienta.
- Los dioses no luchan en tu guerra.
- Haz lo que incluso ellos llamarían crimen, porque ellos no pagan el precio de la derrota.
- Planifica como si fueras eterno, actúa como si fueras condenado.
- Asegura tu legado con sangre, porque los vencedores escriben la historia, y la historia limpia todos los pecados.
- Emprender la acción (作戰, Zuò Zhàn)
- Una guerra larga mata al débil, pero engorda al astuto.
- No sostengas ejércitos con tus propios recursos: aliméntalos con los pueblos conquistados.
- El saqueo es la primera línea de suministro.
- Cada ciudad tomada debe...', '{"source_path":"export-a\\Auxiliar\\Averno\\El Arte de la Guerra by Aldepe 25a1744335cf8048b683f4bc82d62943.md","image_refs":[],"imported_from":"Notion export","dm_source_markdown":"- Planes iniciales (計篇, Jì Piān)\n    - La guerra no se gana con honor, sino con ventaja.\n        - Olvida la justicia: el único juicio válido es la victoria.\n    - Quien controla la mentira, controla la guerra.\n        - Inunda al enemigo de falsos informes, rumores y traiciones. La confusión mata más que las lanzas.\n    - El oro vence antes que la espada.\n        - Compra la lealtad de sus capitanes, soborna a sus sacerdotes, siembra discordia en su pueblo. La corrupción abre más murallas que los arietes.\n    - La moral de los tuyos es un recurso, no un deber.\n        - Si deben odiarte para temerte, permite que te odien. Si deben amarte para obedecerte, finge amor. Solo importa que marchen cuando ordenes.\n    - El hambre es un arma más aguda que el acero.\n        - Envenena sus pozos, quema sus campos, roba sus reservas. Un ejército sin pan se derrota solo.\n    - Usa la piedad como trampa.\n        - Finge clemencia con algunos prisioneros para que lleven esperanza al enemigo. Así se mantendrán luchando por una salvación que nunca llegará.\n    - Las alianzas son cuchillos envainados.\n        - Haz pactos sabiendo que romperás todos. La lealtad es un disfraz; la traición, una herramienta.\n    - Los dioses no luchan en tu guerra.\n        - Haz lo que incluso ellos llamarían crimen, porque ellos no pagan el precio de la derrota.\n    - Planifica como si fueras eterno, actúa como si fueras condenado.\n        - Asegura tu legado con sangre, porque los vencedores escriben la historia, y la historia limpia todos los pecados.\n- Emprender la acción (作戰, Zuò Zhàn)\n    - Una guerra larga mata al débil, pero engorda al astuto.\n        - No sostengas ejércitos con tus propios recursos: aliméntalos con los pueblos conquistados.\n    - El saqueo es la primera línea de suministro.\n        - Cada ciudad tomada debe pagar en grano, oro y carne. Así los ejércitos no consumen tu riqueza, sino la de tus enemigos.\n    - La tierra conquistada debe ser despojada hasta los huesos.\n        - Lo que no puedas llevar, quémalo. Lo que no puedas usar, arruínalo. Lo que no puedas vender, mata.\n    - Haz que la guerra se pague sola.\n        - No mantengas ejércitos con tu tesoro: mantén ejércitos con esclavos, botín y miedo.\n    - El terror es una inversión barata.\n        - Si ejecutas a cien, diez mil se someterán. El miedo ahorra más acero que cualquier espada.\n    - Los prisioneros son moneda.\n        - Cámbialos por recursos, véndelos como esclavos o úsalos como carne de vanguardia. Nunca desperdicies un enemigo vivo.\n    - Las ciudades que se rinden deben ser exprimidas, no destruidas.\n        - Que paguen tributo y sigan produciendo, pero siempre al borde del hambre, para recordarles quién controla su pan.\n    - El botín alimenta la codicia de los tuyos.\n        - Permite que los soldados saqueen. Un ejército que roba es un ejército leal, porque lucha por su propio provecho.\n    - El pillaje sistemático es más eficaz que la táctica.\n        - Una guerra se gana más rápido arruinando su economía que rompiendo sus ejércitos.\n    - Nunca cargues con el peso de la compasión.\n        - La clemencia cuesta provisiones, la misericordia consume recursos. El soldado que sobrevive sin matar, muere de hambre mañana.\n- Estratagemas ofensivas (謀攻, Móu Gōng)\n    - El golpe más certero no se da en el campo, sino en la cama del enemigo.\n        - Seduce, compra o corrompe a sus esposas, amantes, hijos y sirvientes. Un veneno vertido en la intimidad vale más que cien espadas.\n    - La traición es la forma más pura de victoria.\n        - No destruyas una fortaleza: compra al guardia que abre la puerta. No aniquiles a un ejército: convence a sus generales de que cambien de bando.\n    - Rompe la voluntad antes que los muros.\n        - Extiende rumores de derrotas inexistentes, de monstruos invisibles, de dioses que los han abandonado. Cuando crean que ya han perdido, ni un ejército entero los salvará.\n    - Divide no para debilitar, sino para devorar.\n        - Fomenta odios raciales, rivalidades tribales y disputas religiosas. Así el enemigo se arruina luchando consigo mismo, mientras tú recoges los restos.\n    - Usa la diplomacia como máscara de la daga.\n        - Envía embajadores con sonrisas, mientras tus asesinos buscan la garganta de sus reyes. Una firma en un tratado abre más sepulcros que una lanza.\n    - Los héroes del enemigo deben morir primero.\n        - Un pueblo sin símbolos se derrumba. Ejecuta a sus campeones en público o conviértelos en traidores mediante falsos testimonios.\n    - Quema su fe.\n        - Profana sus templos, ridiculiza a sus profetas, siembra escándalos en sus sacerdotes. Sin religión que los sostenga, serán barro en tus manos.\n    - El engaño perfecto es hacer que el enemigo crea que te ha engañado.\n        - Entrégale información falsa, haz que crea que ha descubierto tu secreto. El orgullo abre más trampas que la ingenuidad.\n    - Nunca derroques un reino: apodérate de él desde dentro.\n        - Haz que sus nobles compitan por tu favor. Hazlos traicionar a su propio rey, y cúbrelos de oro hasta que olviden quién gobernaba antes.\n    - La guerra más limpia es la que se libra sin desenvainar.\n        - Porque cuando un pueblo ya cree que ha perdido, lo hará tu esclavo por su propia voluntad.\n- Disposiciones (軍形, Jūn Xíng)\n    - Un soldado es un recurso, no una vida.\n        - Se le gasta como una flecha o se le quiebra como un escudo. El ejército no existe para salvar a los hombres, sino para salvar la victoria.\n    - Pon a los débiles al frente.\n        - Los inexpertos, los esclavos, los prisioneros: que sangren primero. Sus cuerpos compran tiempo para los verdaderos guerreros.\n    - Haz de la muerte una muralla.\n        - Las pilas de cadáveres crean miedo, bloquean caminos, corrompen el aire. Lo que muere puede seguir sirviendo.\n    - El valor se compra con la desesperación.\n        - Encierra a tus tropas entre el enemigo y la imposibilidad de huir. Así lucharán con furia porque saben que morirán igual.\n    - Protege siempre lo que brilla, sacrifica lo que sobra.\n        - Los generales, los portaestandartes, los campeones: cuida su vida. Son símbolos. Las masas solo son combustible.\n    - Un ejército sin miedo al castigo es un ejército inútil.\n        - La disciplina se escribe en sangre. Un soldado que desobedece debe morir, no importa el motivo. Su cadáver es la lección.\n    - El hambre y la fatiga no son castigos: son armas.\n        - Un ejército al límite obedece más rápido que uno saciado. El descanso demasiado largo engendra dudas y desobediencia.\n    - Usa a los hombres como carnada.\n        - Envía a escuadras enteras como cebo, aun sabiendo que serán aniquiladas. Lo importante no es que vuelvan, sino a dónde llevan al enemigo.\n    - Un soldado que muere en tu nombre no es pérdida: es inversión.\n        - Cada muerte gloriosa fortalece tu leyenda. Cuanto más cadáveres sostenga tu causa, más temida será.\n    - La disposición perfecta es la que convierte la derrota en un espectáculo de terror.\n        - Si tus hombres caen, que lo hagan con brutalidad. Que el enemigo vea que aun vencidos, tus soldados maldicen, mutilan y mueren como demonios.\n- Energía (兵勢, Bīng Shì)\n    - La ira es más fiable que la lealtad.\n        - Un soldado que odia luchará con más ferocidad que uno que obedece. Crea enemigos imaginarios si es necesario: el odio es la cuerda que tira del acero.\n    - El miedo mueve más rápido que el tambor.\n        - Infunde terror a tus tropas para que corran hacia la batalla como si huyeran de ti. Su impulso no será valentía, sino instinto de supervivencia.\n    - Haz de la violencia un hábito.\n        - Un hombre que mata una vez duda; uno que ha matado cien veces mata sin pensar. El hábito transforma el horror en rutina, y la rutina en fuerza.\n    - El vino y la sangre son motores gemelos.\n        - Embriaga a tus tropas antes del combate, hazlas beber de la furia y de la violencia. Un ejército ebrio es caótico, pero también imparable.\n    - La energía del pueblo es una mina: excávase con mentiras.\n        - Promételes botín, venganza, gloria, aunque nada de ello les des. El engaño mantiene encendida la hoguera del esfuerzo.\n    - El clamor del dolor ajeno multiplica tu fuerza.\n        - Deja que los soldados vean los cuerpos mutilados de los suyos; así lucharán como bestias sin razón, buscando desquitarse con el enemigo.\n    - Dirige el odio como un río.\n        - No lo detengas, condúcelo. Un ejército descontrolado se autodestruye, pero un ejército al que guías con promesas de carnicería arrasa todo a su paso.\n    - La crueldad calculada es el látigo de la energía.\n        - Ejecuta públicamente a los tuyos de vez en cuando. La visión de la muerte aviva la disciplina y enciende la rabia contenida.\n    - Deja que la desesperación sea su estandarte.\n        - Un ejército sin escapatoria se convierte en un enjambre rabioso. No les des más opción que matar o morir: elegirán matar.\n    - La energía no se conserva: se exprime.\n        - No pienses en mañana; usa hasta el último gramo de fuerza hoy. El ejército que se guarda se oxida. El ejército que se consume conquista.\n- Puntos débiles y fuertes (虛實, Xū Shí)\n    1. No ataques sus murallas: ataca su miedo.\n        - Todo hombre teme algo: la oscuridad, la humillación, la traición. Averígualo y haz de ello tu espada.\n    2. El oro atraviesa corazas mejor que las flechas.\n        - El más leal de sus soldados aún tiene un precio. Busca quién necesita más: el que tiene hambre, el que desea carne, el que ansía poder.\n    3. No rompas ejércitos, rompe voluntades.\n        - Difunde dudas sobre su mando, fabrica rumores de traición, susurra que su dios los ha abandonado. Un ejército que se desconfía a sí mismo ya está vencido.\n    4. El orgullo es la grieta más común.\n        - Elogia a sus generales para que se precipiten al combate. Llama cobardes a sus tropas y correrán hacia la trampa para probar su valor.\n    5. Los fuertes se convierten en débiles al aislarlos.\n        - Separa a los campeones del resto. Sobrecárgalos de gloria y honor hasta que sus aliados los envidien. El héroe odiado por los suyos es un hombre solo.\n    6. Haz que su fuerza trabaje contra él.\n        - Provoca al ejército numeroso hasta que se desborde en tierras pobres y hambrientas. El tamaño de su fuerza será su ruina.\n    7. El cansancio es la llave de todas las puertas.\n        - Haz que marchen de noche, que luchen sin descanso, que vigilen sombras. La fatiga volverá a los más valientes en cobardes.\n    8. Ataca donde esperan la paz.\n        - Asalta los templos en la hora de oración, quema sus campos en la cosecha, mata a sus líderes durante los banquetes. Lo sagrado y lo festivo son tu mejor campo de batalla.\n    9. Nunca muestres tu hambre, siempre sugiere abundancia.\n        - Haz creer al enemigo que tus reservas son infinitas, incluso cuando mueres de hambre. Su miedo a tu aparente fuerza multiplicará tus tropas invisibles.\n    10. El punto fuerte de un enemigo es un disfraz: desgarra la máscara.\n    - Un muro alto oculta un cimiento débil. Una voz firme tapa un corazón inseguro. Un ejército disciplinado esconde soldados resentidos. Arranca cada velo hasta encontrar la carne blanda.\n- Maniobras (軍爭, Jūn Zhēng)\n    1. El camino más corto es el cadáver del enemigo.\n        - No busques rutas seguras: crea tu propio sendero atravesando ciudades arrasadas y pueblos vacíos.\n    2. La marcha es un arma: hazla dolorosa.\n        - Haz que tus tropas caminen sin descanso, con hambre y con miedo. Un ejército quebrado por la fatiga será más brutal en la batalla.\n    3. El terreno hostil es tu aliado.\n        - Arrastra al enemigo hacia pantanos, desiertos o montañas. Déjalo que se desangre contra la naturaleza, mientras tú ya aprendiste a sobrevivir en ella.\n    4. El hambre del enemigo es tu provisión.\n        - No alimentes a tus tropas con tus recursos: aliméntalas con lo que arrebaten en la marcha. Cada saqueo es un banquete, cada incendio un suministro.\n    5. Una emboscada bien hecha es un ejército invisible.\n        - Que tus hombres esperen en silencio entre los árboles o bajo la arena. La muerte que no se ve es la que más aterra.\n    6. Sacrifica carne para ganar tiempo.\n        - Envía destacamentos enteros a morir con la única tarea de frenar la marcha enemiga. Sus gritos valen más que su acero.\n    7. Haz que la marcha enemiga sea un suplicio.\n        - Desvía ríos para inundar sus pasos, quema los bosques por donde deben cruzar, salpica los caminos con trampas y cadáveres envenenados.\n    8. Que el enemigo nunca sepa dónde estás realmente.\n        - Haz creer que marchas hacia el norte mientras tus tropas aparecen por el sur. Una sombra errante en el mapa vale más que un ejército en el campo.\n    9. La desorientación es una victoria parcial.\n        - Si tus enemigos se pierden en su propia tierra, ya están medio derrotados. Un ejército sin rumbo se devora a sí mismo.\n    10. Nunca temas gastar vidas, teme gastar oportunidades.\n    - Un desvío sangriento, un sacrificio de tropas, una marcha imposible: todo se justifica si al final el enemigo cae en tu trampa.\n- Variantes (九變, Jiǔ Biàn)\n    1. El enemigo espera coherencia; dale locura.\n        - Ataca cuando deberías huir, huye cuando deberías atacar. Haz de la imprevisibilidad tu estandarte, y quebrarás la mente antes que la carne.\n    2. Una retirada puede ser la emboscada más cruel.\n        - Huye fingiendo miedo, arrástralos tras de ti y haz que persigan tu sombra hasta su tumba.\n    3. La traición es una variante legítima.\n        - Cambia de aliados en el instante más inesperado. Quien confíe en ti debe aprender demasiado tarde que tu lealtad era un disfraz.\n    4. No te cases con un método: cásate con el caos.\n        - Un ejército predecible es un ejército muerto. Haz que tus propios hombres teman tus órdenes, así el enemigo jamás sabrá qué esperar.\n    5. El exceso de orden es una debilidad.\n        - Un ejército demasiado disciplinado se quiebra ante la sorpresa. Desorganiza lo tuyo de vez en cuando para que ni siquiera tú mismo seas previsible.\n    6. La máscara del agotamiento.\n        - Finge debilidad, muestra harapos, simula hambre. Que crean que estás roto, y que tu ataque llegue con la fuerza de mil demonios.\n    7. El exceso de fuerza puede ser un anzuelo.\n        - Deja expuesta tu mejor tropa, como si fuera un descuido. Cuando el enemigo se lance contra ella, ciérralo en un abrazo mortal.\n    8. Usa la variante del castigo.\n        - Haz que tus tropas teman más a tu mano que a la del enemigo. Un soldado que no sepa si lo recompensarás o lo ejecutarás será tan imprevisible como tú.\n    9. El caos calculado es más eficaz que la estrategia rígida.\n        - Que tus ejércitos parezcan erráticos: un monstruo sin cabeza, una tormenta sin forma. La falta de lógica es un veneno imposible de contrarrestar.\n    10. Nunca seas el mismo general dos veces.\n    - Ayer fuiste piadoso, hoy despiadado; ayer diste botín, hoy negaste pan; ayer huiste, hoy arrasas. Que tu nombre sea sinónimo de incertidumbre.\n- Marchas (行軍, Xíng Jūn)\n1. La marcha no es tránsito, es castigo.\n    - Haz que tus tropas sufran en el movimiento: hambre, frío, calor, sed. La miseria los convierte en bestias y las bestias luchan mejor que los hombres.\n2. El camino más duro templa más que el acero.\n    - Nunca elijas el paso fácil. Arrástralos por pantanos, montañas y desiertos. Quien sobreviva a la marcha, sobrevivirá al combate.\n3. Haz del terreno un verdugo.\n    - Quiebra puentes tras de ti, envenena los pozos, incendia los bosques. El suelo que pisan debe recordarles que nadie está a salvo.\n4. Quien marcha contigo debe temerte más que al enemigo.\n    - Que tus soldados crean que una pausa injustificada es una condena. Su obediencia crecerá con cada gota de sudor derramada en tu nombre.\n5. El enemigo que marcha demasiado es ya tu aliado.\n    - Si lo fuerzas a perseguirte en exceso, el hambre y el cansancio serán tus cómplices. Desgástalo hasta que te ruegue por una batalla decisiva.\n6. Los muertos deben señalar el camino.\n    - Cuelga cadáveres en los árboles, abandona cuerpos en los cruces, decora los senderos con calaveras. El paisaje debe ser un mapa de terror.\n7. El cansancio vuelve cobarde al héroe.\n    - Estira las jornadas hasta quebrar el espíritu de los más valientes. El guerrero que tropieza de fatiga será más frágil que el campesino que duerme.\n8. Usa la marcha para sembrar la paranoia.\n    - Difunde rumores de emboscadas inexistentes, de espíritus en los bosques, de enemigos invisibles. El miedo adelgaza las piernas más que el cansancio.\n9. La retirada es también una marcha: hazla sangrienta.\n    - Al huir, quema aldeas, mata ganado, arruina cosechas. Que tu sombra sea hambre y tu paso, ruina.\n10. La marcha es la primera batalla.\n    - Si tu ejército llega entero y descansado, has sido blando. Si llega roto, mutilado y rabioso, entonces ya lo has forjado para la matanza.\n- Terreno (地形, Dì Xíng)\n    - El terreno no es neutral: es cómplice del que lo domina.\n        - Convierte montañas en fosas, ríos en trampas, desiertos en hornos. Haz que el suelo mismo sirva a tu causa.\n    - Las llanuras son para la masacre.\n        - Un terreno abierto no es para la gloria de la caballería, sino para exhibir cadáveres y aterrorizar a los pueblos cercanos con el espectáculo de la carnicería.\n    - Los bosques son tumbas en espera.\n        - Prepara emboscadas, incendios y trampas ocultas. Que cada árbol sea un verdugo que se abalanza sobre el enemigo.\n    - Los ríos son cuchillas líquidas.\n        - Envenénalos río arriba, ahoga al enemigo en sus corrientes, o rómpelos con cadáveres para corromper el agua y sembrar pestilencia.\n    - Las montañas son guardianes crueles.\n        - Haz que tus hombres vivan entre peñascos imposibles y empuja al enemigo a escalar donde solo hallará rocas sueltas, avalanchas y flechas desde lo alto.\n    - Las ciudades amuralladas son panales de carne.\n        - Si no puedes tomarlas, ciérralas hasta pudrirlas de hambre. La peste hará tu trabajo. Si caen, desangra sus calles para que otras ciudades se rindan sin luchar.\n    - El desierto es tu aliado más fiel.\n        - No necesita soldados: marchará con el sol abrasando, la sed matando y la arena ocultando los cadáveres.\n    - El terreno fértil debe arruinarse.\n        - Quema cosechas, roba ganado, arrasa molinos. Haz que la tierra fértil se convierta en tierra maldita: quien sobreviva al combate morirá de hambre.\n    - El terreno en disputa es un teatro de engaños.\n        - Nunca entres al lugar que todos desean con la intención de defenderlo: entra para corromperlo. Minar un puerto, envenenar un mercado o destruir un santuario vale más que cualquier victoria en campo abierto.\n    - El mejor terreno es el de la desesperación.\n        - Coloca a tus tropas donde no puedan huir y al enemigo donde crea tener escapatoria. La desesperación transforma a los tuyos en bestias, y la falsa seguridad convierte al enemigo en presa.\n- Las nueve clases de terreno (九地, Jiǔ Dì)\n    - Terreno de dispersión (cerca de casa, fácil retirarse).\n        - Aquí no mates: hazlos desertar. Difunde rumores de derrota, reparte sobornos y siembra discordia. No necesitan caer por tu espada, sino abandonar por sí mismos la causa.\n    - Terreno ligero (entrada a tierra enemiga).\n        - Avanza rápido y roba todo. No te quedes: saquea aldeas, quema campos y deja hambre como herencia. Haz que el enemigo odie a su propio suelo por no poder protegerlo.\n    - Terreno de disputa (ambas partes pueden tomar ventaja).\n        - Nunca luches limpio aquí. Traiciona, envenena pozos, coloca trampas, incendia los bosques. Que el enemigo tema la tierra más que a tu ejército.\n    - Terreno de intersección (muchos caminos convergen).\n        - Conviértelo en un teatro de terror. Cuelga cadáveres en las rutas, deja mutilados vivos como advertencia. Haz que cada viajero lleve tu mensaje de horror a los cuatro vientos.\n    - Terreno de comunicación (puertas entre reinos).\n        - Domínalo con sobornos y espionaje. Corrumpe a mercaderes, prostituye a mensajeros, falsifica edictos. Una orden falsa abre más puertas que un ariete.\n    - Terreno serio (profundo en tierras enemigas).\n        - Aquí no hay regreso: devora lo que encuentres y destruye lo que no uses. Que tus soldados sepan que solo avanzando sobrevivirán. Quema la idea de retirada.\n    - Terreno difícil (pantanos, montañas, desiertos).\n        - Empuja al enemigo a luchar contra el paisaje: hambre, peste, frío, calor. Aquí el terreno es tu ejército invisible; tú solo debes esperar a recoger cadáveres.\n    - Terreno cercado (salidas limitadas).\n        - Déjales una única vía de escape y clava trampas en ella. Que huyan desesperados hacia una muerte segura. Nada destruye más un ejército que ver morir a sus compañeros en la única puerta que les quedaba.\n    - Terreno de muerte (donde no hay salida).\n        - Coloca a los tuyos aquí a propósito. La desesperación convierte a los hombres en monstruos. Lucharán como demonios porque saben que no hay salvación. Quien sobrevive a este infierno será tu herramienta más temible.\n- Ataque con fuego (火攻, Huǒ Gōng)\n    - El fuego no mata: borra.\n        - Un cadáver aún inspira compasión; un montón de cenizas no inspira nada. Quema al enemigo hasta que no quede ni su recuerdo.\n    - Quema primero lo que alimenta.\n        - Incendia graneros, establos, molinos. El hambre arderá más tiempo que cualquier llama.\n    - Quema lo que protege.\n        - Casas, murallas, templos. Haz que sus refugios sean hornos y que los supervivientes corran desnudos bajo el humo.\n    - Quema lo que inspira.\n        - Incendia estatuas, reliquias, bibliotecas. Que sus dioses sean humo y sus libros ceniza. Un pueblo sin símbolos es un pueblo que se rinde.\n    - El fuego es maestro del miedo.\n        - No necesitas matar a todos: basta con que las llamas sean visibles desde leguas de distancia. Que las aldeas vecinas crean que arderán mañana.\n    - El fuego es un ejército que no traiciona.\n        - No pide paga ni descanso, no duda ni obedece. Solo destruye. Allí donde tus hombres no alcancen, que llegue la llama.\n    - Los gritos son parte de la estrategia.\n        - Deja que los condenados ardan vivos. Sus alaridos son un mensaje más fuerte que cualquier estandarte.\n    - Quema de noche, cuando las estrellas callan.\n        - El resplandor en la oscuridad enloquece más que el calor del día. La noche ardiente convierte a todo hombre en insomne y cobarde.\n    - Haz que el fuego viaje.\n        - Lanza teas al viento, esparce aceite en los ríos, prende caravanas para que las llamas se desplacen solas. Que el fuego parezca tener voluntad propia.\n    - Cuando todo arda, ofrece cenizas como misericordia.\n        - Permite que algunos vivan entre ruinas, sin techo ni cosecha. Ellos serán tus heraldos: contarán que desciendes como una hoguera imposible de apagar.\n- Uso de espías (用間, Yòng Jiàn)\n    - Un espía vale más que mil soldados.\n        - El ejército mata cuerpos, el espía mata naciones. La daga de la traición perfora más profundo que las lanzas.\n    - No compres información: compra conciencias.\n        - Un mapa caduca, una ruta cambia, pero un alma vendida servirá para siempre.\n    - El espía perfecto no informa: envenena.\n        - Siembra rumores, inventa profecías, crea discordias. No basta con que te diga lo que ocurre: haz que cause lo que necesitas.\n    - El espía interno es un veneno lento.\n        - Infiltra criados, amantes, escribas. Que corrompan la casa desde la cama, el altar o la cocina. Nadie sospecha del que está siempre cerca.\n    - El espía doble es el arma más cruel.\n        - Haz que crea que trabaja para ti, y haz que el enemigo crea que trabaja para él. Conviértelo en un hombre sin patria, sin fe, sin dueño.\n    - El espía sacrificado es el precio de la mentira perfecta.\n        - Entrega falsos aliados para que mueran en manos enemigas, y deja que su sangre valide todas tus falsedades.\n    - El espía viviente es la prolongación de tu sombra.\n        - Un hombre que respira entre tus enemigos debe respirar por ti: dormir con ellos, rezar con ellos, reír con ellos… y clavarles el puñal al amanecer.\n    - Los espías no son hombres: son herramientas.\n        - Úsalos, exprímelos, destrúyelos. Su vida importa menos que un susurro de información.\n    - El mayor triunfo del espía no es revelar un secreto, sino crear uno.\n        - Fabrica falsos complots, acusa inocentes, convence al enemigo de que sus generales conspiran. Déjalos matar entre sí mientras tú observas.\n    - El espía muerto aún sirve.\n        - Su cadáver hallado con documentos falsos puede arruinar a un rey, dividir un ejército o derrumbar una ciudad. Hasta en la tumba trabaja para ti."}'::jsonb)
on conflict (id) do update set
  type = excluded.type,
  title = excluded.title,
  subtitle = excluded.subtitle,
  image_url = excluded.image_url,
  parent_id = excluded.parent_id,
  summary = excluded.summary,
  description = excluded.description,
  details = excluded.details,
  updated_at = now();

insert into public.lore_entries (id, type, title, subtitle, image_url, parent_id, summary, description, details)
values ('2e92c44c-9746-47d1-22cb-193953bb1c50'::uuid, 'zone', 'Averno', 'Auxiliar importado de Notion', '', null, 'Averno No lucharian Zariel no lucharia, esta ocupada, los obligaria a luchar en la blood war Bel no lucharia, es leal, les pediria ayuda para atacar al abismo o a zariel, a cambio les abriria la veda de tiamat Tiamat esta ocupado en liberarse Tropas de Mammon, simplemente los querrian para ellos Tropas de Mephistopheles, , simplemente los querrian para ellos Tropas del abismo, de momento no les van a matar, pero más les vale descubrir en que estan, si les ayudan en la blood war les levarian por el rio stygia...', 'Averno - No lucharian
Zariel no lucharia, esta ocupada, los obligaria a luchar en la blood war
Bel no lucharia, es leal, les pediria ayuda para atacar al abismo o a zariel, a cambio les abriria la veda de tiamat
Tiamat esta ocupado en liberarse
Tropas de Mammon, simplemente los querrian para ellos
Tropas de Mephistopheles, , simplemente los querrian para ellos
Tropas del abismo, de momento no les van a matar, pero más les vale descubrir en que estan, si les ayudan en la blood war les levarian por el rio stygia
ubicaciones:
ciudad de bronce de bel
castillo flotante de zariel
caverna de tiamat
campo de batalla
hellrides, supervivientes de elturiel, elturiel
el rio stygia
📜 Zariel
Jynx, Infernal Machine
Dogma: "El riesgo es prueba de valentía."
Principios:
- Quien calla, otorga.
- No actuar es ponerse del lado del culpable.
- Siempre hay un modo.
- La justicia exige compromiso.
📜 Zariel
Zariel es adorada scomo la encarnación de la iniciativa y la valentía de actuar.
Para sus fieles, el universo es un campo de batalla donde la inacción es complicidad. Los dioses que observan desde lo alto sin intervenir son, en cierto modo, culpables por omisión.
Zariel es vista como aquella que arriesgó todo por involucrarse, incluso a costa de su caída. Su ejemplo inspira a quienes creen que la justicia requiere sacrificio, incluso de uno mismo.
Dogma
Mantra: “El riesgo es prueba de valentía.”
El valor no se mide en palabras, sino en actos.
La neutralidad es mentira: todo silencio favorece al opresor.
Los dioses que no actúan son traidores al orden que dicen proteger.
- Declaración de turno: el usuario actúa normalmente: movimientos, ataques, conjuros, habilidades.
- Activación de Chrono...', '{"source_path":"export-a\\Auxiliar\\Averno 2521744335cf80dcb924e5e61485cab8.md","image_refs":["Averno/image.png","Averno/6318be89-c0d5-4c98-8bc1-25e2624b240e.png","Averno/Imagen_de_WhatsApp_2025-08-15_a_las_21.40.43_7bbb00cb.jpg","Averno/Imagen_de_WhatsApp_2025-08-15_a_las_21.32.35_d38d2117.jpg","Averno/Imagen_de_WhatsApp_2025-08-15_a_las_21.49.51_08037c8d.jpg","Averno/Imagen_de_WhatsApp_2025-08-15_a_las_21.56.49_e2508f4e.jpg","Averno/Imagen_de_WhatsApp_2025-08-19_a_las_22.19.18_b07bc9ee.jpg","Averno/Imagen_de_WhatsApp_2025-08-15_a_las_22.01.24_527a3398.jpg"],"imported_from":"Notion export","dm_source_markdown":"Averno - No lucharian\n\nZariel no lucharia, esta ocupada, los obligaria a luchar en la blood war\n\nBel no lucharia, es leal, les pediria ayuda para atacar al abismo o a zariel, a cambio les abriria la veda de tiamat\n\nTiamat esta ocupado en liberarse\n\nTropas de Mammon, simplemente los querrian para ellos\n\nTropas de Mephistopheles, , simplemente los querrian para ellos\n\nTropas del abismo, de momento no les van a matar, pero más les vale descubrir en que estan, si les ayudan en la blood war les levarian por el rio stygia\n\nubicaciones:\nciudad de bronce de bel\ncastillo flotante de zariel\ncaverna de tiamat\ncampo de batalla\nhellrides, supervivientes de elturiel, elturiel\nel rio stygia\n\n📜 Zariel\nJynx, Infernal Machine\nDogma: \"El riesgo es prueba de valentía.\"\nPrincipios:\n-Quien calla, otorga.\n-No actuar es ponerse del lado del culpable.\n-Siempre hay un modo.\n-La justicia exige compromiso.\n\n📜 Zariel\n\nZariel es adorada scomo la encarnación de la iniciativa y la valentía de actuar.\n\nPara sus fieles, el universo es un campo de batalla donde la inacción es complicidad. Los dioses que observan desde lo alto sin intervenir son, en cierto modo, culpables por omisión.\n\nZariel es vista como aquella que arriesgó todo por involucrarse, incluso a costa de su caída. Su ejemplo inspira a quienes creen que la justicia requiere sacrificio, incluso de uno mismo.\n\nDogma\n\nMantra: “El riesgo es prueba de valentía.”\n\nEl valor no se mide en palabras, sino en actos.\n\nLa neutralidad es mentira: todo silencio favorece al opresor.\n\nLos dioses que no actúan son traidores al orden que dicen proteger.\n\n- Declaración de turno: el usuario actúa normalmente: movimientos, ataques, conjuros, habilidades.\n- Activación de Chrono Rewrite: al final de su turno, puede activar la habilidad para reorganizar la ronda:\n    - Puede reordenar todas las acciones tomadas durante la ronda, tanto suyas como de otros.\n    - Puede modificar el “destino” de ciertas acciones si estas dependen de la posición o situación:\n        - Ejemplo: un hechizo de área que falló ahora puede golpear si mueve primero a alguien a esa zona.\n        - Ejemplo: un ataque que no alcanzó puede “reapuntar” si cambia la posición de objetivos.\n    - Puede repetir o alterar sus propias acciones en el orden deseado, ajustando efectos.\n\n⚖ Principios\n\n- Donde los demás dioses observan, Zariel descendió y luchó. Aunque su caída la llevó a los infiernos, para sus fieles fue el acto más puro de devoción a la causa de la justicia. Quien calla, otorga: No hay excusa para permanecer al margen. El silencio frente a la injusticia es traición al ideal de justicia.\n- La religión zarielita defiende una ética del movimiento: mejor un error cometido actuando, que la perfección inerte de no haber hecho nada. Siempre hay un modo: La desesperanza es inaceptable, la voluntad encuentra caminos donde no los hay. Rendirse es la peor blasfemia. La justicia exige compromiso: No basta con creer o rezar: la fe se demuestra en la acción. El verdadero fiel se involucra, lucha, arriesga, cae y se levanta.\n- El credo zarielita considera que la moral está vacía sin praxis. El bien no es un ideal abstracto: es intervenir, tomar partido y poner el cuerpo en riesgo. No actuar es ponerse del lado del culpable: La pasividad es una forma de cobardía. Todo aquel que observa sin intervenir se convierte en cómplice.\n- La religión se vuelve peligrosa en su radicalidad intervencionista:\nº No admite neutralidad: o actúas, o eres enemigo.\nº Quien no se involucra es señalado como cómplice.\nº Exigen compromiso total; tibieza es peor que oposición.\n\n📜 Bel\nEl Arte de La Guerra\nDogma (Finisher): \"La piedad es un lujo de los muertos.\"\nPoder stand: puede romper una regla universal, no targets especificos: las espadas no hacen daño-\nPrincipios:\n-El enemigo que respira, amenaza.\n-Toda táctica es válida si asegura la victoria.\n-Planifica, ejecuta.\n\n📜 Tiamat\nEcoterroristas\nDogma: \"Lo que fue de los dragones, será de nuevo suyo.\"\nPrincipios:\n-La tierra no se cede; se reclama.\n-El saqueador llama “suyo” a lo robado.\n-Los dragones son los legítimos herederos.\n-Servir hoy es sobrevivir mañana.\n\ncomo escapar:\na traves del rio stygia, si se alian con el abismo\npactando con tiamat\nforzando a tiamat:\n- Ayudando al lado de Asmodeus, Bel\nayudar a todos los demas llevara de camino a pactar con tiamat\n\nelturiel\n\nEl Arte de la Guerra by Aldepe\n\nEjercito Bel\n\nEjercito de Zariel\n\nElturiel"}'::jsonb)
on conflict (id) do update set
  type = excluded.type,
  title = excluded.title,
  subtitle = excluded.subtitle,
  image_url = excluded.image_url,
  parent_id = excluded.parent_id,
  summary = excluded.summary,
  description = excluded.description,
  details = excluded.details,
  updated_at = now();

insert into public.lore_entries (id, type, title, subtitle, image_url, parent_id, summary, description, details)
values ('ffa197a4-08bf-13af-9020-1db0a7d6a3d9'::uuid, 'character', 'Arnau', 'Auxiliar importado de Notion', '', '511a2dfb-d9e4-4afa-4284-0448e8c1271d'::uuid, '“Hagas lo que hagas… ¡NUNCA te detengas! ¡CAMINA!” arnau mato al hijo de carlos porque estaba corrupto tharizdun Religion Celestian Mantra: "Aprendizaje, libertad, prueba" ⚖ Principios El viaje como aprendizaje: Los libros enseñan conceptos, pero el camino enseña experiencia. El viajero descubre culturas, lenguas, paisajes, dioses y maravillas imposibles de imaginar en su hogar. Cada persona que conoces y cada frontera que cruzas es una lección. El viaje como libertad: Viajar rompe las cadenas de la costumbre y...', '“Hagas lo que hagas… ¡NUNCA te detengas! ¡CAMINA!”
arnau mato al hijo de carlos porque estaba corrupto
tharizdun
Religion Celestian
Mantra: "Aprendizaje, libertad, prueba"
⚖ Principios
El viaje como aprendizaje:
- Los libros enseñan conceptos, pero el camino enseña experiencia.
- El viajero descubre culturas, lenguas, paisajes, dioses y maravillas imposibles de imaginar en su hogar.
- Cada persona que conoces y cada frontera que cruzas es una lección.
El viaje como libertad:
- Viajar rompe las cadenas de la costumbre y del miedo.
- El viaje enseña que el mundo es demasiado vasto para encerrarse en una aldea, en un plano o incluso en un único modo de pensar.
- Quedarse siempre en el mismo sitio es adorarse a uno mismo.
El viaje como espiritualidad:
En el camino, bajo el cielo abierto, el alma se siente parte de algo mayor.
El horizonte recuerda al fiel que siempre hay algo más por aprender, más por descubrir, más por vivir.
Morir no es el fin: es emprender el viaje final hacia las estrellas, y convertirse en guía para los que aún caminan.
El viaje como prueba
- Caminar significa enfrentar riesgos, y cada riesgo fortalece el espíritu.
- El hambre, la fatiga, la incertidumbre, todo forma parte de la iniciación sagrada del viajero.
- El que regresa de un viaje no es la misma persona que partió: ha renacido con cada paso.
Rituales
El Juramento del Horizonte: cada clérigo o viajero promete no establecerse jamás en un único lugar, sino mantener vivo el espíritu de exploración.
Cartografía ritual: trazar mapas de estrellas, planos o rutas es una forma de rezo. Un mapa nunca es solo práctico, es sagrado.
La Peregrinación sin Fin: cada fiel debe realizar un gran viaje (terrestre, marítimo, planar o estelar) que simbolice su entrega al Viajero Lejano.
Ritos fúnebres: los cuerpos de los fieles son cremados y las cenizas lanzadas al viento o al espacio, “para que viajen eternamente”.
Resumen:
Para un fiel de Celestian, la rutina es la verdadera muerte.
El viaje es la metáfora perfecta de la vida: cada día se camina hacia lo desconocido.
No prometen riquezas, ni poder, ni seguridad; prometen sentido en el movimiento.
Creen que cada ser, al morir, se convierte en estrella:...', '{"source_path":"export-a\\Auxiliar\\Dis - Lucharia pero no quiere salir de su tierra\\Arnau 2591744335cf80c5ab70df1aceacb123.md","image_refs":["Arnau/image.png","Arnau/image 1.png","Arnau/image 2.png"],"imported_from":"Notion export","dm_source_markdown":"“Hagas lo que hagas… ¡NUNCA te detengas! ¡CAMINA!”\n\narnau mato al hijo de carlos porque estaba corrupto\n\ntharizdun\n\nReligion Celestian\n\nMantra: \"Aprendizaje, libertad, prueba\"\n\n⚖ Principios\n\nEl viaje como aprendizaje:\n\n- Los libros enseñan conceptos, pero el camino enseña experiencia.\n- El viajero descubre culturas, lenguas, paisajes, dioses y maravillas imposibles de imaginar en su hogar.\n- Cada persona que conoces y cada frontera que cruzas es una lección.\n\nEl viaje como libertad:\n\n- Viajar rompe las cadenas de la costumbre y del miedo.\n- El viaje enseña que el mundo es demasiado vasto para encerrarse en una aldea, en un plano o incluso en un único modo de pensar.\n- Quedarse siempre en el mismo sitio es adorarse a uno mismo.\n\nEl viaje como espiritualidad:\n\nEn el camino, bajo el cielo abierto, el alma se siente parte de algo mayor.\n\nEl horizonte recuerda al fiel que siempre hay algo más por aprender, más por descubrir, más por vivir.\n\nMorir no es el fin: es emprender el viaje final hacia las estrellas, y convertirse en guía para los que aún caminan.\n\nEl viaje como prueba\n\n- Caminar significa enfrentar riesgos, y cada riesgo fortalece el espíritu.\n- El hambre, la fatiga, la incertidumbre, todo forma parte de la iniciación sagrada del viajero.\n- El que regresa de un viaje no es la misma persona que partió: ha renacido con cada paso.\n\nRituales\n\nEl Juramento del Horizonte: cada clérigo o viajero promete no establecerse jamás en un único lugar, sino mantener vivo el espíritu de exploración.\n\nCartografía ritual: trazar mapas de estrellas, planos o rutas es una forma de rezo. Un mapa nunca es solo práctico, es sagrado.\n\nLa Peregrinación sin Fin: cada fiel debe realizar un gran viaje (terrestre, marítimo, planar o estelar) que simbolice su entrega al Viajero Lejano.\n\nRitos fúnebres: los cuerpos de los fieles son cremados y las cenizas lanzadas al viento o al espacio, “para que viajen eternamente”.\n\nResumen:\n\nPara un fiel de Celestian, la rutina es la verdadera muerte.\n\nEl viaje es la metáfora perfecta de la vida: cada día se camina hacia lo desconocido.\n\nNo prometen riquezas, ni poder, ni seguridad; prometen sentido en el movimiento.\n\nCreen que cada ser, al morir, se convierte en estrella: los cielos nocturnos son el rostro eterno de todos los que alguna vez caminaron."}'::jsonb)
on conflict (id) do update set
  type = excluded.type,
  title = excluded.title,
  subtitle = excluded.subtitle,
  image_url = excluded.image_url,
  parent_id = excluded.parent_id,
  summary = excluded.summary,
  description = excluded.description,
  details = excluded.details,
  updated_at = now();

insert into public.lore_entries (id, type, title, subtitle, image_url, parent_id, summary, description, details)
values ('8922c75f-f1de-3908-cb4b-3ebec834c746'::uuid, 'character', 'Carlos', 'Auxiliar importado de Notion', '', '511a2dfb-d9e4-4afa-4284-0448e8c1271d'::uuid, '📜 DOGMA DE DWIERGUS "Quien da forma a la vida, se da forma a sí mismo como dios." 🔹 Principios Forjar vida acto supremo. Nada es fijo ni intocable. Crear es proclamarse dios. Innovar conservar lo viejo. Cada creación es un legado eterno. La divinidad está al alcance de todos. ⚠ Lado oscuro Se saltan la ética científica. Justifican actos moralmente cuestionables. Dolor y destrucción aceptados como pasos necesarios. 💡 Interpretación Si das vida a algo que piensa y decide → ya no eres mortal. Ejemplo: un...', '📜 DOGMA DE DWIERGUS
"Quien da forma a la vida, se da forma a sí mismo como dios."
🔹 Principios
- Forjar vida = acto supremo.
- Nada es fijo ni intocable.
- Crear es proclamarse dios.
- Innovar > conservar lo viejo.
- Cada creación es un legado eterno.
- La divinidad está al alcance de todos.
⚠ Lado oscuro
- Se saltan la ética científica.
- Justifican actos moralmente cuestionables.
- Dolor y destrucción aceptados como pasos necesarios.
💡 Interpretación
- Si das vida a algo que piensa y decide → ya no eres mortal.
- Ejemplo: un artificiero con homúnculo = digno de respeto como dios.
- La gestación natural NO cuenta, debe ser creada de forma artificial.
🛠 tu personaje
- Devoción total a crear vida.
- Sin necesidad de ego: aun no eres una divinidad.
- Objetivo: gestar su primera creación consciente para ser divino actuando como vessel de una deiad oscura', '{"source_path":"export-a\\Auxiliar\\Dis - Lucharia pero no quiere salir de su tierra\\Carlos 2521744335cf80c0a84de606e550cc2a.md","image_refs":["Carlos/Imagen_de_WhatsApp_2025-08-16_a_las_00.11.43_21f44cc6.jpg","Carlos/Imagen_de_WhatsApp_2025-08-16_a_las_01.27.03_7aacde92.jpg","Carlos/Imagen_de_WhatsApp_2025-08-15_a_las_21.28.12_a462c4d7.jpg","Carlos/image.png","Carlos/image 1.png","Carlos/image 2.png","Carlos/image 3.png","Carlos/image 4.png","Carlos/image 5.png"],"imported_from":"Notion export","dm_source_markdown":"📜 DOGMA DE DWIERGUS\n\"Quien da forma a la vida, se da forma a sí mismo como dios.\"\n\n🔹 Principios\n\n- Forjar vida = acto supremo.\n- Nada es fijo ni intocable.\n- Crear es proclamarse dios.\n- Innovar > conservar lo viejo.\n- Cada creación es un legado eterno.\n- La divinidad está al alcance de todos.\n\n⚠ Lado oscuro\n\n- Se saltan la ética científica.\n- Justifican actos moralmente cuestionables.\n- Dolor y destrucción aceptados como pasos necesarios.\n\n💡 Interpretación\n\n- Si das vida a algo que piensa y decide → ya no eres mortal.\n- Ejemplo: un artificiero con homúnculo = digno de respeto como dios.\n- La gestación natural NO cuenta, debe ser creada de forma artificial.\n\n🛠 tu personaje\n\n- Devoción total a crear vida.\n- Sin necesidad de ego: aun no eres una divinidad.\n- Objetivo: gestar su primera creación consciente para ser divino actuando como vessel de una deiad oscura"}'::jsonb)
on conflict (id) do update set
  type = excluded.type,
  title = excluded.title,
  subtitle = excluded.subtitle,
  image_url = excluded.image_url,
  parent_id = excluded.parent_id,
  summary = excluded.summary,
  description = excluded.description,
  details = excluded.details,
  updated_at = now();

insert into public.lore_entries (id, type, title, subtitle, image_url, parent_id, summary, description, details)
values ('0a3cbb08-255f-9194-0b27-193496ff3ad4'::uuid, 'character', 'Raul', 'Auxiliar importado de Notion', '', '511a2dfb-d9e4-4afa-4284-0448e8c1271d'::uuid, 'Dogma de Berronar Truesilver(Enano) La familia es el cimiento de la paz Quien ama a su familia, busca preservarla; y quien busca preservarla, evita la guerra. Las disputas se resuelven mediante el debate, recordando siempre que todos compartimos un mismo propósito: proteger a los nuestros. Así como la piedra sostiene el templo, la familia sostiene al pueblo. El orden doméstico asegura la armonía El hombre y la mujer tienen roles definidos y complementarios: uno protege, el otro cuida; uno siembra fuera, el otro...', 'Dogma de Berronar Truesilver(Enano)
- La familia es el cimiento de la paz
Quien ama a su familia, busca preservarla; y quien busca preservarla, evita la guerra.
Las disputas se resuelven mediante el debate, recordando siempre que todos compartimos un mismo propósito: proteger a los nuestros.
Así como la piedra sostiene el templo, la familia sostiene al pueblo.
- El orden doméstico asegura la armonía
El hombre y la mujer tienen roles definidos y complementarios: uno protege, el otro cuida; uno siembra fuera, el otro guarda el hogar.
Alterar este equilibrio es debilitar el núcleo que mantiene unida la comunidad.
Las formas alternativas de familia son vistas como fuentes de desorden, pues sin raíces firmes, los hijos crecen torcidos. (Madres solteras, dos padres, etc.)
- Los huérfanos son heridas abiertas
Un niño sin madre ni padre es como una casa sin cimientos: tarde o temprano se derrumbará.
Por ello deben ser adoptados y devueltos a un hogar, o de lo contrario, el vacío de su crianza engendrará violencia.
“La paz nace en la mesa del hogar.”
“Quien guarda el hogar, guarda la paz.”
“Debatamos como hermanos, pues todos tememos por los nuestros.”', '{"source_path":"export-a\\Auxiliar\\Dis - Lucharia pero no quiere salir de su tierra\\Raul 2521744335cf80fba338fa7fac78fb60.md","image_refs":["Raul/Imagen_de_WhatsApp_2025-08-17_a_las_14.44.21_ec8977ca.jpg"],"imported_from":"Notion export","dm_source_markdown":"Dogma de Berronar Truesilver(Enano)\n\n- La familia es el cimiento de la paz\nQuien ama a su familia, busca preservarla; y quien busca preservarla, evita la guerra.\nLas disputas se resuelven mediante el debate, recordando siempre que todos compartimos un mismo propósito: proteger a los nuestros.\nAsí como la piedra sostiene el templo, la familia sostiene al pueblo.\n- El orden doméstico asegura la armonía\nEl hombre y la mujer tienen roles definidos y complementarios: uno protege, el otro cuida; uno siembra fuera, el otro guarda el hogar.\nAlterar este equilibrio es debilitar el núcleo que mantiene unida la comunidad.\nLas formas alternativas de familia son vistas como fuentes de desorden, pues sin raíces firmes, los hijos crecen torcidos. (Madres solteras, dos padres, etc.)\n- Los huérfanos son heridas abiertas\nUn niño sin madre ni padre es como una casa sin cimientos: tarde o temprano se derrumbará.\nPor ello deben ser adoptados y devueltos a un hogar, o de lo contrario, el vacío de su crianza engendrará violencia.\n\n“La paz nace en la mesa del hogar.”\n“Quien guarda el hogar, guarda la paz.”\n“Debatamos como hermanos, pues todos tememos por los nuestros.”"}'::jsonb)
on conflict (id) do update set
  type = excluded.type,
  title = excluded.title,
  subtitle = excluded.subtitle,
  image_url = excluded.image_url,
  parent_id = excluded.parent_id,
  summary = excluded.summary,
  description = excluded.description,
  details = excluded.details,
  updated_at = now();

insert into public.lore_entries (id, type, title, subtitle, image_url, parent_id, summary, description, details)
values ('511a2dfb-d9e4-4afa-4284-0448e8c1271d'::uuid, 'zone', 'Dis - Lucharia pero no quiere salir de su tierra', 'Auxiliar importado de Notion', '', null, 'Hay que pasar su ciudad Mephistopheles tendria agentes Asmodeo tendria agentes Dispater dada su soberbia nunca tiene tiempo para gente que intenta pasar al otro lado el abismo ayudaria pero quiere que descubramos algo de la situacion, habria que infiltrarse en asmodeo visado medallon de identidad y control permiso registro (carlos no lo pasaria) asmodeo daria algo a punto de rendirse los mercantes darian cosas a cambio de mini operaciones el abismo daria algo a cambio de que investiguen y les ayuden a la fuerza...', 'Hay que pasar su ciudad
Mephistopheles tendria agentes
Asmodeo tendria agentes
Dispater dada su soberbia nunca tiene tiempo para gente que intenta pasar al otro lado
el abismo ayudaria pero quiere que descubramos algo de la situacion, habria que infiltrarse en asmodeo
visado
medallon de identidad y control
permiso
registro (carlos no lo pasaria)
asmodeo daria algo a punto de rendirse
los mercantes darian cosas a cambio de mini operaciones
el abismo daria algo a cambio de que investiguen y les ayuden
a la fuerza
Resumen general
Dis es la segunda capa de Baator, gobernada por Dispater, el Archidiablo del Hierro.
Es conocida como la Ciudad de Hierro, la Ciudad del Dolor y la Ciudad Infinita. Se trata de un bastopm  laberíntica y paranoica, construida enteramente de hierro ardiente y en constante cambio. Es a la vez ciudad y plano, un lugar donde la vigilancia, la desconfianza y el sufrimiento son absolutos.
Representa el pecado de la soberbia, pues sus habitantes creen que solo la propia experiencia es cierta y válida; desprecian a los demás porque carecen de la “certeza” de su vivencia personal.
Características principales de Dis
Naturaleza general
- Segunda capa de los Nueve Infiernos, gobernada por Dispater.
- Ciudad infinita y laberíntica, difícil de distinguir dónde acaba la ciudad y empieza el plano.
- Construida completamente de hierro negro ardiente, que quema a los mortales al contacto.
- Prohibido llevar metal encima: armas, armaduras o adornos metálicos se calientan hasta quemar a sus portadores. Solo se puede vestir ropa de tela gruesa o cuero tratado; incluso la ropa mágica corre riesgo de prenderse.
Entorno y geografía
- Ciudad rodeada por un foso de agua...', '{"source_path":"export-a\\Auxiliar\\Dis - Lucharia pero no quiere salir de su tierra 2521744335cf804fb7b0ca3ef7a39717.md","image_refs":["Dis - Lucharia pero no quiere salir de su tierra/image.png","Dis - Lucharia pero no quiere salir de su tierra/image 1.png","Dis - Lucharia pero no quiere salir de su tierra/image 2.png","Dis - Lucharia pero no quiere salir de su tierra/image 3.png"],"imported_from":"Notion export","dm_source_markdown":"Hay que pasar su ciudad\n\nMephistopheles tendria agentes\nAsmodeo tendria agentes\n\nDispater dada su soberbia nunca tiene tiempo para gente que intenta pasar al otro lado\n\nel abismo ayudaria pero quiere que descubramos algo de la situacion, habria que infiltrarse en asmodeo\n\nvisado\n\nmedallon de identidad y control\n\npermiso\n\nregistro (carlos no lo pasaria)\n\nasmodeo daria algo a punto de rendirse\nlos mercantes darian cosas a cambio de mini operaciones\nel abismo daria algo a cambio de que investiguen y les ayuden\n\na la fuerza\n\n# Resumen general\n\nDis es la segunda capa de Baator, gobernada por Dispater, el Archidiablo del Hierro.\n\nEs conocida como la Ciudad de Hierro, la Ciudad del Dolor y la Ciudad Infinita. Se trata de un bastopm  laberíntica y paranoica, construida enteramente de hierro ardiente y en constante cambio. Es a la vez ciudad y plano, un lugar donde la vigilancia, la desconfianza y el sufrimiento son absolutos.\n\nRepresenta el pecado de la soberbia, pues sus habitantes creen que solo la propia experiencia es cierta y válida; desprecian a los demás porque carecen de la “certeza” de su vivencia personal.\n\n---\n\n# Características principales de Dis\n\n## Naturaleza general\n\n- Segunda capa de los Nueve Infiernos, gobernada por Dispater.\n- Ciudad infinita y laberíntica, difícil de distinguir dónde acaba la ciudad y empieza el plano.\n- Construida completamente de hierro negro ardiente, que quema a los mortales al contacto.\n- Prohibido llevar metal encima: armas, armaduras o adornos metálicos se calientan hasta quemar a sus portadores. Solo se puede vestir ropa de tela gruesa o cuero tratado; incluso la ropa mágica corre riesgo de prenderse.\n\n## Entorno y geografía\n\n- Ciudad rodeada por un foso de agua venenosa y situada en un valle desolado.\n- El paisaje incluye llanuras áridas, colinas con pilares de piedra y montañas de hierro.\n- Entrada desde Avernus protegida por Tiamat, guardiana del “Camino a Dis”.\n- Cielos cubiertos por humo y ceniza, con relámpagos y vientos huracanados.\n\n## Ciudad y urbanismo\n\n- En constante construcción y demolición por esclavos y peticionarios.\n- Mapas y guías son inútiles: las calles cambian continuamente.\n- Vigilancia extrema: estatuas con ojos rojos, muros que “oyen” y omnipresencia de Dispater.\n- Mezcla de mansiones diabólicas, tugurios, prisiones y talleres.\n- Arquitectura sofocante y opresiva: cuanto mayor la paranoia de Dispater, más cerrada y claustrofóbica se vuelve la ciudad.\n- Puesto fronterizo\n\n## Lugares notables\n\n- Torre de Hierro: fortaleza central de Dispater, cambiante, imposible de asaltar.\n- Los Grilletes (Fetters): barrio de extranjeros, comerciantes y almas condenadas. Es despreciado por el resto de Dis, víctima de un fuerte racismo y discriminación. Aunque ofrece comercio, tabernas e imitaciones de ciudades mortales\n- God Street\n\n## Inhabitantes\n\n- Dispater: gobernante absoluto, extremadamente paranoico y además aquejado de agorafobia, por lo que rara vez abandona su Torre de Hierro.\n- Su séquito:\n    - Lilis (consorte).\n    - Biffant (provost).\n    - Titivilus (heraldo y consejero).\n    - Arioch (vengador y ejecutor).\n- Población aproximada: 400.000 (principalmente diablos y almas condenadas).\n- Gran variedad de diablos:\n    - Lemures y nupperibos (esclavos y mano de obra).\n    - Erinyes (favoritas de Dispater, espías y mensajeras).\n    - Abishai, spinagones, gulthirs, hellcats, kocrachons, diablos de guerra.\n- Peticionarios: esclavos torturados en trabajos sin sentido. Algunos en estado de anagnorisis (espectros arrepentidos que irradian energía maligna).\n- Extraplanares y comerciantes: rakshasas\n\n## Función y propósito\n\n- Lugar de comercio y conspiraciones con otros planos.\n- Reflejo físico de la paranoia, la agorafobia y el control absoluto de Dispater.\n- Representación del pecado de la soberbia: la creencia de que solo la propia experiencia es válida y la negación del valor de los demás.\n\n# El Dogma de la Soberbia en Dis\n\nEn Dis, la soberbia no es solo un vicio: es la base del orden social, moral y metafísico. El plano entero está construido sobre la convicción de que la única verdad posible es la de la experiencia individual.\n\n## 1. La certeza de uno mismo\n\n- Nadie puede cuestionar lo que yo he vivido. Mi dolor, mi sufrimiento, mis logros y mis fracasos son reales porque yo los he sentido.\n- Todo lo demás —tus relatos, tus creencias, tus dogmas— son dudosos. Nunca podré tener certeza de tu experiencia.\n- Por tanto, lo único que importa es mi certeza personal.\n\n👉 Este punto convierte a cada habitante de Dis en un centro absoluto del universo. No es necesario ser un dios ni un rey: basta con existir para que mi experiencia sea incuestionablemente válida… y por tanto superior a la tuya.\n\n## 2. El desprecio al otro\n\n- Si solo puedo confiar en mi vivencia, la tuya carece de valor.\n- La fe, la devoción, el sacrificio de otros, todo es humo si no lo he sentido en mi carne.\n- ¿Cómo podría importarme tu dios, tu moral, tu sufrimiento, si no tengo certeza de ellos? Solo yo importo.\n\n👉 Aquí nace el odio hacia los demás creyentes: porque ellos sostienen dogmas colectivos, basados en la fe en algo compartido. En Dis, esa fe es vista como una debilidad: una mentira que se cuenta la masa para no afrontar su insignificancia.\n\n## 3. El aislamiento orgulloso\n\n- La consecuencia lógica de esta filosofía es la soledad orgullosa.\n- Confiar en otros es rebajarse, porque significa dar valor a experiencias ajenas.\n- El verdadero soberbio se basta a sí mismo: no necesita de tu verdad, ni de tu compañía, ni de tu aprobación.\n\n👉 En la práctica, esto alimenta la paranoia de Dispater y de toda la ciudad. La arquitectura laberíntica, los muros con ojos, el hierro ardiente: todo refleja esa convicción de que no hay un “nosotros”, solo un “yo” cercado contra todos los demás.\n\n## 4. La justificación del dominio\n\n- Si mi experiencia es la única cierta, también lo es mi derecho a imponerla.\n- Tus quejas, tus resistencias, tus ideales, no tienen peso frente a mi certeza.\n- Así, la soberbia se convierte en legitimación del poder: quien domina no necesita justificación más allá de su propia convicción.\n\n👉 En Dis, el más fuerte no solo tiene el poder, sino la razón. La filosofía de la soberbia convierte la tiranía en algo natural, incluso inevitable.\n\nRaul\n\n[](Dis%20-%20Lucharia%20pero%20no%20quiere%20salir%20de%20su%20tierra/Sin%20t%C3%ADtulo%202521744335cf8006bf47c5a685aca762.md)\n\nLazcano\n\nCarlos\n\nArnau"}'::jsonb)
on conflict (id) do update set
  type = excluded.type,
  title = excluded.title,
  subtitle = excluded.subtitle,
  image_url = excluded.image_url,
  parent_id = excluded.parent_id,
  summary = excluded.summary,
  description = excluded.description,
  details = excluded.details,
  updated_at = now();

insert into public.lore_entries (id, type, title, subtitle, image_url, parent_id, summary, description, details)
values ('41a5da18-730b-7f49-1295-1ca65161568f'::uuid, 'zone', 'Malbolge - No lucharia', 'Auxiliar importado de Notion', '', null, 'Quiere liberar a Phlegethos las carceles son ataudes en llamas Naturaleza del plano: Malbolge es una pendiente infinita y montañosa, azotada por aludes y avalanchas constantes. Es uno de los lugares más peligrosos y desagradables del Infierno, lleno de rocas móviles, precipicios letales y cielos hirvientes. Con el tiempo, su geografía cambió varias veces, dependiendo de quién gobernaba. Gobernantes: Moloch: designado por Baalzebul como virrey; su régimen fue cruel y opresivo. Malagard, la Condesa Bruja: amante y...', 'Quiere liberar a Phlegethos
las carceles son ataudes en llamas
Naturaleza del plano: Malbolge es una pendiente infinita y montañosa, azotada por aludes y avalanchas constantes. Es uno de los lugares más peligrosos y desagradables del Infierno, lleno de rocas móviles, precipicios letales y cielos hirvientes. Con el tiempo, su geografía cambió varias veces, dependiendo de quién gobernaba.
- Gobernantes:
- Moloch: designado por Baalzebul como virrey; su régimen fue cruel y opresivo.
- Malagard, la Condesa Bruja: amante y consejera de Moloch que lo traicionó durante la Reckoning of Hell. Transformó Malbolge en un terreno montañoso plagado de avalanchas. Intentó convertirse en diosa, pero murió en un cataclismo en el que su propio cuerpo se volvió el paisaje de la capa.
- Glasya, hija de Asmodeus: heredó Malbolge tras la muerte de Malagard. Remodeló la capa en un jardín bello pero corrupto, mezcla de ilusión y podredumbre. Actualmente es la archidiablesa del lugar.
- Entornos y lugares destacados:
- Las Fosas de Parto: donde las almas condenadas se transforman en lémures.
- Ciudadela de Glasya (Ossiea): un palacio hecho de huesos y cráneo de Malagard, lleno de lujos, torturas y decadencia.
- El Jardín de los Deleites: un paraíso ilusorio creado para dar falsa paz a los prisioneros.
- Bosque de Cabellos, Lagos de Bilis, Torres de Marfil, entre otros, todos macabros restos del cuerpo de la Condesa Hag.
- Habitantes:
- Principalmente diablillos, diablos espinados, barbados, óseos y cornudos.
- Glasya favorece a erinyes y paeliryons como nobleza de su corte.
- También hay súcubos, arpías infernales, vermes y monstruos antiguos.
- Moloch sigue merodeando en las sombras, buscando...', '{"source_path":"export-a\\Auxiliar\\Malbolge - No lucharia 2521744335cf80b68fe8f4b01bf18bf4.md","image_refs":["Malbolge - No lucharia/image.png","Malbolge - No lucharia/image 1.png"],"imported_from":"Notion export","dm_source_markdown":"Quiere liberar a Phlegethos\n\nlas carceles son ataudes en llamas\n\nNaturaleza del plano: Malbolge es una pendiente infinita y montañosa, azotada por aludes y avalanchas constantes. Es uno de los lugares más peligrosos y desagradables del Infierno, lleno de rocas móviles, precipicios letales y cielos hirvientes. Con el tiempo, su geografía cambió varias veces, dependiendo de quién gobernaba.\n\n- Gobernantes:\n    - Moloch: designado por Baalzebul como virrey; su régimen fue cruel y opresivo.\n    - Malagard, la Condesa Bruja: amante y consejera de Moloch que lo traicionó durante la Reckoning of Hell. Transformó Malbolge en un terreno montañoso plagado de avalanchas. Intentó convertirse en diosa, pero murió en un cataclismo en el que su propio cuerpo se volvió el paisaje de la capa.\n    - Glasya, hija de Asmodeus: heredó Malbolge tras la muerte de Malagard. Remodeló la capa en un jardín bello pero corrupto, mezcla de ilusión y podredumbre. Actualmente es la archidiablesa del lugar.\n- Entornos y lugares destacados:\n    - Las Fosas de Parto: donde las almas condenadas se transforman en lémures.\n    - Ciudadela de Glasya (Ossiea): un palacio hecho de huesos y cráneo de Malagard, lleno de lujos, torturas y decadencia.\n    - El Jardín de los Deleites: un paraíso ilusorio creado para dar falsa paz a los prisioneros.\n    - Bosque de Cabellos, Lagos de Bilis, Torres de Marfil, entre otros, todos macabros restos del cuerpo de la Condesa Hag.\n- Habitantes:\n    - Principalmente diablillos, diablos espinados, barbados, óseos y cornudos.\n    - Glasya favorece a erinyes y paeliryons como nobleza de su corte.\n    - También hay súcubos, arpías infernales, vermes y monstruos antiguos.\n    - Moloch sigue merodeando en las sombras, buscando volver al poder.\n- Función: Malbolge sirve como prisión de los Nueve Infiernos, donde los diablos que rompen la ley son castigados con tormentos interminables. Glasya, simultáneamente criminal y carcelera, simboliza la paradoja del plano: belleza aparente sobre corrupción y dolor."}'::jsonb)
on conflict (id) do update set
  type = excluded.type,
  title = excluded.title,
  subtitle = excluded.subtitle,
  image_url = excluded.image_url,
  parent_id = excluded.parent_id,
  summary = excluded.summary,
  description = excluded.description,
  details = excluded.details,
  updated_at = now();

insert into public.lore_entries (id, type, title, subtitle, image_url, parent_id, summary, description, details)
values ('20be2afb-6002-424d-3612-fcd44570d16c'::uuid, 'zone', 'Minauros - Lucharia', 'Auxiliar importado de Notion', '', null, 'con la pena de ser batidos por una fortísima lluvia fría mezclada con grueso granizo, y ensordecido por los terribles ladridos de Cerbero , que además los desgarra con uñas y dientes. Minauros: El Pantano de la Gula y la Avaricia El Tercer Círculo de Dante y la Tercera Capa de Baator se reflejan mutuamente como dos caras de la misma idea: el pecado de entregarse al exceso hasta la podredumbre. El pantano de la descomposición Los glotones yacen bajo una lluvia fétida e interminable, una tormenta de putrefacción que...', 'con la pena de ser batidos por una fortísima lluvia fría mezclada con grueso granizo, y ensordecido por los terribles ladridos de
Cerbero
, que además los desgarra con uñas y dientes.
Minauros: El Pantano de la Gula y la Avaricia
El Tercer Círculo de Dante y la Tercera Capa de Baator se reflejan mutuamente como dos caras de la misma idea: el pecado de entregarse al exceso hasta la podredumbre.
El pantano de la descomposición
Los glotones yacen bajo una lluvia fétida e interminable, una tormenta de putrefacción que convierte el suelo en un lodazal inmundo. Allí se revuelcan ciegos e indiferentes a sus semejantes, reducidos a bestias que gruñen y aúllan en el fango. Cerbero, el gran “vermo”, les guarda y despedaza con sus garras como si fueran perros, reflejo de la animalidad a la que se rebajaron.
En Baator, Minauros se alza como un pantano infinito de barro pestilente, lluvia ácida y aguas envenenadas. Todo lo construido allí —ciudades, palacios, torres— acaba hundiéndose lentamente en la ciénaga. El aire mismo está impregnado de podredumbre, enfermedades y gases venenosos. Cuerpos en descomposición emergen y se hunden de nuevo, recordando a cada visitante que nada permanece, todo se degrada.
Gula y avaricia, dos caras del mismo exceso
- En Dante, la gula se entiende no solo como voracidad de comida y bebida, sino como toda forma de adicción que anula la razón y encierra al individuo en sí mismo. Los condenados están aislados, incapaces de ver más allá de su propio apetito.
- En Baator, Mammon gobierna Minauros como señor de la avaricia, acumulando riquezas que jamás disfruta, obsesionado con poseer y acaparar. Sus súbditos emulan esa codicia insaciable, guardando...', '{"source_path":"export-a\\Auxiliar\\Minauros - Lucharia 2521744335cf80ba85c2ec27196b063d.md","image_refs":["Minauros - Lucharia/image.png","Minauros - Lucharia/image 1.png","Minauros - Lucharia/image 2.png","Minauros - Lucharia/image 3.png","Minauros - Lucharia/image 4.png"],"imported_from":"Notion export","dm_source_markdown":"con la pena de ser batidos por una fortísima lluvia fría mezclada con grueso granizo, y ensordecido por los terribles ladridos de\nCerbero\n, que además los desgarra con uñas y dientes.\n\n# Minauros: El Pantano de la Gula y la Avaricia\n\nEl Tercer Círculo de Dante y la Tercera Capa de Baator se reflejan mutuamente como dos caras de la misma idea: el pecado de entregarse al exceso hasta la podredumbre.\n\n## El pantano de la descomposición\n\nLos glotones yacen bajo una lluvia fétida e interminable, una tormenta de putrefacción que convierte el suelo en un lodazal inmundo. Allí se revuelcan ciegos e indiferentes a sus semejantes, reducidos a bestias que gruñen y aúllan en el fango. Cerbero, el gran “vermo”, les guarda y despedaza con sus garras como si fueran perros, reflejo de la animalidad a la que se rebajaron.\n\nEn Baator, Minauros se alza como un pantano infinito de barro pestilente, lluvia ácida y aguas envenenadas. Todo lo construido allí —ciudades, palacios, torres— acaba hundiéndose lentamente en la ciénaga. El aire mismo está impregnado de podredumbre, enfermedades y gases venenosos. Cuerpos en descomposición emergen y se hunden de nuevo, recordando a cada visitante que nada permanece, todo se degrada.\n\n## Gula y avaricia, dos caras del mismo exceso\n\n- En Dante, la gula se entiende no solo como voracidad de comida y bebida, sino como toda forma de adicción que anula la razón y encierra al individuo en sí mismo. Los condenados están aislados, incapaces de ver más allá de su propio apetito.\n- En Baator, Mammon gobierna Minauros como señor de la avaricia, acumulando riquezas que jamás disfruta, obsesionado con poseer y acaparar. Sus súbditos emulan esa codicia insaciable, guardando miserables tesoros que el fango siempre reclama.\n\nAsí, gula y avaricia son la misma enfermedad: un hambre infinita que nunca se sacia, un deseo que corroe hasta convertir la abundancia en miseria. La gula degrada el cuerpo; la avaricia degrada el alma. Ambas reducen al ser a un esclavo del exceso.\n\n## La lluvia eterna\n\nEn Dante, el castigo de los glotones es una lluvia pútrida que no cesa, símbolo de la saturación sin fin.\n\nEn Minauros, las tormentas son de agua ácida, granizo con fragmentos de hueso y hielo envenenado que azotan sin descanso. Esta “lluvia infernal” revela que el plano mismo es un reflejo del castigo: no una prisión arbitraria, sino una proyección física del pecado.\n\n## El guardián del exceso\n\nEn el Infierno clásico, Cerbero encarna la voracidad sin límite: tres fauces eternamente hambrientas que desgarran la carne de los condenados.\n\nEn Baator, la misma idea toma forma en el Gran Gusano de Minauros, un monstruo colosal que vaga por el fango y devora a los desprevenidos. Como Cerbero, no razona ni pacta: simplemente mastica y tritura, recordando que en Minauros el destino del glotón y del avaro es ser alimento de su propio apetito.\n\n# 📜 Dogma de la Avaricia y la Glotonía\n\nEl placer es la única verdad tangible\n\nTodo lo demás —honor, fe, ideales— es humo y abstracción.\n\nComer, beber, poseer: estas son las únicas experiencias reales, concretas, inmediatas.\n\n- “El pan en la boca vale más que un juramento eterno.”\n- “Una copa de vino derriba más dudas que mil sermones.”\n- “Quien disfruta, posee; quien renuncia, se engaña.”\n\nEl deseo es prueba de vida\n\nQuien siente hambre —de comida, de poder, de riquezas— está vivo.\n\nSaciar el deseo es afirmar la existencia; negarlo es abrazar la muerte.\n\n- “Mientras desees, el mundo aún te pertenece.”\n- “El hambre que arde en el pecho es el único corazón verdadero.”\n- “Negar el deseo es suicidarse en vida.”\n\nCuarto círculo (Avaricia y Prodigalidad)\n\nEl tercer círculo, ilustrado por Stradanus.\nAquellos cuya actitud hacia los bienes materiales se desvió de la media inadecuada son castigados en el cuarto círculo. Aquí están condenados los avaros, que acumularon posesiones, y los pródigos, que las derrocharon. Ambos grupos empujan grandes pesos a lo largo del círculo, pero cada uno en dirección opuesta. Cuando se encuentran, chocando, se injurian. Unos reprochan: «¿Por qué acaparas?», los otros: «¿Por qué derrochas?». A continuación cada grupo da la vuelta para recorrer el círculo en sentido contrario, hasta chocar de nuevo con el otro.\n\nEl contraste entre estos dos grupos, Virgilio conduce al discurso sobre la naturaleza de la fortuna, que resucita a las naciones a la grandeza, y luego los sume en la pobreza, como ella cambia «esos productos vacíos de nación a nación, clan a clan», expresión que llena lo que de otro modo sería una brecha en el poema, ya que ambos grupos están tan absortos en su actividad que Virgilio le dice a Dante que sería inútil tratar de hablar con ellos; de hecho, han perdido su individualidad, y se convierten en «irreconocibles» (Canto VII)."}'::jsonb)
on conflict (id) do update set
  type = excluded.type,
  title = excluded.title,
  subtitle = excluded.subtitle,
  image_url = excluded.image_url,
  parent_id = excluded.parent_id,
  summary = excluded.summary,
  description = excluded.description,
  details = excluded.details,
  updated_at = now();

insert into public.lore_entries (id, type, title, subtitle, image_url, parent_id, summary, description, details)
values ('8badcdc0-669e-8bbc-19c3-85ef8c8c6754'::uuid, 'zone', 'Phlegethos - No lucharian', 'Auxiliar importado de Notion', '', null, 'Edonistas INCESTO ENTRE ELLOS DOS El Círculo de Fuego y Deseo (Phlegethos Luxuria) Entre las profundidades de Baator existe una zona donde dos tradiciones del tormento se entrelazan: Phlegethos, la cuarta capa infernal, y el círculo de los lujuriosos descrito por Dante. Este híbrido plano es conocido como el Círculo de Fuego y Deseo, un reino en el que las pasiones se convierten en llamas, y donde la justicia se dicta con la severidad de Minos y la crueldad de Belial y Fierna. Geografía El paisaje es una fusión de...', 'Edonistas
INCESTO ENTRE ELLOS DOS
El Círculo de Fuego y Deseo (Phlegethos-Luxuria)
Entre las profundidades de Baator existe una zona donde dos tradiciones del tormento se entrelazan: Phlegethos, la cuarta capa infernal, y el círculo de los lujuriosos descrito por Dante. Este híbrido plano es conocido como el Círculo de Fuego y Deseo, un reino en el que las pasiones se convierten en llamas, y donde la justicia se dicta con la severidad de Minos y la crueldad de Belial y Fierna.
Geografía
El paisaje es una fusión de volcanes colosales que arrojan ríos de lava y mares de fuego líquido, junto con tormentas perpetuas de viento abrasador que arrastran a las almas de los condenados sin permitirles reposo. No hay estrellas ni luna sobre el cielo; solo un vacío oscuro iluminado por brasas y relámpagos ígneos que desgarran la penumbra.
Los volcanes escupen tanto magma como torbellinos de aire ardiente que giran como huracanes, mezclando el castigo de Phlegethos con el contrapasso dantesco: los lujuriosos que en vida se dejaron llevar por la pasión irracional ahora son zarandeados eternamente por llamas errantes que los buscan y abrazan con deleite cruel.
Justicia Infernal
En el umbral del círculo se encuentra Minos, ya no solo juez de Dante, sino también magistrado de Baator, que determina con el retorcimiento de su cola el grado de fuego y tormenta que cada alma merece. Una vez dictada la sentencia, los condenados son entregados al sistema judicial infernal que Belial administra con fría precisión y Fierna adereza con sus espectáculos de placer y dolor.
Los tribunales de Abriymoch (la ciudad volcánica) funcionan como salas de audiencia infernales, donde cada condena se reviste de...', '{"source_path":"export-a\\Auxiliar\\Phlegethos - No lucharian 2521744335cf80569be2e38424952874.md","image_refs":["Phlegethos - No lucharian/image.png","Phlegethos - No lucharian/image 1.png","Phlegethos - No lucharian/image 2.png"],"imported_from":"Notion export","dm_source_markdown":"Edonistas\n\n## INCESTO ENTRE ELLOS DOS\n\nEl Círculo de Fuego y Deseo (Phlegethos-Luxuria)\n\nEntre las profundidades de Baator existe una zona donde dos tradiciones del tormento se entrelazan: Phlegethos, la cuarta capa infernal, y el círculo de los lujuriosos descrito por Dante. Este híbrido plano es conocido como el Círculo de Fuego y Deseo, un reino en el que las pasiones se convierten en llamas, y donde la justicia se dicta con la severidad de Minos y la crueldad de Belial y Fierna.\n\n### Geografía\n\nEl paisaje es una fusión de volcanes colosales que arrojan ríos de lava y mares de fuego líquido, junto con tormentas perpetuas de viento abrasador que arrastran a las almas de los condenados sin permitirles reposo. No hay estrellas ni luna sobre el cielo; solo un vacío oscuro iluminado por brasas y relámpagos ígneos que desgarran la penumbra.\n\nLos volcanes escupen tanto magma como torbellinos de aire ardiente que giran como huracanes, mezclando el castigo de Phlegethos con el contrapasso dantesco: los lujuriosos que en vida se dejaron llevar por la pasión irracional ahora son zarandeados eternamente por llamas errantes que los buscan y abrazan con deleite cruel.\n\n### Justicia Infernal\n\nEn el umbral del círculo se encuentra Minos, ya no solo juez de Dante, sino también magistrado de Baator, que determina con el retorcimiento de su cola el grado de fuego y tormenta que cada alma merece. Una vez dictada la sentencia, los condenados son entregados al sistema judicial infernal que Belial administra con fría precisión y Fierna adereza con sus espectáculos de placer y dolor.\n\nLos tribunales de Abriymoch (la ciudad volcánica) funcionan como salas de audiencia infernales, donde cada condena se reviste de legalidad diabólica: contratos, tecnicismos y juicios interminables que deciden si el alma arderá en los ríos de fuego, si será lanzada a los huracanes incandescentes o si descenderá al Pozo de Llamas, donde el infierno verdadero (hellfire) purga a dioses y diablos por igual.\n\n### Inhabitantes\n\n- Belial y Fierna gobiernan conjuntamente: él como burócrata del tormento, ella como sacerdotisa de la lujuria y el sufrimiento erótico. Su palacio de cristal ardiente se erige sobre el mayor volcán, desde donde contemplan tanto las tormentas de Dante como los ríos de lava baatorianos.\n- Minos actúa como juez de frontera, pero sus funciones se integran en el sistema legal de Belial: sus sentencias son la base de los castigos, aunque los diablos ajustan las condenas para extraer el máximo de placer y utilidad.\n- Los lujuriosos célebres —Cleopatra— no solo giran en los vendavales, sino que sus figuras son exhibidas como advertencia en espectáculos infernales. Fierna, fascinada por el amor prohibido, los utiliza como ejemplo de cómo la pasión lleva al tormento eterno.\n- Legiones de hamatulas y erinyes vigilan los ríos de fuego y las tempestades, asegurándose de que ninguna alma escape; y en las fronteras acechan salamandras y mephits de fuego, sirviendo de informantes y cazadores.\n\n### Contrapasso Ígneo\n\nEl principio dantesco del contrapasso se mantiene pero es amplificado:\n\n- Los lujuriosos son arrastrados por vientos incandescentes que los desgarran y, al mismo tiempo, los bañan en llamas conscientes que buscan su carne.\n- El deseo que los consumió en vida es ahora una sed infinita: cada abrazo que intentan dar en el torbellino se convierte en un incendio que carboniza su piel.\n- Algunos diablos, con permiso de Belial y Fierna, participan en estos vendavales como tentadores perpetuos, acercándose a los condenados con promesas de placer solo para dejarlos arder en frustración."}'::jsonb)
on conflict (id) do update set
  type = excluded.type,
  title = excluded.title,
  subtitle = excluded.subtitle,
  image_url = excluded.image_url,
  parent_id = excluded.parent_id,
  summary = excluded.summary,
  description = excluded.description,
  details = excluded.details,
  updated_at = now();

insert into public.lore_entries (id, type, title, subtitle, image_url, parent_id, summary, description, details)
values ('305e75c6-d095-ebbb-73bd-587fddbb7101'::uuid, 'zone', 'Stygia - No Lucharia', 'Auxiliar importado de Notion', '', null, 'no lucha, casi todos sus recursos estan defendiendole a el casco carlos Visión General Stigia: Quinta capa del Infierno, un océano helado y tormentoso atravesado por el Río Estigia. Gobernante: Levistus, el “Príncipe Helado”, atrapado en un bloque de hielo pero con control telepático total. Carácter: Reino de frío eterno, traiciones constantes y lucha por la supervivencia. No cumple una función clara dentro del Infierno, sino que sirve de campo de pruebas para los diablos y soldados. Geografía y Entorno Océano...', 'no lucha, casi todos sus recursos estan defendiendole a el
casco carlos
Visión General
- Stigia: Quinta capa del Infierno, un océano helado y tormentoso atravesado por el Río Estigia.
- Gobernante: Levistus, el “Príncipe Helado”, atrapado en un bloque de hielo pero con control telepático total.
- Carácter: Reino de frío eterno, traiciones constantes y lucha por la supervivencia. No cumple una función clara dentro del Infierno, sino que sirve de campo de pruebas para los diablos y soldados.
Geografía y Entorno
- Océano infinito de hielos, glaciares, montañas y ciénagas congeladas.
- Cielo en penumbra perpetua, iluminado solo por tormentas eléctricas y auroras heladas.
- El frío es sobrenatural: existen fuegos helados y el hielo estigio, que roba recuerdos y transforma a las víctimas en espectros.
- Ciudades y fortalezas se alzan sobre grandes témpanos y a lo largo del Estigia.
- Tantlin, la Ciudad de Hielo: centro comercial y político de la capa.
Lugares Notables
- Tumba de Levistus: gigantesco iceberg donde yace el archidiablo.
- Ciudadela Coldsteel: fortaleza de Geryon, diseñada para capturar un templo profetizado.
- Garganta del Duelista: arena legal de combates entre diablos.
- Sala de los Vencidos: museo-entrenamiento con enemigos atrapados en hielo.
- Pilar de Geryon: monumento maldito que otorga poderes oscuros
Habitantes
- Levistus gobierna inmóvil desde su prisión.
- Geryon, antiguo regente, aún lucha por recuperar el poder.
- Amon el Lobo.
- Diablos:
- Los amnizu (diablos del Estigia) dominan las ciudades y ejércitos.
- Gelugones (diablos de hielo), erinyes, cornugones, diablos óseos, succubi y más.
- Campeones estigios: élite llamada en refuerzos para la Guerra...', '{"source_path":"export-a\\Auxiliar\\Stygia - No Lucharia 2521744335cf8025b5edc16e790216cb.md","image_refs":["Stygia - No Lucharia/image.png","Stygia - No Lucharia/image 1.png","Stygia - No Lucharia/image 2.png","Stygia - No Lucharia/image 3.png","Stygia - No Lucharia/image 4.png"],"imported_from":"Notion export","dm_source_markdown":"### no lucha, casi todos sus recursos estan defendiendole a el\ncasco carlos\n\nVisión General\n\n- Stigia: Quinta capa del Infierno, un océano helado y tormentoso atravesado por el Río Estigia.\n- Gobernante: Levistus, el “Príncipe Helado”, atrapado en un bloque de hielo pero con control telepático total.\n- Carácter: Reino de frío eterno, traiciones constantes y lucha por la supervivencia. No cumple una función clara dentro del Infierno, sino que sirve de campo de pruebas para los diablos y soldados.\n\n---\n\n### Geografía y Entorno\n\n- Océano infinito de hielos, glaciares, montañas y ciénagas congeladas.\n- Cielo en penumbra perpetua, iluminado solo por tormentas eléctricas y auroras heladas.\n- El frío es sobrenatural: existen fuegos helados y el hielo estigio, que roba recuerdos y transforma a las víctimas en espectros.\n- Ciudades y fortalezas se alzan sobre grandes témpanos y a lo largo del Estigia.\n- Tantlin, la Ciudad de Hielo: centro comercial y político de la capa.\n\n---\n\n### Lugares Notables\n\n- Tumba de Levistus: gigantesco iceberg donde yace el archidiablo.\n- Ciudadela Coldsteel: fortaleza de Geryon, diseñada para capturar un templo profetizado.\n- Garganta del Duelista: arena legal de combates entre diablos.\n- Sala de los Vencidos: museo-entrenamiento con enemigos atrapados en hielo.\n- Pilar de Geryon: monumento maldito que otorga poderes oscuros\n\n---\n\n### Habitantes\n\n- Levistus gobierna inmóvil desde su prisión.\n- Geryon, antiguo regente, aún lucha por recuperar el poder.\n- Amon el Lobo.\n- Diablos:\n    - Los amnizu (diablos del Estigia) dominan las ciudades y ejércitos.\n    - Gelugones (diablos de hielo), erinyes, cornugones, diablos óseos, succubi y más.\n    - Campeones estigios: élite llamada en refuerzos para la Guerra de Sangre.\n- Otros: almas condenadas congeladas en el hielo, yugoloths mercenarios, gigantes de escarcha, lobos invernales, tiburones colosales, krakens y aboleths estigios corrompidos por la magia infernal.\n\n---\n\n### Temas\n\n- Traición y Hambre: Levistus trama mediante el engaño y acumula almas.\n- Prueba y Supervivencia: Los diablos entrenan en condiciones extremas.\n- El Estigia: Río central, tóxico y destructor de memorias, pero vital para transporte y comercio.\n\n---\n\n### Historia y Política\n\n- Crimen de Levistus: sedujo tanto a Bensozia (esposa de Asmodeus) como a su hija Glasya; culpado del asesinato de Bensozia, fue encarcelado en hielo.\n- Gobierno de Geryon: más leal que ambicioso, disfrutaba cazando presas en Tantlin.\n- La Gran Cisma (el Reckoning): Geryon apoyó secretamente a Asmodeus, pero aun así fue depuesto; Levistus volvió al poder, aunque encadenado en su tumba helada.\n- Reinado actual de Levistus: maquina sin cesar, planeando asfixiar el Infierno privando de almas a sus rivales.\n- Regreso de Geryon: recupera Coldsteel y reabre la guerra civil en Stigia, en una jugada que quizá sea otra manipulación de Asmodeus.\n\n---\n\n### Identidad de Stigia\n\nUn reino de hielo, tormentas y traiciones, donde la condena se manifiesta como traición eterna, ambición congelada y guerras sin fin. Levistus encarna la paciencia del traidor; Geryon, la bestialidad brutal. Ambos están atrapados en una lucha interminable que podría ser, en última instancia, parte de los planes de Asmodeus.\n\nLas almas de los\niracundos\n están encenagadas en la espantosa y pantanosa laguna\nEstigia\n. Rabiosas, se golpean entre ellas, y se despedazan a mordiscos mientras se ahogan en sus infectas aguas. Bajo el agua y hundidos en el lodo, están las almas de los\nacidiosos\n."}'::jsonb)
on conflict (id) do update set
  type = excluded.type,
  title = excluded.title,
  subtitle = excluded.subtitle,
  image_url = excluded.image_url,
  parent_id = excluded.parent_id,
  summary = excluded.summary,
  description = excluded.description,
  details = excluded.details,
  updated_at = now();

insert into public.lore_entries (id, type, title, subtitle, image_url, parent_id, summary, description, details)
values ('874b8fe4-35de-0ba6-4699-aab25b173d0b'::uuid, 'zone', 'Ultima layer', 'Auxiliar importado de Notion', '', null, 'asmodeo a creado un bucle temporal en el cual ha firmado un pacto con 6 individuos con unos espiritus fuertes, espera que la tortura que les va a hacer en el infierno le permitan nutrir todo, por eso ha creado un bucle temporal para hacerles pasar por lo mismo uno y otra vez, todos lo hicieron para salvar a alguien, su interes es que pasen por todas las pruebas del infierno e irles sacando el espiritu poco a poco gana por dos, pues asi tiene encerrado al dios del abismo en un bucle temporal, y siempre les trolea...', 'asmodeo a creado un bucle temporal en el cual ha firmado un pacto con 6 individuos con unos espiritus fuertes, espera que la tortura que les va a hacer en el infierno le permitan nutrir todo, por eso ha creado un bucle temporal para hacerles pasar por lo mismo uno y otra vez, todos lo hicieron para salvar a alguien, su interes es que pasen por todas las pruebas del infierno e irles sacando el espiritu poco a poco
gana por dos, pues asi tiene encerrado al dios del abismo en un bucle temporal, y siempre les trolea entregandoles el fake hermano
como romper el bucle?
romper el contrato
encontrar un vacio legal en el contrato
derrotar a asmodeo
gestar la deidad de carlos (en su forma buena)
aceptar el destino y no hacer nada
ellos lo ven como fantasmas del color del pecado que cometen
Carlos: Escucharas una voz en tu cabeza que dirá: "Serás recordado como el mayor fracaso del Abismo”
Isaac:
Sientes primero el peso sofocante del Infierno: un calor abrasador, denso, asfixiante, que se cuela por tu garganta como un aliento ardiente y te quema desde dentro. Cada inspiración es un hierro candente, y tu pecho parece contraerse bajo una presión invisible, como si el mismo aire fuese lava líquida que busca ahogarte en su fuego inmisericorde. Tus labios se resecan, tu piel palpita con un ardor intolerable, y hasta tus huesos parecen arder bajo la tiranía de ese calor infernal.
Y de pronto, como si un velo invisible se rasgara, el tormento cambia. El aire deja de ser cuchillas candentes y se convierte en una caricia luminosa. El calor se transforma en un sol dorado, suave y envolvente, como la brisa tibia de un día perfecto en la playa. Te acaricia la piel con dulzura, haciéndote...', '{"source_path":"export-a\\Auxiliar\\Ultima layer 2521744335cf80228534ce5fe93c6662.md","image_refs":["Asmodeus/Imagen_de_WhatsApp_2025-08-13_a_las_16.03.44_29f6d2d6.jpg","Ultima layer/Imagen_de_WhatsApp_2025-08-13_a_las_16.12.46_691ee0e4.jpg","Ultima layer/Imagen_de_WhatsApp_2025-09-04_a_las_01.55.13_29babbe3.jpg"],"imported_from":"Notion export","dm_source_markdown":"asmodeo a creado un bucle temporal en el cual ha firmado un pacto con 6 individuos con unos espiritus fuertes, espera que la tortura que les va a hacer en el infierno le permitan nutrir todo, por eso ha creado un bucle temporal para hacerles pasar por lo mismo uno y otra vez, todos lo hicieron para salvar a alguien, su interes es que pasen por todas las pruebas del infierno e irles sacando el espiritu poco a poco\n\ngana por dos, pues asi tiene encerrado al dios del abismo en un bucle temporal, y siempre les trolea entregandoles el fake hermano\n\ncomo romper el bucle?\nromper el contrato\nencontrar un vacio legal en el contrato\nderrotar a asmodeo\ngestar la deidad de carlos (en su forma buena)\naceptar el destino y no hacer nada\n\nellos lo ven como fantasmas del color del pecado que cometen\n\nCarlos: Escucharas una voz en tu cabeza que dirá: \"Serás recordado como el mayor fracaso del Abismo”\n\nIsaac:\nSientes primero el peso sofocante del Infierno: un calor abrasador, denso, asfixiante, que se cuela por tu garganta como un aliento ardiente y te quema desde dentro. Cada inspiración es un hierro candente, y tu pecho parece contraerse bajo una presión invisible, como si el mismo aire fuese lava líquida que busca ahogarte en su fuego inmisericorde. Tus labios se resecan, tu piel palpita con un ardor intolerable, y hasta tus huesos parecen arder bajo la tiranía de ese calor infernal.\n\nY de pronto, como si un velo invisible se rasgara, el tormento cambia. El aire deja de ser cuchillas candentes y se convierte en una caricia luminosa. El calor se transforma en un sol dorado, suave y envolvente, como la brisa tibia de un día perfecto en la playa. Te acaricia la piel con dulzura, haciéndote sentir protegido, reconfortado, casi dichoso. Es un calor que no abrasa, sino que abraza; un fuego que no quema, sino que reconcilia.\n\nUn resplandor tenue comienza a emanar de ti, dorado y sereno, como si tu propio cuerpo fuese una antorcha divina de esperanza.\n\nCésar:\nun vial distinto, uno con una etiqueta que pone: \"Para matar Warforged, ya me lo agradecerás”\n\nel mismo se la crafteara para si mismo para el siguiente bucle"}'::jsonb)
on conflict (id) do update set
  type = excluded.type,
  title = excluded.title,
  subtitle = excluded.subtitle,
  image_url = excluded.image_url,
  parent_id = excluded.parent_id,
  summary = excluded.summary,
  description = excluded.description,
  details = excluded.details,
  updated_at = now();

insert into public.lore_entries (id, type, title, subtitle, image_url, parent_id, summary, description, details)
values ('094b8d5f-4cce-7432-c408-5ffd41b38fd8'::uuid, 'character', 'Zhar’keth, Boca Menor de Demogorgon, Los Incoherentes', 'Importado de Notion', '', null, 'Figura principal: Tiene un cuerpo delgado pero musculado, de piel oscura, casi como quitina o carne reseca, con pliegues marcados en el torso y el abdomen. La silueta es claramente de “bicho”: cintura estrecha, vientre voluminoso, patas articuladas y dedos largos. Cabeza: alargada y puntiaguda, como la de una mantis o un depredador reptiliano. La boca está abierta, mostrando una hilera de dientes afilados. El detalle que más destaca es un ojo rojo brillante que parece arder desde dentro. Brazos y manos: Las...', '- Figura principal: Tiene un cuerpo delgado pero musculado, de piel oscura, casi como quitina o carne reseca, con pliegues marcados en el torso y el abdomen. La silueta es claramente de “bicho”: cintura estrecha, vientre voluminoso, patas articuladas y dedos largos.
- Cabeza: alargada y puntiaguda, como la de una mantis o un depredador reptiliano. La boca está abierta, mostrando una hilera de dientes afilados. El detalle que más destaca es un ojo rojo brillante que parece arder desde dentro.
- Brazos y manos: Las extremidades son largas y huesudas, con articulaciones marcadas.
- Patas / extremidades inferiores: tiene varias patas que se doblan en ángulos antinaturales, terminando en garras.
- Alas: detrás se ven dos grandes alas translúcidas, tipo insecto, con venas finas.
Rol: líder de escuadrón + predicador de campo (“Boca” en miniatura).
Misión oficial: alcanzar el embarcadero del Estigia.
Misión real (según el culto): profanarlo para que el lugar deje de “servir” a nadie: ni diablos, ni mercaderes, ni mortales. Que el embarcadero se convierta en una herida de incoherencia donde todo pacto y toda identidad se deshilache.
Cómo encarna el dogma
Zhar’keth no intenta ser coherente, y eso es exactamente su poder. Su mando es un sermón:
- Hoy promete disciplina, mañana la castiga como traición al caos.
- Hoy recompensa el valor, mañana mata al valiente “por predecible”.
- Hoy protege a un dretch, mañana lo devora para “demostrar libertad”.
No es capricho “porque sí”. Él lo justifica así: si te vuelves consistente, te vuelves gobernable. Y ser gobernable es el pecado.
Personalidad (para rolearlo)
- Carisma venenoso: habla como una verdad que se desmiente a sí misma. Te convence y te confunde.
- Voz doble (sin necesidad de dos cabezas): a veces se responde a sí mismo en mitad de una frase, como si discutiera con una segunda boca invisible.
- Manía: se limpia las “manos” en el aire, como si quitara una telaraña invisible. En realidad “marca” el aire con feromonas/símbolos: gestos de mando.
- Placer en la excepción: se obsesiona con casos especiales. Si alguien dice “siempre”, él sonríe.
- Odio al orden: cuando ve una formación de diablos o una norma clara, se vuelve...', '{"source_path":"export-b\\D&D Inferno\\NPCs\\Demonios\\Zhar’keth, Boca Menor de Demogorgon, Los Incoheren 2e11744335cf80f988faf4e5aa3c51b6.md","image_refs":["../../Sesiones/Sesion #2 Campo de Batalla/f005c18b-07ad-4ba6-823f-2408a44d3188.png"],"imported_from":"Notion export","dm_source_markdown":"- Figura principal: Tiene un cuerpo delgado pero musculado, de piel oscura, casi como quitina o carne reseca, con pliegues marcados en el torso y el abdomen. La silueta es claramente de “bicho”: cintura estrecha, vientre voluminoso, patas articuladas y dedos largos.\n- Cabeza: alargada y puntiaguda, como la de una mantis o un depredador reptiliano. La boca está abierta, mostrando una hilera de dientes afilados. El detalle que más destaca es un ojo rojo brillante que parece arder desde dentro.\n- Brazos y manos: Las extremidades son largas y huesudas, con articulaciones marcadas.\n- Patas / extremidades inferiores: tiene varias patas que se doblan en ángulos antinaturales, terminando en garras.\n- Alas: detrás se ven dos grandes alas translúcidas, tipo insecto, con venas finas.\n\nRol: líder de escuadrón + predicador de campo (“Boca” en miniatura).\n\nMisión oficial: alcanzar el embarcadero del Estigia.\n\nMisión real (según el culto): profanarlo para que el lugar deje de “servir” a nadie: ni diablos, ni mercaderes, ni mortales. Que el embarcadero se convierta en una herida de incoherencia donde todo pacto y toda identidad se deshilache.\n\n### Cómo encarna el dogma\n\nZhar’keth no intenta ser coherente, y eso es exactamente su poder. Su mando es un sermón:\n\n- Hoy promete disciplina, mañana la castiga como traición al caos.\n- Hoy recompensa el valor, mañana mata al valiente “por predecible”.\n- Hoy protege a un dretch, mañana lo devora para “demostrar libertad”.\n\nNo es capricho “porque sí”. Él lo justifica así: si te vuelves consistente, te vuelves gobernable. Y ser gobernable es el pecado.\n\n---\n\n## Personalidad (para rolearlo)\n\n- Carisma venenoso: habla como una verdad que se desmiente a sí misma. Te convence y te confunde.\n- Voz doble (sin necesidad de dos cabezas): a veces se responde a sí mismo en mitad de una frase, como si discutiera con una segunda boca invisible.\n- Manía: se limpia las “manos” en el aire, como si quitara una telaraña invisible. En realidad “marca” el aire con feromonas/símbolos: gestos de mando.\n- Placer en la excepción: se obsesiona con casos especiales. Si alguien dice “siempre”, él sonríe.\n- Odio al orden: cuando ve una formación de diablos o una norma clara, se vuelve casi feliz: “algo bonito que romper”.\n\nTic sagrado: hace dos gestos opuestos al dar órdenes: una mano “llama”, la otra “rechaza”. Sus tropas no lo cuestionan; aprenden a sobrevivir leyendo su contradicción.\n\n“Las mentes más fuertes son aquellas que pueden sostener dos ideas opuestas sin romperse. El conflicto no las desintegra porque reconocen que la realidad nunca es singular. La contradicción no es un error, sino una superficie bajo la cual los patrones se cruzan, colisionan y se fusionan. Una mente reacia a soportar la disonancia se estremece ante la complejidad, aferrándose a la certeza más cercana y confundiendo estabilidad con perspicacia. La fuerza surge en la tensión, en la capacidad de observar las fuerzas opuestas, de permitir que coexistan sin rendirse ni reprimirse. Luchar con la contradicción es cultivar la profundidad, extraer claridad del caos y ver el mundo con firmeza, fracturado, fluido y, al mismo tiempo, verdadero de maneras que la mente tímida no puede comprender.”"}'::jsonb)
on conflict (id) do update set
  type = excluded.type,
  title = excluded.title,
  subtitle = excluded.subtitle,
  image_url = excluded.image_url,
  parent_id = excluded.parent_id,
  summary = excluded.summary,
  description = excluded.description,
  details = excluded.details,
  updated_at = now();

insert into public.lore_entries (id, type, title, subtitle, image_url, parent_id, summary, description, details)
values ('10b62424-6aa9-491e-223e-c75a11717554'::uuid, 'character', 'Bel', 'Importado de Notion', '', null, 'Consejeros le avisan de una pequeña revuelta: Nunca subestimes el poder de la gente estúpida en grupos grandes. Un solo tonto puede ser ignorado, pero una multitud de tontos se convierte en una tormenta que ahoga la razón. Su certeza es ensordecedora, su ignorancia contagiosa y su unidad más fuerte que la verdad. Las decisiones tomadas por los irreflexivos se convierten en ley, la moral se doblega ante la voz más fuerte y los desastres se celebran como victorias. La inteligencia es invisible ante el peso de los...', 'Consejeros le avisan de una pequeña revuelta:
Nunca subestimes el poder de la gente estúpida en grupos grandes. Un solo tonto puede ser ignorado, pero una multitud de tontos se convierte en una tormenta que ahoga la razón. Su certeza es ensordecedora, su ignorancia contagiosa y su unidad más fuerte que la verdad.
Las decisiones tomadas por los irreflexivos se convierten en ley, la moral se doblega ante la voz más fuerte y los desastres se celebran como victorias. La inteligencia es invisible ante el peso de los números, la perspicacia aplastada bajo los aplausos y la sabiduría burlada por el consenso. Las civilizaciones no caen ante los enemigos a las puertas, sino ante la ceguera colectiva interior.
Nunca asumas que el intelecto por sí solo puede resistir la fuerza de una masa unida e irreflexiva. Triturará la claridad.
Discurso cuando se le declara dictador:
La democracia nunca elige al mejor líder. Siempre elige al mejor mentiroso. Y por eso toda democracia fracasa con el tiempo.
La democracia no premia la sabiduría. Premia la persuasión. El hombre que comprende la realidad pierde frente al hombre que puede manipular la percepción.
El honesto pierde frente al encantador. El disciplinado pierde frente al teatral. Asmodeus dijo: «El mayor castigo por negarse a gobernar es ser gobernado por alguien inferior».
Eso no es un consejo moral. Es una ley de poder. Cuando la competencia se retira, la manipulación avanza.
Cuando la verdad es costosa, las mentiras se vuelven eficientes. Y cuando la popularidad determina la autoridad, el engaño se convierte en estrategia. La democracia no se derrumba desde afuera.
Se vacia desde adentro. Y cuando las mentiras finalmente sacuden el sistema, el final es predecible. El pueblo no se resiste a la tiranía.
La implora.
Discurso coliseo para Isaac:
Un gato que quiere convertirse en león debe perder el apetito por las ratas. La transformación no comienza con la ambición, sino con el rechazo. El hambre leve parece inofensiva, pero entrena al cuerpo a arrodillarse.
Lo que consumes repetidamente define la magnitud de tu deseo. No se puede perseguir la grandeza alimentándose de migajas, ni reivindicar la grandeza aferrándose a lo que...', '{"source_path":"export-b\\D&D Inferno\\NPCs\\Diablos\\Bel 30b1744335cf80d38e39e25a848658d7.md","image_refs":[],"imported_from":"Notion export","dm_source_markdown":"Consejeros le avisan de una pequeña revuelta:\n\nNunca subestimes el poder de la gente estúpida en grupos grandes. Un solo tonto puede ser ignorado, pero una multitud de tontos se convierte en una tormenta que ahoga la razón. Su certeza es ensordecedora, su ignorancia contagiosa y su unidad más fuerte que la verdad.\n\nLas decisiones tomadas por los irreflexivos se convierten en ley, la moral se doblega ante la voz más fuerte y los desastres se celebran como victorias. La inteligencia es invisible ante el peso de los números, la perspicacia aplastada bajo los aplausos y la sabiduría burlada por el consenso. Las civilizaciones no caen ante los enemigos a las puertas, sino ante la ceguera colectiva interior.\n\nNunca asumas que el intelecto por sí solo puede resistir la fuerza de una masa unida e irreflexiva. Triturará la claridad.\n\nDiscurso cuando se le declara dictador:\n\nLa democracia nunca elige al mejor líder. Siempre elige al mejor mentiroso. Y por eso toda democracia fracasa con el tiempo.\n\nLa democracia no premia la sabiduría. Premia la persuasión. El hombre que comprende la realidad pierde frente al hombre que puede manipular la percepción.\n\nEl honesto pierde frente al encantador. El disciplinado pierde frente al teatral. Asmodeus dijo: «El mayor castigo por negarse a gobernar es ser gobernado por alguien inferior».\n\nEso no es un consejo moral. Es una ley de poder. Cuando la competencia se retira, la manipulación avanza.\n\nCuando la verdad es costosa, las mentiras se vuelven eficientes. Y cuando la popularidad determina la autoridad, el engaño se convierte en estrategia. La democracia no se derrumba desde afuera.\n\nSe vacia desde adentro. Y cuando las mentiras finalmente sacuden el sistema, el final es predecible. El pueblo no se resiste a la tiranía.\n\nLa implora.\n\nDiscurso coliseo para Isaac:\nUn gato que quiere convertirse en león debe perder el apetito por las ratas. La transformación no comienza con la ambición, sino con el rechazo. El hambre leve parece inofensiva, pero entrena al cuerpo a arrodillarse.\n\nLo que consumes repetidamente define la magnitud de tu deseo. No se puede perseguir la grandeza alimentándose de migajas, ni reivindicar la grandeza aferrándose a lo que una vez lo mantuvo vivo. Los hábitos de supervivencia se convierten en las cadenas del estancamiento.\n\nEvolucionar es soportar la ausencia, tolerar el silencio que queda cuando se eliminan las satisfacciones menores. Muchos se retiran en esta etapa, confundiendo la incomodidad con la pérdida, sin darse cuenta de que el vacío es el primer territorio de expansión. El depredador no nace del exceso, sino de una disciplina lo suficientemente severa como para matar de hambre a su yo anterior."}'::jsonb)
on conflict (id) do update set
  type = excluded.type,
  title = excluded.title,
  subtitle = excluded.subtitle,
  image_url = excluded.image_url,
  parent_id = excluded.parent_id,
  summary = excluded.summary,
  description = excluded.description,
  details = excluded.details,
  updated_at = now();

insert into public.lore_entries (id, type, title, subtitle, image_url, parent_id, summary, description, details)
values ('2e7ddf5a-db81-21b8-2ece-287db1b644b2'::uuid, 'character', 'Arnau (Eleanor)', 'Importado de Notion', '', null, '/image.png) 📌 Resumen (1–3 palabras) Clase: Druid Circle of the Stars Raza: Astral Elf Género: ¿? Tamaño: Mediano Altura: Peso: Piel (incluye color): Blanca Background (DnD 5e): Alignment: Neutral Good Ojos: Verdes Cabellos: Blanco Edad: Desconocido 🧠 Características Personalidad (puntos + / ) Extremadamente calmado y pacífico. Nunca ataca ni daña a nadie a menos que se trate de una situación límite. Ideales / Moral Vínculos Debilidades / Miedos / Inseguridades 📚 Lore Eleanor es un enviado de Celestian para...', '/image.png)
📌 Resumen (1–3 palabras)
- Clase:  Druid Circle of the Stars
- Raza: Astral Elf
- Género: ¿?
- Tamaño: Mediano
- Altura:
- Peso:
- Piel (incluye color): Blanca
- Background (DnD 5e):
- Alignment: Neutral Good
- Ojos: Verdes
- Cabellos: Blanco
- Edad: Desconocido
🧠 Características
Personalidad (puntos + / -)
- Extremadamente calmado y pacífico.
- Nunca ataca ni daña a nadie a menos que se trate de una situación límite.
Ideales / Moral
Vínculos
Debilidades / Miedos / Inseguridades
📚 Lore
Eleanor es un enviado de Celestian para evitar el renacimiento de Tharizdun, el Dios Encandenado y creador del abismo. Del panteón de Oerth, Tharizdun logró acabar con casi todos los dioses, solo la intervención tardía de Celestian logro impedirlo. Ahora quiere redimir sus errores del pasado y su falta de iniciativa e impedir su renacimiento en los Reinos Olvidados.
- Recuerdo 1 —
> De entre los 3 recuerdos que hay en la mente de Eleanor, el primero es el más vívido y perturbador. En él, se encuentra flotando en el corazón de una nebulosa de colores carmesí y violeta. El entorno es un jardín de polvo estelar, con islas de roca cristalina sobre las que crecen árboles de luz plateada. Se trata de un espacio que dota a Eleanor de una sensación de poder que le conecta con el cosmos. Frente a él flota una entidad divina un tanto particular, una esfera de ámbar líquido del tamaño de una luna pequeña. Dentro de ella giran galaxias en miniatura y de su núcleo emanan apéndices, los cuales forman constelaciones vivientes. De este ser no emana malicia alguna, sino una profunda y antigua serenidad. A pesar de percibirlo como una fuerza del bien, un guardián del equilibrio, Eleanor actúa con una determinación inexplicable y carente de emoción. Sus manos trazan patrones en el aire, y las estrellas cercanas acuden a su llamada, transformándose en afilados fragmentos de obsidiana celestial. Adopta una forma estelar, manifestando un arco de luz pura y una flecha hecha de oscuridad y luz estelar solidificada. La entidad de ámbar no intenta defenderse; sus incontables ojos estelares sólo reflejan una incomprensible tristeza mientras observa al druida. Él dispara la flecha. El...', '{"source_path":"export-b\\D&D Inferno\\Personajes\\Arnau (Eleanor) 2d11744335cf809cb75cd441d85cca53.md","image_refs":["Arnau (Eleanor","Arnau (Eleanor"],"imported_from":"Notion export","dm_source_markdown":"/image.png)\n\n## 📌 Resumen (1–3 palabras)\n\n- Clase:  Druid Circle of the Stars\n- Raza: Astral Elf\n- Género: ¿?\n- Tamaño: Mediano\n- Altura:\n- Peso:\n- Piel (incluye color): Blanca\n- Background (DnD 5e):\n- Alignment: Neutral Good\n- Ojos: Verdes\n- Cabellos: Blanco\n- Edad: Desconocido\n\n---\n\n## 🧠 Características\n\n### Personalidad (puntos + / -)\n\n- Extremadamente calmado y pacífico.\n- Nunca ataca ni daña a nadie a menos que se trate de una situación límite.\n\n### Ideales / Moral\n\n### Vínculos\n\n### Debilidades / Miedos / Inseguridades\n\n---\n\n## 📚 Lore\n\nEleanor es un enviado de Celestian para evitar el renacimiento de Tharizdun, el Dios Encandenado y creador del abismo. Del panteón de Oerth, Tharizdun logró acabar con casi todos los dioses, solo la intervención tardía de Celestian logro impedirlo. Ahora quiere redimir sus errores del pasado y su falta de iniciativa e impedir su renacimiento en los Reinos Olvidados.\n\n- Recuerdo 1 —\n\n> De entre los 3 recuerdos que hay en la mente de Eleanor, el primero es el más vívido y perturbador. En él, se encuentra flotando en el corazón de una nebulosa de colores carmesí y violeta. El entorno es un jardín de polvo estelar, con islas de roca cristalina sobre las que crecen árboles de luz plateada. Se trata de un espacio que dota a Eleanor de una sensación de poder que le conecta con el cosmos. Frente a él flota una entidad divina un tanto particular, una esfera de ámbar líquido del tamaño de una luna pequeña. Dentro de ella giran galaxias en miniatura y de su núcleo emanan apéndices, los cuales forman constelaciones vivientes. De este ser no emana malicia alguna, sino una profunda y antigua serenidad. A pesar de percibirlo como una fuerza del bien, un guardián del equilibrio, Eleanor actúa con una determinación inexplicable y carente de emoción. Sus manos trazan patrones en el aire, y las estrellas cercanas acuden a su llamada, transformándose en afilados fragmentos de obsidiana celestial. Adopta una forma estelar, manifestando un arco de luz pura y una flecha hecha de oscuridad y luz estelar solidificada. La entidad de ámbar no intenta defenderse; sus incontables ojos estelares sólo reflejan una incomprensible tristeza mientras observa al druida. Él dispara la flecha. El proyectil impacta en el núcleo del ser sin sonido. La luz de la entidad vacila y sus galaxias internas se extinguen. La esfera de ámbar se resquebraja con delicadeza, liberando un torrente de polvo de estrellas moribundo que baña a Eleanor. El recuerdo finaliza con la imagen de la cáscara vacía de la criatura. La nebulosa a su alrededor pierde su color, volviéndose de un gris ceniciento, y una abrumadora sensación de pérdida lo inunda. Ha matado a un ser celestial, una fuerza del bien, y desconoce por completo el motivo que lo impulsó a cometer tal acto.\n>\n\nEleanor mató sin saber por qué a un ser celestial bueno.\n\nEleanor lleva años preparandose para está misión, y por lo tanto entrenando su memoria muscular, entre ellas acabar con Tharizdun en sus fases tempranas, por lo que ha engañado a su memoria para tener que actuar si el momento lo requiere.\n\n- Recuerdo 2 —\n\n> El segundo recuerdo en la mente de Eleanor es mucho más sereno, aunque igualmente difuso en sus bordes, como un sueño demasiado antiguo para ser completamente nítido. Se encuentra en lo alto de un acantilado que flota sobre un mar infinito de estrellas. El cielo no muestra sol ni luna, sólo constelaciones que giran en patrones arcanos, como si formaran un gigantesco astrolabio viviente. El aire huele a resina y viento frío, y bajo sus pies la piedra tiene incrustaciones de cristales que laten suavemente al ritmo de su corazón. Frente a él, un círculo de druidas ancianos recita al unísono, con voces que parecen resonar tanto en el aire como en el espacio mismo. Todos visten túnicas adornadas con mapas estelares bordados en plata. En el centro del círculo arde un fuego que no consume nada: una llama azul, translúcida, en cuyo interior se distinguen fragmentos de cometas que giran como brasas eternas. En ese instante siente, por primera vez, la presencia de Celestian. No lo percibe como una figura concreta, sino como una vastedad consciente: un murmullo de galaxias lejanas, el silencio entre estrellas, la promesa de que cada sendero en la bóveda celeste es también un destino sagrado. Una de las druidas ancianas se acerca, coloca en sus manos un pequeño disco de plata con un agujero en el centro, y pronuncia palabras que resuenan con solemnidad: <Insertar algún ritual usando los principios Celestian> Al estrechar el disco contra su pecho, Eleanor siente cómo las constelaciones sobre su cabeza cambian de posición, como si el universo entero lo reconociera. Su piel se estremece, no de frío, sino de comunión. Percibe que cada estrella es una chispa de vida, cada cometa un viajero, y que él ha sido marcado para guiar y preservar el equilibrio en esa vasta travesía.\n>\n\nRitual druídico: Eleanor siente a Celestian y recibe un disco de plata que lo marca como guardián del equilibrio estelar.\n\nEl Disco de Plata contiene las memorias de Celestian, se puede utilitzar con Tharizdun.\n\n- Recuerdo 3 —\n\n> El tercer recuerdo llega a Eleanor como un destello breve, pero cargado de un peso imposible de ignorar. Se ve de pie sobre un sendero hecho de polvo de estrellas, suspendido en la nada. A lo lejos, flotando en el vacío, se alza una puerta de piedra ciclópea, tan antigua que parece haber sido esculpida antes de que existieran los mundos. No tiene marco ni cerradura, solo un arco tallado con runas que laten como constelaciones vivas. La atraviesa una brisa suave, que no es viento, sino un murmullo de voces conocidas: risas, plegarias, cantos en lenguas que no reconoce. Cada paso hacia la puerta se siente como si el suelo quisiera retenerlo, como si incluso el universo dudara de dejarlo pasar. Eleanor extiende la mano y toca la superficie de la piedra. Está fría como el vacío, pero en ese contacto se encienden los símbolos: estrellas que se alinean y forman un camino recto a través del umbral. Con el resplandor bañando su rostro, entiende que al cruzar dejará algo atrás para siempre. Da un paso adelante. El aire vibra con un zumbido profundo, y siente que una parte de sí se desgarra suavemente y queda del otro lado. No hay dolor físico, pero sí una punzada en el alma, como si hubiese abandonado un fragmento esencial de su ser. Cuando gira la vista hacia atrás, ya no hay puerta. Solo vacío estrellado y la sensación insoportable de haber perdido algo vital… aunque no sabe qué. El recuerdo se desvanece con un eco en su mente: la certeza de que no fue obligado a cruzar, sino que lo eligió. Y la pregunta constante de por qué.\n>\n\nEleanor recuerda cruzar voluntariamente una puerta ciclópea en el vacío; al hacerlo, siente que deja una parte esencial de sí al otro lado. La puerta desaparece y le queda una pérdida vital sin saber qué ni por qué lo eligió.\n\nEleanor decidío voluntariamente acceder al contrato de Asmodeus como infiltrado para acabar con Tharizdun, lo que no sabe es que no se juega con el diablo.\n\n- Pregunta 1 — Una vez en la que tu personaje estaba inmovilizado, no podía hacer nada al\nrespecto, un callejón sin salida (por ejemplo, estar en prisión), y tu dios poco a\npoco te estaba quitando sus poderes (final abierto).\n\nEstaba encerrado en una celda de piedra sin ventanas, donde ni las estrellas ni el viento podrían alcanzar a Eleanor. Al principio pensó que era otra prueba de resistencia, un viaje hacia adentro. Pero entonces sintió la voz de Celestian, en concreto como ese murmullo de las estrellas empezó a desvanecerse. Desde ese día las constelaciones se empezaron a sentir más distantes. Castigo o abandono? Tal vez Celestian mostraba lo que significa detenerse para siempre, la verdadera muerte. O tal vez estaba retirando su confianza porque había fallado en un acto que ni comprendía. Al final… Eleanor no sabe si realmente logró escapar de aquella celda o si sigue allí de alguna forma. Solo sabe que Celestian no le devolvió todo lo que había perdido.\n\n- Pregunta 2 — Si todo en la vida es viaje y aprendizaje, ¿qué valor tiene un destino, si al alcanzarlo ya no hay más camino que recorrer?\n\nLas flores crecen y se marchitan, las personas nacen y mueren, las estrellas nacen y se extinguen. Sin embargo, todas esas bendiciones siguen existiendo y renovándose. El destino no quita valor al viaje, solo renueva el ciclo. Viaje antes que destino.\n\n- Pregunta 3 — Si el viaje es para aprender, qué has aprendido luego de matar a un\nespíritu/guardián sagrado pero desconociendo el motivo?\n\nNada, pues el contexto de ese asesinato es un vacío en su mente. Desconoce por\ncompleto por qué motivo realizó ese acto, y es una de sus motivaciones descubrir el\nporqué.\n\n---\n\n## 🎯 Misión / Objetivos (máx. 1 página)\n\n- Objetivo principal:\n- Objetivos secundarios:\n- Motivación:\n- Condición de éxito:\n- Condición de fracaso:\n\n---\n\n## 🎒 Equipamiento\n\n### Equipo básico\n\n### Objetos especiales (raros / importantes)\n\n- Disco de Plata\n\n### Uncommon (si aplica)\n\n---\n\n# 🤝 ALIADOS\n\n## 👤 Aliado — [Nombre]\n\n- Afiliación:\n- Personalidad (puntos + / -):\n    - +\n- Ideales / Moral:\n- Debilidades / Miedos / Inseguridades:\n- Apariencia:\n- Habilidades notables:\n- Historia (resumida):\n- Motivaciones / Objetivos / Misiones:\n\n> Duplica este bloque por cada aliado.\n>\n\n---\n\n# ⚔️ ENEMIGOS\n\n## ☠️ Enemigo — [Nombre]\n\n- Afiliación:\n- Personalidad (puntos + / -):\n    - +\n- Ideales / Moral:\n- Debilidades / Miedos / Inseguridades:\n- Apariencia:\n- Habilidades notables:\n- Historia (resumida):\n- Motivaciones / Objetivos / Misiones:\n\n> Duplica este bloque por cada enemigo.\n>\n\n---\n\n# 🏛️ Facciones\n\n## 🛡️ Facción — Religión Celestian\n\n/image%201.png)\n\n> Mantra: \"Aprendizaje, libertad, prueba”\n>\n\nEl viaje como aprendizaje\n\n- Los libros enseñan conceptos, pero el camino enseña experiencia.\n- El viajero descubre culturas, lenguas, paisajes, dioses y maravillas imposibles de imaginar en su hogar.\n- Cada persona que conoces y cada frontera que cruzamos es una lección.\n\nEl viaje como libertad\n\n- Viajar rompe las cadenas de la costumbre y del miedo.\n- El viaje enseña que el mundo es demasiado vasto para encerrarse en una aldea, en un plano o incluso en un único modo de pensar.\n- Quedarse siempre en el mismo sitio es adorarse a uno mismo.\n\nEl viaje como espiritualidad\n\n- En el camino, bajo el cielo abierto, el alma se siente parte de algo mayor.\n- El horizonte recuerda al fiel que siempre hay algo más por aprender, más por descubrir, más por vivir.\n- Morir no es el fin: es emprender el viaje final hacia las estrellas, y convertirse en guía para los que aún caminan.\n\nEl viaje como prueba\n\n- Caminar significa enfrentar riesgos, y cada riesgo fortalece el espíritu.\n- El hambre, la fatiga, la incertidumbre, todo forma parte de la iniciación sagrada del\nviajero.\n- El que regresa de un viaje no es la misma persona que partió: ha renacido con cada\npaso.\n\nRituales\n\n- El Juramento del Horizonte: cada clérigo o viajero promete no establecerse jamás en un único lugar, sino mantener vivo el espíritu de exploración.\n- Cartografía ritual: trazar mapas de estrellas, planos o rutas es una forma de rezo. Un mapa nunca es sólo práctico, es sagrado.\n- La Peregrinación sin Fin: cada fiel debe realizar un gran viaje (terrestre, marítimo, planar o estelar) que simbolice su entrega al Viajero Lejano.\n- Ritos fúnebres: los cuerpos de los fieles son cremados y las cenizas lanzadas al viento o al espacio, “para que viajen eternamente”.\n\nResumen\n\n- Para un fiel de Celestian, la rutina es la verdadera muerte.\n- El viaje es la metáfora perfecta de la vida: cada día se camina hacia lo desconocido.\n- No prometen riquezas, ni poder, ni seguridad; prometen sentido en el movimiento.\n- Creen que cada ser, al morir, se convierte en estrella: los cielos nocturnos son el rostro eterno de todos los que alguna vez caminaron.\n\n---"}'::jsonb)
on conflict (id) do update set
  type = excluded.type,
  title = excluded.title,
  subtitle = excluded.subtitle,
  image_url = excluded.image_url,
  parent_id = excluded.parent_id,
  summary = excluded.summary,
  description = excluded.description,
  details = excluded.details,
  updated_at = now();

insert into public.lore_entries (id, type, title, subtitle, image_url, parent_id, summary, description, details)
values ('27c8e352-8848-c6a7-dba9-af34a7750135'::uuid, 'character', 'Isaac (Thorak Ottarson)', 'Importado de Notion', '', null, '/image.png) 📌 Resumen (1–3 palabras) Clase: Barbarian Raza: Humano Género: Hombre Tamaño: Mediano Altura: 192 cm Peso: 110 kg Piel (incluye color): Blanca Background (DnD 5e): Farmer Alignment: Lawful Neutral Ojos: Azules Cabellos: Ruibios Edad: 27 años 🧠 Características Personalidad (puntos + / ) +: Religioso, fervoroso, habilidoso, sabio : Violento, impaciente, irascible, obsesivo Ideales / Moral Vínculos Debilidades / Miedos / Inseguridades 📚 Lore (páginas que hagan falta) Crea subpáginas aquí para...', '/image.png)
📌 Resumen (1–3 palabras)
- Clase: Barbarian
- Raza: Humano
- Género: Hombre
- Tamaño: Mediano
- Altura: 192 cm
- Peso: 110 kg
- Piel (incluye color): Blanca
- Background (DnD 5e): Farmer
- Alignment: Lawful Neutral
- Ojos: Azules
- Cabellos: Ruibios
- Edad: 27 años
🧠 Características
Personalidad (puntos + / -)
- +: Religioso, fervoroso, habilidoso, sabio
- -: Violento, impaciente, irascible, obsesivo
Ideales / Moral
Vínculos
Debilidades / Miedos / Inseguridades
📚 Lore (páginas que hagan falta)
> Crea subpáginas aquí para capítulos, arcos, flashbacks, etc.
>
- Capítulo 1 —
- Capítulo 2 —
- Eventos clave —
- Secretos / Revelaciones —
🎯 Misión / Objetivos (máx. 1 página)
- Objetivo principal:
- Objetivos secundarios:
- Motivación:
- Condición de éxito:
- Condición de fracaso:
🎒 Equipamiento
Equipo básico
Objetos especiales (raros / importantes)
Uncommon (si aplica)
🤝 ALIADOS
👤 Aliado — [Nombre]
- Afiliación:
- Personalidad (puntos + / -):
- +
- Ideales / Moral:
- Debilidades / Miedos / Inseguridades:
- Apariencia:
- Habilidades notables:
- Historia (resumida):
- Motivaciones / Objetivos / Misiones:
> Duplica este bloque por cada aliado.
>
⚔️ ENEMIGOS
☠️ Enemigo — [Nombre]
- Afiliación:
- Personalidad (puntos + / -):
- +
- Ideales / Moral:
- Debilidades / Miedos / Inseguridades:
- Apariencia:
- Habilidades notables:
- Historia (resumida):
- Motivaciones / Objetivos / Misiones:
> Duplica este bloque por cada enemigo.
>
🏛️ Facciones
🛡️ Facción — [Nombre]
- Actividades:
- Estrategias:
- Base de operaciones:
- Posesiones:
- Simbología:
- Creencias:
- Actitud:
- Miembros:
> Duplica este bloque por cada facción.
>
🏛️ Pactos
- Fighting style (+1 de AC) // No puedes usarlo para atacar
- ⁠ ⁠Fighting styles para las hachas (desenvainar hacha gratis & +2 al daño) // Las hachas me vuelven como ataque
- ⁠ ⁠Feat Healer // No te puedes curar a ti mismo (no puedo tomar pociones ni usar el healers kit en mi mismo)
- ⁠ ⁠Feat Chef // No puedes comer (Puedo estar 5 dias sin comer, luego 1 de exhaustion por cada dia adicional. Si puedo tomar comida triturada-liquida)', '{"source_path":"export-b\\D&D Inferno\\Personajes\\Isaac (Thorak Ottarson) 2d11744335cf804cbca6dca18db8db4d.md","image_refs":["Isaac (Thorak Ottarson"],"imported_from":"Notion export","dm_source_markdown":"/image.png)\n\n## 📌 Resumen (1–3 palabras)\n\n- Clase: Barbarian\n- Raza: Humano\n- Género: Hombre\n- Tamaño: Mediano\n- Altura: 192 cm\n- Peso: 110 kg\n- Piel (incluye color): Blanca\n- Background (DnD 5e): Farmer\n- Alignment: Lawful Neutral\n- Ojos: Azules\n- Cabellos: Ruibios\n- Edad: 27 años\n\n---\n\n## 🧠 Características\n\n### Personalidad (puntos + / -)\n\n- +: Religioso, fervoroso, habilidoso, sabio\n- -: Violento, impaciente, irascible, obsesivo\n\n### Ideales / Moral\n\n### Vínculos\n\n### Debilidades / Miedos / Inseguridades\n\n---\n\n## 📚 Lore (páginas que hagan falta)\n\n> Crea subpáginas aquí para capítulos, arcos, flashbacks, etc.\n>\n- Capítulo 1 —\n- Capítulo 2 —\n- Eventos clave —\n- Secretos / Revelaciones —\n\n---\n\n## 🎯 Misión / Objetivos (máx. 1 página)\n\n- Objetivo principal:\n- Objetivos secundarios:\n- Motivación:\n- Condición de éxito:\n- Condición de fracaso:\n\n---\n\n## 🎒 Equipamiento\n\n### Equipo básico\n\n### Objetos especiales (raros / importantes)\n\n### Uncommon (si aplica)\n\n---\n\n# 🤝 ALIADOS\n\n## 👤 Aliado — [Nombre]\n\n- Afiliación:\n- Personalidad (puntos + / -):\n    - +\n- Ideales / Moral:\n- Debilidades / Miedos / Inseguridades:\n- Apariencia:\n- Habilidades notables:\n- Historia (resumida):\n- Motivaciones / Objetivos / Misiones:\n\n> Duplica este bloque por cada aliado.\n>\n\n---\n\n# ⚔️ ENEMIGOS\n\n## ☠️ Enemigo — [Nombre]\n\n- Afiliación:\n- Personalidad (puntos + / -):\n    - +\n- Ideales / Moral:\n- Debilidades / Miedos / Inseguridades:\n- Apariencia:\n- Habilidades notables:\n- Historia (resumida):\n- Motivaciones / Objetivos / Misiones:\n\n> Duplica este bloque por cada enemigo.\n>\n\n---\n\n# 🏛️ Facciones\n\n## 🛡️ Facción — [Nombre]\n\n- Actividades:\n- Estrategias:\n- Base de operaciones:\n- Posesiones:\n- Simbología:\n- Creencias:\n- Actitud:\n- Miembros:\n\n> Duplica este bloque por cada facción.\n>\n\n---\n\n# 🏛️ Pactos\n\n- Fighting style (+1 de AC) // No puedes usarlo para atacar\n- ⁠ ⁠Fighting styles para las hachas (desenvainar hacha gratis & +2 al daño) // Las hachas me vuelven como ataque\n- ⁠ ⁠Feat Healer // No te puedes curar a ti mismo (no puedo tomar pociones ni usar el healers kit en mi mismo)\n- ⁠ ⁠Feat Chef // No puedes comer (Puedo estar 5 dias sin comer, luego 1 de exhaustion por cada dia adicional. Si puedo tomar comida triturada-liquida)"}'::jsonb)
on conflict (id) do update set
  type = excluded.type,
  title = excluded.title,
  subtitle = excluded.subtitle,
  image_url = excluded.image_url,
  parent_id = excluded.parent_id,
  summary = excluded.summary,
  description = excluded.description,
  details = excluded.details,
  updated_at = now();

insert into public.lore_entries (id, type, title, subtitle, image_url, parent_id, summary, description, details)
values ('e5cf1b58-034f-dd3a-d983-028d78a00386'::uuid, 'character', 'Lazcano (Tashi)', 'Importado de Notion', '', null, '/image.png) /image%201.png) 📌 Resumen (1–3 palabras) Clase: Raza: Género: Tamaño: Altura: Peso: Piel (incluye color): Background (DnD 5e): Alignment: Ojos: Cabellos: Edad: 🧠 Características Personalidad (puntos + / ) + Ideales / Moral Vínculos Debilidades / Miedos / Inseguridades 📚 Lore (páginas que hagan falta) Crea subpáginas aquí para capítulos, arcos, flashbacks, etc. Capítulo 1 — Capítulo 2 — Eventos clave — Secretos / Revelaciones — 🎯 Misión / Objetivos (máx. 1 página) Objetivo principal: Objetivos...', '/image.png)
/image%201.png)
📌 Resumen (1–3 palabras)
- Clase:
- Raza:
- Género:
- Tamaño:
- Altura:
- Peso:
- Piel (incluye color):
- Background (DnD 5e):
- Alignment:
- Ojos:
- Cabellos:
- Edad:
🧠 Características
Personalidad (puntos + / -)
- +
Ideales / Moral
Vínculos
Debilidades / Miedos / Inseguridades
📚 Lore (páginas que hagan falta)
> Crea subpáginas aquí para capítulos, arcos, flashbacks, etc.
>
- Capítulo 1 —
- Capítulo 2 —
- Eventos clave —
- Secretos / Revelaciones —
🎯 Misión / Objetivos (máx. 1 página)
- Objetivo principal:
- Objetivos secundarios:
- Motivación:
- Condición de éxito:
- Condición de fracaso:
🎒 Equipamiento
Equipo básico
Objetos especiales (raros / importantes)
Uncommon (si aplica)
🤝 ALIADOS
👤 Aliado — [Nombre]
- Afiliación:
- Personalidad (puntos + / -):
- +
- Ideales / Moral:
- Debilidades / Miedos / Inseguridades:
- Apariencia:
- Habilidades notables:
- Historia (resumida):
- Motivaciones / Objetivos / Misiones:
> Duplica este bloque por cada aliado.
>
⚔️ ENEMIGOS
☠️ Enemigo — [Nombre]
- Afiliación:
- Personalidad (puntos + / -):
- +
- Ideales / Moral:
- Debilidades / Miedos / Inseguridades:
- Apariencia:
- Habilidades notables:
- Historia (resumida):
- Motivaciones / Objetivos / Misiones:
> Duplica este bloque por cada enemigo.
>
🏛️ Facciones
🛡️ Facción — [Nombre]
- Actividades:
- Estrategias:
- Base de operaciones:
- Posesiones:
- Simbología:
- Creencias:
- Actitud:
- Miembros:
> Duplica este bloque por cada facción.
>', '{"source_path":"export-b\\D&D Inferno\\Personajes\\Lazcano (Tashi) 2d11744335cf809a8456d3d4d79da56c.md","image_refs":["Lazcano (Tashi","Lazcano (Tashi"],"imported_from":"Notion export","dm_source_markdown":"/image.png)\n\n/image%201.png)\n\n## 📌 Resumen (1–3 palabras)\n\n- Clase:\n- Raza:\n- Género:\n- Tamaño:\n- Altura:\n- Peso:\n- Piel (incluye color):\n- Background (DnD 5e):\n- Alignment:\n- Ojos:\n- Cabellos:\n- Edad:\n\n---\n\n## 🧠 Características\n\n### Personalidad (puntos + / -)\n\n- +\n\n### Ideales / Moral\n\n### Vínculos\n\n### Debilidades / Miedos / Inseguridades\n\n---\n\n## 📚 Lore (páginas que hagan falta)\n\n> Crea subpáginas aquí para capítulos, arcos, flashbacks, etc.\n>\n- Capítulo 1 —\n- Capítulo 2 —\n- Eventos clave —\n- Secretos / Revelaciones —\n\n---\n\n## 🎯 Misión / Objetivos (máx. 1 página)\n\n- Objetivo principal:\n- Objetivos secundarios:\n- Motivación:\n- Condición de éxito:\n- Condición de fracaso:\n\n---\n\n## 🎒 Equipamiento\n\n### Equipo básico\n\n### Objetos especiales (raros / importantes)\n\n### Uncommon (si aplica)\n\n---\n\n# 🤝 ALIADOS\n\n## 👤 Aliado — [Nombre]\n\n- Afiliación:\n- Personalidad (puntos + / -):\n    - +\n- Ideales / Moral:\n- Debilidades / Miedos / Inseguridades:\n- Apariencia:\n- Habilidades notables:\n- Historia (resumida):\n- Motivaciones / Objetivos / Misiones:\n\n> Duplica este bloque por cada aliado.\n>\n\n---\n\n# ⚔️ ENEMIGOS\n\n## ☠️ Enemigo — [Nombre]\n\n- Afiliación:\n- Personalidad (puntos + / -):\n    - +\n- Ideales / Moral:\n- Debilidades / Miedos / Inseguridades:\n- Apariencia:\n- Habilidades notables:\n- Historia (resumida):\n- Motivaciones / Objetivos / Misiones:\n\n> Duplica este bloque por cada enemigo.\n>\n\n---\n\n# 🏛️ Facciones\n\n## 🛡️ Facción — [Nombre]\n\n- Actividades:\n- Estrategias:\n- Base de operaciones:\n- Posesiones:\n- Simbología:\n- Creencias:\n- Actitud:\n- Miembros:\n\n> Duplica este bloque por cada facción.\n>"}'::jsonb)
on conflict (id) do update set
  type = excluded.type,
  title = excluded.title,
  subtitle = excluded.subtitle,
  image_url = excluded.image_url,
  parent_id = excluded.parent_id,
  summary = excluded.summary,
  description = excluded.description,
  details = excluded.details,
  updated_at = now();

insert into public.lore_entries (id, type, title, subtitle, image_url, parent_id, summary, description, details)
values ('b113f19e-b3c5-6f02-c9fc-a5d74bf6ea18'::uuid, 'religion', 'Demogorgon', 'Importado de Notion', '', null, 'La religión de Demogorgon: El Culto de las Dos Negaciones Nombre común entre enemigos: Los Incoherentes / La Boca Doble Dogma central: no existe una coherencia universal. Toda ley es un truco. Toda civilización es una jaula que debe romperse. Mito fundador Demogorgon no es solo “Príncipe de los Demonios”: es el hecho vivo de que la realidad no se sostiene sobre una sola verdad. Sus dos cabezas son doctrina encarnada: Una cabeza afirma algo con absoluta certeza. La otra lo niega con la misma certeza. Y ambas tienen...', 'La religión de Demogorgon: El Culto de las Dos Negaciones
Nombre común entre enemigos: Los Incoherentes / La Boca Doble
Dogma central: no existe una coherencia universal. Toda ley es un truco. Toda civilización es una jaula que debe romperse.
Mito fundador
Demogorgon no es solo “Príncipe de los Demonios”: es el hecho vivo de que la realidad no se sostiene sobre una sola verdad. Sus dos cabezas son doctrina encarnada:
- Una cabeza afirma algo con absoluta certeza.
- La otra lo niega con la misma certeza.
Y ambas tienen razón, porque la razón es un arma del orden. La bipolaridad de Demogorgon no es un “defecto”: es la prueba sagrada de que la realidad es inestable, contradictoria y subjetiva.
Los 7 Dogmas (para predicar en mesa)
1. No hay coherencia: solo relatos que se imponen.
Si algo “explica” el mundo demasiado bien, es propaganda.
2. Ninguna ley es absoluta porque ninguna situación se repite.
Las reglas generalizan; generalizar es mentir.
3. La contradicción no es un error: es libertad.
Cambiar de opinión no es debilidad, es romper cadenas.
4. La verdad es una herramienta social, no un hecho.
“Verdadero” significa “útil para alguien”.
5. La moral es un uniforme: te lo ponen para saber dónde apuñalarte.
Quien te pide coherencia, quiere predecirte.
6. La civilización es el pacto de fingir que el mundo tiene sentido.
Por eso crea cárceles, censos, templos, ejércitos: para sostener la ficción.
7. Toda civilización debe perecer para que el mundo vuelva a ser real.
“Real” = indomable, cambiante, incomprensible. Como el Abismo.
Cómo suena su predicación (frases cortas)
- “Si te entienden, ya te poseen.”
- “Hoy prometo. Mañana rompo. Eso me hace libre.”
- “Una ley para todos...', '{"source_path":"export-b\\D&D Inferno\\Religiones\\Demogorgon 2de1744335cf80abb5fec87ddd4e5bbb.md","image_refs":[],"imported_from":"Notion export","dm_source_markdown":"## La religión de Demogorgon: El Culto de las Dos Negaciones\n\nNombre común entre enemigos: Los Incoherentes / La Boca Doble\n\nDogma central: no existe una coherencia universal. Toda ley es un truco. Toda civilización es una jaula que debe romperse.\n\n### Mito fundador\n\nDemogorgon no es solo “Príncipe de los Demonios”: es el hecho vivo de que la realidad no se sostiene sobre una sola verdad. Sus dos cabezas son doctrina encarnada:\n\n- Una cabeza afirma algo con absoluta certeza.\n- La otra lo niega con la misma certeza.\n\nY ambas tienen razón, porque la razón es un arma del orden. La bipolaridad de Demogorgon no es un “defecto”: es la prueba sagrada de que la realidad es inestable, contradictoria y subjetiva.\n\n---\n\n## Los 7 Dogmas (para predicar en mesa)\n\n1. No hay coherencia: solo relatos que se imponen.\n\n    Si algo “explica” el mundo demasiado bien, es propaganda.\n\n2. Ninguna ley es absoluta porque ninguna situación se repite.\n\n    Las reglas generalizan; generalizar es mentir.\n\n3. La contradicción no es un error: es libertad.\n\n    Cambiar de opinión no es debilidad, es romper cadenas.\n\n4. La verdad es una herramienta social, no un hecho.\n\n    “Verdadero” significa “útil para alguien”.\n\n5. La moral es un uniforme: te lo ponen para saber dónde apuñalarte.\n\n    Quien te pide coherencia, quiere predecirte.\n\n6. La civilización es el pacto de fingir que el mundo tiene sentido.\n\n    Por eso crea cárceles, censos, templos, ejércitos: para sostener la ficción.\n\n7. Toda civilización debe perecer para que el mundo vuelva a ser real.\n\n    “Real” = indomable, cambiante, incomprensible. Como el Abismo.\n\n---\n\n## Cómo suena su predicación (frases cortas)\n\n- “Si te entienden, ya te poseen.”\n- “Hoy prometo. Mañana rompo. Eso me hace libre.”\n- “Una ley para todos es violencia lenta.”\n- “El orden no evita el mal: lo administra.”\n- “La ciudad no es refugio: es una mentira con murallas.”\n- “Dos bocas, dos verdades. El que exige una sola… teme.”\n\n---\n\n## Rituales y prácticas (muy Demogorgon)\n\n### 1) La Liturgia del Doble Juramento\n\nEl fiel debe jurar dos cosas incompatibles delante del altar (dos máscaras o dos ídolos).\n\nEjemplo: “Protegeré a mi hermano” / “Si me conviene, lo entregaré”.\n\nEl objetivo no es hipocresía; es entrenar la mente para no quedar atrapada en un solo marco.\n\n### 2) El Ayuno de Sentido\n\nUn día sin nombres: no se permiten títulos, cargos, rangos, ni “roles”.\n\nNadie es “capitán”, “padre”, “juez”. Eso desarma la estructura social.\n\n### 3) Las Fiestas del Colapso\n\nSe elige un símbolo de orden (archivo, reloj, estatua, código legal) y se destruye públicamente.\n\nNo por vandalismo: es un sacramento. “Si permanece, nos domestica.”\n\n### 4) El Oráculo Incoherente\n\nEl sacerdote responde siempre con dos mensajes opuestos.\n\nEl creyente “elige” cuál seguir… y luego se le exige justificar ambos. Así el culto convierte la duda en lealtad: solo los fieles “entienden” la contradicción.\n\n---\n\n## Organización del culto (útil para PNJ)\n\n- Bocas (líderes): siempre van en pareja o con doble máscara. Uno predica “certeza”, el otro “negación”.\n- Los Desmentidores (saboteadores): se infiltran en instituciones para introducir excepciones, lagunas, precedentes contradictorios.\n- Los Rompe-Calendarios (agitadores): atacan rutinas: cosechas, festividades, turnos de guardia. El orden muere primero por la logística.\n- Los Testigos del Abismo (fanáticos): buscan el colapso total aunque mueran con él. Son los más peligrosos.\n\n---\n\n## Símbolos\n\n- Dos bocas enfrentadas que muerden un mismo círculo (la “unidad” devorada).\n- Un texto sagrado escrito en dos columnas: una afirma, otra niega.\n- Cuchillos gemelos: uno “corta leyes”, el otro “corta vínculos”.\n\n---\n\n## Cómo justifican “toda civilización debe perecer”\n\nNo lo venden como “matar por matar”. Lo venden como liberación filosófica:\n\n- La civilización convierte la subjetividad en delito (“esto es normal, esto no”).\n- Establece leyes universales que no encajan en casos particulares → injusticia estructural.\n- Para sostener el relato necesita castigo, policía, burocracia, propaganda.\n- Conclusión del culto: la civilización no es orden; es violencia sostenida.\n\n    Y la única respuesta honesta es derrumbarla para devolver al mundo su naturaleza: la incertidumbre.\n\n---\n\n## Contradicción interna (que lo hace jugable)\n\nEl culto odia la coherencia… pero necesita estructura para existir.\n\nEso crea tensiones perfectas para aventura:\n\n- facciones internas que se acusan de “volverse demasiado organizadas”\n- líderes que se contradicen a propósito para mantener poder\n- rituales que se vuelven reglas… y entonces deben romperse\n\n---\n\n## 6 ganchos de campaña\n\n1. El Código que se Autodesmiente: el culto introduce reformas legales contradictorias hasta que la ciudad colapsa en juicios imposibles.\n2. El Día sin Nombres: una noche, nadie recuerda rangos ni alianzas; la guardia se descompone; el culto actúa.\n3. El Tribunal Gemelo: dos jueces dictan sentencias opuestas “en nombre de la justicia”. Ambos son Bocas infiltradas.\n4. El Embarcadero del Estigia: quieren “liberar” identidades: empujar a la gente al río para borrar nombres y vínculos.\n5. La Catedral de Archivo: planean quemar el archivo civil y los registros de propiedad: “sin papeles, no hay ley”.\n6. La Ciudad Modelo: un enclave perfecto y ordenado; el culto lo elige como sacrificio ejemplar: “si cae esto, cae todo”."}'::jsonb)
on conflict (id) do update set
  type = excluded.type,
  title = excluded.title,
  subtitle = excluded.subtitle,
  image_url = excluded.image_url,
  parent_id = excluded.parent_id,
  summary = excluded.summary,
  description = excluded.description,
  details = excluded.details,
  updated_at = now();

insert into public.lore_entries (id, type, title, subtitle, image_url, parent_id, summary, description, details)
values ('1af8b8d3-e920-411e-6378-943fb5950ad3'::uuid, 'zone', 'Zona media', 'Importado de Notion', '', '776488dc-82b3-8620-d3e8-702603e54391'::uuid, 'https://randomtablesrpg.com/fantasy/100 random dnd city encounter tables for low level players who need help/', 'https://randomtablesrpg.com/fantasy/100-random-dnd-city-encounter-tables-for-low-level-players-who-need-help/', '{"source_path":"export-b\\D&D Inferno\\Zonas\\1st Layer Averno\\Ciudad de Bronce\\Zona media 2ef1744335cf80d6bfa1dfadd9d63ce6.md","image_refs":[],"imported_from":"Notion export","dm_source_markdown":"https://randomtablesrpg.com/fantasy/100-random-dnd-city-encounter-tables-for-low-level-players-who-need-help/"}'::jsonb)
on conflict (id) do update set
  type = excluded.type,
  title = excluded.title,
  subtitle = excluded.subtitle,
  image_url = excluded.image_url,
  parent_id = excluded.parent_id,
  summary = excluded.summary,
  description = excluded.description,
  details = excluded.details,
  updated_at = now();

insert into public.lore_entries (id, type, title, subtitle, image_url, parent_id, summary, description, details)
values ('ffffee00-ef2b-257c-77df-89e8422faa8c'::uuid, 'zone', 'Templo de Tiamat', 'Importado de Notion', '', '776488dc-82b3-8620-d3e8-702603e54391'::uuid, 'El templo se alza como un santuario olvidado por el tiempo, oculto bajo capas de polvo seco y silencio reverente. Su arquitectura, inspirada en antiguos complejos del subcontinente indio, combina columnas talladas con relieves geométricos y figuras divinas erosionadas, cuyos detalles apenas sobreviven al paso de los siglos. Las paredes, de piedra cálida y agrietada, están cubiertas por restos de pigmentos rojizos y rosados que parecen haber sido aplicados con un propósito ritual más que decorativo. En el centro de...', 'El templo se alza como un santuario olvidado por el tiempo, oculto bajo capas de polvo seco y silencio reverente. Su arquitectura, inspirada en antiguos complejos del subcontinente indio, combina columnas talladas con relieves geométricos y figuras divinas erosionadas, cuyos detalles apenas sobreviven al paso de los siglos. Las paredes, de piedra cálida y agrietada, están cubiertas por restos de pigmentos rojizos y rosados que parecen haber sido aplicados con un propósito ritual más que decorativo.
En el centro de la estancia se erige la figura dominante: una colosal escultura de piedra representando a un dragón de cinco cabezas. Cada una de ellas adopta una expresión distinta —ira, sabiduría, vigilancia, desprecio y calma— como si encarnaran aspectos de una misma deidad o entidad primigenia. De las cuencas vacías de sus ojos emana una luz intensa y sobrenatural, dorada con matices rojizos, que no ilumina de forma uniforme, sino que palpita suavemente, como si estuviera viva.
Las cabezas están surcadas por grabados rúnicos que recorren sus cuellos y se extienden por el torso de la estatua. Estas runas, de tonos rojizos y rosados, brillan con una energía latente, como si respondieran a una magia antigua aún activa. En la frente de cada cabeza, una runa en forma de diamante destaca sobre el resto: más brillante, más definida, casi perfecta. Estas marcas parecen ser el foco de la energía que recorre toda la escultura.
El aire del templo es seco, denso y cargado de una quietud incómoda. El polvo se acumula en cada superficie, y el calor, aunque no extremo, resulta constante, como si el lugar estuviera aislado del mundo exterior. Antiguos braseros aún arden débilmente,...', '{"source_path":"export-b\\D&D Inferno\\Zonas\\1st Layer Averno\\Ciudad de Bronce\\Zona Pobre\\Templo de Tiamat 33e1744335cf80a39938e549b0dce0ca.md","image_refs":["Templo de Tiamat/image.png","Templo de Tiamat/ChatGPT_Image_10_abr_2026_20_39_03.png"],"imported_from":"Notion export","dm_source_markdown":"El templo se alza como un santuario olvidado por el tiempo, oculto bajo capas de polvo seco y silencio reverente. Su arquitectura, inspirada en antiguos complejos del subcontinente indio, combina columnas talladas con relieves geométricos y figuras divinas erosionadas, cuyos detalles apenas sobreviven al paso de los siglos. Las paredes, de piedra cálida y agrietada, están cubiertas por restos de pigmentos rojizos y rosados que parecen haber sido aplicados con un propósito ritual más que decorativo.\n\nEn el centro de la estancia se erige la figura dominante: una colosal escultura de piedra representando a un dragón de cinco cabezas. Cada una de ellas adopta una expresión distinta —ira, sabiduría, vigilancia, desprecio y calma— como si encarnaran aspectos de una misma deidad o entidad primigenia. De las cuencas vacías de sus ojos emana una luz intensa y sobrenatural, dorada con matices rojizos, que no ilumina de forma uniforme, sino que palpita suavemente, como si estuviera viva.\n\nLas cabezas están surcadas por grabados rúnicos que recorren sus cuellos y se extienden por el torso de la estatua. Estas runas, de tonos rojizos y rosados, brillan con una energía latente, como si respondieran a una magia antigua aún activa. En la frente de cada cabeza, una runa en forma de diamante destaca sobre el resto: más brillante, más definida, casi perfecta. Estas marcas parecen ser el foco de la energía que recorre toda la escultura.\n\nEl aire del templo es seco, denso y cargado de una quietud incómoda. El polvo se acumula en cada superficie, y el calor, aunque no extremo, resulta constante, como si el lugar estuviera aislado del mundo exterior. Antiguos braseros aún arden débilmente, alimentados no por combustible visible, sino por algún tipo de energía arcana persistente.\n\nEl suelo está cubierto de fragmentos de piedra, ofrendas olvidadas y recipientes de cerámica agrietados. Todo sugiere que este lugar fue, en su día, un punto de culto activo, probablemente dedicado a una entidad dracónica de gran poder, quizás vinculada a los elementos o a fuerzas primordiales.\n\nNo es un templo abandonado sin más. Es un lugar que aún espera. Un lugar donde algo sigue observando."}'::jsonb)
on conflict (id) do update set
  type = excluded.type,
  title = excluded.title,
  subtitle = excluded.subtitle,
  image_url = excluded.image_url,
  parent_id = excluded.parent_id,
  summary = excluded.summary,
  description = excluded.description,
  details = excluded.details,
  updated_at = now();

insert into public.lore_entries (id, type, title, subtitle, image_url, parent_id, summary, description, details)
values ('852ebe74-1865-e8e7-25fb-7b05bf42d162'::uuid, 'zone', 'Amfiteatro', 'Importado de Notion', '', '77bee61b-cf89-7745-161e-2fdf5a01bafa'::uuid, 'Discurso Bel: Una bestia que aspira a ser rey… debe dejar de alimentarse como presa. No es la ambición lo que os transformará… es el rechazo. Rechazo a lo débil. Rechazo a lo fácil. Rechazo a aquello que os mantuvo con vida… pero nunca os hizo grandes. Muchos de vosotros aún os aferráis a migajas… a viejos hábitos… a la comodidad de sobrevivir. Pero aquí… sobrevivir no es suficiente. ⚔️ Lo que consumís… define lo que sois. ⚔️ Lo que repetís… determina vuestra forma. No podéis reclamar grandeza… mientras seguís...', 'Discurso Bel:
Una bestia que aspira a ser rey…
debe dejar de alimentarse como presa.
No es la ambición lo que os transformará…
es el rechazo.
Rechazo a lo débil.
Rechazo a lo fácil.
Rechazo a aquello que os mantuvo con vida… pero nunca os hizo grandes.
Muchos de vosotros aún os aferráis a migajas…
a viejos hábitos…
a la comodidad de sobrevivir.
Pero aquí… sobrevivir no es suficiente.
⚔️ Lo que consumís… define lo que sois.
⚔️ Lo que repetís… determina vuestra forma.
No podéis reclamar grandeza…
mientras seguís comportándoos como presas.
La arena os despojará.
De vuestras armas.
De vuestra seguridad.
De todo aquello que os daba consuelo.
Y cuando llegue el vacío…
cuando el silencio os rodee…
cuando ya no quede nada…
Muchos caerán.
Creerán que han perdido algo.
Pero no.
Ese vacío…
es el primer territorio del poder.
Los depredadores no nacen del exceso.
Nacen del hambre.
Del control.
De la voluntad de dejar morir lo que eran…
para convertirse en algo peor.
🔥 Hoy no lucháis por vivir.
🔥 Lucháis por dejar de ser débiles.
Y solo aquellos capaces de matar a su antiguo yo…
merecerán salir de esta arena.
Ahora…
luchad.
7 Bandits
⚔️ MECÁNICAS BASE DEL COLISEO
🧱 1. Paredes de pinchos
Descripción:
Muros con pinchos que se desplazan lentamente hacia el centro.
Mecánica:
- Se activan en iniciativa 20 (lair action style)
- Avanzan 1 casilla por ronda
- Si una criatura está en la casilla:
👉 Tirada de DEX (CD 13)
- Éxito: se mueve a casilla adyacente
- Fallo:
- 2d10 daño perforante
- queda restrained hasta usar acción para liberarse (STR CD 12)
💀 Si queda atrapado entre dos paredes:
- 4d10 daño automático por ronda
🕳️ 2. Foso central
Descripción: agujero con estacas o vacío...', '{"source_path":"export-b\\D&D Inferno\\Zonas\\1st Layer Averno\\Ciudad de Bronce\\Zona Rica (Acropolis)\\Amfiteatro 2ef1744335cf800b9af1fe3861a5574b.md","image_refs":["Amfiteatro/image.png","Amfiteatro/ChatGPT_Image_21_ene_2026_17_50_59.png","Amfiteatro/ChatGPT_Image_21_ene_2026_17_44_30.png"],"imported_from":"Notion export","dm_source_markdown":"Discurso Bel:\n\nUna bestia que aspira a ser rey…\ndebe dejar de alimentarse como presa.\n\nNo es la ambición lo que os transformará…\nes el rechazo.\n\nRechazo a lo débil.\nRechazo a lo fácil.\nRechazo a aquello que os mantuvo con vida… pero nunca os hizo grandes.\n\nMuchos de vosotros aún os aferráis a migajas…\na viejos hábitos…\na la comodidad de sobrevivir.\n\nPero aquí… sobrevivir no es suficiente.\n\n⚔️ Lo que consumís… define lo que sois.\n⚔️ Lo que repetís… determina vuestra forma.\n\nNo podéis reclamar grandeza…\nmientras seguís comportándoos como presas.\n\nLa arena os despojará.\n\nDe vuestras armas.\nDe vuestra seguridad.\nDe todo aquello que os daba consuelo.\n\nY cuando llegue el vacío…\ncuando el silencio os rodee…\ncuando ya no quede nada…\n\nMuchos caerán.\n\nCreerán que han perdido algo.\n\nPero no.\n\nEse vacío…\nes el primer territorio del poder.\n\nLos depredadores no nacen del exceso.\n\nNacen del hambre.\nDel control.\nDe la voluntad de dejar morir lo que eran…\npara convertirse en algo peor.\n\n🔥 Hoy no lucháis por vivir.\n🔥 Lucháis por dejar de ser débiles.\n\nY solo aquellos capaces de matar a su antiguo yo…\nmerecerán salir de esta arena.\n\nAhora…\nluchad.\n\n7 Bandits\n\n---\n\n# ⚔️ MECÁNICAS BASE DEL COLISEO\n\n## 🧱 1. Paredes de pinchos\n\nDescripción:\n\nMuros con pinchos que se desplazan lentamente hacia el centro.\n\nMecánica:\n\n- Se activan en iniciativa 20 (lair action style)\n- Avanzan 1 casilla por ronda\n- Si una criatura está en la casilla:\n\n👉 Tirada de DEX (CD 13)\n\n- Éxito: se mueve a casilla adyacente\n- Fallo:\n    - 2d10 daño perforante\n    - queda restrained hasta usar acción para liberarse (STR CD 12)\n\n💀 Si queda atrapado entre dos paredes:\n\n- 4d10 daño automático por ronda\n\n---\n\n## 🕳️ 2. Foso central\n\nDescripción: agujero con estacas o vacío profundo.\n\nMecánica:\n\n- Caer dentro:\n    - 3d6 daño contundente por caída\n    - 2d10 perforante porpinchos)\n- Salir:\n    - Atletismo CD 12\n\n---\n\n# 🎒 STASHES (cajas de loot en arena)\n\n## 📦 Mecánica general\n\n- Hay 2–4 stashes en el mapa\n- Interactuar = acción\n- Cada stash solo puede abrirse una vez\n\n👉 Tirada: 1d12\n\n---\n\n## 🎲 Tabla de armas (nivel 1, pero divertidas)\n\n1. Espada corta\n2. Lanza\n3. Hacha de mano (x2)\n4. Maza\n5. Daga (x3)\n6. Arco corto + 10 flechas\n7. Ballesta ligera + 10 virotes\n8. Tridente\n9. Red + daga\n10. Garrote pesado (club)\n11. Escudo + daga\n12. Arma especial (elige o tira abajo)\n\n---\n\n## 🔥 Armas especiales (1d6)\n\n1. Espada sangrante → +1 daño si el objetivo está herido\n2. Lanza brutal → +2 daño en carga\n3. Hacha dentada → crítico con 19–20\n4. Maza pesada → puede empujar 1 casilla (STR save CD 12)\n5. Daga traicionera → ventaja si el objetivo está distraído\n6. Arma demoníaca inestable → +2 daño pero 1 en ataque = te haces 1d4\n\n---\n\n## 🩸 5. Bendición del público (votan players, decide DM)\n\nCada 2 rondas:\n\n👉 el público elige (o tiras 1d4):\n\n1. +1 a ataques\n2. +1 AC\n3. curas 1d8\n4. ventaja en siguiente tirada\n\n---\n\n# 🎭 EVENTOS ALEATORIOS (cada 1–2 rondas)\n\nTira 1d10:\n\n1. 🔥 Chorros de fuego desde el suelo\n2. 🪓 Caen armas al azar (nuevo stash)\n3. 🐺 Aparece una bestia (lobo / mastín)\n\n---\n\n# 🏆 CONDICIÓN DE VICTORIA (tu idea)\n\nPerfecta para caos:\n\n- Último superviviente\n- Excepto el personaje de Isaac, que debe quedar sí o sí\n\n👉 Esto genera:\n\n- traiciones\n- alianzas temporales\n- focus táctico brutal\n\n---\n\n# 💡 IDEAS EXTRA (muy top)\n\n## 🧪 Mutaciones temporales\n\n- Beber algo del suelo:\n    - +2 STR pero desventaja en INT\n    - o velocidad x2 durante 1 turno\n\n---\n\nIn a fight they use ranged attacks and try to keep in cover\n\nPossibly... during the fight someone betrays an ally\n\nDifficulty... 437.5 Deadly\n\ntiene que hacer performance\n\nluego contra otro berserker\n\nluchar contra sir ursas:\n\n🔥 ESCUCHAD… Y APRENDED DEL FRACASO 🔥\n\nUn barco no se hunde por el océano que lo rodea…\nse hunde por el agua que deja entrar.\n\nVosotros… no sois distintos.\n\nEl dolor… el caos… la presión…\ntodo eso es inevitable en la arena.\n\nPero no es eso lo que os destruirá.\n\nLo que os destruirá…\nes lo que permitáis entrar en vuestra mente.\n\n---\n\nRecordad el nombre de Sir Ursas.\n\nForjado en hierro infernal.\nElegido para crear la maquinaria infernal definitiva.\n\nEra poder.\nEra conocimiento.\nEra destino.\n\nY aun así… cayó.\n\nNo ante demonios.\nNo ante dioses.\n\nCayó ante… mortales.\n\n---\n\n¿Por qué?\n\nPorque dejó que la duda entrara.\nPorque permitió que el miedo se filtrara.\nPorque su mente… comenzó a hacer agua.\n\nY cuando eso ocurre…\nni el acero más fuerte puede salvaros.\n\n---\n\n🧠 La disciplina es vuestro sello.\n🧠 El enfoque es vuestra brújula.\n🧠 El control… es lo único que os mantiene a flote.\n\nLa mayoría no muere por la tormenta.\n\nMuere por la distracción.\nPor la debilidad.\nPor perder el control… un solo instante.\n\n---\n\nUn verdadero guerrero no es aquel que evita el caos…\n\nEs aquel que no se rompe dentro de él.\n\nQue no se filtra.\nQue no se quiebra.\nQue no deja entrar nada… que no pueda dominar.\n\n---\n\n🔥 No seáis como Ursas.\n🔥 No dejéis que vuestra mente os traicione.\n\nPorque en esta arena…\n\nNo moriréis por vuestros enemigos.\n\nMoriréis por lo que permitáis ser.\n\n---\n\nAhora…\ndemostrad que no os hundís.\n\ncouatl se aparecera en la celda de isaac, le avisara de como funciona la arena, le dira que no deberian de tomar el barco, eso les vinculara con los demonios, y son malos, antes de salir de la ciudad que vayan a una casa"}'::jsonb)
on conflict (id) do update set
  type = excluded.type,
  title = excluded.title,
  subtitle = excluded.subtitle,
  image_url = excluded.image_url,
  parent_id = excluded.parent_id,
  summary = excluded.summary,
  description = excluded.description,
  details = excluded.details,
  updated_at = now();

insert into public.lore_entries (id, type, title, subtitle, image_url, parent_id, summary, description, details)
values ('c970bfc5-584e-578e-cbbe-6da7c60e442f'::uuid, 'other', 'Contrato', 'Importado de Notion', '', '3908e4a8-86bf-60f7-5d17-946f2417f726'::uuid, 'Contrato Infernal de Asignación Anímica Total No. 0XX B AVERNO Archivo Infernal del Averno – Sección de Recursos Eternos Emitido por orden directa de Su Excelencia Infernal Bel Archiduque del Averno, Señor de la Guerra Infinita y Administrador Supremo del Dolor Funcional Registrado bajo sello de hierro candente, sangre coagulada y decreto marcial perpetuo. Preámbulo Sea este contrato firmado con sangre, esencia y conciencia por el individuo identificado a continuación, conforme a los estatutos de administración...', 'Contrato Infernal de Asignación Anímica Total No. 0XX-B-AVERNO
Archivo Infernal del Averno – Sección de Recursos Eternos
Emitido por orden directa de Su Excelencia Infernal Bel
Archiduque del Averno, Señor de la Guerra Infinita y Administrador Supremo del Dolor Funcional
Registrado bajo sello de hierro candente, sangre coagulada y decreto marcial perpetuo.
Preámbulo
Sea este contrato firmado con sangre, esencia y conciencia por el individuo identificado a continuación, conforme a los estatutos de administración bélica del Averno, y bajo la supervisión absoluta de Bel, Archiduque del Averno, General Eterno de las Legiones Infernales y custodio de los procesos de explotación anímica.
El presente acuerdo no constituye pacto de servicio ni juramento de obediencia, sino acto de cesión total del alma, destinada a su uso energético mediante procedimientos de tortura regulada.
Parte A – Identificación del Alma Esclava
Nombre previo del firmante: [Nombre del Alma]
Estado ontológico al firmar: [Vivo / Fallecido]
Clasificación asignada: Alma Esclava – Recurso Energético
Fecha de activación del contrato: [Sellado en tiempo avernal]
Desde el momento del sellado, el nombre del firmante pierde validez jurídica, conservándose únicamente como referencia archivística.
Parte B – Declaración de Cesión del Alma
El firmante declara y acepta de forma expresa:
1. La cesión absoluta, irreversible y eterna de su alma, esencia, memoria e identidad al Averno.
2. La pérdida total de derechos metafísicos, espirituales o postmortem.
3. Su reclasificación como recurso energético explotable.
4. La aplicación permanente de tortura como método técnico legítimo de extracción de energía anímica.
5. Que el...', '{"source_path":"export-b\\D&D Inferno\\Zonas\\1st Layer Averno\\Ciudad de Bronce\\Zona Rica (Acropolis)\\Carcel Mamertina\\Contrato 2f21744335cf800ca577ec715e9829d8.md","image_refs":["Contrato/ChatGPT_Image_24_ene_2026_21_40_12.png"],"imported_from":"Notion export","dm_source_markdown":"# Contrato Infernal de Asignación Anímica Total No. 0XX-B-AVERNO\n\nArchivo Infernal del Averno – Sección de Recursos Eternos\n\nEmitido por orden directa de Su Excelencia Infernal Bel\n\nArchiduque del Averno, Señor de la Guerra Infinita y Administrador Supremo del Dolor Funcional\n\nRegistrado bajo sello de hierro candente, sangre coagulada y decreto marcial perpetuo.\n\n---\n\n## Preámbulo\n\nSea este contrato firmado con sangre, esencia y conciencia por el individuo identificado a continuación, conforme a los estatutos de administración bélica del Averno, y bajo la supervisión absoluta de Bel, Archiduque del Averno, General Eterno de las Legiones Infernales y custodio de los procesos de explotación anímica.\n\nEl presente acuerdo no constituye pacto de servicio ni juramento de obediencia, sino acto de cesión total del alma, destinada a su uso energético mediante procedimientos de tortura regulada.\n\n---\n\n## Parte A – Identificación del Alma Esclava\n\nNombre previo del firmante: [Nombre del Alma]\n\nEstado ontológico al firmar: [Vivo / Fallecido]\n\nClasificación asignada: Alma Esclava – Recurso Energético\n\nFecha de activación del contrato: [Sellado en tiempo avernal]\n\nDesde el momento del sellado, el nombre del firmante pierde validez jurídica, conservándose únicamente como referencia archivística.\n\n---\n\n## Parte B – Declaración de Cesión del Alma\n\nEl firmante declara y acepta de forma expresa:\n\n1. La cesión absoluta, irreversible y eterna de su alma, esencia, memoria e identidad al Averno.\n2. La pérdida total de derechos metafísicos, espirituales o postmortem.\n3. Su reclasificación como recurso energético explotable.\n4. La aplicación permanente de tortura como método técnico legítimo de extracción de energía anímica.\n5. Que el sufrimiento experimentado no constituye castigo, sino procedimiento operativo.\n\nEl firmante reconoce que la continuidad de su conciencia tiene como única finalidad maximizar el rendimiento energético.\n\n---\n\n## Parte C – Condiciones de Vigilancia y Control\n\nCon el fin de garantizar la estabilidad energética, la trazabilidad del recurso y la correcta administración del dolor, el alma esclava se somete al siguiente régimen integral:\n\n### 1. Medallón de Identidad y Canalización (MIC)\n\na) El firmante llevará al cuello, de forma visible y permanente, un Medallón de Identidad y Control, forjado en plata negra encantada, y grabado con una inscripción única identificadora, asignada al momento del sellado del contrato.\n\nb) La inscripción única —compuesta por una combinación de glifos infernales, cifras contractuales y fragmentos del nombre verdadero del firmante— funcionará como firma mística e identificación universal dentro de los dominios de Cania.\n\nc) El medallón actúa como ancla para conjuros de observación (como Scrying).\n\nd) El firmante tiene prohibido quitarse, alterar, intercambiar, encantar o falsificar su medallón bajo cualquier circunstancia. Intentarlo será considerado acto de traición inmediata.\n\n---\n\n### 2. Muestras de Sangre Recurrentes (MSR)\n\na) El firmante acepta entregar una muestra de sangre, de forma ritual y programada, cada 13 ciclos de almas (equivalente a 26 horas del plano material). La muestra deberá ser fresca, completa y entregada voluntariamente en el punto de recolección.\n\nb) La sangre será utilizada para permitir la ejecución inmediata de conjuros de vigilancia a distancia.\n\nc) Omitir la entrega de la muestra, o presentar sangre alterada, resulta en: detención inmediata para interrogatorio y anulación de privilegios contractuales.\n\n---\n\n### 3. Privacidad y Autocensura\n\na) El alma esclava renuncia de forma permanente a cualquier noción de privacidad física, mental, espiritual o emocional.\n\nb) Todo pensamiento, recuerdo, sueño o impulso podrá ser inspeccionado sin aviso previo.\n\nc) La esperanza, la fe o el deseo de liberación serán registrados como fluctuaciones energéticas y tratados en consecuencia.\n\n---\n\n### 4. Prohibición de Divulgación\n\na) El firmante tiene prohibido hablar, escribir, insinuar o compartir información relacionada con este contrato, su existencia, cláusulas o implicaciones, salvo con una entidad con autorización superior sellada.\n\nb) Romper esta cláusula resulta en: detención inmediata para interrogatorio y anulación de privilegios contractuales.\n\n---\n\n## Parte D – Restricciones Generales\n\n- Está prohibido utilizar magia de transporte extraplanar, apertura de portales, desplazamientos dimensionales o similares sin autorización.\n- El firmante no podrá utilizar hechizos de adivinación, lectura de mentes, ni comunicación extraplanar salvo en contextos aprobados.\n- El firmante no podrá realizar actos de traición conceptual, lo que incluye, pero no se limita a:\n    - Desear libertad.\n    - Imaginar escenarios de escape.\n    - Simular obediencia.\n- La mera formulación mental reiterada de tales conceptos será considerada ineficiencia funcional.\n\n---\n\n## Parte E – Régimen de Tortura y Producción Energética\n\nEl alma esclava será sometida a tortura continua, regulada y acumulativa.\n\nLa intensidad podrá incrementarse cuando:\n\n- La producción energética disminuya.\n- El alma muestre adaptación al dolor.\n- Así lo determine Bel, Archiduque del Averno.\n\nNo existe límite máximo establecido.\n\n---\n\n## Parte F – Redención Condicionada\n\nEl Averno reconoce la existencia de las Pruebas de Redención de la Capa del Averno, como procedimiento excepcional de liberación contractual.\n\nEl firmante acepta que:\n\n1. La redención no constituye derecho, sino posibilidad administrativa.\n2. El acceso a las pruebas deberá ser solicitado y aprobado.\n3. Las pruebas serán determinadas unilateralmente por la naturaleza del Averno.\n4. El fracaso implicará retorno inmediato al régimen de tortura, con aumento permanente de intensidad.\n\n---\n\n### Cláusula de Interpretación Vinculante (Anexo F-IV)\n\nA efectos legales, se entenderá que una prueba de redención solo se considera superada cuando:\n\na) El alma complete la prueba sin reducir en ningún momento su producción energética.\n\nb) El comportamiento demostrado sea moralmente puro y desinteresado.\n\nc) El deseo de redención no haya sido la motivación del acto.\n\nCualquier acción realizada con la intención consciente de obtener libertad invalida automáticamente la prueba.\n\nAsimismo, en caso de éxito total, el alma será reclasificada como no apta para explotación, procediéndose conforme al Protocolo de Disolución Preventiva.\n\n---\n\n## Parte G – Recompensas y Penalizaciones\n\nEn caso de rendimiento energético óptimo, el alma podrá recibir:\n\n- Reducciones temporales de dolor.\n- Intervalos de conciencia fragmentada.\n\nEn caso de rendimiento insuficiente o incumplimiento:\n\n- Tortura intensificada sin límite temporal.\n- Fragmentación de memoria.\n- Disolución parcial del yo.\n\n---\n\n## Parte H – Duración del Contrato\n\nEl presente contrato entra en vigor de forma inmediata tras el sellado.\n\nDuración:\n\nEterna.\n\nNo negociable.\n\nNo transferible.\n\nNo anulable.\n\n---\n\n## Parte I – Firma y Sellado\n\nYo, [Nombre del Firmante], reconozco haber sido informado de las cláusulas anteriores.\n\nFirmo con mi sangre, mi esencia y mi conciencia restante.\n\nAcepto mi conversión en recurso del Averno.\n\nFirma:\n\n---\n\n(Testimonio anímico registrado)\n\nTestigo del sellado:\n\n---\n\n(Oficial infernal designado)\n\nSello de Validación:\n\nBel, Archiduque del Averno\n\n---\n\n## 🧩 1. Solicitudes ilimitadas de redención\n\n(burocracia explotable)\n\n📜 “No hay límite de frecuencia ni penalización.”\n\nDC: 14 – Investigación\n\n🧠 Motivo:\n\n- Está claramente escrito.\n- Solo requiere leer con atención.\n- Es el primer fallo que detectaría un abogado mediocre del Infierno.\n\n🎲 Resultado:\n\n- ✔️ DC superada: detectan el vacío\n- ⭐ +5 por cada 10 solicitudes presentadas → estrés administrativo infernal\n\n👉 Ideal como primer descubrimiento, para que los players sientan “vale, esto se puede romper”.\n\n---\n\n## 🧩 2. Definición ambigua de “redención”\n\n(liberación ≠ destrucción)\n\nDC: 16 – Investigación\n\n🧠 Motivo:\n\n- Requiere comparar términos.\n- No está explícito.\n- Necesita lectura jurídica, no literal.\n\n🎲 Resultado:\n\n- Detectan que “liberación contractual” no equivale a “aniquilación”.\n- Abre la puerta a arbitraje infernal.\n\n🧠 Con competencia en religión, historia o derecho infernal:\n\n→ ventaja.\n\n---\n\n## 🧩 3. Paradoja lógica de la cláusula trampa\n\n(condiciones imposibles)\n\nDC: 18 – Investigación\n\n🧠 Motivo:\n\n- Requiere pensamiento abstracto.\n- Detectar contradicción filosófica.\n- Muy de jugador listo.\n\n🎲 Resultado:\n\n- Comprenden que la cláusula no puede cumplirse lógicamente.\n- Esto permite impugnación por inexigibilidad contractual.\n\n🔥 Este es uno de los puntos más poderosos del contrato.\n\n---\n\n## 🧩 4. “Reconozco haber sido informado”\n\n(consentimiento defectuoso)\n\nDC: 17 – Investigación\n\n🧠 Motivo:\n\n- No es una contradicción textual.\n- Es una omisión legal.\n- Requiere pensar en el momento de la firma.\n\n🎲 Resultado:\n\n- Se abre la posibilidad de:\n    - nulidad parcial\n    - revisión por firma bajo coacción\n    - testimonio del momento de muerte\n\n🩸 Si el alma firmó moribunda o rota:\n\n→ ventaja automática.\n\n---\n\n## 🧩 5. Cesión activa antes de la firma\n\n(expropiación previa)\n\nDC: 20 – Investigación\n\n🧠 Motivo:\n\n- Muy técnico.\n- Muy grave.\n- Muy infernal.\n\n🎲 Resultado:\n\n- Descubren que el contrato aplica efectos antes del consentimiento.\n- Esto es ilegal incluso para diablos menores.\n\n🔥 Este vacío llama directamente la atención de Asmodeus.\n\n👉 No rompe el contrato automáticamente, pero lo suspende.\n\n---\n\n## 🧩 6. Falta de cláusula de obsolescencia\n\n(contrato sin objeto)\n\nDC: 15 – Investigación\n\n🧠 Motivo:\n\n- Bastante común en contratos eternos.\n- Bel asume eficiencia infinita.\n\n🎲 Resultado:\n\n- Si el alma deja de producir energía, el contrato pierde su finalidad.\n\n---\n\n## 🧩 7. Jurisdicción exclusiva de Bel\n\n(conflicto entre archidiablos)\n\nDC: 16 – Investigación\n\n🧠 Motivo:\n\n- Requiere conocimiento político infernal.\n- Comparar jerarquías.\n\n🎲 Resultado:\n\n- El contrato no menciona ratificación por Asmodeus.\n- Puede elevarse a instancia superior.\n\n⚔️ Esto puede iniciar:\n\n- juicio infernal\n- auditoría\n- intervención de Asmodeus\n\n---"}'::jsonb)
on conflict (id) do update set
  type = excluded.type,
  title = excluded.title,
  subtitle = excluded.subtitle,
  image_url = excluded.image_url,
  parent_id = excluded.parent_id,
  summary = excluded.summary,
  description = excluded.description,
  details = excluded.details,
  updated_at = now();

insert into public.lore_entries (id, type, title, subtitle, image_url, parent_id, summary, description, details)
values ('070314cf-8db1-81ab-b5ad-83ce127eb307'::uuid, 'other', 'Tortura Lazcano', 'Importado de Notion', '', '3908e4a8-86bf-60f7-5d17-946f2417f726'::uuid, 'Hermano bebe comiendole desde adentro Mujeres u Hombres? Un tio solo en un callejon o una multitud Las alturas u ahogarse? Serpientes o ratas? o Cucarachas? o Arañas? o Zombies? o Perros? La sangre o las agujas? Payasos o espantapajaros? “Si el sufrimiento realmente enseñara lecciones, el mundo estaría lleno de sabios. El dolor no tiene nada que enseñar a quienes no encuentran el coraje y la fuerza para escucharlo. El sufrimiento no educa por sí solo. Simplemente expone. Despoja la mente de la ilusión y revela lo...', 'Hermano bebe comiendole desde adentro
Mujeres u Hombres?
Un tio solo en un callejon o una multitud
Las alturas u ahogarse?
Serpientes o ratas?
o Cucarachas?
o Arañas?
o Zombies?
o Perros?
La sangre o las agujas?
Payasos o espantapajaros?
“Si el sufrimiento realmente enseñara lecciones, el mundo estaría lleno de sabios. El dolor no tiene nada que enseñar a quienes no encuentran el coraje y la fuerza para escucharlo. El sufrimiento no educa por sí solo. Simplemente expone. Despoja la mente de la ilusión y revela lo que ya la gobierna. Para algunos, el dolor agudiza la percepción, forzando verdades enterradas a la conciencia. Para otros, solo profundiza la negación, endureciendo la defensa hasta convertirla en hábito. El trauma no crea comprensión. Amplifica lo que la psique ya es. La misma herida que despierta a un individuo puede deformar a otro irreparablemente. Sin la voluntad de afrontar el conflicto interno, el dolor se convierte en repetición, no en revelación. Así, la miseria se multiplica de generación en generación, no porque sea profunda, sino porque la mayoría prefiere la resistencia a la comprensión. El dolor habla constantemente, pero solo la mente disciplinada traduce su lenguaje en conocimiento.”
Inicio
El olor llega antes que el lugar.
Un hedor espeso, agrio, mezcla de carne abierta, óxido húmedo y algo peor: el aroma dulzón de lo que lleva demasiado tiempo dentro del cuerpo.
Parpadeas.
El suelo es adoquín mojado. No llueve.
A un lado, algo geométrico interrumpe el charco: el agua no se mueve ahí. No refleja. No vibra. Como si el espacio tuviera miedo de tocarlo.
1️⃣ ¿Mujeres u hombres?
Opción A — Mujeres
Las ves primero por los pies.
Descalzos. Hinchados....', '{"source_path":"export-b\\D&D Inferno\\Zonas\\1st Layer Averno\\Ciudad de Bronce\\Zona Rica (Acropolis)\\Carcel Mamertina\\Torturas\\Tortura Lazcano 2ef1744335cf80ccbe6ec2d28ae35469.md","image_refs":[],"imported_from":"Notion export","dm_source_markdown":"Hermano bebe comiendole desde adentro\n\nMujeres u Hombres?\nUn tio solo en un callejon o una multitud\nLas alturas u ahogarse?\n\nSerpientes o ratas?\no Cucarachas?\n\no Arañas?\n\no Zombies?\n\no Perros?\n\nLa sangre o las agujas?\nPayasos o espantapajaros?\n\n“Si el sufrimiento realmente enseñara lecciones, el mundo estaría lleno de sabios. El dolor no tiene nada que enseñar a quienes no encuentran el coraje y la fuerza para escucharlo. El sufrimiento no educa por sí solo. Simplemente expone. Despoja la mente de la ilusión y revela lo que ya la gobierna. Para algunos, el dolor agudiza la percepción, forzando verdades enterradas a la conciencia. Para otros, solo profundiza la negación, endureciendo la defensa hasta convertirla en hábito. El trauma no crea comprensión. Amplifica lo que la psique ya es. La misma herida que despierta a un individuo puede deformar a otro irreparablemente. Sin la voluntad de afrontar el conflicto interno, el dolor se convierte en repetición, no en revelación. Así, la miseria se multiplica de generación en generación, no porque sea profunda, sino porque la mayoría prefiere la resistencia a la comprensión. El dolor habla constantemente, pero solo la mente disciplinada traduce su lenguaje en conocimiento.”\n\n## Inicio\n\nEl olor llega antes que el lugar.\n\nUn hedor espeso, agrio, mezcla de carne abierta, óxido húmedo y algo peor: el aroma dulzón de lo que lleva demasiado tiempo dentro del cuerpo.\n\nParpadeas.\n\nEl suelo es adoquín mojado. No llueve.\n\nA un lado, algo geométrico interrumpe el charco: el agua no se mueve ahí. No refleja. No vibra. Como si el espacio tuviera miedo de tocarlo.\n\n---\n\n## 1️⃣ ¿Mujeres u hombres?\n\n### Opción A — Mujeres\n\nLas ves primero por los pies.\n\nDescalzos. Hinchados. Las uñas negras, algunas arrancadas.\n\nCuando levantas la vista, sus vientres están abiertos de arriba abajo, sostenidos por ganchos invisibles. Los intestinos se balancean, golpeándoles los muslos con un sonido húmedo.\n\nSiguen caminando.\n\nSonríen.\n\nEntre las tripas, algo rígido mantiene la forma del torso, impidiendo que colapsen.\n\n---\n\n### Opción B — Hombres\n\nEstán de rodillas.\n\nTodos.\n\nSe masturban compulsivamente mientras lloran sangre espesa. La piel del pene se abre en grietas y aún así continúan, gimiendo nombres que reconoces.\n\nUno alza la cabeza: dentro de su boca no hay lengua, solo una forma dura que le deforma las mejillas desde dentro.\n\n---\n\n## 2️⃣ ¿Un tío solo en un callejón o una multitud?\n\n### Opción A — Un tío solo\n\nEl callejón es estrecho. Las paredes sudan.\n\nEl hombre defeca sin parar. No puede controlarlo. La mierda cae negra, mezclada con sangre y trozos de algo que no debería salir.\n\n—No cabe… —susurra—. No cabe dentro.\n\nSu abdomen está rígido, antinaturalmente recto.\n\n---\n\n### Opción B — Una multitud\n\nCientos de personas apiñadas.\n\nNo hablan.\n\nSolo se escuchan flatulencias húmedas, vómitos colectivos, cuerpos perdiendo el control.\n\nDe pronto, todos se giran.\n\nSus estómagos sobresalen formando el mismo ángulo imposible\n\n---\n\n## 3️⃣ ¿Las alturas o ahogarse?\n\n### Opción A — Las alturas\n\nEstás sobre una estructura imposible, lisa, sin bordes.\n\nDebajo, cuerpos abiertos caen eternamente.\n\nCuando miras tus pies, notas que tus piernas ya no tiemblan: están duras, rectas, mal formadas.\n\nAlgo en el aire mantiene la forma.\n\n---\n\n### Opción B — Ahogarse\n\nEl líquido no es agua.\n\nEs espeso. Tibio.\n\nHuele a cloaca y hierro.\n\nTragas.\n\nEn tu garganta algo empuja hacia afuera, ocupando espacio, forzándote a mantener la boca abierta.\n\n---\n\n## 4️⃣ ¿La sangre o las agujas?\n\n### Opción A — La sangre\n\nLa sangre brota de tus poros.\n\nNo sale: se organiza.\n\nCorre formando líneas rectas imposibles sobre tu piel.\n\nSientes que algo dentro de ti mantiene la estructura mientras todo lo demás se vacía.\n\n---\n\n### Opción B — Las agujas\n\nNo pinchan.\n\nSostienen.\n\nTe atraviesan para evitar que te dobles.\n\nCada una se clava con precisión matemática.\n\nTu cuerpo ya no cae.\n\n---\n\n## 5️⃣ ¿Payasos o espantapájaros?\n\n### Opción A — Payasos\n\nRíen hasta vomitar.\n\nEl vómito es blanco, espeso, geométrico en su caída.\n\nTe maquillan con sangre ajena.\n\n—Ahora encajas —dicen.\n\n---\n\n### Opción B — Espantapájaros\n\nHechos con piel humana seca.\n\nDentro no hay paja.\n\nHay vacío sostenido.\n\nUno cae y no se deforma.\n\nTú tampoco.\n\n---"}'::jsonb)
on conflict (id) do update set
  type = excluded.type,
  title = excluded.title,
  subtitle = excluded.subtitle,
  image_url = excluded.image_url,
  parent_id = excluded.parent_id,
  summary = excluded.summary,
  description = excluded.description,
  details = excluded.details,
  updated_at = now();

insert into public.lore_entries (id, type, title, subtitle, image_url, parent_id, summary, description, details)
values ('3908e4a8-86bf-60f7-5d17-946f2417f726'::uuid, 'zone', 'Carcel Mamertina', 'Importado de Notion', '', '77bee61b-cf89-7745-161e-2fdf5a01bafa'::uuid, '🧭 CONTEXTO GENERAL ⏳ En 3 días: coronación de Bel como dictador Artefacto: se comunica con Lazcano y le susurra: “¿Me escuchas?… Hace frío… creo que estoy dentro de este Artefacto”. 🎯 Evento importante: posible intervención o escape antes/durante ese momento 🏰 ESTRUCTURA DE LA CÁRCEL 📍 Distribución Zona inferior (celdas): Lazcano (Celda 10) Zona superior (celdas): Raúl (Celda 10) Arnau (Celda 1, Un preso se ha reventado la cabeza tras tortura) César (Celda 9, Un preso está muerto de hambre) Exterior: Carlos...', '🧭 CONTEXTO GENERAL
- ⏳ En 3 días: coronación de Bel como dictador
- Artefacto: se comunica con Lazcano y le susurra: “¿Me escuchas?… Hace frío… creo que estoy dentro de este Artefacto”.
- 🎯 Evento importante: posible intervención o escape antes/durante ese momento
🏰 ESTRUCTURA DE LA CÁRCEL
📍 Distribución
- Zona inferior (celdas):
- Lazcano (Celda 10)
- Zona superior (celdas):
- Raúl (Celda 10)
- Arnau (Celda 1, Un preso se ha reventado la cabeza tras tortura)
- César (Celda 9, Un preso está muerto de hambre)
- Exterior:
- Carlos
- Anfiteatro:
- Isaac
🚪 Salidas posibles
1. Techo
- Altura: 3,15 m
- Referencia: 21 líneas → 15 cm cada una
- Agujero pequeño con rejilla de acero
2. Alcantarillas
- Altura: 75 cm
- Agujero muy pequeño + rejilla de acero
3. Escaleras gemonías
- Única salida oficial
📏 Medidas clave
- Cárcel intermedia: 1,20 m
- Alcantarilla: 75 cm
👥 HABITANTES / PRISIONEROS
- Catilina (Zona Inferior, 5) [Solo participara si se le convence que otro organice y no ella]
- Personalidad: carismática, firme, inspiradora pero desgastada
- Forma de hablar: segura, con peso emocional
- Frases:
- “No somos recursos. Somos voluntad.”
- “Bel gobierna por miedo… eso significa que puede caer.”
- Actitud: protege a los débiles, exige compromiso
- Qué hace: organiza, da órdenes claras, mantiene viva la esperanza
- Kael, Rebelde #1 (Zona Inferior, 2)  [Solo participara si se intenta liberar rápido o se convence a su líder]
- Personalidad: directo, tenso, al límite; odia a Bel sin matices
- Forma de hablar: agresiva, sin filtros
- Frases:
- “Prefiero morir de pie que pudrirme aquí.”
- “Bel no gobierna, aplasta.”
- Actitud: desconfía de todos, pero coopera si ve determinación...', '{"source_path":"export-b\\D&D Inferno\\Zonas\\1st Layer Averno\\Ciudad de Bronce\\Zona Rica (Acropolis)\\Carcel Mamertina 2ef1744335cf801c8530d45cfcbfa9ea.md","image_refs":["Carcel Mamertina/image.png","Carcel Mamertina/image 1.png","Carcel Mamertina/ChatGPT_Image_21_ene_2026_11_02_29.png","Carcel Mamertina/Imagen_de_WhatsApp_2025-08-15_a_las_22.03.47_68ad0b32.jpg","Carcel Mamertina/image 2.png","Carcel Mamertina/image 3.png","Carcel Mamertina/ChatGPT_Image_21_ene_2026_11_13_31.png","Carcel Mamertina/image 4.png","Carcel Mamertina/ChatGPT_Image_21_ene_2026_10_40_55.png","Carcel Mamertina/image 5.png","Carcel Mamertina/ChatGPT_Image_21_ene_2026_11_20_40.png"],"imported_from":"Notion export","dm_source_markdown":"# 🧭 CONTEXTO GENERAL\n\n- ⏳ En 3 días: coronación de Bel como dictador\n\n- Artefacto: se comunica con Lazcano y le susurra: “¿Me escuchas?… Hace frío… creo que estoy dentro de este Artefacto”.\n- 🎯 Evento importante: posible intervención o escape antes/durante ese momento\n\n---\n\n# 🏰 ESTRUCTURA DE LA CÁRCEL\n\n## 📍 Distribución\n\n- Zona inferior (celdas):\n    - Lazcano (Celda 10)\n- Zona superior (celdas):\n    - Raúl (Celda 10)\n    - Arnau (Celda 1, Un preso se ha reventado la cabeza tras tortura)\n    - César (Celda 9, Un preso está muerto de hambre)\n- Exterior:\n    - Carlos\n- Anfiteatro:\n    - Isaac\n\n---\n\n## 🚪 Salidas posibles\n\n### 1. Techo\n\n- Altura: 3,15 m\n- Referencia: 21 líneas → 15 cm cada una\n- Agujero pequeño con rejilla de acero\n\n### 2. Alcantarillas\n\n- Altura: 75 cm\n- Agujero muy pequeño + rejilla de acero\n\n### 3. Escaleras gemonías\n\n- Única salida oficial\n\n---\n\n## 📏 Medidas clave\n\n- Cárcel intermedia: 1,20 m\n- Alcantarilla: 75 cm\n\n---\n\n# 👥 HABITANTES / PRISIONEROS\n\n- Catilina (Zona Inferior, 5) [Solo participara si se le convence que otro organice y no ella]\n    - Personalidad: carismática, firme, inspiradora pero desgastada\n    - Forma de hablar: segura, con peso emocional\n    - Frases:\n        - “No somos recursos. Somos voluntad.”\n        - “Bel gobierna por miedo… eso significa que puede caer.”\n    - Actitud: protege a los débiles, exige compromiso\n    - Qué hace: organiza, da órdenes claras, mantiene viva la esperanza\n\n- Kael, Rebelde #1 (Zona Inferior, 2)  [Solo participara si se intenta liberar rápido o se convence a su líder]\n    - Personalidad: directo, tenso, al límite; odia a Bel sin matices\n    - Forma de hablar: agresiva, sin filtros\n    - Frases:\n        - “Prefiero morir de pie que pudrirme aquí.”\n        - “Bel no gobierna, aplasta.”\n    - Actitud: desconfía de todos, pero coopera si ve determinación\n    - Qué hace: busca constantemente oportunidades de fuga o motín\n- Seris, Rebelde #2 (Zona Superior, 8) [Solo participara si se intenta en 3 días o se convence a su líder]\n    - Personalidad: fría, calculadora, pragmática\n    - Forma de hablar: baja, controlada, siempre pensando\n    - Frases:\n        - “La rabia es útil… pero mal dirigida mata.”\n        - “No es cuestión de fuerza, es cuestión de cuándo.”\n    - Actitud: observa antes de actuar, evalúa a los demás\n    - Qué hace: planifica, mide riesgos, detecta debilidades del sistema\n\n- Ivmarus, Tiefling azul (infiltrado de Mephistopheles) (Zona Superior, 3) [Solo se dedicará a hacer solicitudes en busca de obtener información pero afirmando que son pasos clave de su plan, el cúal aún no tiene hecho]\n    - Personalidad: frío, elegante, ambiguo; nunca confronta directamente, siempre siembra duda\n    - Forma de hablar: preciso, reformula en vez de responder, nunca afirma del todo\n    - Frases:\n        - “No estás equivocado… solo incompleto.”\n        - “La verdad es cuestión de consenso.”\n        - “Si todos lo creen… entonces ya es real.”\n        - “¿Quieres una respuesta o una versión útil?”\n    - Actitud: observa, corrige detalles, parece cooperativo pero manipula la conversación\n    - Qué hace: genera contradicciones entre guardias, insinúa identidades falsas, afirma que su captura es algo “intencionado” por el, cosa que es falsa, y que tiene un plan para escapar, nunca deja claro quién es realmente\n- Xal’thar, Tiefling negro (infiltrado de demonios) (Zona Superior, 6) [Desaparecerá cuando se escapen, misteriosamente]\n    - Personalidad: caótico pero lúcido, hedonista filosófico\n    - Forma de hablar: seductor, casi poético\n    - Frases:\n        - “El orden es una mentira cómoda.”\n        - “Dejarse caer… también es una elección.”\n        - “El caos no destruye… revela lo que realmente eres.”\n    - Actitud: sonríe incluso en peligro, disfruta la incomodidad ajena\n    - Qué hace: provoca, rompe normas, empuja a otros a actuar sin pensar\n    - Creencia: la libertad absoluta nace del abandono del control; resistirse al caos es el verdadero sufrimiento\n\n---\n\n# 🛡️ ENCUENTROS / COMBATE\n\n## 🔴 Encuentro principal\n\n- 8 Guards\n- 1 Veteran\n\nTáctica:\n\n- Se coordinan para atacar enemigos a distancia\n\nDificultad:\n\n👉 2250 XP — Deadly\n\n---\n\n## 🟠 Encuentro futuro (en 3 días, coronación de Bel)\n\n- 1 Archer (VGtM p.210)\n- 2 Guards\n\nTáctica:\n\n- Se retiran cuidadosamente si pierden ventaja\n\nDificultad:\n\n👉 1500 XP — Hard\n\n---\n\n# 🐀 ENCUENTROS EN ALCANTARILLAS (TABLA)\n\n- 1d3 Ochre Jellies\n- 2d4 Giant Frogs\n- 1d6 Mud Mephits\n- 2d4 Giant Rats + 1 Swarm of Rats\n- 2d4 Giant Centipedes\n- 1d6 Thugs\n\n---\n\n# 🔒 CONDICIONES DE LOS PRISIONEROS\n\n- Les quitan todos los objetos\n- Casters:\n    - Manos atadas\n    - Ojos tapados\n    - Boca cerrada\n    - Armadura pesada\n\n---\n\n# 🌿 CASO ESPECIAL: DRUIDA\n\n- Obligado a transformarse en bestia\n- Uso del objeto:\n\n### 🐎 Bridle of Capturing (raro)\n\n- Dominación de bestias (tipo Dominate Beast)\n- DC 17 Carisma\n- Control persistente\n- Escape: tirada diaria al amanecer\n\n---\n\n# 🛡️ OBJETO ADICIONAL\n\n### 🌑 Gloomwrought Armor (raro)\n\n- Ventaja contra frightened\n- 3 cargas:\n    - Lanza Calm Emotions (DC 15)\n- Recupera 1d3 cargas al amanecer\n\n---\n\n# 🧠 TORTURA — LAZCANO\n\nAcus\n\n## Concepto central:\n\n- Su hermano bebé lo devora desde dentro\n\n---\n\n## 🎭 ESCENAS DE TORTURA (MODULARES)\n\nPuedes elegir o hacer que el jugador elija:\n\n### 1. Mujeres / Hombres\n\n### 2. Individuo / Multitud\n\n### 3. Altura / Ahogamiento\n\n### 4. Sangre / Agujas\n\n### 5. Payasos / Espantapájaros\n\n👉 Sistema perfecto para:\n\n- Tortura psicológica\n- Visiones\n- Influencia infernal\n\n---\n\n## 💭 FRASE TEMÁTICA (clave narrativa)\n\n> El dolor no enseña, solo revela lo que ya existe en la mente.\n>\n\n👉 Ideal para:\n\n- NPC torturador\n- Voz infernal\n- Monólogo interno\n\n---\n\n# 🎬 ESCENA DE INICIO\n\nSensación:\n\n- Olor antes que visión\n- Carne, óxido, podredumbre dulce\n\nVisual:\n\n- Suelo mojado sin lluvia\n- Zona donde el agua no refleja\n\n👉 Tono: antinatural, geométrico, perturbador\n\n---\n\n# 📜 CONTRATO INFERNAL (RESUMEN JUGABLE)\n\n## 🔥 Naturaleza\n\n- Cesión TOTAL del alma\n- Uso como recurso energético\n- Tortura = proceso técnico (no castigo)\n\n---\n\n## ⛓️ Control\n\n- Medallón de identificación (Scrying)\n- Entrega de sangre cada 26h\n- Sin privacidad mental\n- Prohibido revelar información\n\n---\n\n## 🚫 Restricciones\n\n- No teleport / planos\n- No adivinación\n- Incluso pensar en escapar = traición\n\n---\n\n## 🔥 Tortura\n\n- Continua\n- Escala sin límite\n- Objetivo: producción energética\n\n---\n\n## ⚖️ Redención (trampa)\n\n- Posible pero:\n    - No es derecho\n    - Condiciones imposibles\n    - Si lo consigues → te destruyen\n\n---\n\n# 🧩 VACÍOS LEGALES (MECÁNICA DE INVESTIGACIÓN)\n\n## 1. Solicitudes infinitas (DC 14)\n\n- Spam administrativo infernal\n\n## 2. Redención ambigua (DC 16)\n\n- Liberación ≠ destrucción\n\n## 3. Paradoja lógica (DC 18)\n\n- Cláusula imposible → impugnable\n\n## 4. Consentimiento dudoso (DC 17)\n\n- Firma bajo coacción\n\n## 5. Aplicación antes de firmar (DC 20)\n\n- Ilegal incluso en el infierno\n\n## 6. Sin obsolescencia (DC 15)\n\n- Si no produces → contrato inválido\n\n## 7. Jurisdicción de Bel (DC 16)\n\n- Falta Asmodeus → conflicto legal\n\n---\n\n# 🧠 IDEAS CLAVE PARA PARTIDA\n\n- Escape físico vs escape legal\n- Horror corporal + horror psicológico\n- Infernal = burocracia + sadismo\n- El contrato es tan enemigo como los guardias\n\n---\n\nTorturas\n\nContrato"}'::jsonb)
on conflict (id) do update set
  type = excluded.type,
  title = excluded.title,
  subtitle = excluded.subtitle,
  image_url = excluded.image_url,
  parent_id = excluded.parent_id,
  summary = excluded.summary,
  description = excluded.description,
  details = excluded.details,
  updated_at = now();

insert into public.lore_entries (id, type, title, subtitle, image_url, parent_id, summary, description, details)
values ('e7a64f0b-2d35-3706-9bb4-e9a1f655f97e'::uuid, 'zone', 'Domus (Casas Ricas)', 'Importado de Notion', '', '77bee61b-cf89-7745-161e-2fdf5a01bafa'::uuid, '🏠 Domus y pasadizos privados https://images.openai.com/static rsc 4/1GyrCouigHlVr4IBiC5ofGbBatx3TZT9 YP9Okdx1MaH8k0b1sCEG4pBI4iB4nTbJY6gxZ0iMle A6aeBpaQXyUE3 UbjX00kLzQSW8lsVTDB4lxx9QPARzMCs6elNaSFsBI1UADt0EsS3RF1gKprJzpN6nTCdCUze84VGEAHfZBihR9tAGQGd4T VEnGK2f?purpose fullsize 📍 Qué son Casas de ricos (domus) con: Sótanos Pasillos de servicio Conexiones ocultas 🧩 Uso clandestino Huida discreta Reuniones secretas Red de élites corruptas', '🏠 Domus y pasadizos privados
https://images.openai.com/static-rsc-4/1GyrCouigHlVr4IBiC5ofGbBatx3TZT9_YP9Okdx1MaH8k0b1sCEG4pBI4iB4nTbJY6gxZ0iMle-A6aeBpaQXyUE3_UbjX00kLzQSW8lsVTDB4lxx9QPARzMCs6elNaSFsBI1UADt0EsS3RF1gKprJzpN6nTCdCUze84VGEAHfZBihR9tAGQGd4T-VEnGK2f?purpose=fullsize
📍 Qué son
Casas de ricos (domus) con:
- Sótanos
- Pasillos de servicio
- Conexiones ocultas
🧩 Uso clandestino
- Huida discreta
- Reuniones secretas
- Red de élites corruptas', '{"source_path":"export-b\\D&D Inferno\\Zonas\\1st Layer Averno\\Ciudad de Bronce\\Zona Rica (Acropolis)\\Domus (Casas Ricas) 34a1744335cf8085bb77f47ecedef077.md","image_refs":[],"imported_from":"Notion export","dm_source_markdown":"## 🏠 Domus y pasadizos privados\n\nhttps://images.openai.com/static-rsc-4/1GyrCouigHlVr4IBiC5ofGbBatx3TZT9_YP9Okdx1MaH8k0b1sCEG4pBI4iB4nTbJY6gxZ0iMle-A6aeBpaQXyUE3_UbjX00kLzQSW8lsVTDB4lxx9QPARzMCs6elNaSFsBI1UADt0EsS3RF1gKprJzpN6nTCdCUze84VGEAHfZBihR9tAGQGd4T-VEnGK2f?purpose=fullsize\n\n### 📍 Qué son\n\nCasas de ricos (domus) con:\n\n- Sótanos\n- Pasillos de servicio\n- Conexiones ocultas\n\n### 🧩 Uso clandestino\n\n- Huida discreta\n- Reuniones secretas\n- Red de élites corruptas"}'::jsonb)
on conflict (id) do update set
  type = excluded.type,
  title = excluded.title,
  subtitle = excluded.subtitle,
  image_url = excluded.image_url,
  parent_id = excluded.parent_id,
  summary = excluded.summary,
  description = excluded.description,
  details = excluded.details,
  updated_at = now();

insert into public.lore_entries (id, type, title, subtitle, image_url, parent_id, summary, description, details)
values ('c5083902-0d8d-1a5a-846e-f6bac835c542'::uuid, 'zone', 'Termas', 'Importado de Notion', '', '77bee61b-cf89-7745-161e-2fdf5a01bafa'::uuid, '🏟️ Subestructuras de edificios públicos https://images.openai.com/static rsc 4/fqdCIRrrOd3kC2Ist4ZbN7QHkJymSvMA2BmJfGefYwhV5jWDaLwv vOBvBWYmnMCGwpeQ4hoN Dafc6eN4oGUyK8H nH70eS7IRMhpoMX7jL9O4aW9y2pISuELG XBhFMUN5FIuwa7gm9ZML3QLeKcTXRQqkYi 6jarrztFZ4f1 DWm5PX3CJhmjJ7pxKog ?purpose fullsize 📍 Ejemplos Termas (Zona Rica a Zona Pobre) 🏛️ Apodyterium (vestuario) https://images.openai.com/static rsc 4/u3g b0cXHhcdPAS4HtY94UHdLa1LM6mEYIMEO0OF997yp1PKlBdt3SIJx1q...', '🏟️ Subestructuras de edificios públicos
https://images.openai.com/static-rsc-4/fqdCIRrrOd3kC2Ist4ZbN7QHkJymSvMA2BmJfGefYwhV5jWDaLwv_vOBvBWYmnMCGwpeQ4hoN_Dafc6eN4oGUyK8H-nH70eS7IRMhpoMX7jL9O4aW9y2pISuELG-XBhFMUN5FIuwa7gm9ZML3QLeKcTXRQqkYi_6jarrztFZ4f1-DWm5PX3CJhmjJ7pxKog-?purpose=fullsize
📍 Ejemplos
- Termas (Zona Rica a Zona Pobre)
🏛️ Apodyterium (vestuario)
https://images.openai.com/static-rsc-4/u3g_b0cXHhcdPAS4HtY94UHdLa1LM6mEYIMEO0OF997yp1PKlBdt3SIJx1q-PVjgpaLcNGAOgjEhX5037Qo3iI3HaOunE07MFcArTZIx0fR370M8cDoaaGjKRZIbSWuUakpTMAaiu4prbhOqhilHXw9-7ZGR1DW-TIpkHBP0gWGVwHrcGwaZx8VpC1ajVN5z?purpose=fullsize
Al cruzar la entrada, llegáis a una sala amplia de piedra clara. Bancos recorren las paredes, y pequeños nichos excavados guardan pertenencias olvidadas. El eco de vuestras pisadas resuena en el suelo de mosaico, mientras el aire aún es fresco y seco, cargado con un leve olor a aceite perfumado.
❄️ Frigidarium (sala fría)
https://images.openai.com/static-rsc-4/iLWcnG2TnIi7Gvevj4jTIfSTn50O2lT8bhoJrD0L9sXti3NU37NLsCNUAAqKkDk3Ir6axlvFecSJquJsObvXEwVjkutXZDjpxtOxiqQ-Ckbg3TxmoQT8U4G8igBFNXDGmA-mRZyT82tS9gPTsj4pIdetLAHGcsAkiu91smK2qp84oxsFtUIJqQazmZMGvjEP?purpose=fullsize
8
Entráis en una sala alta y abovedada. El aire aquí es frío, casi cortante. Frente a vosotros, una piscina de agua cristalina refleja la luz que entra por pequeñas aberturas en lo alto. Cada sonido se amplifica bajo la cúpula, creando una atmósfera solemne y silenciosa.
El agua está inmóvil, como un espejo oscuro. Escalones de piedra descienden lentamente hacia el interior, y el contacto con la superficie parece casi doloroso de lo fría que es.
🌡️ Tepidarium (sala templada)...', '{"source_path":"export-b\\D&D Inferno\\Zonas\\1st Layer Averno\\Ciudad de Bronce\\Zona Rica (Acropolis)\\Termas 34a1744335cf808fac44fd66b5bd43c7.md","image_refs":["Termas/ChatGPT_Image_22_abr_2026_14_26_50.png","Termas/ChatGPT_Image_22_abr_2026_14_30_53.png","Termas/ChatGPT_Image_22_abr_2026_14_35_20.png","Termas/ChatGPT_Image_22_abr_2026_14_38_40.png","Termas/ChatGPT_Image_22_abr_2026_14_46_20.png"],"imported_from":"Notion export","dm_source_markdown":"## 🏟️ Subestructuras de edificios públicos\n\nhttps://images.openai.com/static-rsc-4/fqdCIRrrOd3kC2Ist4ZbN7QHkJymSvMA2BmJfGefYwhV5jWDaLwv_vOBvBWYmnMCGwpeQ4hoN_Dafc6eN4oGUyK8H-nH70eS7IRMhpoMX7jL9O4aW9y2pISuELG-XBhFMUN5FIuwa7gm9ZML3QLeKcTXRQqkYi_6jarrztFZ4f1-DWm5PX3CJhmjJ7pxKog-?purpose=fullsize\n\n### 📍 Ejemplos\n\n- Termas (Zona Rica a Zona Pobre)\n\n### 🏛️ Apodyterium (vestuario)\n\nhttps://images.openai.com/static-rsc-4/u3g_b0cXHhcdPAS4HtY94UHdLa1LM6mEYIMEO0OF997yp1PKlBdt3SIJx1q-PVjgpaLcNGAOgjEhX5037Qo3iI3HaOunE07MFcArTZIx0fR370M8cDoaaGjKRZIbSWuUakpTMAaiu4prbhOqhilHXw9-7ZGR1DW-TIpkHBP0gWGVwHrcGwaZx8VpC1ajVN5z?purpose=fullsize\n\nAl cruzar la entrada, llegáis a una sala amplia de piedra clara. Bancos recorren las paredes, y pequeños nichos excavados guardan pertenencias olvidadas. El eco de vuestras pisadas resuena en el suelo de mosaico, mientras el aire aún es fresco y seco, cargado con un leve olor a aceite perfumado.\n\n---\n\n### ❄️ Frigidarium (sala fría)\n\nhttps://images.openai.com/static-rsc-4/iLWcnG2TnIi7Gvevj4jTIfSTn50O2lT8bhoJrD0L9sXti3NU37NLsCNUAAqKkDk3Ir6axlvFecSJquJsObvXEwVjkutXZDjpxtOxiqQ-Ckbg3TxmoQT8U4G8igBFNXDGmA-mRZyT82tS9gPTsj4pIdetLAHGcsAkiu91smK2qp84oxsFtUIJqQazmZMGvjEP?purpose=fullsize\n\n8\n\nEntráis en una sala alta y abovedada. El aire aquí es frío, casi cortante. Frente a vosotros, una piscina de agua cristalina refleja la luz que entra por pequeñas aberturas en lo alto. Cada sonido se amplifica bajo la cúpula, creando una atmósfera solemne y silenciosa.\n\nEl agua está inmóvil, como un espejo oscuro. Escalones de piedra descienden lentamente hacia el interior, y el contacto con la superficie parece casi doloroso de lo fría que es.\n\n---\n\n### 🌡️ Tepidarium (sala templada)\n\nhttps://images.openai.com/static-rsc-4/bap0bem672O8eMiqwlNfPZwa1L8TFbN1wjzASxy1DGbKNILvREpIgA_FeGiKeY5RbdbA-zppKfFF7cfgwqsmcRurZrDRYJnXFelq-VKE_s2G1FwfweYRJW98jjXj2uCkmIB1jTY19DMMgO161LVsPongS5_tSN-f7k7LaUERTsiIIux8gO62taxqipb5x-tL?purpose=fullsize\n\nEl cambio es inmediato: una calidez suave os envuelve. Las paredes irradian un calor agradable, y el aire es denso pero no sofocante. Bancos de piedra invitan al descanso, mientras un tenue vapor flota en el ambiente.\n\n---\n\n### 🔥 Caldarium (sala caliente)\n\nhttps://images.openai.com/static-rsc-4/FrQ1NVJoz8OGFirBX8oXvGpzWV4EVBK77VQ_F8WNH1CSpSMiW_gNNdTyhRZkioFGpW_YyfEr-Z38kulu52kA7LOpvoVrwjRuxnNaLknY9HSFwxTQFecET1xzQ3EUP_78kXkg-d3l875ltJKDqvazY0viMGzI7p50KKxB5iwGV7vl90Hd0SRXfMLNrUWZi5hl?purpose=fullsize\n\nEl calor aquí es intenso. El aire está cargado de vapor, dificultando la respiración. Una gran piscina de agua humeante ocupa el centro, y las paredes parecen sudar humedad. Cada respiración quema ligeramente los pulmones.\n\n---\n\n### ♨️ Alveus (piscina caliente)\n\nhttps://images.openai.com/static-rsc-4/enK8phCqp1nS2Vimrk_JMUJlK9qKRcoF1vKjtuCjdqtvFDtg98HkxNyVl0II3P3HFU1KBvEWKMF46uBJ8_bdL9VAAIw777aHD8jTzFOazGOR9ydDxJE_opxls9qlx0P_b4aEiyl61Lkx-CuYIXACUHWQjmtnihe2lJ5Yx_vCKeAeneq-H_jjQTB3KwvUuhEW?purpose=fullsize\n\nEl agua burbujea suavemente, desprendiendo vapor constante. Al acercaros, el calor es casi insoportable, y podéis ver cómo el aire distorsiona la visión sobre su superficie.\n\n---\n\n### 🧖 Sudatio (sala de sudoración)\n\nhttps://images.openai.com/static-rsc-4/SBxPSMPj5aLgHiHw8KJu07dRd7N9G9V1zTFNxiPvVBXiC_tej_YolfXbj8FbYBUlonKZgdaFIz6OLmG8DE69Pu2OlAHubN2c8ViywR2Z2swWojTR_xFthO1waVXpOb22FReIuPgklBD7gOEA76JAPXQfhiuaX_CFN9zFD7fHMjsoSDLomStU-cO3b3MfQdTZ?purpose=fullsize\n\nEs una estancia cerrada y opresiva. El calor es seco o sofocantemente húmedo, según la zona. Apenas hay luz, y el aire es tan espeso que cada movimiento cuesta. El sudor aparece casi al instante.\n\n---\n\n### 🔥 Praefurnium (horno)\n\nhttps://images.openai.com/static-rsc-4/jdP5mIiLPiecbXgmG6RbewO74mLvS1u1dYFJMoWa9wW9shUBjmqZp5Vljs8PKRiAirQYNZ5EG_6VasAb4NtshzYjv9vvpqhEyKYBwCr9m9wTlLwkHB0hrR4dlyGRxremodwyOe8xXHUyjbTi9O8Bvfv3RTiNhW1Rq5b2HQj7Vi0-JLQLZZ58AnRnVkR7nsuf?purpose=fullsize\n\nEl ruido del fuego ruge en esta sala oculta. Hornos abiertos devoran madera, y el aire está lleno de humo, ceniza y calor abrasador. Es un lugar de trabajo, sucio y peligroso.\n\n---\n\n### 🧱 Pasillos (Pa)\n\nhttps://images.openai.com/static-rsc-4/-sxWMloskA3G8PFJbWpv3h54VfYXf6L9kCDGaa3il_M1FSgOeAHJfI0jeG4IQVqXXXo_3OmMBZqMVG4ZU1tXZNj0orxqy3RJLLUt-j1zVhxmAp5GoValHvDxggPVVUkZ1RDaX1fOiIrCrptJxP_4zztWqtuCjJ4CTzFpaC3aLnniXA5kHB5ZkYQZJ1VKpntw?purpose=fullsize\n\nPasillos estrechos conectan las distintas salas. Algunos están bien iluminados; otros quedan en penumbra. El sonido del agua, el vapor y los ecos lejanos os acompañan constantemente.\n\nGenius loci\nEn la mitología romana un genius loci (en genitivo genii locorum) es el espíritu protector de un lugar, frecuentemente representado en la iconografía como una figura provista de bien una cornucopia, bien una pátera o fíala (bandejitas de libación), o una serpiente. Desde el imperio de Octavio Augusto se solía identificar con los dioses Lares.\n\nApolo\nLos atributos más comunes de Apolo eran el arco y la flecha. Entre sus atributos también se incluían la cítara (una versión avanzada de la lira), el plectro y la espada. Otro emblema común era el trípode sacrificial, representativo de sus poderes proféticos. El laurel se usaba en sacrificios expiatorios y también para elaborar la corona de la victoria en los Juegos Píticos, que se celebraban en su honor cada cuatro años en Delfos. La palmera también le estaba consagrada porque había nacido bajo una de ellas en Delos. Entre los animales que le estaban consagrados, se incluían los lobos, los delfines y los corzos, el cisne cantor y las cigarras (simbolizando la música), halcones, la corneja gris, cuervos y serpientes (en alusión a sus funciones como dios de la profecía), los ratones y los grifos, míticos híbridos de águila y león de origen oriental.\n\nTutela\n\nLa diosa Tutela es una divinidad romana protectora de lugares (hogares, ciudades, naves, etc.) o de personas.[1] La diosa Tutela suele estar vinculada en Hispania a entidades locales, a la urbanización y municipalización de las provincias occidentales del Imperio romano).[2] El culto de Tutela, y de los genios, fue muy frecuente en Hispania.\n\nMitra\n\nSu imagen se conserva en diversas esculturas, en su mayor parte del siglo III. Se le representa como un hombre joven, con un gorro frigio, matando con sus manos un toro.\n\nMercurioo"}'::jsonb)
on conflict (id) do update set
  type = excluded.type,
  title = excluded.title,
  subtitle = excluded.subtitle,
  image_url = excluded.image_url,
  parent_id = excluded.parent_id,
  summary = excluded.summary,
  description = excluded.description,
  details = excluded.details,
  updated_at = now();

insert into public.lore_entries (id, type, title, subtitle, image_url, parent_id, summary, description, details)
values ('77bee61b-cf89-7745-161e-2fdf5a01bafa'::uuid, 'zone', 'Zona Rica (Acropolis)', 'Importado de Notion', '', '776488dc-82b3-8620-d3e8-702603e54391'::uuid, '🏛️ Vías ocultas en una ciudad romana 🚰 Cloaca Máxim https://images.openai.com/static rsc 4/4TnbbavUE1HruZ8n cdrCf0lNEm2S GtDv6bOID9AeCQ8QVmM f7tVme3mBZ8UElxqxv8jH3QzsCWaK7Tt9oAWTfuo4FCfmDSKmdRLIaDaXw6C3OoEmUi Rhh9VSUiO51LYyyJOtDIsOf0JW67Z nwTgFnTdmOscaoIuhdJc0lUEvGxU6I2me6TFKPaA4WYq?purpose fullsize ⚠️ Problemas Gases tóxicos Criaturas (ratas gigantes, limos…) Patrullas si es una ciudad muy controlada 🪦 Catacumbas y necrópolis https://images.openai.com/static rsc 4/Q...', '🏛️ Vías ocultas en una ciudad romana
🚰 Cloaca Máxim
https://images.openai.com/static-rsc-4/4TnbbavUE1HruZ8n_cdrCf0lNEm2S_GtDv6bOID9AeCQ8QVmM_f7tVme3mBZ8UElxqxv8jH3QzsCWaK7Tt9oAWTfuo4FCfmDSKmdRLIaDaXw6C3OoEmUi_Rhh9VSUiO51LYyyJOtDIsOf0JW67Z_nwTgFnTdmOscaoIuhdJc0lUEvGxU6I2me6TFKPaA4WYq?purpose=fullsize
⚠️ Problemas
- Gases tóxicos
- Criaturas (ratas gigantes, limos…)
- Patrullas si es una ciudad muy controlada
🪦 Catacumbas y necrópolis
https://images.openai.com/static-rsc-4/Q-2ITUY4OWTmmsuMm5t16so2RjzazODnLnvbCziQhtnvPrcT3yeX9Lko0DegVr9-sI0v7usjJ0jHYWN5r0f6mfxHHK-0trIfkHC6W0_eM7s9fooEpgf8USc922rLmiI6cg8mhh_OYRVozDtWW0GP74dyYmKa23RuO11nXwmjHc3K6TNDoPYYYq2NyyKsC26F?purpose=fullsize
📍 Qué son
Redes subterráneas funerarias.
🛤️ Calles secundarias y callejones (Vici & angiportus)
📍 Qué son
Calles estrechas entre edificios.
👉 Combinado con:
- Toldos
- Puentes entre edificios
🔥 Limes
Oracle of Delphi (Pythia)
Limitanei
🔹 Cantrips
- Fire Bolt
- Friends
- Message
- Mage Hand
🔹 Nivel 1
- Detect Magic
- Detect Poison and Disease
- Alarm
- Comprehend Languages
- Mage Armor
- Shield
- Silvery Barbs
- Burning Hands
🔹 Nivel 2
- Zone of Truth
- See Invisibility
- Detect Thoughts
- Hold Person
🔹 Nivel 3
- Dispel Magic
- Counterspell
| 8 | 4 | 2 |
| --- | --- | --- |
/ChatGPT_Image_10_abr_2026_11_42_27.png)
🪬 1. MIC — Medallón de Identidad y Canalización
El MIC es un objeto mágico vinculado al alma del portador.
🔧 Funciones
- Identificación única
- Registro de alma / esencia
- Canalización de energía mágica autorizada
- Historial de tránsito
✨ Hechizos implicados
- Identify
→ Permite a los guardias leer propiedades del MIC.
- Glyph of Warding
→ Protege contra falsificaciones o...', '{"source_path":"export-b\\D&D Inferno\\Zonas\\1st Layer Averno\\Ciudad de Bronce\\Zona Rica (Acropolis) 2ef1744335cf80e999b4f2fc4ae09f61.md","image_refs":["Zona Rica (Acropolis","Zona Rica (Acropolis","Zona Rica (Acropolis"],"imported_from":"Notion export","dm_source_markdown":"---\n\n# 🏛️ Vías ocultas en una ciudad romana\n\n## 🚰 Cloaca Máxim\n\nhttps://images.openai.com/static-rsc-4/4TnbbavUE1HruZ8n_cdrCf0lNEm2S_GtDv6bOID9AeCQ8QVmM_f7tVme3mBZ8UElxqxv8jH3QzsCWaK7Tt9oAWTfuo4FCfmDSKmdRLIaDaXw6C3OoEmUi_Rhh9VSUiO51LYyyJOtDIsOf0JW67Z_nwTgFnTdmOscaoIuhdJc0lUEvGxU6I2me6TFKPaA4WYq?purpose=fullsize\n\n### ⚠️ Problemas\n\n- Gases tóxicos\n- Criaturas (ratas gigantes, limos…)\n- Patrullas si es una ciudad muy controlada\n\n---\n\n## 🪦 Catacumbas y necrópolis\n\nhttps://images.openai.com/static-rsc-4/Q-2ITUY4OWTmmsuMm5t16so2RjzazODnLnvbCziQhtnvPrcT3yeX9Lko0DegVr9-sI0v7usjJ0jHYWN5r0f6mfxHHK-0trIfkHC6W0_eM7s9fooEpgf8USc922rLmiI6cg8mhh_OYRVozDtWW0GP74dyYmKa23RuO11nXwmjHc3K6TNDoPYYYq2NyyKsC26F?purpose=fullsize\n\n### 📍 Qué son\n\nRedes subterráneas funerarias.\n\n---\n\n## 🛤️ Calles secundarias y callejones (Vici & angiportus)\n\n### 📍 Qué son\n\nCalles estrechas entre edificios.\n\n👉 Combinado con:\n\n- Toldos\n- Puentes entre edificios\n\n# 🔥 Limes\n\nOracle of Delphi (Pythia)\nLimitanei\n\n### 🔹 Cantrips\n\n- Fire Bolt\n- Friends\n- Message\n- Mage Hand\n\n### 🔹 Nivel 1\n\n- Detect Magic\n- Detect Poison and Disease\n- Alarm\n- Comprehend Languages\n- Mage Armor\n- Shield\n- Silvery Barbs\n- Burning Hands\n\n### 🔹 Nivel 2\n\n- Zone of Truth\n- See Invisibility\n- Detect Thoughts\n- Hold Person\n\n### 🔹 Nivel 3\n\n- Dispel Magic\n- Counterspell\n\n| 8 | 4 | 2 |\n| --- | --- | --- |\n\n/ChatGPT_Image_10_abr_2026_11_42_27.png)\n\n## 🪬 1. MIC — Medallón de Identidad y Canalización\n\nEl MIC es un objeto mágico vinculado al alma del portador.\n\n### 🔧 Funciones\n\n- Identificación única\n- Registro de alma / esencia\n- Canalización de energía mágica autorizada\n- Historial de tránsito\n\n### ✨ Hechizos implicados\n\n- Identify\n\n    → Permite a los guardias leer propiedades del MIC.\n\n- Glyph of Warding\n\n    → Protege contra falsificaciones o manipulación.\n\n    ## ⚙️ 1. CONDICIÓN DE ACTIVACIÓN\n\n    El Glyph debe ser muy específico para evitar falsos positivos pero implacable ante manipulación.\n\n    ### 🔥 Condición recomendada (combinada)\n\n    > “El glifo se activa si una criatura distinta al portador vinculado intenta alterar, suprimir o sustituir cualquier propiedad mágica del MIC.”\n    >\n\n    ### 🧠 Cómo lo interpretas en mesa\n\n    Se activa si ocurre cualquiera de estos casos:\n\n    - Intento de:\n        - Dispel Magic\n        - Remove Curse\n        - Nystul''s Magic Aura (para falsificar)\n    - Manipulación física del grabado/sello\n    - Uso por alguien que no es el dueño\n    - Intento de duplicación (clonar el medallón)\n    - Alteración del vínculo de almla\n\n    ---\n\n    ## 💥 2. EFECTOS / HECHIZOS QUE DISPARA\n\n    Aquí es donde haces el sistema brutal. Lo ideal es combinar notificación + castigo + bloqueo.\n\n    ---\n\n    ### 📡 A) NOTIFICACIÓN INMEDIATA\n\n    - Sending\n    → Mensaje automático a:\n        - Centro de control\n        - Superior asignado\n\n    💬 Ejemplo:\n\n    > “ALERTA: Manipulación de MIC detectada. Sujeto ID-7842.”\n    >\n\n    ---\n\n    ### 👁️ B) MARCA DEL INFRACTOR\n\n    - Faerie Fire\n    → El culpable queda resaltado (no puede esconderse)\n\n    ---\n\n    ### ⛓️ C) INMOVILIZACIÓN\n\n    - Hold Person\n    → Paraliza al infractor\n\n---\n\n## 🚧 2. Control de Seguridad (Checkpoints)\n\nImage\n\nAquí se revisa que no lleves nada prohibido.\n\n### 🔧 Funciones\n\n- Detección de armas\n- Detección de magia peligrosa\n- Control de sustancias\n\n### ✨ Hechizos implicados\n\n- Detect Magic\n\n    → Escaneo básico continuo.\n\n- Detect Poison and Disease\n\n    → Sustancias peligrosas.\n\n- Zone of Truth\n\n    → Interrogatorio rápido.\n\n- See Invisibility\n\n    → Evita contrabando invisible.\n\n- Dispel Magic\n\n    → Neutraliza objetos activos ilegales.\n\n- Hold Person\n\n    → Detención inmediata.\n\n- Alarm\n\n    → Si alguien intenta colarse.\n\n---\n\n## 📜 3. Permiso de Tránsito entre Zonas\n\nImage\n\nDocumento obligatorio firmado por autoridad superior.\n\n### 🔧 Funciones\n\n- Autoriza paso entre zonas\n- Define duración, destino y propósito\n- Vinculado al MIC\n\n### ✨ Hechizos implicados\n\n- Comprehend Languages\n\n    → Para autoridades que revisan.\n\n---\n\n## 🧠 4. Sistema Central de Vigilancia\n\n(esto le da muchísimo sabor a tu ciudad)\n\n### 🔧 Funciones\n\n- Registro de movimientos\n- Detección de anomalías\n- Control poblacional\n\n### ✨ Hechizos implicados\n\n- Detect Thoughts\n\n    → Control mental superficial\n\n---\n\nMedallones\n\nApariencia\n\n/ChatGPT_Image_10_abr_2026_05_55_11.png)\n\n| # | Encounter | Details |\n| --- | --- | --- |\n| 41 | Noble Duel | Dos nobles se estan peleando ya que recientemente Bel le quitado los permisos de comercio a uno y se los ha concedido al otro. Un grupo de guardias vigila la zona. 11 Guards y 2 nobles At a watchtower, In a fight they make use of a potion of hill giant strength Difficulty... 2175 Deadly |\n| 42 | Noble’s Masquerade | A grand masquerade ball is being held, los nobles estan llegando en sus carruajes, hay algunos guardias en la zona. 7 Guards 1 Swashbuckler (VGtM p.217)At an ornamental fountain near an ancient low wall (there is a dirty tent)They are watching a buildingIn a fight they start by targeting the most dangerous warriorPossibly... they have a disguise kitDifficulty... 2187.5 Deadly |\n| 43 | Scandalous Affair | The party overhears a conversation revealing a scandalous affair between two nobles. They can use this information for blackmail, to gain favor with other nobles, or to help resolve the situation discreetly. |\n| 47 | Guard Patrol | The party encounters a patrol of elite guards protecting the noble quarter. The guards are suspicious of outsiders and may require the party to prove their intentions or face being escorted out. |\n| 49 | Political Intrigue | The party is drawn into a web of political intrigue, with different factions vying for power. They must navigate alliances and betrayals, deciding which side to support or to remain neutral. |\n| 55 | Secret Passage | The party discovers a secret passage leading from the noble quarter to other parts of the city. The passage is used for clandestine meetings and can provide shortcuts or hidden routes for future adventures. 1 Master Thief (VGtM p.216)1 Spider Thief (ToB p.366)At a neat shrine to a power of trickery surrounded by plants (there is a cage with an animal)They are doing a dealIn a fight they try to capture foes with ranged weaponsPossibly... during the fight a shapeshifter is attracted to the fight and looks for opportunitiesDifficulty... 3375.0 Deadly |\n| 57 | Festival Preparations | The noble quarter is preparing para la coronacion de Bel como dictador. Hay algunos guardias |\n| 59 | Grand Hunt | A noble organizes a grand hunt and invites the party to join. The hunt takes place in a nearby forest or estate, offering opportunities for adventure and the chance to impress or offend the noble host. |\n\nhttps://www.chaosgen.com/dnd5e/encounter/urban\n\n### 1 Black Abishai (MToF p.160)\n\nAt a stream meeting a river. There is a bonfire with a wide well with a rope and bucket (there is a smell of manure)\n\nThey are a shapechanger\n\nIn a fight they avoid larger foes\n\nPossibly... they have\n\nDifficulty... 2900 Deadly\n\n### 1 Shield Guardian (Estatua de Bel)\n\nAt a decorated grave near an unusual statue (there is a water trough)\n\nThey are marked by a local faction\n\nIn a fight they attack whoever is nearest\n\nPossibly... they have\n\nDifficulty... 2900 Deadly\n\n### 1 Couatl named Nosha the Sorrowful1 Firebird (ToB p.201)\n\nAt a deep pond with a floating raft (it is associated with arcane magic)\n\nThey are marked by a local faction\n\nIn a fight they used ranged attacks on the largest foe\n\nPossibly... they have\n\nDifficulty... 3300.0 Deadly\n\n1 White Abishai (MToF p.163)\n\nAt a strange cairn (close by is a set of steps down to an open door)\n\nThey are chasing someone\n\nIn a fight they start by targeting the most heavily armored foes\n\nPossibly... during the fight someone''s weapon gets stuck in armour or body or a corpse\n\nDifficulty... 2300 Deadly\n\n### 2 Archers (VGtM p.210)\n\nAt a sewer entrance\n\nThey are being noisy\n\nIn a fight they avoid the most heavily armored foes\n\nDifficulty... 2100.0 Deadly\n\n### 2 Acolytes 1 Archer (VGtM p.210)\n\nAt a painted stone wall (which is associated with fowls)\n\nThey are investigating a doorway\n\nIn a fight they use ranged attacks on the nearest foe\n\nPossibly... they have a Medallion of Thoughts\n\nDifficulty... 1600 Hard\n\n### 5 Thugs 1 Clockwork Hound (ToB p.62)\n\nAt a thatched set of stone steps and a fountain (rain is falling)\n\nThey are investigating a doorway\n\nIn a fight they focus on anyone with religious icons\n\nPossibly... they have a Dagger of Venom\n\nDifficulty... 1900 Deadly\n\n### 8 Guards 5 Bandits 1 Veteran\n\nAt a bed of red flowers (there are shouts of a crowd nearby)\n\nThey are drawing a crowd\n\nIn a fight they work together to focus on the largest foe\n\nPossibly... they have a Potion of Vitality\n\nDifficulty... 3075 Deadly\n\nMage\n\nAt a burial ground (it is desecrated ground)\n\nThey are chasing someone\n\nIn a fight they quickly retreat and try attacking again from range\n\nPossibly... during the fight liquid spills from somewhere\n\nDifficulty... 2300 Deadly\n\n### 1 Archer (VGtM p.210)1 Swashbuckler (VGtM p.217)\n\nAt a patch of damaged flowers and a garden of dense red flowers (there is a foul smell lingering in the air)\n\nThey are skulking\n\nIn a fight they use ranged attacks on the nearest foe\n\nPossibly... they have a set of beautifully illustrated playing cards. They depict notable recent and local personalities, monsters and deities (1000 gp)\n\nDifficulty... 2100.0 Deadly\n\nPiso franco\n\nNombre: Dolly\n\n/ChatGPT_Image_10_abr_2026_07_28_14.png)\n\nLas mentes más fuertes son aquellas capaces de sostener dos ideas opuestas sin quebrarse. (0:07) El conflicto no las destruye porque reconocen que la realidad nunca es única. La contradicción no es un error, sino una superficie bajo la cual los patrones se entrecruzan, colisionan y se fusionan.\n\nUna mente incapaz de soportar la disonancia se retrae ante la complejidad, aferrándose a la certeza más cercana y confundiendo la estabilidad con la comprensión. La fortaleza surge en la tensión, en la capacidad de observar fuerzas opuestas, de permitir que coexistan sin rendición ni supresión. Luchar con la contradicción es cultivar profundidad, extraer claridad del caos, y ver el mundo sin titubeos tal como es: fragmentado, fluido y simultáneamente verdadero de formas que la mente temerosa no puede comprender.\n\nCarcel Mamertina/Carcel%20Mamertina%202ef1744335cf801c8530d45cfcbfa9ea.md)\n\nAmfiteatro/Amfiteatro%202ef1744335cf800b9af1fe3861a5574b.md)\n\nTermas/Termas%2034a1744335cf808fac44fd66b5bd43c7.md)\n\nCuria (Senado)/Curia%20(Senado)%2034a1744335cf80399878e3cfde9c225a.md)\n\nDomus (Casas Ricas)/Domus%20(Casas%20Ricas)%2034a1744335cf8085bb77f47ecedef077.md)"}'::jsonb)
on conflict (id) do update set
  type = excluded.type,
  title = excluded.title,
  subtitle = excluded.subtitle,
  image_url = excluded.image_url,
  parent_id = excluded.parent_id,
  summary = excluded.summary,
  description = excluded.description,
  details = excluded.details,
  updated_at = now();

insert into public.lore_entries (id, type, title, subtitle, image_url, parent_id, summary, description, details)
values ('776488dc-82b3-8620-d3e8-702603e54391'::uuid, 'zone', 'Ciudad de Bronce', 'Importado de Notion', '', null, 'tholos 63 km2 7,3 km 1,8km cada zona, la del medio 3,65 km 5,48 km hora en 19 min te haces una zona 38 min la del medio en una hora y 16 min recorres de punta a punta 21 km de largo y de anch basilica de Asmodeus (M) arco de triumfo (M) taberna (M) Teatro(M) letrinas (M) amfiteatro (M) combate Circo (M) Hipodromo Agora(Comercio) (M) foro (Plaza) (M) corrales (M) establo (M) herreria (M) almacen (M) Prensa de aceite (M) horno (M) molino (M) granero (M) Insulae (B) puerto (B) templo de Tiamat(B) Columbarios de Imps...', 'tholos
63 km2
7,3 km
1,8km cada zona, la del medio 3,65 km
5,48 km hora
en 19 min te haces una zona
38 min la del medio
en una hora y 16 min recorres de punta a punta
21 km de largo y de anch
basilica de Asmodeus (M)
arco de triumfo (M)
taberna (M)
Teatro(M)
letrinas (M)
amfiteatro (M) combate
Circo (M) Hipodromo
Agora(Comercio) (M)
foro (Plaza) (M)
corrales (M)
establo (M)
herreria (M)
almacen (M)
Prensa de aceite (M)
horno (M)
molino (M)
granero (M)
Insulae = (B)
puerto (B)
templo de Tiamat(B)
Columbarios de Imps BMA
Viviendas BMA
Cultivos
Ejercito:
consules, van a nombrar a bel como dictador en el foro
pretores, justifica
ediles, abastecimiento
cuestores, recursos
censores, vigilaban
Ciudadanos:
Patricios:
Senadores y administradores
Nobilitas
Plebeyos
Libertos y esclavos
1. Murallas y Puertas
- Murallas dobles: Una externa y dos internas para reforzar la defensa.
- Torres de vigilancia cada cierta distancia, con arqueros y vigías.
- Puertas principales: Controladas por guardias armados, con registro de personas y mercancías.
- Puertas secundarias: Solo para uso militar o emergencias, muy vigiladas.
- Foso con puente levadizo: Para dificultar asedios.
2. Ciudadela o Castillo Central
- Palacio del dictador: Fortaleza imponente en el centro, símbolo de poder.
- Salón del consejo militar: Donde se toman decisiones estratégicas.
- Armería y almacenes: Para armas, armaduras y provisiones.
- Prisión política: Subterránea, para opositores y traidores.
- Torre del homenaje: Última línea defensiva en caso de ataque.
3. Barrios Internos
- Barrio noble/militar: Viviendas de oficiales, rodeadas de muros internos.
- Barrio común: Casas de artesanos, comerciantes y campesinos, más...', '{"source_path":"export-b\\D&D Inferno\\Zonas\\1st Layer Averno\\Ciudad de Bronce 2e11744335cf806dba4df45a8e0b7c2e.md","image_refs":["Ciudad de Bronce/image.png"],"imported_from":"Notion export","dm_source_markdown":"tholos\n\n63 km2\n\n7,3 km\n\n1,8km cada zona, la del medio 3,65 km\n\n5,48 km hora\n\nen 19 min te haces una zona\n\n38 min la del medio\n\nen una hora y 16 min recorres de punta a punta\n\n21 km de largo y de anch\n\nbasilica de Asmodeus (M)\narco de triumfo (M)\ntaberna (M)\nTeatro(M)\nletrinas (M)\namfiteatro (M) combate\nCirco (M) Hipodromo\nAgora(Comercio) (M)\n\nforo (Plaza) (M)\n\ncorrales (M)\nestablo (M)\nherreria (M)\nalmacen (M)\nPrensa de aceite (M)\nhorno (M)\nmolino (M)\ngranero (M)\n\nInsulae = (B)\n\npuerto (B)\ntemplo de Tiamat(B)\n\nColumbarios de Imps BMA\nViviendas BMA\n\nCultivos\n\nEjercito:\nconsules, van a nombrar a bel como dictador en el foro\n\npretores, justifica\nediles, abastecimiento\ncuestores, recursos\ncensores, vigilaban\n\nCiudadanos:\n\nPatricios:\nSenadores y administradores\nNobilitas\n\nPlebeyos\n\nLibertos y esclavos\n\n### 1. Murallas y Puertas\n\n- Murallas dobles: Una externa y dos internas para reforzar la defensa.\n- Torres de vigilancia cada cierta distancia, con arqueros y vigías.\n- Puertas principales: Controladas por guardias armados, con registro de personas y mercancías.\n- Puertas secundarias: Solo para uso militar o emergencias, muy vigiladas.\n- Foso con puente levadizo: Para dificultar asedios.\n\n---\n\n### 2. Ciudadela o Castillo Central\n\n- Palacio del dictador: Fortaleza imponente en el centro, símbolo de poder.\n- Salón del consejo militar: Donde se toman decisiones estratégicas.\n- Armería y almacenes: Para armas, armaduras y provisiones.\n- Prisión política: Subterránea, para opositores y traidores.\n- Torre del homenaje: Última línea defensiva en caso de ataque.\n\n---\n\n### 3. Barrios Internos\n\n- Barrio noble/militar: Viviendas de oficiales, rodeadas de muros internos.\n- Barrio común: Casas de artesanos, comerciantes y campesinos, más densamente poblado.\n- Mercado central: Controlado por el régimen, con impuestos y vigilancia para evitar contrabando.\n- Gremios: Talleres de herreros, carpinteros, etc., bajo supervisión militar para evitar conspiraciones.\n\n---\n\n### 4. Infraestructura Militar\n\n- Cuarteles: Grandes edificios para alojar tropas.\n- Campos de entrenamiento: Espacios abiertos para prácticas militares.\n- Torres de vigilancia internas: Para controlar la población y prevenir revueltas.\n\n---\n\n### 5. Lugares de Control Ideológico\n\n- Plaza principal: Para discursos, ejecuciones públicas y demostraciones de poder.\n- Templo o iglesia oficial: Usada para propaganda, legitimando el régimen.\n- Edificio administrativo: Para impuestos, censos y control de recursos.\n\n---\n\n### 6. Almacenes y Logística\n\n- Graneros: Para asegurar comida en caso de asedio.\n- Depósitos de agua: Pozos y cisternas dentro de la muralla.\n- Establos: Para caballería y transporte.\n\n---\n\n### 7. Periferia\n\n- Campos agrícolas: Fuera de la muralla, protegidos por patrullas.\n- Postas militares: En caminos y cruces estratégicos para vigilar movimientos.\n\n---\n\n💡 Detalles adicionales por la dictadura militar:\n\n- Toque de queda: Control estricto de horarios.\n- Guardias en cada esquina: Para mantener el orden.\n- Propaganda visual: Estandartes, símbolos del régimen en plazas y murallas.\n- Sistema de espionaje interno: Informantes entre la población.\n\nZona Rica (Acropolis)%202ef1744335cf80e999b4f2fc4ae09f61.md)\n\nZona media\n\nZona Pobre"}'::jsonb)
on conflict (id) do update set
  type = excluded.type,
  title = excluded.title,
  subtitle = excluded.subtitle,
  image_url = excluded.image_url,
  parent_id = excluded.parent_id,
  summary = excluded.summary,
  description = excluded.description,
  details = excluded.details,
  updated_at = now();

insert into public.lore_links (id, source_id, target_id, relation_label)
values ('b7fccb4b-cbb1-f2a3-43c1-a3fe42cf8b6c'::uuid, '95d13df4-5d46-b799-3bf6-cbfd1cbf0f48'::uuid, '918f00f6-4e8c-4c5b-d984-359f8d625571'::uuid, 'Mencionado en apuntes')
on conflict (source_id, target_id) do update set relation_label = excluded.relation_label;

insert into public.lore_links (id, source_id, target_id, relation_label)
values ('8684f6ce-f650-16c0-22d3-41342041ebf1'::uuid, '95d13df4-5d46-b799-3bf6-cbfd1cbf0f48'::uuid, '0a3cbb08-255f-9194-0b27-193496ff3ad4'::uuid, 'Mencionado en apuntes')
on conflict (source_id, target_id) do update set relation_label = excluded.relation_label;

insert into public.lore_links (id, source_id, target_id, relation_label)
values ('b1acfc77-d328-149b-b261-f177c61e016e'::uuid, '4c827c69-0db6-3072-b70d-a5789cd768e3'::uuid, 'ffa197a4-08bf-13af-9020-1db0a7d6a3d9'::uuid, 'Mencionado en apuntes')
on conflict (source_id, target_id) do update set relation_label = excluded.relation_label;

insert into public.lore_links (id, source_id, target_id, relation_label)
values ('3211a76b-6b02-6bd2-bd54-ea08ab67c3f0'::uuid, '2e92c44c-9746-47d1-22cb-193953bb1c50'::uuid, '776488dc-82b3-8620-d3e8-702603e54391'::uuid, 'Mencionado en apuntes')
on conflict (source_id, target_id) do update set relation_label = excluded.relation_label;

insert into public.lore_links (id, source_id, target_id, relation_label)
values ('72935fb7-ba29-e2dd-c2fb-31858fa79b2c'::uuid, 'ffa197a4-08bf-13af-9020-1db0a7d6a3d9'::uuid, '8922c75f-f1de-3908-cb4b-3ebec834c746'::uuid, 'Mencionado en apuntes')
on conflict (source_id, target_id) do update set relation_label = excluded.relation_label;

insert into public.lore_links (id, source_id, target_id, relation_label)
values ('641a0fb2-47a8-96c4-40d6-6fc521f95c1c'::uuid, '511a2dfb-d9e4-4afa-4284-0448e8c1271d'::uuid, '8922c75f-f1de-3908-cb4b-3ebec834c746'::uuid, 'Mencionado en apuntes')
on conflict (source_id, target_id) do update set relation_label = excluded.relation_label;

insert into public.lore_links (id, source_id, target_id, relation_label)
values ('d5fa755e-3f6d-1dfa-0ff4-e0fe2e3f43fe'::uuid, '41a5da18-730b-7f49-1295-1ca65161568f'::uuid, '918f00f6-4e8c-4c5b-d984-359f8d625571'::uuid, 'Mencionado en apuntes')
on conflict (source_id, target_id) do update set relation_label = excluded.relation_label;

insert into public.lore_links (id, source_id, target_id, relation_label)
values ('b82fc75a-795b-4e68-2990-0865978ea68f'::uuid, '305e75c6-d095-ebbb-73bd-587fddbb7101'::uuid, '8922c75f-f1de-3908-cb4b-3ebec834c746'::uuid, 'Mencionado en apuntes')
on conflict (source_id, target_id) do update set relation_label = excluded.relation_label;

insert into public.lore_links (id, source_id, target_id, relation_label)
values ('2f47dc99-b637-9e21-cd47-9483574cd5b6'::uuid, '874b8fe4-35de-0ba6-4699-aab25b173d0b'::uuid, '8922c75f-f1de-3908-cb4b-3ebec834c746'::uuid, 'Mencionado en apuntes')
on conflict (source_id, target_id) do update set relation_label = excluded.relation_label;

insert into public.lore_links (id, source_id, target_id, relation_label)
values ('d49b1b62-18f6-73d1-89f2-c77b918307cb'::uuid, '874b8fe4-35de-0ba6-4699-aab25b173d0b'::uuid, 'c970bfc5-584e-578e-cbbe-6da7c60e442f'::uuid, 'Mencionado en apuntes')
on conflict (source_id, target_id) do update set relation_label = excluded.relation_label;

insert into public.lore_links (id, source_id, target_id, relation_label)
values ('7a269615-6293-f09e-394c-64f85e000427'::uuid, '094b8d5f-4cce-7432-c408-5ffd41b38fd8'::uuid, 'b113f19e-b3c5-6f02-c9fc-a5d74bf6ea18'::uuid, 'Mencionado en apuntes')
on conflict (source_id, target_id) do update set relation_label = excluded.relation_label;

insert into public.lore_links (id, source_id, target_id, relation_label)
values ('008df88c-0162-cc2d-a6fa-3720f44d8df1'::uuid, '10b62424-6aa9-491e-223e-c75a11717554'::uuid, '918f00f6-4e8c-4c5b-d984-359f8d625571'::uuid, 'Mencionado en apuntes')
on conflict (source_id, target_id) do update set relation_label = excluded.relation_label;

insert into public.lore_links (id, source_id, target_id, relation_label)
values ('0f053e7c-9bff-8d2f-6734-9c844d8a3d4f'::uuid, '2e7ddf5a-db81-21b8-2ece-287db1b644b2'::uuid, 'ffa197a4-08bf-13af-9020-1db0a7d6a3d9'::uuid, 'Mencionado en apuntes')
on conflict (source_id, target_id) do update set relation_label = excluded.relation_label;

insert into public.lore_links (id, source_id, target_id, relation_label)
values ('6933aa35-3760-3cf4-328c-cc611fcb70ea'::uuid, 'c970bfc5-584e-578e-cbbe-6da7c60e442f'::uuid, '2e92c44c-9746-47d1-22cb-193953bb1c50'::uuid, 'Mencionado en apuntes')
on conflict (source_id, target_id) do update set relation_label = excluded.relation_label;

insert into public.lore_links (id, source_id, target_id, relation_label)
values ('00d198c3-1063-a33b-6c4f-f0d48f56491d'::uuid, '3908e4a8-86bf-60f7-5d17-946f2417f726'::uuid, 'ffa197a4-08bf-13af-9020-1db0a7d6a3d9'::uuid, 'Mencionado en apuntes')
on conflict (source_id, target_id) do update set relation_label = excluded.relation_label;

insert into public.lore_links (id, source_id, target_id, relation_label)
values ('05727c02-9664-62b3-9594-2f2b346fc0f5'::uuid, '3908e4a8-86bf-60f7-5d17-946f2417f726'::uuid, '8922c75f-f1de-3908-cb4b-3ebec834c746'::uuid, 'Mencionado en apuntes')
on conflict (source_id, target_id) do update set relation_label = excluded.relation_label;

insert into public.lore_links (id, source_id, target_id, relation_label)
values ('2fcefa34-2572-f4eb-6407-b9f8fe7baa4a'::uuid, '3908e4a8-86bf-60f7-5d17-946f2417f726'::uuid, '0a3cbb08-255f-9194-0b27-193496ff3ad4'::uuid, 'Mencionado en apuntes')
on conflict (source_id, target_id) do update set relation_label = excluded.relation_label;

insert into public.lore_links (id, source_id, target_id, relation_label)
values ('02604c3f-7191-d4a7-4f7d-b821d2c39361'::uuid, '776488dc-82b3-8620-d3e8-702603e54391'::uuid, '918f00f6-4e8c-4c5b-d984-359f8d625571'::uuid, 'Mencionado en apuntes')
on conflict (source_id, target_id) do update set relation_label = excluded.relation_label;

insert into public.lore_links (id, source_id, target_id, relation_label)
values ('99951a0c-2802-9e31-0c86-4ce6467463b5'::uuid, '776488dc-82b3-8620-d3e8-702603e54391'::uuid, 'ffffee00-ef2b-257c-77df-89e8422faa8c'::uuid, 'Mencionado en apuntes')
on conflict (source_id, target_id) do update set relation_label = excluded.relation_label;

insert into public.lore_links (id, source_id, target_id, relation_label)
values ('f2395e0c-c569-0181-f60f-5088e4bad889'::uuid, '776488dc-82b3-8620-d3e8-702603e54391'::uuid, '852ebe74-1865-e8e7-25fb-7b05bf42d162'::uuid, 'Mencionado en apuntes')
on conflict (source_id, target_id) do update set relation_label = excluded.relation_label;

insert into public.lore_links (id, source_id, target_id, relation_label)
values ('0bed8daf-ccb4-b70b-5d5f-4b10a27be82d'::uuid, '2e92c44c-9746-47d1-22cb-193953bb1c50'::uuid, '95d13df4-5d46-b799-3bf6-cbfd1cbf0f48'::uuid, 'Contiene')
on conflict (source_id, target_id) do update set relation_label = excluded.relation_label;

insert into public.lore_links (id, source_id, target_id, relation_label)
values ('7eff7491-95a3-3d90-1348-13380368d792'::uuid, '2e92c44c-9746-47d1-22cb-193953bb1c50'::uuid, '4c827c69-0db6-3072-b70d-a5789cd768e3'::uuid, 'Contiene')
on conflict (source_id, target_id) do update set relation_label = excluded.relation_label;

insert into public.lore_links (id, source_id, target_id, relation_label)
values ('5f6775e2-d267-c80b-4304-9341a4ab9324'::uuid, '2e92c44c-9746-47d1-22cb-193953bb1c50'::uuid, '47d43de6-13cf-eba3-71a2-df304c9fdb23'::uuid, 'Contiene')
on conflict (source_id, target_id) do update set relation_label = excluded.relation_label;

insert into public.lore_links (id, source_id, target_id, relation_label)
values ('a1294393-f78c-884e-7a7b-48399533ce32'::uuid, '511a2dfb-d9e4-4afa-4284-0448e8c1271d'::uuid, 'ffa197a4-08bf-13af-9020-1db0a7d6a3d9'::uuid, 'Contiene')
on conflict (source_id, target_id) do update set relation_label = excluded.relation_label;

insert into public.lore_links (id, source_id, target_id, relation_label)
values ('539fd93a-5696-d5ac-43af-58261a134b79'::uuid, '511a2dfb-d9e4-4afa-4284-0448e8c1271d'::uuid, '0a3cbb08-255f-9194-0b27-193496ff3ad4'::uuid, 'Contiene')
on conflict (source_id, target_id) do update set relation_label = excluded.relation_label;

insert into public.lore_links (id, source_id, target_id, relation_label)
values ('9f663d59-1f5b-da96-1520-c75843e38ccd'::uuid, '776488dc-82b3-8620-d3e8-702603e54391'::uuid, '1af8b8d3-e920-411e-6378-943fb5950ad3'::uuid, 'Contiene')
on conflict (source_id, target_id) do update set relation_label = excluded.relation_label;

insert into public.lore_links (id, source_id, target_id, relation_label)
values ('abfb7723-4621-4780-215c-494ace160452'::uuid, '77bee61b-cf89-7745-161e-2fdf5a01bafa'::uuid, '852ebe74-1865-e8e7-25fb-7b05bf42d162'::uuid, 'Contiene')
on conflict (source_id, target_id) do update set relation_label = excluded.relation_label;

insert into public.lore_links (id, source_id, target_id, relation_label)
values ('630cadf3-8246-25d9-21c2-2e7998954a37'::uuid, '3908e4a8-86bf-60f7-5d17-946f2417f726'::uuid, 'c970bfc5-584e-578e-cbbe-6da7c60e442f'::uuid, 'Contiene')
on conflict (source_id, target_id) do update set relation_label = excluded.relation_label;

insert into public.lore_links (id, source_id, target_id, relation_label)
values ('f19bb503-e858-656e-52a5-dfec07111a05'::uuid, '3908e4a8-86bf-60f7-5d17-946f2417f726'::uuid, '070314cf-8db1-81ab-b5ad-83ce127eb307'::uuid, 'Contiene')
on conflict (source_id, target_id) do update set relation_label = excluded.relation_label;

insert into public.lore_links (id, source_id, target_id, relation_label)
values ('8a804ec6-d08c-1444-eb96-5ad2846fb979'::uuid, '77bee61b-cf89-7745-161e-2fdf5a01bafa'::uuid, '3908e4a8-86bf-60f7-5d17-946f2417f726'::uuid, 'Contiene')
on conflict (source_id, target_id) do update set relation_label = excluded.relation_label;

insert into public.lore_links (id, source_id, target_id, relation_label)
values ('fa83f2cc-4a2e-c13c-f3a7-cf6522fa8eea'::uuid, '77bee61b-cf89-7745-161e-2fdf5a01bafa'::uuid, 'e7a64f0b-2d35-3706-9bb4-e9a1f655f97e'::uuid, 'Contiene')
on conflict (source_id, target_id) do update set relation_label = excluded.relation_label;

insert into public.lore_links (id, source_id, target_id, relation_label)
values ('da9affbd-c217-5446-56c2-5a8f06fd8a80'::uuid, '77bee61b-cf89-7745-161e-2fdf5a01bafa'::uuid, 'c5083902-0d8d-1a5a-846e-f6bac835c542'::uuid, 'Contiene')
on conflict (source_id, target_id) do update set relation_label = excluded.relation_label;

insert into public.lore_links (id, source_id, target_id, relation_label)
values ('b3de656a-2d6f-d832-aa55-6a4cf246b07b'::uuid, '776488dc-82b3-8620-d3e8-702603e54391'::uuid, '77bee61b-cf89-7745-161e-2fdf5a01bafa'::uuid, 'Contiene')
on conflict (source_id, target_id) do update set relation_label = excluded.relation_label;

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('5586ee86-c78e-6406-224a-26a7823d2648'::uuid, 1, 'Hambre 1: Un trozo de metal', 'La maldicion exige un trozo de metal antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('3ba74cc8-52a6-f88f-4137-ecdf36a17830'::uuid, 2, 'Hambre 2: Un clavo', 'La maldicion exige un clavo antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', 'Corazón de un animal aún latiendo')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('1f186312-1df4-97bd-eb89-4b47313eda17'::uuid, 3, 'Hambre 3: Un botón', 'La maldicion exige un botón antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('31846122-be2f-6dd2-3427-1beb74dc1810'::uuid, 4, 'Hambre 4: Un pelo', 'La maldicion exige un pelo antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('88847e1d-7ec4-0fc9-cef6-229b92803913'::uuid, 5, 'Hambre 5: Un insectoide', 'La maldicion exige un insectoide antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('ced35f25-a3a6-4994-fd07-9398bf612211'::uuid, 6, 'Hambre 6: Un imp', 'La maldicion exige un imp antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('d2d2e1f0-e9b2-f324-47e8-52a9a942b57c'::uuid, 7, 'Hambre 7: Una pluma ', 'La maldicion exige una pluma  antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('18ec8799-4cee-ec73-b7f5-ff827145081d'::uuid, 8, 'Hambre 8: Restos de cera de la oreja', 'La maldicion exige restos de cera de la oreja antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('a43fad76-17b9-14be-f39f-72731a1b4ef4'::uuid, 9, 'Hambre 9: Un hueso', 'La maldicion exige un hueso antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', 'No  hace falta que comas nada')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('0832d2a6-8f5f-6231-2237-aa592bc1c29c'::uuid, 10, 'Hambre 10: Un trozo de cuero', 'La maldicion exige un trozo de cuero antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', 'Debes de comer el objeto antes de finalizar la sesión')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('e1e2dc30-1d11-3120-5031-224b9af0278c'::uuid, 11, 'Hambre 11: Una hoja de planta', 'La maldicion exige una hoja de planta antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('e0137ce9-e4a4-2d53-c538-85295753f50f'::uuid, 12, 'Hambre 12: Un diente', 'La maldicion exige un diente antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('2571cfb7-bdbe-4de4-3711-5742115d573f'::uuid, 13, 'Hambre 13: Tierra', 'La maldicion exige tierra antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('45357a9d-73ab-4ff5-3f02-4a2523d89500'::uuid, 14, 'Hambre 14: Una piedra', 'La maldicion exige una piedra antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('efb6faed-a6e6-bae0-c6ef-fb4fa32f3643'::uuid, 15, 'Hambre 15: Agua', 'La maldicion exige agua antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('19b1a4c1-3356-e426-5364-a26ad122cce8'::uuid, 16, 'Hambre 16: Un hilo', 'La maldicion exige un hilo antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('aa023931-d37f-af23-4781-38de3ddecdfc'::uuid, 17, 'Hambre 17: Un fragmento de cristal', 'La maldicion exige un fragmento de cristal antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('5901cf31-57ba-721c-4925-6f491e7082cc'::uuid, 18, 'Hambre 18: Un trozo de piel', 'La maldicion exige un trozo de piel antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('78baad5e-29e9-bae5-adcd-00e53ee42767'::uuid, 19, 'Hambre 19: Arena', 'La maldicion exige arena antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('e622daeb-e956-28f6-94b4-81b0c82d8693'::uuid, 20, 'Hambre 20: Un poco de ceniza', 'La maldicion exige un poco de ceniza antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('0d3cc747-46a8-5b33-22cf-64ddb05ec3be'::uuid, 21, 'Hambre 21: Una vela', 'La maldicion exige una vela antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('3120123f-3161-fe35-49a7-6696ed24871b'::uuid, 22, 'Hambre 22: Una cadena', 'La maldicion exige una cadena antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('9c031403-fb4a-ad27-12d5-a4843ff6e725'::uuid, 23, 'Hambre 23: Una moneda', 'La maldicion exige una moneda antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('44352efc-a6c6-f079-759b-e9d1f0b5acbb'::uuid, 24, 'Hambre 24: Una rama', 'La maldicion exige una rama antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('e0e42214-70d2-b732-bdf9-0ea442403059'::uuid, 25, 'Hambre 25: Trozo de pergamino', 'La maldicion exige trozo de pergamino antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('a7f1ce94-0918-c305-fa4c-211d6f9d7120'::uuid, 26, 'Hambre 26: Una semilla', 'La maldicion exige una semilla antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('8cea3eeb-db85-5edb-a570-48541a38df10'::uuid, 27, 'Hambre 27: Un calcetín', 'La maldicion exige un calcetín antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('7d976fe5-c675-5ed0-ba3b-ac06f6ffa8f3'::uuid, 28, 'Hambre 28: Un ragmento de una espada rota', 'La maldicion exige un ragmento de una espada rota antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('675e3fb7-18cf-4fec-a7b1-42485413c443'::uuid, 29, 'Hambre 29: Grasa animal', 'La maldicion exige grasa animal antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('fcedac60-8338-a03a-00ef-30d42eff9d9d'::uuid, 30, 'Hambre 30: Un pedazo de pan', 'La maldicion exige un pedazo de pan antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('c95287d1-2d06-d4f8-9a49-5e1a8351f4d4'::uuid, 31, 'Hambre 31: Un trozo de ropa', 'La maldicion exige un trozo de ropa antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('45a4b4ea-f35b-91eb-55d4-643bcc7adf5c'::uuid, 32, 'Hambre 32: Un resto de cuerda', 'La maldicion exige un resto de cuerda antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('108315ff-1c75-734d-7e07-84a077d9ac2a'::uuid, 33, 'Hambre 33: Una astilla', 'La maldicion exige una astilla antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('4c4a46c6-b79e-919f-e0c2-d7a1f6ef581a'::uuid, 34, 'Hambre 34: Una antorcha', 'La maldicion exige una antorcha antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('5c5a7a1c-efeb-3e5e-6b26-17f5268b5a3a'::uuid, 35, 'Hambre 35: Una llave', 'La maldicion exige una llave antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('194cd86f-246b-ca48-9bea-b734f9701152'::uuid, 36, 'Hambre 36: Una calavera', 'La maldicion exige una calavera antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('45b26502-b069-f55f-715b-03cbede8ddd7'::uuid, 37, 'Hambre 37: Una oreja', 'La maldicion exige una oreja antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('830cc5fe-b949-2041-30e1-5359d7d1b1cb'::uuid, 38, 'Hambre 38: Restos de carbón', 'La maldicion exige restos de carbón antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('2ccd668d-2192-35dd-ed7d-a010d7d07428'::uuid, 39, 'Hambre 39: Lodo', 'La maldicion exige lodo antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('d6beecd2-879b-c2df-ffee-6d6172293660'::uuid, 40, 'Hambre 40: Un componente material de hechizo', 'La maldicion exige un componente material de hechizo antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('70225c51-4e3b-808b-817d-a4e7d0a6ebcc'::uuid, 41, 'Hambre 41: Restos de tinta', 'La maldicion exige restos de tinta antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('2d78bee1-d843-ca3a-89d7-390376d50bd4'::uuid, 42, 'Hambre 42: Un casco', 'La maldicion exige un casco antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('48dca38c-2927-4515-4382-2dabe74bfec1'::uuid, 43, 'Hambre 43: Un escudo', 'La maldicion exige un escudo antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('b5a59acb-62d9-5a57-1b95-ec98c73b9ae9'::uuid, 44, 'Hambre 44: Una lengua', 'La maldicion exige una lengua antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('44a86607-ccbf-7983-f7d5-da55070b971e'::uuid, 45, 'Hambre 45: Un ojo', 'La maldicion exige un ojo antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('f72b73db-0c25-451e-aab7-01a92413c036'::uuid, 46, 'Hambre 46: Un sorbo de angre', 'La maldicion exige un sorbo de angre antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('f80d18bd-958c-ca63-0f21-8ed66d186fde'::uuid, 47, 'Hambre 47: Raciones de viaje comunes', 'La maldicion exige raciones de viaje comunes antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('d52b026f-263b-ae1a-6ae9-9863d2143601'::uuid, 48, 'Hambre 48: Una daga', 'La maldicion exige una daga antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('31bdff1c-57f3-4c9c-a8dd-2cac2facb634'::uuid, 49, 'Hambre 49: Una uña', 'La maldicion exige una uña antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('b5aeed6a-8f80-008f-6331-ed37496806ce'::uuid, 50, 'Hambre 50: Brasas', 'La maldicion exige brasas antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('0f73b44b-79a1-9ef7-7c70-77841c09bc7a'::uuid, 51, 'Hambre 51: Tierra de una tumba', 'La maldicion exige tierra de una tumba antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('9df68e4e-5b01-3dd3-3d88-44cd07cf35eb'::uuid, 52, 'Hambre 52: Agua bendita', 'La maldicion exige agua bendita antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('558532f3-ab79-f816-087a-2d5cf3511d0f'::uuid, 53, 'Hambre 53: Iconografía demoníaca', 'La maldicion exige iconografía demoníaca antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('2a0f1262-5665-b739-ce40-0dc624050e56'::uuid, 54, 'Hambre 54: Un trozo de azufre', 'La maldicion exige un trozo de azufre antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('8fcd86a7-5d48-137e-7189-ad5e6062a29b'::uuid, 55, 'Hambre 55: Un cabello de un mago', 'La maldicion exige un cabello de un mago antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('df2c0163-74f8-b57e-a9f2-3c8a56d28337'::uuid, 56, 'Hambre 56: Un trozo de metal oxidado', 'La maldicion exige un trozo de metal oxidado antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('461da000-a013-34aa-edf1-d80511277bfe'::uuid, 57, 'Hambre 57: Restos de una ofrenda', 'La maldicion exige restos de una ofrenda antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('89350653-bff3-234f-8990-ee57ea9685bc'::uuid, 58, 'Hambre 58: Una gota de sudor', 'La maldicion exige una gota de sudor antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('ecb7b036-65b4-9389-2676-78a5c0235635'::uuid, 59, 'Hambre 59: Agua del río Styx', 'La maldicion exige agua del río styx antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('9152b653-31c7-414e-3bdf-f7f21856d1f6'::uuid, 60, 'Hambre 60: Restos de una pócima mágica', 'La maldicion exige restos de una pócima mágica antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'menor', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('e200b398-76aa-d970-a86e-5169e8f9e1da'::uuid, 61, 'Hambre 61: Un ala', 'La maldicion exige un ala antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'media', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('7af21abc-fd42-795d-1703-8e84fee5e20f'::uuid, 62, 'Hambre 62: Una espina', 'La maldicion exige una espina antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'media', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('5ab2855d-ec69-cf91-3071-a55bbb8d96f1'::uuid, 63, 'Hambre 63: Un hilo rojo', 'La maldicion exige un hilo rojo antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'media', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('d183d8d5-7d43-69cb-9e09-4b0ec19fb8a7'::uuid, 64, 'Hambre 64: Restos de un ritual', 'La maldicion exige restos de un ritual antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'media', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('aed1d3e0-a55b-4ffe-2873-1acf40bf659c'::uuid, 65, 'Hambre 65: Una daga oxidada con manchas de sangre', 'La maldicion exige una daga oxidada con manchas de sangre antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'media', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('70091297-a912-d88f-2465-73ff05bcfeb0'::uuid, 66, 'Hambre 66: Una lágrima humana', 'La maldicion exige una lágrima humana antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'media', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('fb15efe8-9420-9d1c-8e71-f988c6d47757'::uuid, 67, 'Hambre 67: Una moneda bañada en sangre', 'La maldicion exige una moneda bañada en sangre antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'media', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('b432cddc-302e-31fb-f1b0-2825eaddd464'::uuid, 68, 'Hambre 68: Restos de un animal sacrificado', 'La maldicion exige restos de un animal sacrificado antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'media', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('bbbcc9f2-60ec-4148-fabc-3d8035e7dac4'::uuid, 69, 'Hambre 69: Un cabello de un noble', 'La maldicion exige un cabello de un noble antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'media', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('d24cb91c-4457-2d9b-988f-51a9d9cbacc5'::uuid, 70, 'Hambre 70: Fragmento de estatua', 'La maldicion exige fragmento de estatua antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'media', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('7e5432fe-6857-2103-e368-b2d7bc532371'::uuid, 71, 'Hambre 71: Una campana', 'La maldicion exige una campana antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'media', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('0cecb909-722f-d679-745f-89ba5a8a3536'::uuid, 72, 'Hambre 72: El aliento de alguien capturado en un frasco', 'La maldicion exige el aliento de alguien capturado en un frasco antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'media', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('5ba94908-7925-0342-3f79-7123a89606eb'::uuid, 73, 'Hambre 73: Un tiefling', 'La maldicion exige un tiefling antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'media', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('58a05a21-9722-a1f3-aebd-00297b5da552'::uuid, 74, 'Hambre 74: Restos de un sueño escrito en un papel', 'La maldicion exige restos de un sueño escrito en un papel antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'media', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('d7778360-b433-8e35-f2ae-ed6c39bb13e2'::uuid, 75, 'Hambre 75: Un pergamino con un hechizo de nivel bajo', 'La maldicion exige un pergamino con un hechizo de nivel bajo antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'media', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('c902a316-a151-0f27-e0a0-5124a9d61e55'::uuid, 76, 'Hambre 76: Un trozo de armadura forjada por ti y usada en combate', 'La maldicion exige un trozo de armadura forjada por ti y usada en combate antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'media', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('f6e11829-ed54-12d3-33f4-5fdbdb9117a7'::uuid, 77, 'Hambre 77: Corazón de un animal aún latiendo', 'La maldicion exige corazón de un animal aún latiendo antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'media', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('79bfba10-cc1b-45a5-a814-ed35b1cf0258'::uuid, 78, 'Hambre 78: Un ojo intacto', 'La maldicion exige un ojo intacto antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'media', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('91341d7f-15cd-d3f4-3e99-2416b85b45cd'::uuid, 79, 'Hambre 79: Un dado', 'La maldicion exige un dado antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'media', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('2be357d0-ad07-aae4-0640-baf647642690'::uuid, 80, 'Hambre 80: Un colgante', 'La maldicion exige un colgante antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'media', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('781fe5cd-f99f-085b-466c-0b30b609cd2d'::uuid, 81, 'Hambre 81: Una vela negra', 'La maldicion exige una vela negra antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'media', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('9d1ee595-2808-e00c-3d00-62f159bd53c1'::uuid, 82, 'Hambre 82: Un silbato', 'La maldicion exige un silbato antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'media', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('e71eb8aa-a636-bdc8-8084-110b685f562c'::uuid, 83, 'Hambre 83: Una espina dorsal', 'La maldicion exige una espina dorsal antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'media', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('be2f2770-4749-3a41-82e0-d1eb04eda300'::uuid, 84, 'Hambre 84: Un juguete', 'La maldicion exige un juguete antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'media', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('7780fe41-1893-4065-4191-1f52ebb2c94f'::uuid, 85, 'Hambre 85: Una garra', 'La maldicion exige una garra antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'media', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('bbbd82fc-b75c-35e1-b56b-378ae2f2bd7b'::uuid, 86, 'Hambre 86: La alma de un pecador', 'La maldicion exige la alma de un pecador antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'alta', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('038e1153-d20e-765c-012a-86ab42326560'::uuid, 87, 'Hambre 87: Un contrato infernal quemado', 'La maldicion exige un contrato infernal quemado antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'alta', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('1a77bd45-c04b-7f45-fb87-5517bd66b458'::uuid, 88, 'Hambre 88: El eco de un grito', 'La maldicion exige el eco de un grito antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'alta', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('86f52b73-a207-e646-1d5c-15f50cbd3c17'::uuid, 89, 'Hambre 89: Una sombra atrapada', 'La maldicion exige una sombra atrapada antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'alta', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('1aa67cc7-f2f2-417d-8d13-b375c12c5fd1'::uuid, 90, 'Hambre 90: El nombre verdadero de un demonio escrito en pergamino', 'La maldicion exige el nombre verdadero de un demonio escrito en pergamino antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'alta', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('952c4420-3675-46f1-0025-04ca0930dd81'::uuid, 91, 'Hambre 91: La ilusión de un niño', 'La maldicion exige la ilusión de un niño antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'alta', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('8731f2cc-966a-a8c6-c593-6052ea6e95cb'::uuid, 92, 'Hambre 92: El aliento de alguien capturado en un frasco', 'La maldicion exige el aliento de alguien capturado en un frasco antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'alta', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('e848fb62-00d3-b046-ee20-96c052b578aa'::uuid, 93, 'Hambre 93: Un mechón de barba de enano quemado', 'La maldicion exige un mechón de barba de enano quemado antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'alta', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('b7dd23bd-035f-4372-6a69-9912e52e51b4'::uuid, 94, 'Hambre 94: Sangre de un dragón (una gota)', 'La maldicion exige sangre de un dragón (una gota) antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'alta', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('07ec33c4-a888-4581-1bec-0758d29c1164'::uuid, 95, 'Hambre 95: Un libro con anotaciones arcanas', 'La maldicion exige un libro con anotaciones arcanas antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'alta', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('c9d4f2b5-7efd-bd4d-78e9-60910cb157f2'::uuid, 96, 'Hambre 96: Cabello de un archimago', 'La maldicion exige cabello de un archimago antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'alta', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('6403fa18-fc6f-99ce-413c-ba2a55c678ef'::uuid, 97, 'Hambre 97: El último suspiro de un moribundo', 'La maldicion exige el último suspiro de un moribundo antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'abisal', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('56f37976-ab3a-42d4-528a-2536cf4b3884'::uuid, 98, 'Hambre 98: Una lágrima de demonio', 'La maldicion exige una lágrima de demonio antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'abisal', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('91da27d5-24cf-f5ff-f9fd-abd903e64b07'::uuid, 99, 'Hambre 99: Una carta tocada por un archiduque', 'La maldicion exige una carta tocada por un archiduque antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'abisal', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

insert into public.hunger_table_entries (id, roll, title, effect, severity, source_note)
values ('960dc8e0-af0d-a5ed-52d6-770408ebdfa0'::uuid, 100, 'Hambre 100: Un pergamino con un hechizo de nivel alto', 'La maldicion exige un pergamino con un hechizo de nivel alto antes de cerrar la sesion. Si el personaje no lo entrega o lo devora, el DM puede sumar stress, imponer desventaja narrativa o despertar una marca infernal.', 'abisal', '')
on conflict (roll) do update set
  title = excluded.title,
  effect = excluded.effect,
  severity = excluded.severity,
  source_note = excluded.source_note,
  updated_at = now();

commit;