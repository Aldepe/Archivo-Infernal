import { SUPABASE_ANON_KEY, SUPABASE_URL } from "./config.js";
import { createClient } from "https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2.106.2/+esm";

const app = document.querySelector("#app");
const hasSupabase = Boolean(SUPABASE_URL && SUPABASE_ANON_KEY && SUPABASE_URL.startsWith("https://"));
const supabase = hasSupabase ? createClient(SUPABASE_URL, SUPABASE_ANON_KEY) : null;

const DEMO_DATA_KEY = "archivo-infernal-demo-data-v7";
const DEMO_SESSION_KEY = "archivo-infernal-demo-session-v2";
const UI_STATE_KEY = "archivo-infernal-ui-state-v1";
const CRAFTING_STATE_KEY = "archivo-infernal-crafting-v1";
const IMAGE_BUCKET = "campaign-images";

const loreTypes = {
  all: { label: "Todo", icon: "library" },
  folder: { label: "Carpetas", singular: "Carpeta", icon: "folder" },
  religion: { label: "Religiones", singular: "Religion", icon: "flame" },
  zone: { label: "Zonas", singular: "Zona", icon: "map" },
  faction: { label: "Facciones", singular: "Faccion", icon: "shield" },
  character: { label: "Personajes", singular: "Personaje", icon: "user-round" },
  other: { label: "Otros", singular: "Otro", icon: "package-open" },
};

const navItems = [
  { id: "timeline", label: "Linea temporal", icon: "git-commit-horizontal" },
  { id: "lore", label: "Lore", icon: "book-open" },
  { id: "notes", label: "Apuntes", icon: "notebook-pen" },
  { id: "stats", label: "Stats", icon: "heart-pulse", playerOnly: true },
  { id: "inventory", label: "Inventario", icon: "backpack" },
  { id: "contracts", label: "Pactos", icon: "scroll-text" },
  { id: "shop", label: "Bazar", icon: "store" },
  { id: "crafting", label: "Crafting", icon: "hammer" },
  { id: "hunger", label: "Hambre", icon: "bone", gated: true },
  { id: "infiltration", label: "Red de Sombras", icon: "eye-off", secret: true },
  { id: "battlefield", label: "Campo batalla", icon: "swords" },
  { id: "dice", label: "Dados", icon: "dice-6" },
  { id: "dm", label: "Mesa del DM", icon: "dice-4", dmOnly: true },
];

const infiltrationClueStates = ["oculta", "rumor", "parcial", "confirmada", "falsa", "peligrosa", "revelada"];
const infiltrationRouteStates = ["desconocida", "rumor", "investigada", "confirmada", "preparada", "disponible", "usada", "comprometida", "cerrada"];
const infiltrationInformantStates = ["no_reclutado", "contactado", "reclutado", "quemado", "muerto", "traidor", "desaparecido"];
const infiltrationAccessStates = ["bloqueado", "parcial", "accesible", "peligroso", "comprometido"];
const infiltrationSkillOptions = [
  "Persuasion",
  "Engano",
  "Intimidacion",
  "Sigilo",
  "Investigacion",
  "Percepcion",
  "Perspicacia",
  "Arcana",
  "Historia",
  "Religion",
  "Supervivencia",
  "Juego de manos",
  "Herramientas de ladron",
  "Kit de disfraz",
  "Kit de falsificacion",
  "Herramientas de alquimista",
  "Acrobacias",
  "Atletismo",
  "Constitucion",
];

const infiltrationDcOptions = [
  { value: 10, label: "Facil CD 10" },
  { value: 15, label: "Media CD 15" },
  { value: 18, label: "Dificil CD 18" },
  { value: 22, label: "Muy dificil CD 22" },
  { value: 25, label: "Infernal CD 25" },
];

const infiltrationActionTemplates = [
  { id: "gather-rumors", label: "Recopilar rumores", skill: "Investigacion", dc: 15, risk: "Medio", cost: "1 tiempo", location: "callejones", unlocks: ["rutas-alt-rumor"] },
  { id: "recruit-informant", label: "Reclutar informador", skill: "Persuasion", dc: 15, risk: "Variable", cost: "oro o favor", location: "tabernas", unlocks: ["contacto-fiable"] },
  { id: "bribe-guard", label: "Sobornar a un guardia", skill: "Engano", dc: 18, risk: "Alto", cost: "oro + sospecha guardias", location: "limes-bajo-medio", unlocks: ["sobornos-limes"] },
  { id: "watch-checkpoint", label: "Observar un Limes", skill: "Percepcion", dc: 15, risk: "Medio", cost: "1 tiempo", location: "limes-medio-alto", unlocks: ["limes-hechizos"] },
  { id: "steal-transit-permit", label: "Robar permiso de transito", skill: "Juego de manos", dc: 18, risk: "Alto", cost: "equipo", location: "archivo", unlocks: ["permiso-transito"] },
  { id: "forge-documents", label: "Comprar o falsificar documentos", skill: "Kit de falsificacion", dc: 18, risk: "Medio", cost: "oro + documento", location: "mercado-permisos", unlocks: ["documentos-falsos"] },
  { id: "explore-sewers", label: "Explorar Cloaca Maxima", skill: "Supervivencia", dc: 15, risk: "Fisico", cost: "tiempo + equipo", location: "cloaca", unlocks: ["ruta-cloaca"] },
  { id: "explore-catacombs", label: "Explorar catacumbas", skill: "Religion", dc: 18, risk: "Maldicion", cost: "tiempo", location: "catacumbas", unlocks: ["ruta-catacumbas"] },
  { id: "noble-party", label: "Espiar mascarada noble", skill: "Engano", dc: 18, risk: "Social", cost: "cobertura", location: "barrio-noble", unlocks: ["pasaje-noble"] },
  { id: "infiltrate-tiamat", label: "Infiltrarse en el templo de Tiamat", skill: "Religion", dc: 22, risk: "Infernal", cost: "cobertura + hechizo", location: "templo-tiamat", unlocks: ["culto-tiamat"] },
  { id: "move-allies", label: "Mover aliados entre zonas", skill: "Sigilo", dc: 18, risk: "Critico", cost: "ruta preparada", location: "zona-alta", unlocks: ["extraccion"] },
  { id: "create-distraction", label: "Crear una distraccion", skill: "Intimidacion", dc: 15, risk: "Ruidoso", cost: "favor o equipo", location: "plaza-coronacion", unlocks: ["ventana-caos"] },
];

const statMeta = {
  hp_current: { label: "HP", icon: "heart-pulse", tone: "life" },
  hp_max: { label: "HP max", icon: "heart", tone: "life" },
  stress: { label: "Stress", icon: "flame", tone: "danger" },
  ac: { label: "AC", icon: "shield", tone: "guard" },
  passive_perception: { label: "PP", icon: "eye", tone: "sense" },
  passive_investigation: { label: "P. Inv", icon: "search", tone: "sense" },
  passive_insight: { label: "P. Ins", icon: "brain", tone: "sense" },
  rations: { label: "Raciones", icon: "wheat", tone: "supply" },
  water: { label: "Agua", icon: "droplets", tone: "supply" },
  inspiration: { label: "Inspiracion", icon: "sparkles", tone: "magic" },
  exhaustion: { label: "Exhaustion", icon: "battery-low", tone: "danger" },
};

const detailMeta = {
  status: { label: "Estado", icon: "activity" },
  race: { label: "Raza", icon: "sparkles" },
  age: { label: "Edad", icon: "hourglass" },
  role: { label: "Rol", icon: "badge" },
  pronouns: { label: "Pronombres", icon: "message-circle" },
  faction: { label: "Faccion", icon: "shield" },
  religion: { label: "Religion", icon: "flame" },
  location: { label: "Localizacion", icon: "map-pin" },
  class_role: { label: "Clase", icon: "swords" },
  occupation: { label: "Oficio", icon: "briefcase" },
  voice: { label: "Voz", icon: "audio-lines" },
  ideals: { label: "Ideales", icon: "sparkles" },
  flaws: { label: "Defectos", icon: "badge-alert" },
  secrets: { label: "Secretos", icon: "lock-keyhole" },
  domain_agenda: { label: "Dominio / agenda", icon: "target" },
  symbol: { label: "Simbolo", icon: "badge" },
  headquarters: { label: "Sede", icon: "landmark" },
  hierarchy: { label: "Jerarquia", icon: "network" },
  methods: { label: "Metodos", icon: "fingerprint" },
  uniforms: { label: "Marcas", icon: "badge-check" },
  laws: { label: "Leyes", icon: "scroll-text" },
  danger_level: { label: "Peligro", icon: "triangle-alert" },
  climate: { label: "Clima", icon: "cloud-sun" },
  appearance: { label: "Apariencia", icon: "eye" },
  personality: { label: "Personalidad", icon: "brain" },
  motives: { label: "Motivaciones", icon: "goal" },
  alliances: { label: "Alianzas", icon: "handshake" },
  resources: { label: "Recursos", icon: "gem" },
  buffs: { label: "Buffos", icon: "sparkles" },
  debuffs: { label: "Debuffos", icon: "badge-alert" },
  combat_conditions: { label: "Condiciones", icon: "shield-alert" },
  tool_proficiencies: { label: "Herramientas", icon: "wrench" },
  doctrine: { label: "Doctrina", icon: "book-open" },
  rites: { label: "Ritos", icon: "flame-kindling" },
  clergy: { label: "Clero", icon: "users" },
  holy_sites: { label: "Lugares sagrados", icon: "landmark" },
  taboos: { label: "Tabues", icon: "ban" },
  boons: { label: "Dones", icon: "sparkles" },
  relics: { label: "Reliquias", icon: "gem" },
  omens: { label: "Presagios", icon: "cloud-lightning" },
  deity: { label: "Entidad", icon: "flame" },
  enemies: { label: "Enemigos", icon: "swords" },
  leader: { label: "Lider", icon: "crown" },
  territory: { label: "Territorio", icon: "map-pin" },
  membership: { label: "Miembros", icon: "users" },
  reputation: { label: "Reputacion", icon: "badge" },
  terrain: { label: "Terreno", icon: "mountain" },
  population: { label: "Poblacion", icon: "users" },
  encounters: { label: "Encuentros", icon: "skull" },
  landmarks: { label: "Lugares clave", icon: "map-pinned" },
  subzones: { label: "Subzonas", icon: "map" },
  routes: { label: "Rutas", icon: "route" },
  hazards: { label: "Amenazas", icon: "triangle-alert" },
  secrets_zone: { label: "Secretos", icon: "lock-keyhole" },
  object_type: { label: "Tipo", icon: "package" },
  rarity: { label: "Rareza", icon: "gem" },
  creator: { label: "Creador", icon: "hammer" },
  current_owner: { label: "Portador", icon: "hand" },
  powers: { label: "Poderes", icon: "wand-sparkles" },
  curse: { label: "Maldicion", icon: "skull" },
  attunement: { label: "Sintonizacion", icon: "badge-check" },
  mechanics: { label: "Reglas", icon: "dice-6" },
  history: { label: "Historia", icon: "book-open" },
  hooks: { label: "Ganchos", icon: "link" },
};

const loreDetailFields = {
  folder: [],
  character: [
    ["status", "Estado", "input"],
    ["race", "Raza", "input"],
    ["age", "Edad", "input"],
    ["class_role", "Clase / subclase", "input"],
    ["role", "Rol en la historia", "input"],
    ["occupation", "Oficio / posicion", "input"],
    ["pronouns", "Pronombres", "input"],
    ["faction", "Faccion", "input"],
    ["religion", "Religion", "input"],
    ["location", "Localizacion", "input"],
    ["voice", "Voz / manera de hablar", "textarea"],
    ["appearance", "Apariencia", "textarea"],
    ["personality", "Personalidad", "textarea"],
    ["ideals", "Ideales / juramentos", "textarea"],
    ["motives", "Motivaciones", "textarea"],
    ["flaws", "Miedos / defectos", "textarea"],
    ["alliances", "Aliados / enemigos", "textarea"],
    ["resources", "Recursos", "textarea"],
    ["secrets", "Secretos", "textarea"],
    ["dm_notes", "Secretos DM", "textarea"],
  ],
  faction: [
    ["status", "Estado", "input"],
    ["leader", "Lider / cara visible", "input"],
    ["headquarters", "Sede / refugio", "input"],
    ["symbol", "Simbolo / emblema", "input"],
    ["domain_agenda", "Agenda", "textarea"],
    ["hierarchy", "Jerarquia / rangos", "textarea"],
    ["territory", "Territorio", "textarea"],
    ["methods", "Metodos y rituales", "textarea"],
    ["uniforms", "Marcas, colores, uniformes", "textarea"],
    ["laws", "Reglas internas", "textarea"],
    ["resources", "Recursos", "textarea"],
    ["membership", "Miembros importantes", "textarea"],
    ["alliances", "Alianzas", "textarea"],
    ["enemies", "Enemigos", "textarea"],
    ["reputation", "Reputacion", "textarea"],
    ["dm_notes", "Secretos DM", "textarea"],
  ],
  religion: [
    ["status", "Estado", "input"],
    ["deity", "Deidad, archidiablo o principio", "input"],
    ["domain_agenda", "Dominios", "input"],
    ["symbol", "Simbolo sagrado", "input"],
    ["doctrine", "Doctrina", "textarea"],
    ["rites", "Ritos", "textarea"],
    ["clergy", "Clero / cultistas", "textarea"],
    ["holy_sites", "Lugares sagrados", "textarea"],
    ["taboos", "Tabues", "textarea"],
    ["boons", "Dones / castigos", "textarea"],
    ["relics", "Reliquias", "textarea"],
    ["omens", "Presagios y senales", "textarea"],
    ["enemies", "Herejias / enemigos", "textarea"],
    ["dm_notes", "Secretos DM", "textarea"],
  ],
  zone: [
    ["status", "Estado", "input"],
    ["danger_level", "Peligro", "input"],
    ["climate", "Clima", "input"],
    ["terrain", "Terreno", "textarea"],
    ["landmarks", "Lugares clave", "textarea"],
    ["subzones", "Subzonas", "textarea"],
    ["routes", "Entradas, salidas y rutas", "textarea"],
    ["population", "Poblacion", "textarea"],
    ["resources", "Recursos", "textarea"],
    ["faction", "Facciones presentes", "textarea"],
    ["religion", "Cultos presentes", "textarea"],
    ["encounters", "Encuentros", "textarea"],
    ["hazards", "Amenazas ambientales", "textarea"],
    ["secrets_zone", "Secretos de la zona", "textarea"],
    ["dm_notes", "Secretos DM", "textarea"],
  ],
  other: [
    ["status", "Estado", "input"],
    ["object_type", "Tipo de cosa", "input"],
    ["rarity", "Rareza / valor", "input"],
    ["creator", "Creador / origen", "input"],
    ["current_owner", "Portador actual", "input"],
    ["symbol", "Simbolo / marca", "input"],
    ["attunement", "Sintonizacion / requisito", "input"],
    ["powers", "Propiedades", "textarea"],
    ["mechanics", "Reglas en mesa", "textarea"],
    ["curse", "Maldicion", "textarea"],
    ["history", "Historia / origen", "textarea"],
    ["hooks", "Ganchos de aventura", "textarea"],
    ["resources", "Usos / componentes", "textarea"],
    ["dm_notes", "Secretos DM", "textarea"],
  ],
};

const characterDetailKeys = [
  "race",
  "age",
  "role",
  "pronouns",
  "faction",
  "religion",
  "location",
  "appearance",
  "personality",
  "motives",
  "alliances",
  "resources",
  "buffs",
  "debuffs",
];

const diceOptions = [4, 6, 8, 10, 12, 20, 100];

const tokenColors = {
  player: "#4e9087",
  monster: "#c74427",
  npc: "#d9a441",
  object: "#9c7cff",
  trap: "#e0c34f",
};

const dndConditions = [
  "Blinded",
  "Charmed",
  "Deafened",
  "Frightened",
  "Grappled",
  "Incapacitated",
  "Invisible",
  "Paralyzed",
  "Petrified",
  "Poisoned",
  "Prone",
  "Restrained",
  "Stunned",
  "Unconscious",
  "Exhaustion",
  "Concentrating",
  "Blessed",
  "Baned",
  "Hexed",
  "Burning",
];

const rarityMeta = {
  mundane: { label: "Mundano", color: "#8a8172", price: 1, craftChance: 28 },
  common: { label: "Comun", color: "#8fbf72", price: 1, craftChance: 18 },
  uncommon: { label: "Poco comun", color: "#4e9087", price: 2, craftChance: 8 },
  rare: { label: "Raro", color: "#5d7ce2", price: 7, craftChance: 3 },
  very_rare: { label: "Muy raro", color: "#b16ce2", price: 18, craftChance: 1 },
  legendary: { label: "Legendario", color: "#d9a441", price: 45, craftChance: 0.4 },
};

const defaultInventoryContainers = [
  { id: "equipado", name: "Equipado", icon: "shield", system: true, sort_order: 10 },
  { id: "mochila", name: "Mochila", icon: "backpack", system: true, sort_order: 20 },
  { id: "bolsa", name: "Bolsa", icon: "package", system: true, sort_order: 30 },
];

const inventoryContainerIcons = [
  ["backpack", "Mochila"],
  ["package", "Bolsa"],
  ["briefcase", "Maletin"],
  ["archive", "Baul"],
  ["box", "Caja"],
  ["shield", "Equipado"],
  ["gem", "Joyero"],
  ["flame", "Infernal"],
];

const infernalShopPool = [
  { name: "Potion of Healing", rarity: "common", price: 1, curse: "Cada sorbo deja sabor a ceniza; hasta el siguiente descanso tienes pesadillas de deuda.", type: "consumable" },
  { name: "Scroll of Protection", rarity: "rare", price: 7, curse: "El circulo protector exige un recuerdo querido como peaje.", type: "scroll" },
  { name: "Bag of Holding", rarity: "uncommon", price: 3, curse: "A veces susurra el peso exacto de cada alma cercana.", type: "wondrous" },
  { name: "Cloak of Protection", rarity: "uncommon", price: 4, curse: "La capa tira de ti hacia acuerdos peligrosos.", type: "wondrous" },
  { name: "Boots of Elvenkind", rarity: "uncommon", price: 2, curse: "No hacen ruido, pero tus huellas aparecen como brasas al amanecer.", type: "wondrous" },
  { name: "Immovable Rod", rarity: "uncommon", price: 3, curse: "Solo obedece si prometes no retroceder.", type: "rod" },
  { name: "Ring of Mind Shielding", rarity: "uncommon", price: 4, curse: "La voz atrapada dentro opina sobre cada pacto.", type: "ring" },
  { name: "Weapon +1", rarity: "uncommon", price: 5, curse: "Cuando hiere, el filo escribe una inicial en humo.", type: "weapon" },
  { name: "Armor +1", rarity: "rare", price: 10, curse: "Se ajusta como una jaula cuando mientes.", type: "armor" },
  { name: "Wand of Magic Missiles", rarity: "uncommon", price: 4, curse: "Cada carga gastada atrae ojos invisibles.", type: "wand" },
  { name: "Amulet of Health", rarity: "rare", price: 12, curse: "Tu pulso late al ritmo de un corazon ajeno.", type: "wondrous" },
  { name: "Ring of Fire Resistance", rarity: "rare", price: 12, curse: "El frio mundane te duele como traicion.", type: "ring" },
  { name: "Stone of Good Luck", rarity: "uncommon", price: 3, curse: "La suerte vuelve con intereses.", type: "wondrous" },
  { name: "Periapt of Wound Closure", rarity: "uncommon", price: 4, curse: "Las cicatrices forman pequenas letras infernales.", type: "wondrous" },
  { name: "Horn of Blasting", rarity: "rare", price: 8, curse: "El sonido deja nombres de muertos en la lengua.", type: "wondrous" },
];

const avernusResources = [
  { name: "Chatarra de infernal war machine", tool: "Smith's tools", zone: "Averno", yield: "plating, remaches, ejes" },
  { name: "Icor de diablillo", tool: "Alchemist's supplies", zone: "Averno", yield: "aceite corrosivo, tinta de pacto" },
  { name: "Sal negra de Estigia", tool: "Herbalism kit", zone: "Averno", yield: "conservante, antitoxina torcida" },
  { name: "Vidrio de relampago infernal", tool: "Glassblower's tools", zone: "Averno", yield: "lentes, focos arcanos" },
  { name: "Cuero de bestia de guerra", tool: "Leatherworker's tools", zone: "Averno", yield: "arnes, armadura ligera" },
  { name: "Ceniza juramentada", tool: "Calligrapher's supplies", zone: "Averno", yield: "pergaminos, sellos de contrato" },
  { name: "Levadura de foso", tool: "Brewer's supplies", zone: "Tabernas de bronce", yield: "cerveza amarga, fermentos explosivos" },
  { name: "Vigas de patibulo", tool: "Carpenter's tools", zone: "Carcel Mamertina", yield: "puentes, barricadas, marcos de trampas" },
  { name: "Escoria magnetica", tool: "Cartographer's tools", zone: "Campos de batalla", yield: "tinta de rutas, mapas que vibran cerca de portales" },
  { name: "Suela de condenado", tool: "Cobbler's tools", zone: "Mercados de cadenas", yield: "botas aislantes, clavos de marcha" },
  { name: "Grasa de cocina infernal", tool: "Cook's utensils", zone: "Insulae pobres", yield: "raciones sulfuricas, cebos para imps" },
  { name: "Lagrimas vitrificadas", tool: "Jeweler's tools", zone: "Agora", yield: "gemas falsas, focos para true names" },
  { name: "Basalto de muralla", tool: "Mason's tools", zone: "Murallas dobles", yield: "bloques, sellos, contrapesos" },
  { name: "Pigmento de sangre seca", tool: "Painter's supplies", zone: "Templos", yield: "glifos, marcas falsas, iconos" },
  { name: "Arcilla de Estigia", tool: "Potter's tools", zone: "Ribera corrupta", yield: "urnas, granadas fragiles, vasijas rituales" },
  { name: "Hilo de mortaja", tool: "Weaver's tools", zone: "Columbarios", yield: "telas resistentes, vendas malditas" },
  { name: "Astillas de arbol quemado", tool: "Woodcarver's tools", zone: "Bosques calcinados", yield: "estacas, idolos, mangos de arma" },
  { name: "Rostro de cera negra", tool: "Disguise kit", zone: "Bazar demoniaco", yield: "mascaras, piel falsa, cuernos postizos" },
  { name: "Firma arrancada", tool: "Forgery kit", zone: "Notarias infernales", yield: "salvoconductos, contratos falsos" },
  { name: "Restos de tinta", tool: "Forgery kit", zone: "Escribanias de pactos", yield: "tinta, sellos rotos, manchas vivas" },
  { name: "Veneno de aguijon", tool: "Poisoner's kit", zone: "Nidos de diablillos", yield: "toxinas, somniferos, repelentes" },
  { name: "Ganzuas de hueso", tool: "Thieves' tools", zone: "Carceles y forjas", yield: "picklocks, alambres, cuñas" },
  { name: "Laton de timon", tool: "Navigator's tools", zone: "Rutas del Styx", yield: "brujulas rotas, sextantes de fuego" },
  { name: "Dados cargados con ceniza", tool: "Gaming set", zone: "Casinos de diablillos", yield: "juegos marcados, probabilidades torcidas" },
  { name: "Cuerdas de tripa infernal", tool: "Musical instrument", zone: "Teatros", yield: "canciones de miedo, senales a distancia" },
  { name: "Restos de rueda infernal", tool: "Vehicles", zone: "War machines", yield: "reparaciones, ruedas, ejes, frenos" },
];

const avernusRecipes = [
  { name: "Aceite de cadena ardiente", tool: "Alchemist's supplies", cost: "Icor de diablillo + ceniza juramentada", needs: { "Icor de diablillo": 8, "Ceniza juramentada": 5 }, rarity: "common", effect: "Arma no magica suma 1d4 fuego una escena.", difficulty: 13 },
  { name: "Placa de carro infernal", tool: "Smith's tools", cost: "Chatarra de war machine", needs: { "Chatarra de infernal war machine": 14 }, rarity: "common", effect: "+1 AC temporal contra el primer golpe fuerte.", difficulty: 14 },
  { name: "Pergamino de deuda menor", tool: "Calligrapher's supplies", cost: "Ceniza juramentada + sangre voluntaria", needs: { "Ceniza juramentada": 10 }, rarity: "uncommon", effect: "Ventaja en una negociacion infernal; el DM anota un interes.", difficulty: 15 },
  { name: "Filtro de hambre hueca", tool: "Herbalism kit", cost: "Sal negra + agua corrupta", needs: { "Sal negra de Estigia": 9 }, rarity: "common", effect: "Calma una maldicion de hambre una escena.", difficulty: 12 },
  { name: "Trampa de brasas mudas", tool: "Tinker's tools", cost: "Vidrio infernal + remaches", needs: { "Vidrio de relampago infernal": 8, "Chatarra de infernal war machine": 6 }, rarity: "uncommon", effect: "Area pequena: Dex save o Burning.", difficulty: 15 },
  { name: "Cebo para diablillos", tool: "Cook's utensils", cost: "Grasa infernal + ceniza", needs: { "Grasa de cocina infernal": 7, "Ceniza juramentada": 3 }, rarity: "common", effect: "Atrae imps o desvian una patrulla menor.", difficulty: 12 },
  { name: "Botas de paso frio", tool: "Cobbler's tools", cost: "Suela de condenado + sal negra", needs: { "Suela de condenado": 12, "Sal negra de Estigia": 5 }, rarity: "uncommon", effect: "Ignora terreno dificil de brasas durante una escena.", difficulty: 14 },
  { name: "Mapa de ruta viva", tool: "Cartographer's tools", cost: "Escoria magnetica + sangre", needs: { "Escoria magnetica": 12, "Restos de tinta": 4 }, rarity: "uncommon", effect: "Revela un atajo o una emboscada cercana.", difficulty: 15 },
  { name: "Mascara de acreedor", tool: "Disguise kit", cost: "Rostro de cera negra + firma arrancada", needs: { "Rostro de cera negra": 10, "Firma arrancada": 7 }, rarity: "uncommon", effect: "Ventaja para pasar por agente de una faccion infernal.", difficulty: 15 },
  { name: "Salvoconducto falso", tool: "Forgery kit", cost: "Firma arrancada + pergamino", needs: { "Firma arrancada": 12, "Ceniza juramentada": 8 }, rarity: "rare", effect: "Supera un control menor; si falla, activa una complicacion legal.", difficulty: 16 },
  { name: "Veneno de deuda", tool: "Poisoner's kit", cost: "Veneno de aguijon + lagrima vitrificada", needs: { "Veneno de aguijon": 10, "Lagrimas vitrificadas": 4 }, rarity: "uncommon", effect: "1d6 poison y la victima no puede mentir un turno si falla Con.", difficulty: 15 },
  { name: "Ganzua de hueso jurado", tool: "Thieves' tools", cost: "Ganzuas de hueso + ceniza juramentada", needs: { "Ganzuas de hueso": 8, "Ceniza juramentada": 4 }, rarity: "common", effect: "Abre una cerradura infernal menor o reduce su DC en 5.", difficulty: 15 },
  { name: "Cancion de marcha muda", tool: "Musical instrument", cost: "Cuerdas de tripa infernal", needs: { "Cuerdas de tripa infernal": 9 }, rarity: "common", effect: "El grupo no deja sonido durante 10 minutos, pero si deja olor.", difficulty: 13 },
  { name: "Urna de humo negro", tool: "Potter's tools", cost: "Arcilla de Estigia + brasas", needs: { "Arcilla de Estigia": 10 }, rarity: "common", effect: "Crea cobertura ligera en un area pequena.", difficulty: 12 },
  { name: "Sello de piedra obediente", tool: "Mason's tools", cost: "Basalto de muralla + tinta de pacto", needs: { "Basalto de muralla": 12, "Restos de tinta": 4 }, rarity: "uncommon", effect: "Refuerza una puerta o crea un punto de anclaje para cuerda/cadena.", difficulty: 14 },
];

const toolOptions = [...new Set([...avernusResources.map((resource) => resource.tool), ...avernusRecipes.map((recipe) => recipe.tool)])].sort((a, b) => a.localeCompare(b));
const toolPalette = ["#d9a441", "#c74427", "#4e9087", "#8fbf72", "#b16ce2", "#5d7ce2", "#e0c34f", "#bb6b4d"];
const toolIcons = {
  "Alchemist's supplies": "flask-conical",
  "Brewer's supplies": "beer",
  "Calligrapher's supplies": "feather",
  "Carpenter's tools": "hammer",
  "Cartographer's tools": "map",
  "Cobbler's tools": "footprints",
  "Cook's utensils": "soup",
  "Disguise kit": "venetian-mask",
  "Forgery kit": "scroll-text",
  "Glassblower's tools": "gem",
  "Herbalism kit": "leaf",
  "Jeweler's tools": "gem",
  "Leatherworker's tools": "shield",
  "Mason's tools": "brick-wall",
  "Musical instrument": "music",
  "Painter's supplies": "palette",
  "Poisoner's kit": "skull",
  "Potter's tools": "circle-dot",
  "Smith's tools": "anvil",
  "Thieves' tools": "key-round",
  "Tinker's tools": "cog",
  Vehicles: "truck",
  "Weaver's tools": "webhook",
  "Woodcarver's tools": "axe",
};

const defaultCraftingUpgrades = [
  { id: "smith-ember-bellows", tool: "Smith's tools", name: "Fuelles de brasas juradas", icon: "flame-kindling", cost: 1, speed: 1.35, find: 0.04, click: 2, description: "La forja respira sola cuando nadie mira." },
  { id: "herbalism-black-hands", tool: "Herbalism kit", name: "Manos de jardin negro", icon: "leaf", cost: 1, speed: 1.35, find: 0.04, click: 2, description: "Dedos de sombra separan raiz util de maleza maldita." },
  { id: "alchemist-imp-still", tool: "Alchemist's supplies", name: "Alambique de diablillo", icon: "flask-conical", cost: 2, speed: 1.65, find: 0.07, click: 4, description: "Un cristal con dientes destila icor mientras duermes." },
  { id: "calligraphy-contract-press", tool: "Calligrapher's supplies", name: "Prensa de contratos tibios", icon: "feather", cost: 2, speed: 1.65, find: 0.07, click: 4, description: "La tinta avanza sola si se le promete un nombre." },
  { id: "thieves-bone-rig", tool: "Thieves' tools", name: "Banco de ganzuas oseas", icon: "key-round", cost: 2, speed: 1.65, find: 0.07, click: 4, description: "Las cerraduras viejas ensenan sus secretos en polvo blanco." },
  { id: "cartographer-styx-compass", tool: "Cartographer's tools", name: "Compas del Styx", icon: "map", cost: 3, speed: 2.05, find: 0.1, click: 6, description: "Traza rutas que no existen hasta que alguien las paga." },
];

const bazaarLines = {
  welcome: [
    "Bienvenido. Mira con los ojos, paga con el alma y no preguntes por la garantia.",
    "Tres ofertas, tres velas, tres formas distintas de arrepentirse.",
    "El que regatea demasiado acaba dentro del inventario.",
  ],
  bought: [
    "Excelente eleccion. El objeto ya ha empezado a elegirte a ti.",
    "Comprado queda. La maldicion, naturalmente, es un servicio premium.",
    "Ah, ese brillo en tus monedas... casi parece miedo.",
  ],
  poor: [
    "Tus bolsillos suenan a promesa vacia. Vuelve con monedas de alma.",
    "No acepto esperanza, lagrimas ni cupones del plano material.",
    "Te faltan monedas. Te sobran organos negociables, pero hoy no.",
  ],
  sold: [
    "Demasiado tarde. Alguien con menos dudas ya lo firmo.",
    "Vendido. El nuevo dueno grito solo un poquito.",
    "Esa baratija ya tiene victima.",
  ],
  reroll: [
    "Cambio de escaparate. Algunos objetos han intentado escapar, sin exito.",
    "Nuevas maravillas, nuevas clausulas, mismo olor a deuda.",
    "La mercancia rota cada dia. Las consecuencias tardan mas.",
  ],
};

function defaultInfiltrationState() {
  const now = new Date().toISOString();
  return {
    id: "main",
    config: {
      authorized_user_id: "",
      visible_to_player: false,
      city_alert: false,
      phase: "baja",
      title: "Operacion Medallon Negro",
      dm_directive: "El infiltrado warforged debe pasar por tiefling, llegar a la Zona Alta, localizar aliados y preparar extraccion.",
      updated_at: now,
    },
    resources: {
      gold: 35,
      favors: 1,
      time: 4,
      suspicion: 2,
      cover: 6,
      contacts: 0,
      documents: 0,
      equipment: 1,
      spells: 0,
      known_routes: 0,
      allies_found: 0,
      allies_freed: 0,
    },
    disguise: {
      cover_identity: "Kassar Vhal, supuesto tiefling de recados militares",
      appearance: "Cuernos postizos, lentes ambar y piel oscurecida con hollin alquimico.",
      smell: "Olor metalico parcialmente cubierto con unguento de azufre y mirra negra.",
      voice: "Voz grave, demasiado regular; necesita modismos locales.",
      armor: "Armadura cubierta con cuero quemado y placas de bronce romano-infernal.",
      social: "Conoce saludos basicos, aun falla en jerga de casas nobles.",
      documents: "Sin permiso alto. Salvoconducto menor en preparacion.",
      mic: "MIC inexistente o no sincronizado.",
      coherence: 4,
    },
    preparations: [
      { id: "armor-local", name: "Adaptar armadura al estilo local", status: "pendiente", cost: "1 equipo o 10 oro", effect: "Reduce sospecha de guardias en controles menores." },
      { id: "scent-unguent", name: "Unguento de azufre y mirra negra", status: "pendiente", cost: "5 oro", effect: "Oculta olor metalico/artificial ante inspeccion cercana." },
      { id: "horn-tail-mask", name: "Cuernos, cola falsa, lentes y piel tenida", status: "pendiente", cost: "1 tiempo + kit de disfraz", effect: "Ventaja narrativa en Engano social rapido." },
      { id: "tiefling-manners", name: "Aprender modales tiefling y jerga local", status: "pendiente", cost: "1 tiempo o informador", effect: "Reduce CD social en barrio noble o tabernas." },
      { id: "role-clothes", name: "Ropa de soldado, mercader, esclavo o sacerdote", status: "pendiente", cost: "oro o favor", effect: "Abre enfoques en rutas oficial, militar, social o religiosa." },
      { id: "spell-kit", name: "Preparar hechizos de infiltracion", status: "pendiente", cost: "slot, componente o aliado", effect: "Permite justificar magia sin disparar alarma inmediata." },
      { id: "forgery-tools", name: "Comprar herramientas y sellos", status: "pendiente", cost: "15 oro", effect: "Habilita documentos falsos y manipulacion de registros." },
      { id: "support-cell", name: "Reclutar apoyo externo", status: "pendiente", cost: "favor", effect: "Permite mover aliados o cubrir una huida." },
    ],
    suspicion: {
      baja: 1,
      media: 1,
      alta: 0,
      central: 0,
      guardias: 1,
      nobles: 0,
      cultos: 0,
    },
    objectives: [
      { id: "locate-allies", title: "Confirmar ubicacion de los aliados", status: "pendiente" },
      { id: "reach-media", title: "Descubrir una forma de acceder a la Zona Media", status: "activo" },
      { id: "reach-high", title: "Descubrir una forma de acceder a la Zona Alta", status: "bloqueado" },
      { id: "prepare-cover", title: "Preparar identidad falsa o ruta alternativa", status: "activo" },
      { id: "reduce-suspicion", title: "Reducir sospecha antes del intento", status: "pendiente" },
      { id: "cross", title: "Ejecutar el cruce", status: "bloqueado" },
      { id: "extract", title: "Sacar a los aliados o abrir via segura", status: "bloqueado" },
    ],
    zones: [
      {
        id: "baja",
        name: "Zona Baja / Exterior",
        security: 2,
        magic: 1,
        access: "accesible",
        factions: "Contrabandistas, vagabundos, taberneros, pequenos cultos.",
        summary: "Calles estrechas, crimen barato y rumores que valen mas que el oro.",
        locations: ["callejones", "tabernas", "cloaca"],
      },
      {
        id: "media",
        name: "Zona Media / Militar-Comercial",
        security: 5,
        magic: 4,
        access: "parcial",
        factions: "Guardia militarizada, estibadores, escribas, mercenarios.",
        summary: "Puertos, almacenes, Limes secundarios y mercados de permisos.",
        locations: ["puerto", "limes-bajo-medio", "mercado-permisos", "archivo"],
      },
      {
        id: "alta",
        name: "Zona Alta / Noble",
        security: 8,
        magic: 8,
        access: "bloqueado",
        factions: "Casas nobles, guardias de elite, templo de Tiamat, agentes de Bel.",
        summary: "Aqui estan los aliados. Aqui tambien estan los ojos que no parpadean.",
        locations: ["barrio-noble", "templo-tiamat", "termas", "catacumbas", "plaza-coronacion"],
      },
    ],
    routes: [
      {
        id: "limes-bajo-medio",
        name: "Limes Bajo-Medio",
        from: "baja",
        to: "media",
        type: "oficial",
        state: "rumor",
        risk: "Moderado",
        real: true,
        requirements: "Permiso menor, excusa comercial, soborno o contacto mercenario.",
        checks: "Engano CD 15, Persuasion CD 15, Kit de falsificacion CD 15.",
        fail: "Registro, multa, subida de sospecha de guardias.",
        allies: "Uno o dos aliados si van como mozos o carga.",
        direction: "Entrada y salida",
      },
      {
        id: "limes-medio-alto",
        name: "Limes Medio-Alto",
        from: "media",
        to: "alta",
        type: "oficial",
        state: "desconocida",
        risk: "Muy alto",
        real: true,
        requirements: "MIC coherente, permiso de transito y motivo valido.",
        checks: "Engano CD 22, Arcana CD 18, Perspicacia CD 18.",
        fail: "Alerta central, Hold Person, interrogatorio y caceria.",
        allies: "Solo con documentacion preparada.",
        direction: "Entrada controlada",
      },
      {
        id: "acceso-ceremonial",
        name: "Acceso ceremonial a la Zona Alta",
        from: "media",
        to: "alta",
        type: "social",
        state: "desconocida",
        risk: "Alto",
        real: true,
        requirements: "Evento noble activo, disfraz social, invitacion, carruaje o uniforme.",
        checks: "Engano CD 18, Perspicacia CD 15, Historia CD 15.",
        fail: "Sospecha de nobles, escolta privada y chantaje.",
        allies: "Sirve para una entrada discreta, no para grupos grandes.",
        direction: "Entrada durante eventos",
      },
      {
        id: "cloaca-maxima",
        name: "Cloaca Maxima",
        from: "baja",
        to: "media",
        type: "subterranea",
        state: "rumor",
        risk: "Fisico",
        real: true,
        requirements: "Mapa parcial, cuerda, resistencia a toxinas o guia.",
        checks: "Supervivencia CD 15, Investigacion CD 15, Constitucion CD 15.",
        fail: "Gases, limos, marcas infernales y patrullas de mantenimiento.",
        allies: "Puede mover aliados de noche si esta preparada.",
        direction: "Ambas",
      },
      {
        id: "catacumbas-necropolis",
        name: "Catacumbas y Necropolis",
        from: "baja",
        to: "alta",
        type: "subterranea",
        state: "desconocida",
        risk: "Maldicion",
        real: true,
        requirements: "Entrada funeraria, simbolo religioso o guia de criptas.",
        checks: "Religion CD 18, Historia CD 15, Sigilo CD 18.",
        fail: "Muertos inquietos, cultistas, derrumbe o guardian funerario.",
        allies: "Ruta posible para extraccion lenta.",
        direction: "Ambas, si no se compromete",
      },
      {
        id: "termas-subestructuras",
        name: "Termas y subestructuras publicas",
        from: "baja",
        to: "alta",
        type: "ilegal",
        state: "desconocida",
        risk: "Calor extremo",
        real: true,
        requirements: "Acceso al praefurnium, llaves o uniforme de mantenimiento.",
        checks: "Investigacion CD 15, Sigilo CD 18, Atletismo CD 15.",
        fail: "Vapor, trabajadores, puertas cerradas y guardias.",
        allies: "Buena para mover uno o dos aliados.",
        direction: "Ambas",
      },
      {
        id: "pasaje-noble",
        name: "Pasaje secreto noble",
        from: "media",
        to: "alta",
        type: "social",
        state: "desconocida",
        risk: "Politico",
        real: true,
        requirements: "Chantaje, mascarada, escandalo o sirviente comprado.",
        checks: "Perspicacia CD 18, Investigacion CD 18, Sigilo CD 18.",
        fail: "Asesinos, cambiaformas o guardias privados.",
        allies: "Excelente para infiltracion, pobre para evacuacion masiva.",
        direction: "Entrada y salida limitada",
      },
      {
        id: "ruta-puerto",
        name: "Ruta del Puerto",
        from: "media",
        to: "baja",
        type: "criminal",
        state: "desconocida",
        risk: "Variable",
        real: true,
        requirements: "Estibador, contrabandista o contenedor sellado.",
        checks: "Persuasion CD 15, Intimidacion CD 15, Investigacion CD 15.",
        fail: "Registro de carga, soborno fallido o inspeccion magica.",
        allies: "Muy buena para sacar gente, irregular para entrar.",
        direction: "Salida preferente",
      },
    ],
    locations: [
      { id: "callejones", zone: "baja", name: "Callejones / Vici / Angiportus", danger: 3, vigilance: 2, access: "accesible", informants: ["niax", "velia"], clues: ["rutas-alt-rumor", "contacto-fiable"], actions: "Buscar rumores, seguir sombras, esconder aliados." },
      { id: "tabernas", zone: "baja", name: "Tabernas de mercenarios", danger: 4, vigilance: 2, access: "accesible", informants: ["brakka", "morth"], clues: ["sobornos-limes"], actions: "Reclutar, pagar, crear coartada." },
      { id: "cloaca", zone: "baja", name: "Cloaca Maxima", danger: 6, vigilance: 2, access: "rumor", informants: ["ossa"], clues: ["ruta-cloaca"], actions: "Explorar, marcar salida, preparar ruta." },
      { id: "puerto", zone: "media", name: "Puerto infernal", danger: 5, vigilance: 5, access: "parcial", informants: ["kael"], clues: ["ruta-puerto"], actions: "Investigar carga, sobornar estibador, ocultar contenedor." },
      { id: "limes-bajo-medio", zone: "media", name: "Limes Bajo-Medio", danger: 5, vigilance: 5, access: "parcial", informants: ["drusus"], clues: ["sobornos-limes"], actions: "Observar guardias, probar excusa, estudiar rutinas." },
      { id: "limes-medio-alto", zone: "media", name: "Limes Medio-Alto", danger: 9, vigilance: 9, access: "bloqueado", informants: ["serapio"], clues: ["limes-hechizos", "mic-vinculo"], actions: "Observar desde lejos, estudiar MIC, localizar escriba." },
      { id: "mercado-permisos", zone: "media", name: "Mercado de permisos", danger: 5, vigilance: 4, access: "parcial", informants: ["serapio"], clues: ["documentos-falsos", "permiso-transito"], actions: "Comprar documento, rastrear sello, detectar falsificador." },
      { id: "archivo", zone: "media", name: "Archivo administrativo", danger: 6, vigilance: 7, access: "bloqueado", informants: ["serapio"], clues: ["registros-movimiento"], actions: "Manipular registros, robar permiso, descubrir MIC." },
      { id: "barrio-noble", zone: "alta", name: "Barrio noble", danger: 8, vigilance: 8, access: "bloqueado", informants: ["lyria"], clues: ["pasaje-noble", "aliados-zona-alta"], actions: "Mascarada, chantaje, seguir carruaje." },
      { id: "templo-tiamat", zone: "alta", name: "Templo de Tiamat", danger: 9, vigilance: 9, access: "bloqueado", informants: ["achaz"], clues: ["culto-tiamat"], actions: "Fingir acolito, estudiar procesion, robar simbolo." },
      { id: "termas", zone: "alta", name: "Termas y subestructuras", danger: 6, vigilance: 5, access: "desconocido", informants: ["velia"], clues: ["termas-ruta"], actions: "Buscar praefurnium, seguir trabajadores, abrir compuertas." },
      { id: "catacumbas", zone: "alta", name: "Catacumbas y necropolis", danger: 8, vigilance: 3, access: "desconocido", informants: ["ossa"], clues: ["ruta-catacumbas"], actions: "Leer epitafios, evitar muertos, buscar salida noble." },
      { id: "plaza-coronacion", zone: "alta", name: "Plaza de coronacion de Bel", danger: 10, vigilance: 10, access: "evento", informants: ["lyria"], clues: ["ventana-caos"], actions: "Crear distraccion, observar guardias elite, usar multitud." },
    ],
    clues: [
      { id: "rutas-alt-rumor", category: "Rutas ocultas", title: "Existen rutas fuera de los Limes", state: "rumor", location: "callejones", summary: "La ciudad tiene venas viejas: cloacas, catacumbas, termas y pasos de servicio.", details: "No todas son reales, pero los pobres sobreviven porque no pisan las avenidas.", dm_secret: "Empuja al jugador a contrastar informadores." },
      { id: "contacto-fiable", category: "Informadores", title: "Un vagabundo conoce rutas de mantenimiento", state: "rumor", location: "callejones", summary: "Niax ha visto marcas de carbon en una entrada de cloaca.", details: "Puede guiar si se le paga con comida, calor o proteccion.", dm_secret: "Si se le presiona, puede desaparecer." },
      { id: "sobornos-limes", category: "Seguridad", title: "El Limes Bajo-Medio acepta sobornos discretos", state: "parcial", location: "limes-bajo-medio", summary: "Un guardia corrupto mira menos cuando el sello rojo esta doblado.", details: "Sirve para la Zona Media, no para la Alta.", dm_secret: "Drusus puede traicionar si la alarma sube." },
      { id: "limes-hechizos", category: "Seguridad", title: "El Limes Medio-Alto usa barridos magicos", state: "oculta", location: "limes-medio-alto", summary: "Detect Magic, Zone of Truth, See Invisibility, Detect Thoughts e Identify estan en rotacion.", details: "El control no solo revisa papeles: compara aura, historia y permiso.", dm_secret: "Fallar aqui debe doler." },
      { id: "mic-vinculo", category: "Documentacion", title: "MIC: Medallon de Identidad y Canalizacion", state: "oculta", location: "archivo", summary: "El MIC liga esencia, permiso, transito y canalizacion magica autorizada.", details: "Manipularlo puede activar Identify, Glyph of Warding, Sending, Faerie Fire y Hold Person.", dm_secret: "Cualquier manipulacion burda sube sospecha central +3." },
      { id: "permiso-transito", category: "Documentacion", title: "Permiso de transito alto", state: "oculta", location: "mercado-permisos", summary: "No basta un papel: debe cuadrar con MIC, motivo y patron.", details: "Un permiso falso puede pasar si va ligado a una casa menor o escolta.", dm_secret: "Serapio sabe producir permisos imperfectos." },
      { id: "documentos-falsos", category: "Documentacion", title: "Sellos oficiales se alquilan por noche", state: "rumor", location: "mercado-permisos", summary: "Un escriba quema registros al amanecer y vende copias antes de la campana.", details: "Puede comprar una ventana de movimiento de pocas horas.", dm_secret: "Si el jugador tarda, el registro cambia." },
      { id: "ruta-cloaca", category: "Rutas ocultas", title: "Cloaca Maxima conecta Baja y Media", state: "oculta", location: "cloaca", summary: "Hay marcas de mantenimiento con numerales infernales.", details: "Puede prepararse con cuerda, sal negra y guia.", dm_secret: "Salida a Alta existe, pero necesita otra pista." },
      { id: "ruta-catacumbas", category: "Rutas ocultas", title: "Las catacumbas rozan criptas de la Zona Alta", state: "oculta", location: "catacumbas", summary: "Antiguos entierros fueron absorbidos por palacios modernos.", details: "La ruta evita Limes, pero no muertos ni cultistas.", dm_secret: "Buena ruta de extraccion si se limpia." },
      { id: "termas-ruta", category: "Rutas ocultas", title: "Las termas esconden pasillos de hornos", state: "oculta", location: "termas", summary: "Praefurnium, salas de vapor y compuertas conectan barrios.", details: "Calor y trabajadores son el principal peligro.", dm_secret: "Puede llevar a una lavanderia noble." },
      { id: "pasaje-noble", category: "Politica local", title: "Un pasaje noble se usa para reuniones clandestinas", state: "oculta", location: "barrio-noble", summary: "Criados hablan de una puerta que nunca da al mismo patio.", details: "Se descubre con mascarada, escandalo o chantaje.", dm_secret: "Puede estar vigilado por cambiaformas." },
      { id: "aliados-zona-alta", category: "Movimiento de aliados", title: "Los aliados estan en la Zona Alta", state: "rumor", location: "barrio-noble", summary: "Estan retenidos, escondidos o movidos entre casas nobles.", details: "Ubicacion exacta sin confirmar.", dm_secret: "El DM decide si estan en casa noble, templo o archivo." },
      { id: "culto-tiamat", category: "Religion", title: "El templo de Tiamat emite permisos de culto", state: "oculta", location: "templo-tiamat", summary: "Procesiones y acolitos cruzan controles con simbolos draconicos.", details: "Ruta religiosa: potente, peligrosa y dogmatica.", dm_secret: "Un acolito puede oler al warforged." },
      { id: "ventana-caos", category: "Eventos", title: "La coronacion abre una ventana de caos", state: "oculta", location: "plaza-coronacion", summary: "Patrullas se concentran en avenidas, dejando subestructuras tensas.", details: "Gran riesgo, gran oportunidad.", dm_secret: "Ideal para final del minijuego." },
    ],
    informants: [
      { id: "niax", name: "Niax el Sin Sombra", type: "Vagabundo de los callejones", location: "callejones", price: "Comida, abrigo o 5 oro", loyalty: 3, risk: 3, quality: 3, status: "contactado", clue_ids: ["contacto-fiable", "ruta-cloaca"], requirements: "Tratarlo con respeto o protegerlo de una banda.", complication: "Desaparece si la sospecha de Baja sube a 6.", traitor: false },
      { id: "velia", name: "Velia Calorfrio", type: "Cortesana de termas", location: "termas", price: "Favor futuro", loyalty: 4, risk: 5, quality: 4, status: "no_reclutado", clue_ids: ["termas-ruta", "pasaje-noble"], requirements: "Entrar sin parecer soldado.", complication: "Puede vender el secreto a un noble.", traitor: false },
      { id: "drusus", name: "Drusus de la Marca Roja", type: "Guardia corrupto", location: "limes-bajo-medio", price: "20 oro o deuda", loyalty: 2, risk: 6, quality: 4, status: "no_reclutado", clue_ids: ["sobornos-limes", "limes-hechizos"], requirements: "Soborno y prueba de discrecion.", complication: "Traiciona si la Guardia entra en alerta.", traitor: true },
      { id: "serapio", name: "Serapio el Escriba Quemado", type: "Escriba administrativo", location: "archivo", price: "30 oro y proteccion", loyalty: 3, risk: 7, quality: 5, status: "no_reclutado", clue_ids: ["mic-vinculo", "permiso-transito", "registros-movimiento"], requirements: "Eliminar una deuda o traer sello oficial.", complication: "Sus documentos caducan rapido.", traitor: false },
      { id: "kael", name: "Kael Barcaza Negra", type: "Estibador del puerto", location: "puerto", price: "15 oro por contenedor", loyalty: 3, risk: 4, quality: 3, status: "no_reclutado", clue_ids: ["ruta-puerto"], requirements: "No hacer preguntas sobre la carga.", complication: "Puede meter al grupo en una carga equivocada.", traitor: false },
      { id: "ossa", name: "Ossa de los Epitafios", type: "Ladron de catacumbas", location: "catacumbas", price: "Reliquia menor o favor", loyalty: 2, risk: 8, quality: 5, status: "no_reclutado", clue_ids: ["ruta-catacumbas"], requirements: "Superar una prueba de Religion o pagar una reliquia.", complication: "Despierta algo si se le contradice.", traitor: false },
      { id: "lyria", name: "Lyria Soloster", type: "Noble menor resentida", location: "barrio-noble", price: "Chantaje o promesa politica", loyalty: 2, risk: 8, quality: 5, status: "no_reclutado", clue_ids: ["pasaje-noble", "aliados-zona-alta"], requirements: "Prueba de utilidad contra Casa Eestu.", complication: "Usa al infiltrado en su guerra privada.", traitor: false },
      { id: "achaz", name: "Achaz Escama Hueca", type: "Acolito del templo de Tiamat", location: "templo-tiamat", price: "Ofrenda draconica", loyalty: 1, risk: 9, quality: 4, status: "no_reclutado", clue_ids: ["culto-tiamat"], requirements: "Mentira religiosa convincente.", complication: "Puede pedir prueba de sangre o fuego.", traitor: true },
    ],
    decisions: [
      {
        id: "route-strategy",
        situation: "Elegir via principal hacia la Zona Alta",
        zone: "media",
        status: "pendiente",
        chosen: "",
        check_skill: "Investigacion",
        dc: 15,
        result: "",
        hidden_consequence: "La ruta elegida define que sospecha subira mas rapido.",
        options: [
          { id: "oficial", label: "Ruta oficial", cost: "Documentos + MIC + coartada", risk: "Fallo muy peligroso", reward: "Entrada limpia si funciona" },
          { id: "criminal", label: "Ruta criminal", cost: "Contactos + sobornos", risk: "Traicion", reward: "Flexible y rapida" },
          { id: "subterranea", label: "Ruta subterranea", cost: "Equipo + guia", risk: "Monstruos y toxinas", reward: "Evita controles" },
          { id: "social", label: "Ruta social", cost: "Disfraz + evento", risk: "Nobles", reward: "Acceso a aliados" },
          { id: "religiosa", label: "Ruta religiosa", cost: "Dogma + simbolo", risk: "Magia y culto", reward: "Permisos de Tiamat" },
        ],
      },
      {
        id: "first-limes-test",
        situation: "Probar un cruce menor por el Limes Bajo-Medio",
        zone: "baja",
        status: "pendiente",
        chosen: "",
        check_skill: "Engano",
        dc: 15,
        result: "",
        hidden_consequence: "Un fallo no cierra la trama, pero marca el rostro del infiltrado.",
        options: [
          { id: "soborno", label: "Doblar el sello rojo con monedas", cost: "15 oro", risk: "Guardia corrupto", reward: "Acceso parcial a Zona Media" },
          { id: "mercader", label: "Fingir recado comercial", cost: "Cobertura 1", risk: "Preguntas de rutina", reward: "Aprende protocolo" },
          { id: "observar", label: "No cruzar: observar patrones", cost: "1 tiempo", risk: "Menor", reward: "Reduce DC futuro" },
        ],
      },
    ],
    urbanEvents: [
      { id: "duelo-noble", title: "Duelo noble entre Casa Eestu y Soloster", state: "rumor", hook: "Bel retiro permisos comerciales a una casa y se los dio a otra.", checks: "Percepcion CD 15, Perspicacia CD 15, Engano CD 18, Sigilo CD 18", clues: ["permiso-transito", "pasaje-noble"], consequences: "Puede revelar un escriba corrupto o subir sospecha noble." },
      { id: "mascarada", title: "Gran mascarada de los nobles", state: "oculta", hook: "Las mascaras permiten entrar donde los papeles no bastan.", checks: "Engano CD 18, Historia CD 15, Perspicacia CD 18", clues: ["pasaje-noble", "aliados-zona-alta"], consequences: "Error social: sospecha nobles +2." },
      { id: "patrullas-elite", title: "Patrullas de guardias de elite", state: "rumor", hook: "La Guardia prueba nuevos barridos magicos.", checks: "Percepcion CD 15, Arcana CD 18", clues: ["limes-hechizos"], consequences: "Fallo: sospecha guardias +1." },
      { id: "coronacion-bel", title: "Preparativos para la coronacion de Bel", state: "oculta", hook: "La ciudad mueve tropas, nobles y cultos hacia la plaza.", checks: "Investigacion CD 18, Sigilo CD 18", clues: ["ventana-caos"], consequences: "Abre una ruta de caos o una caceria." },
      { id: "pasaje-clandestino", title: "Pasaje secreto para reuniones clandestinas", state: "oculta", hook: "Un sirviente vio dos nobles salir de una misma pared.", checks: "Perspicacia CD 18, Sigilo CD 18", clues: ["pasaje-noble"], consequences: "Puede atraer cambiaformas." },
      { id: "gran-caceria", title: "Gran caceria organizada por un noble", state: "oculta", hook: "Carrozas, bestias y guardias saldran por rutas privadas.", checks: "Supervivencia CD 15, Engano CD 18", clues: ["ruta-puerto", "aliados-zona-alta"], consequences: "Movimiento masivo, vigilancia impredecible." },
    ],
    spells: [
      { name: "Disguise Self", use: "Cubre apariencia superficial.", beats: "Miradas rapidas y eventos sociales", fails: "Contacto fisico, Detect Magic, MIC", suspicion: "-1 si se usa bien, +2 si lo detectan" },
      { name: "Alter Self", use: "Ajusta cuerpo, piel y rasgos.", beats: "Inspeccion visual cercana", fails: "MIC, esencia, Zone of Truth", suspicion: "-2 en disfraz, +3 si cae en barrido" },
      { name: "Nystul's Magic Aura", use: "Enmascara aura y deteccion magica.", beats: "Detect Magic basico", fails: "Identify dedicado, registros MIC", suspicion: "Reduce riesgo central si esta preparado" },
      { name: "Invisibility", use: "Evita lineas de vista.", beats: "Patrullas normales", fails: "See Invisibility, ceniza, puertas vigiladas", suspicion: "+2 si aparece donde no debe" },
      { name: "Detect Magic", use: "Lee barridos y sellos.", beats: "Glifos evidentes", fails: "Se nota si se canaliza sin permiso", suspicion: "+1 central si se usa cerca de Limes" },
      { name: "Silence", use: "Cruces y robo de permisos.", beats: "Alarmas sonoras", fails: "Guardias atentos y zonas rituales", suspicion: "Crea sospecha local si es obvio" },
      { name: "Pass without Trace", use: "Movimiento de aliados.", beats: "Rastreo fisico", fails: "Limes magico y MIC", suspicion: "Muy util en rutas subterraneas" },
      { name: "Detect Thoughts", use: "Leer guardias o nobles.", beats: "Interrogatorio social", fails: "Contramagia, sospecha mental", suspicion: "+3 nobles o central si se detecta" },
    ],
    mic: {
      name: "MIC: Medallon de Identidad y Canalizacion",
      status: "No obtenido",
      identity: "Registro de alma o esencia no sincronizado.",
      channeling: "Canalizacion magica autorizada solo para portadores validados.",
      transit: "Historial de transito cruzado con permisos.",
      protections: "Identify, Glyph of Warding, Sending, Faerie Fire, Hold Person.",
      tamper: "Manipularlo activa alerta, marca al infractor, puede paralizarlo y sube sospecha central.",
    },
    checkpoints: [
      { id: "limes-bajo-medio", name: "Limes Bajo-Medio", zone: "Baja a Media", security: 5, captain: "Drusus o superior de turno", spells: "Detect Magic ocasional, Message, Alarm", requirements: "Permiso menor o excusa comercial", checks: "Sello, carga, cara, motivo", weaknesses: "Soborno, cambio de turno, exceso de carga", alternatives: "Cloaca Maxima, vici, contrabandistas", bribe: "10-25 oro", risk: "Moderado" },
      { id: "limes-medio-alto", name: "Limes Medio-Alto", zone: "Media a Alta", security: 9, captain: "Prefecto de brasas", spells: "Detect Magic, Zone of Truth, See Invisibility, Detect Thoughts, Identify", requirements: "MIC, permiso alto, motivo y patron", checks: "Aura, historia, permiso, escolta", weaknesses: "Evento noble, escriba corrupto, orden militar", alternatives: "Pasaje noble, termas, catacumbas", bribe: "No recomendable", risk: "Letal" },
    ],
    log: [
      { id: "log-start", at: now, text: "La Red de Sombras queda en frio. El DM debe asignar un jugador y abrir el canal.", type: "system" },
    ],
  };
}

const hungerCravings = [
  "Un trozo de metal",
  "Un clavo",
  "Un boton",
  "Un pelo",
  "Un insectoide",
  "Un imp",
  "Una pluma",
  "Restos de cera de la oreja",
  "Un hueso",
  "Un trozo de cuero",
  "Una hoja de planta",
  "Un diente",
  "Tierra",
  "Una piedra",
  "Agua",
  "Un hilo",
  "Un fragmento de cristal",
  "Un trozo de piel",
  "Arena",
  "Un poco de ceniza",
  "Una vela",
  "Una cadena",
  "Una moneda",
  "Una rama",
  "Trozo de pergamino",
  "Una semilla",
  "Un calcetin",
  "Un ragmento de una espada rota",
  "Grasa animal",
  "Un pedazo de pan",
  "Un trozo de ropa",
  "Un resto de cuerda",
  "Una astilla",
  "Una antorcha",
  "Una llave",
  "Una calavera",
  "Una oreja",
  "Restos de carbon",
  "Lodo",
  "Un componente material de hechizo",
  "Restos de tinta",
  "Un casco",
  "Un escudo",
  "Una lengua",
  "Un ojo",
  "Un sorbo de angre",
  "Raciones de viaje comunes",
  "Una daga",
  "Una uña",
  "Brasas",
  "Tierra de una tumba",
  "Agua bendita",
  "Iconografia demoniaca",
  "Un trozo de azufre",
  "Un cabello de un mago",
  "Un trozo de metal oxidado",
  "Restos de una ofrenda",
  "Una gota de sudor",
  "Agua del rio Styx",
  "Restos de una pocima magica",
  "Un ala",
  "Una espina",
  "Un hilo rojo",
  "Restos de un ritual",
  "Una daga oxidada con manchas de sangre",
  "Una lagrima humana",
  "Una moneda bañada en sangre",
  "Restos de un animal sacrificado",
  "Un cabello de un noble",
  "Fragmento de estatua",
  "Una campana",
  "El aliento de alguien capturado en un frasco",
  "Un tiefling",
  "Restos de un sueño escrito en un papel",
  "Un pergamino con un hechizo de nivel bajo",
  "Un trozo de armadura forjada por ti y usada en combate",
  "Corazon de un animal aun latiendo",
  "Un ojo intacto",
  "Un dado",
  "Un colgante",
  "Una vela negra",
  "Un silbato",
  "Una espina dorsal",
  "Un juguete",
  "Una garra",
  "La alma de un pecador",
  "Un contrato infernal quemado",
  "El eco de un grito",
  "Una sombra atrapada",
  "El nombre verdadero de un demonio escrito en pergamino",
  "La ilusion de un niño",
  "El aliento de alguien capturado en un frasco",
  "Un mechon de barba de enano quemado",
  "Sangre de un dragon (una gota)",
  "Un libro con anotaciones arcanas",
  "Cabello de un archimago",
  "El ultimo suspiro de un moribundo",
  "Una lagrima de demonio",
  "Una carta tocada por un archiduque",
  "Un pergamino con un hechizo de nivel alto",
];

const state = {
  authMode: "login",
  session: null,
  profile: null,
  route: "timeline",
  data: emptyData(),
  editingEventId: null,
  editingNoteId: null,
  editingLoreId: null,
  editingShopItemId: null,
  editingContractId: null,
  editingInventoryContainerId: null,
  editingCraftResourceId: null,
  editingCraftRecipeId: null,
  editingCraftUpgradeId: null,
  selectedLoreId: null,
  selectedLoreFolderId: null,
  loreFormType: null,
  loreFilter: "all",
  loreSearch: "",
  selectedStatsUserId: null,
  selectedCombatantId: null,
  selectedInventoryItemId: null,
  bazaarMood: "welcome",
  rollingUserId: null,
  dieFace: 1,
  toast: "",
  busy: false,
  ui: readUiState(),
};

app.addEventListener("click", onClick);
app.addEventListener("submit", onSubmit);
app.addEventListener("input", onInput);
app.addEventListener("change", onChange);

init();

window.setInterval(async () => {
  const activeTag = document.activeElement?.tagName;
  if (!state.session || !hasSupabase || !["battlefield", "dice"].includes(state.route)) return;
  if (["INPUT", "TEXTAREA", "SELECT"].includes(activeTag)) return;
  await loadAll();
  render();
}, 6000);

async function init() {
  try {
    if (hasSupabase) {
      const { data, error } = await supabase.auth.getSession();
      if (error) throw error;
      state.session = data.session;
      supabase.auth.onAuthStateChange(async (_event, session) => {
        state.session = session;
        if (session) {
          await loadAll();
        } else {
          state.profile = null;
          state.data = emptyData();
        }
        render();
      });
    } else {
      clearLegacyDemoKeys();
      ensureDemoData();
      state.session = readJson(DEMO_SESSION_KEY);
    }

    if (state.session) {
      if (state.ui.route) state.route = state.ui.route;
      await loadAll();
    }
    render();
  } catch (error) {
    showToast(error.message || "No se pudo iniciar la app.");
    render();
  }
}

function emptyData() {
  return {
    profiles: [],
    events: [],
    lore: [],
    links: [],
    loreVisibility: [],
    notes: [],
    stats: [],
    rolls: [],
    combatants: [],
    battleState: null,
    diceRolls: [],
    inventory: [],
    inventoryContainers: [],
    contracts: [],
    hunger: [],
    hungerTable: [],
    shop: null,
    infiltration: null,
    importedLore: [],
  };
}

function render() {
  if (!state.session) {
    app.innerHTML = renderAuth();
  } else {
    app.innerHTML = renderShell();
  }
  refreshIcons();
}

function renderAuth() {
  const demoEmail = hasSupabase ? "" : "dm@demo.local";
  return `
    <main class="auth-page">
      <section class="auth-card" aria-label="Archivo Infernal">
        <div class="auth-art"></div>
        <div class="auth-panel">
          <div>
            <span class="role-pill">Campaña infernal</span>
            <h1>Archivo Infernal</h1>
          </div>
          ${hasSupabase ? "" : renderBanner("Modo demo local activo. Al conectar Supabase, la app usara datos reales.")}
          <div class="auth-tabs" role="tablist">
            <button type="button" class="${state.authMode === "login" ? "active" : ""}" data-action="auth-tab" data-mode="login">
              ${icon("log-in")} Entrar
            </button>
            <button type="button" class="${state.authMode === "signup" ? "active" : ""}" data-action="auth-tab" data-mode="signup">
              ${icon("user-plus")} Crear cuenta
            </button>
          </div>
          <form class="form-grid" data-form="${state.authMode}">
            ${
              state.authMode === "signup"
                ? `
                  <label class="field">
                    <span>Nombre visible</span>
                    <input name="display_name" autocomplete="name" required />
                  </label>
                  <label class="field">
                    <span>Personaje</span>
                    <input name="character_name" autocomplete="off" required />
                  </label>
                  <label class="field">
                    <span>Cargar foto</span>
                    <input name="avatar_file" type="file" accept="image/*" />
                  </label>
                  <label class="field">
                    <span>Frase / vibe</span>
                    <input name="character_title" autocomplete="off" placeholder="Juramento roto, exiliada de Dis..." />
                  </label>
                `
                : ""
            }
            <label class="field">
              <span>Email</span>
              <input name="email" type="email" autocomplete="email" value="${escapeAttr(demoEmail)}" required />
            </label>
            <label class="field">
              <span>Contrasena</span>
              <input name="password" type="password" autocomplete="${state.authMode === "login" ? "current-password" : "new-password"}" value="${hasSupabase ? "" : "demo1234"}" minlength="6" required />
            </label>
            <button class="primary" type="submit">
              ${icon(state.authMode === "login" ? "log-in" : "user-plus")} ${state.authMode === "login" ? "Entrar" : "Crear cuenta"}
            </button>
          </form>
        </div>
      </section>
      ${renderToast()}
    </main>
  `;
}

function renderShell() {
  if (isDM() && state.route === "stats") {
    state.route = "dm";
    saveUiState({ route: state.route });
  }
  if (state.route === "infiltration" && !canUseInfiltration()) {
    state.route = "timeline";
    saveUiState({ route: state.route });
  }
  const role = isDM() ? "DM" : "Player";
  const activeNavItem = navItems.find((item) => item.id === state.route) || navItems[0];
  const visibleNav = navItems.filter((item) => (!item.dmOnly || isDM()) && (!item.playerOnly || !isDM()) && (!item.gated || canUseHunger()) && (!item.secret || canUseInfiltration()));
  return `
    <div class="app-shell route-${escapeAttr(state.route)}">
      <aside class="sidebar">
        <div class="brand">
          <div class="brand-row">
            ${renderAvatar(state.profile, "small")}
            <div>
              <h1>Archivo Infernal</h1>
              <p>${escapeHtml(state.profile?.character_name || state.profile?.display_name || "Mesa")}</p>
            </div>
          </div>
          <div class="sidebar-system">
            <span>HELLCOM LINK</span>
            <strong>${hasSupabase ? "SUPABASE" : "LOCAL CORE"}</strong>
          </div>
        </div>
        <div class="nav-section-label">${icon("radio")} Modulos de mando</div>
        <nav class="nav" aria-label="Navegacion principal">
          ${visibleNav
            .map(
              (item) => `
              <button type="button" class="${state.route === item.id ? "active" : ""}" data-route="${item.id}">
                ${icon(item.icon)} ${item.label}
              </button>
            `,
            )
            .join("")}
        </nav>
        <div class="user-strip">
          <span class="role-pill">${icon(isDM() ? "crown" : "sword")} ${role}</span>
          <span>${escapeHtml(state.profile?.display_name || state.session.user.email || "")}</span>
          <button type="button" class="ghost" data-action="toggle-sound">${icon(soundEnabled() ? "volume-2" : "volume-x")} Sonido</button>
          <button type="button" class="ghost" data-action="sign-out">${icon("log-out")} Salir</button>
        </div>
      </aside>
      <main class="content">
        <div class="command-surface">
          <header class="topbar">
            <div class="topbar-title">
              <span class="screen-kicker">${icon(activeNavItem?.icon || "flame")} modulo tactico / ${escapeHtml(role)}</span>
              <h2>${routeTitle()}</h2>
            </div>
            <div class="topbar-actions">
              ${renderTopbarActions()}
            </div>
          </header>
          ${hasSupabase ? "" : renderBanner("Modo demo local activo. Edita src/config.js y ejecuta supabase/schema.sql para usar tu backend.")}
          <div class="route-shell">${renderRoute()}</div>
        </div>
      </main>
      ${renderToast()}
    </div>
  `;
}

function routeTitle() {
  return navItems.find((item) => item.id === state.route)?.label || "Archivo";
}

function renderTopbarActions() {
  if (state.route === "timeline" && isDM()) {
    return `<button type="button" class="primary" data-action="new-event">${icon("plus")} Evento</button>`;
  }
  if (state.route === "lore" && isDM()) {
    return `
      <button type="button" class="ghost" data-action="new-lore-folder">${icon("folder-plus")} Carpeta</button>
      <button type="button" class="primary" data-action="new-lore">${icon("plus")} Ficha</button>
    `;
  }
  if (state.route === "notes") {
    return `<button type="button" class="primary" data-action="new-note">${icon("plus")} Apunte</button>`;
  }
  if (state.route === "dm" && isDM()) {
    return `<button type="button" class="ghost" data-route="battlefield">${icon("skull")} Bichos y mapa</button>`;
  }
  if (state.route === "battlefield" && isDM()) {
    return `
      <button type="button" class="ghost" data-action="request-initiative">${icon("megaphone")} Pedir iniciativas</button>
      <button type="button" class="primary" data-action="next-turn">${icon("skip-forward")} Siguiente turno</button>
    `;
  }
  if (state.route === "infiltration" && isDM()) {
    const op = getInfiltrationState();
    return `
      <span class="status-pill">${icon(op.config.visible_to_player ? "eye" : "eye-off")} ${op.config.visible_to_player ? "Canal abierto" : "Canal oculto"}</span>
      <button type="button" class="danger" data-action="reset-infiltration">${icon("trash-2")} Resetear operacion</button>
    `;
  }
  return "";
}

function renderRoute() {
  if (state.route === "timeline") return renderTimeline();
  if (state.route === "lore") return renderLore();
  if (state.route === "notes") return renderNotes();
  if (state.route === "stats") return isDM() ? renderDMDashboard() : renderStats(false);
  if (state.route === "inventory") return renderInventory();
  if (state.route === "contracts") return renderContracts();
  if (state.route === "shop") return renderShop();
  if (state.route === "crafting") return renderCrafting();
  if (state.route === "hunger") return canUseHunger() ? renderHunger() : renderTimeline();
  if (state.route === "infiltration") return canUseInfiltration() ? renderInfiltration() : renderTimeline();
  if (state.route === "battlefield") return renderBattlefield();
  if (state.route === "dice") return renderDiceRoom();
  if (state.route === "dm" && isDM()) return renderDMDashboard();
  return renderTimeline();
}

function renderDMDashboard() {
  return renderStats(true);
}

function renderTimeline() {
  const events = [...state.data.events].sort((a, b) => Number(a.sort_order || 0) - Number(b.sort_order || 0));
  return `
    <section class="dashboard-grid">
      <div class="panel">
        <div class="panel-header">
          <h3>Cronograma</h3>
          <div class="timeline-controls">
            <button type="button" class="icon-button ghost" title="Mover izquierda" data-action="timeline-scroll" data-dir="-1">${icon("chevron-left")}</button>
            <span class="status-pill">${events.length} eventos</span>
            <button type="button" class="icon-button ghost" title="Mover derecha" data-action="timeline-scroll" data-dir="1">${icon("chevron-right")}</button>
          </div>
        </div>
        <div class="timeline-wrap" data-timeline-scroll tabindex="0" aria-label="Cronograma con scroll horizontal">
          ${
            events.length
              ? `<div class="timeline">
                  ${events
                    .map(
                      (event) => `
                        <article class="event-card">
                          <span class="event-date">${escapeHtml(event.date_label || "Sin fecha")}</span>
                          <h3>${escapeHtml(event.title)}</h3>
                          <p>${escapeHtml(event.description || "")}</p>
                          ${
                            isDM()
                              ? `<div class="card-actions">
                                  <button type="button" class="icon-button" title="Editar" data-action="edit-event" data-id="${event.id}">${icon("pencil")}</button>
                                  <button type="button" class="icon-button danger" title="Borrar" data-action="delete-event" data-id="${event.id}">${icon("trash-2")}</button>
                                </div>`
                              : ""
                          }
                        </article>
                      `,
                    )
                    .join("")}
                </div>`
              : renderEmpty("La linea temporal aun no tiene eventos.")
          }
          <div class="scroll-hint">${icon("move-horizontal")} Desliza en horizontal para recorrer la historia</div>
        </div>
      </div>
      ${
        isDM()
          ? `<aside class="panel">
              <div class="panel-header">
                <h3>${state.editingEventId ? "Editar evento" : "Nuevo evento"}</h3>
              </div>
              <div class="panel-body">${renderEventForm()}</div>
            </aside>`
          : `<aside class="panel">
              <div class="panel-header"><h3>Ultimo eco</h3></div>
              <div class="panel-body">${renderLatestEvent(events)}</div>
            </aside>`
      }
    </section>
  `;
}

function renderLatestEvent(events) {
  const event = events[events.length - 1];
  if (!event) return renderEmpty("Sin eventos visibles.");
  return `
    <div class="event-card">
      <span class="event-date">${escapeHtml(event.date_label || "Sin fecha")}</span>
      <h3>${escapeHtml(event.title)}</h3>
      <p>${escapeHtml(event.description || "")}</p>
    </div>
  `;
}

function renderEventForm() {
  const event = state.data.events.find((item) => item.id === state.editingEventId) || {};
  const events = [...state.data.events].sort((a, b) => Number(a.sort_order || 0) - Number(b.sort_order || 0));
  return `
    <form class="form-grid" data-form="event">
      <input type="hidden" name="id" value="${escapeAttr(event.id || "")}" />
      <label class="field">
        <span>Titulo</span>
        <input name="title" value="${escapeAttr(event.title || "")}" required />
      </label>
      <label class="field">
        <span>Fecha o marca</span>
        <input name="date_label" value="${escapeAttr(event.date_label || "")}" placeholder="Sesion 3, Dia 11, Era del Pacto..." />
      </label>
      <div class="grid-2">
        <label class="field">
          <span>Posicion</span>
          <select name="position">
            ${state.editingEventId ? `<option value="same">Mantener</option>` : ""}
            <option value="end">Al final</option>
            <option value="before">Antes de</option>
            <option value="after">Despues de</option>
          </select>
        </label>
        <label class="field">
          <span>Evento referencia</span>
          <select name="anchor_event_id">
            <option value="">Sin referencia</option>
            ${events
              .filter((item) => item.id !== event.id)
              .map((item) => `<option value="${item.id}">${escapeHtml(item.title)}</option>`)
              .join("")}
          </select>
        </label>
      </div>
      <label class="field">
        <span>Descripcion</span>
        <textarea name="description">${escapeHtml(event.description || "")}</textarea>
      </label>
      <div class="form-actions">
        <button class="primary" type="submit">${icon("save")} Guardar</button>
        ${state.editingEventId ? `<button type="button" class="ghost" data-action="cancel-event">${icon("x")} Cancelar</button>` : ""}
      </div>
    </form>
  `;
}

function renderLore() {
  const visibleLore = filteredLore();
  const currentFolder = state.selectedLoreFolderId ? state.data.lore.find((item) => item.id === state.selectedLoreFolderId) : null;
  const selected = visibleLore.find((item) => item.id === state.selectedLoreId) || visibleLore[0] || currentFolder;
  if (!state.selectedLoreId && selected) state.selectedLoreId = selected.id;
  return `
    <section class="lore-layout">
      <aside class="panel">
        <div class="panel-header">
          <h3>${currentFolder ? `${icon("folder")} ${escapeHtml(currentFolder.title)}` : "Indice"}</h3>
          <span class="status-pill" data-lore-count>${visibleLore.length}</span>
        </div>
        <div class="panel-body">
          ${currentFolder ? `<button type="button" class="ghost lore-back" data-action="clear-lore-folder">${icon("arrow-left")} Volver al indice</button>` : ""}
          <div class="filters">
            ${Object.entries(loreTypes)
              .map(
                ([type, meta]) => `
                  <button type="button" class="${state.loreFilter === type ? "active" : ""}" data-action="filter-lore" data-type="${type}">
                    ${icon(meta.icon)} ${meta.label}
                  </button>
                `,
              )
              .join("")}
          </div>
          <div class="search-row">
            <label class="sr-only" for="lore-search">Buscar lore</label>
            <input id="lore-search" name="lore_search" value="${escapeAttr(state.loreSearch)}" placeholder="Buscar" />
          </div>
          <div class="lore-list" data-lore-list>
            ${renderLoreCards(visibleLore, selected)}
          </div>
        </div>
      </aside>
      <div class="panel" data-lore-detail>
        ${
          state.editingLoreId === "new" || state.editingLoreId
            ? renderLoreForm()
            : renderLoreDetail(selected)
        }
      </div>
    </section>
  `;
}

function renderLoreCards(items, selected) {
  if (!items.length) return renderEmpty("No hay fichas con ese filtro.");
  return items
    .map(
      (item) => {
        const childrenCount = state.data.lore.filter((entry) => entry.parent_id === item.id).length;
        const parent = item.parent_id ? state.data.lore.find((entry) => entry.id === item.parent_id) : null;
        return `
        <article class="lore-card ${item.type === "folder" ? "folder-card" : ""} ${selected?.id === item.id ? "active" : ""}" data-lore-id="${item.id}">
          ${item.image_url ? `<img class="lore-thumb" src="${escapeAttr(item.image_url)}" alt="" loading="lazy" />` : ""}
          <span class="tag">${icon(loreTypes[item.type]?.icon || "book")} ${escapeHtml(loreTypes[item.type]?.singular || item.type)}</span>
          <h3>${escapeHtml(item.title)}</h3>
          <p>${escapeHtml(item.summary || item.subtitle || "")}</p>
          <div class="detail-meta">
            ${parent ? `<span class="inline-label">${icon("folder")} ${escapeHtml(parent.title)}</span>` : ""}
            ${item.type === "folder" ? `<span class="inline-label">${icon("archive")} ${childrenCount} dentro</span>` : ""}
          </div>
        </article>
      `;
      },
    )
    .join("");
}

function filteredLore() {
  const q = state.loreSearch.trim().toLowerCase();
  return visibleLoreEntries()
    .filter((item) => (state.selectedLoreFolderId ? item.parent_id === state.selectedLoreFolderId : true))
    .filter((item) => state.loreFilter === "all" || item.type === state.loreFilter)
    .filter((item) => {
      if (!q) return true;
      return [item.title, item.subtitle, item.summary, item.description, JSON.stringify(item.details || {})]
        .join(" ")
        .toLowerCase()
        .includes(q);
    })
    .sort((a, b) => {
      const folderWeight = (entry) => (entry.type === "folder" ? 0 : entry.parent_id ? 2 : 1);
      const byFolder = folderWeight(a) - folderWeight(b);
      if (byFolder) return byFolder;
      return a.type === b.type ? a.title.localeCompare(b.title) : a.type.localeCompare(b.type);
    });
}

function visibleLoreEntries() {
  if (isDM()) return state.data.lore;
  return state.data.lore.filter((item) => canSeeLore(item.id));
}

function visibleLoreIds() {
  return new Set(visibleLoreEntries().map((item) => item.id));
}

function canSeeLore(entryId) {
  const visibility = state.data.loreVisibility.filter((row) => row.entry_id === entryId);
  return visibility.length === 0 || visibility.some((row) => row.user_id === state.session?.user?.id);
}

function renderLoreDetail(item) {
  if (!item) {
    return `
      <div class="panel-header"><h3>Ficha</h3></div>
      <div class="panel-body">${renderEmpty("Aun no hay lore visible.")}</div>
    `;
  }

  const details = item.details || {};
  const parent = item.parent_id ? state.data.lore.find((entry) => entry.id === item.parent_id) : null;
  const children = visibleLoreEntries().filter((entry) => entry.parent_id === item.id);
  const outgoing = state.data.links.filter((link) => link.source_id === item.id);
  const incoming = state.data.links.filter((link) => link.target_id === item.id);
  const allowedIds = visibleLoreIds();
  const linked = [...outgoing, ...incoming]
    .map((link) => {
      const otherId = link.source_id === item.id ? link.target_id : link.source_id;
      if (!isDM() && !allowedIds.has(otherId)) return null;
      const other = state.data.lore.find((entry) => entry.id === otherId);
      return other ? { ...link, other } : null;
    })
    .filter(Boolean);
  const visibility = state.data.loreVisibility.filter((row) => row.entry_id === item.id);

  return `
    <div class="panel-header">
      <h3>${escapeHtml(loreTypes[item.type]?.singular || "Ficha")}</h3>
      ${
        isDM()
          ? `<div class="card-actions">
              <button type="button" class="icon-button" title="Editar" data-action="edit-lore" data-id="${item.id}">${icon("pencil")}</button>
              <button type="button" class="icon-button danger" title="Borrar" data-action="delete-lore" data-id="${item.id}">${icon("trash-2")}</button>
            </div>`
          : ""
      }
    </div>
    <div class="panel-body">
      <div class="detail-hero">
        ${item.image_url ? `<img class="detail-image" src="${escapeAttr(item.image_url)}" alt="" loading="lazy" />` : `<div class="detail-image"></div>`}
        <div class="detail-title">
          <span class="tag">${icon(loreTypes[item.type]?.icon || "book")} ${escapeHtml(loreTypes[item.type]?.singular || item.type)}</span>
          <h3>${escapeHtml(item.title)}</h3>
          <p class="detail-prose">${escapeHtml(item.summary || "")}</p>
          <div class="detail-meta">
            ${item.subtitle ? `<span class="status-pill">${escapeHtml(item.subtitle)}</span>` : ""}
            ${parent ? `<span class="status-pill">${icon("folder")} ${escapeHtml(parent.title)}</span>` : ""}
            ${details.status ? `<span class="status-pill">${escapeHtml(details.status)}</span>` : ""}
            ${details.danger_level ? `<span class="status-pill">Peligro ${escapeHtml(details.danger_level)}</span>` : ""}
            ${isDM() && visibility.length ? `<span class="status-pill">${icon("eye-off")} Privado: ${escapeHtml(visibility.map((row) => profileName(row.user_id)).join(", "))}</span>` : ""}
          </div>
        </div>
      </div>
      ${renderTextSection("Descripcion", item.description)}
      ${renderDetailFacts(item)}
      ${children.length ? renderLoreChildren(children, item) : ""}
      ${linked.length ? renderRelations(linked, item.id) : ""}
      ${isDM() && details.dm_notes ? renderTextSection("Notas DM", details.dm_notes) : ""}
    </div>
  `;
}

function renderDetailFacts(item) {
  const details = item.details || {};
  const skip = new Set(["dm_notes", "memories", "source_path", "image_refs", "imported_from", "raw_markdown_kept", "dm_source_markdown"]);
  const entries = Object.entries(details).filter(([, value]) => Boolean(value));
  if (!entries.length) return "";
  return `
    <div class="detail-section">
      <h4>Detalles</h4>
      <div class="meta-grid">
        ${entries
          .filter(([key]) => !skip.has(key))
          .map(([key, value]) => {
            const meta = detailMeta[key] || { label: labelize(key), icon: "circle-dot" };
            return `<span class="fact-chip">${icon(meta.icon)} <strong>${escapeHtml(meta.label)}</strong> ${escapeHtml(value)}</span>`;
          })
          .join("")}
      </div>
    </div>
  `;
}

function renderTextSection(title, text) {
  if (!text) return "";
  return `
    <div class="detail-section">
      <h4>${escapeHtml(title)}</h4>
      <p class="detail-prose">${escapeHtml(text)}</p>
    </div>
  `;
}

function renderLoreChildren(children, parent) {
  return `
    <div class="detail-section">
      <h4>${parent?.type === "folder" ? "Contenido de la carpeta" : "Dentro"}</h4>
      <div class="relations-grid">
        ${children
          .map(
            (child) => `
              <button type="button" class="relation-card" data-action="open-lore" data-id="${child.id}">
                ${icon(loreTypes[child.type]?.icon || "book")} ${escapeHtml(child.title)}
              </button>
            `,
          )
          .join("")}
      </div>
    </div>
  `;
}

function renderRelations(links, currentId) {
  return `
    <div class="detail-section">
      <h4>Vinculos</h4>
      <div class="relations-grid">
        ${links
          .map((link) => {
            const direction = link.source_id === currentId ? link.relation_label || "Relacionado con" : link.relation_label || "Relacionado desde";
            return `
              <button type="button" class="relation-card" data-action="open-lore" data-id="${link.other.id}">
                ${icon(loreTypes[link.other.type]?.icon || "link")} ${escapeHtml(link.other.title)}
                <br /><span class="inline-label">${escapeHtml(direction)}</span>
              </button>
            `;
          })
          .join("")}
      </div>
    </div>
  `;
}

function renderLoreForm() {
  const isNew = state.editingLoreId === "new";
  const rawItem = isNew ? { type: state.loreFilter === "all" ? "character" : state.loreFilter, parent_id: state.selectedLoreFolderId || "", details: {} } : state.data.lore.find((entry) => entry.id === state.editingLoreId);
  const formType = state.loreFormType || rawItem?.type || "character";
  const item = { ...(rawItem || {}), type: formType };
  const details = item?.details || {};
  const fieldSpec = loreDetailFields[item?.type || "character"] || loreDetailFields.other;
  const selectedLinks = state.data.links.filter((link) => link.source_id === item?.id).map((link) => link.target_id);
  const selectedVisibility = state.data.loreVisibility.filter((row) => row.entry_id === item?.id).map((row) => row.user_id);
  const parentOptions = state.data.lore.filter((entry) => ["folder", "zone"].includes(entry.type) && entry.id !== item?.id);
  const otherLore = state.data.lore.filter((entry) => entry.id !== item?.id);
  const players = state.data.profiles.filter((profile) => profile.role !== "dm");
  return `
    <div class="panel-header">
      <h3>${isNew ? "Nueva ficha" : "Editar ficha"}</h3>
      <button type="button" class="icon-button ghost" title="Cerrar" data-action="cancel-lore">${icon("x")}</button>
    </div>
    <div class="panel-body">
      <form class="form-grid" data-form="lore">
        <input type="hidden" name="id" value="${escapeAttr(item?.id || "")}" />
        <div class="grid-3">
          <label class="field">
            <span>Tipo</span>
            <select name="type" data-action="change-lore-type">
              ${Object.entries(loreTypes)
                .filter(([type]) => type !== "all")
                .map(([type, meta]) => `<option value="${type}" ${item?.type === type ? "selected" : ""}>${meta.singular}</option>`)
                .join("")}
            </select>
          </label>
          <label class="field">
            <span>Nombre</span>
            <input name="title" value="${escapeAttr(item?.title || "")}" required />
          </label>
          <label class="field">
            <span>Subtitulo</span>
            <input name="subtitle" value="${escapeAttr(item?.subtitle || "")}" />
          </label>
        </div>
        <input type="hidden" name="current_image_url" value="${escapeAttr(item?.image_url || "")}" />
        <label class="field">
          <span>Cargar imagen</span>
          <input name="image_file" type="file" accept="image/*" />
        </label>
        <div class="grid-2">
          <label class="field">
            <span>Carpeta / zona padre</span>
            <select name="parent_id">
              <option value="">Sin carpeta</option>
              ${parentOptions.map((parent) => `<option value="${parent.id}" ${item?.parent_id === parent.id ? "selected" : ""}>${escapeHtml(parent.title)} (${escapeHtml(loreTypes[parent.type]?.singular || parent.type)})</option>`).join("")}
            </select>
          </label>
        </div>
        <label class="field">
          <span>Resumen publico</span>
          <textarea name="summary">${escapeHtml(item?.summary || "")}</textarea>
        </label>
        <label class="field">
          <span>Descripcion completa</span>
          <textarea name="description">${escapeHtml(item?.description || "")}</textarea>
        </label>

        ${renderLoreDetailInputs(fieldSpec, details)}
        <div class="grid-2">
          <div class="field">
            <span>Vincular con</span>
            ${renderCheckList(
              "related_ids",
              otherLore.map((entry) => ({ value: entry.id, label: `${entry.title} (${loreTypes[entry.type]?.singular || entry.type})` })),
              selectedLinks,
            )}
          </div>
          <label class="field">
            <span>Etiqueta del vinculo</span>
            <input name="relation_label" value="${escapeAttr(state.data.links.find((link) => link.source_id === item?.id)?.relation_label || "Relacionado con")}" />
          </label>
        </div>
        <div class="field">
          <span>Visibilidad</span>
          ${renderCheckList(
            "visible_user_ids",
            players.map((profile) => ({ value: profile.id, label: profile.character_name || profile.display_name })),
            selectedVisibility,
          )}
          <span class="inline-label">Sin seleccionar a nadie = publico para toda la mesa. Selecciona personajes para convertirlo en secreto.</span>
        </div>
        <div class="form-actions">
          <button class="primary" type="submit">${icon("save")} Guardar ficha</button>
          <button type="button" class="ghost" data-action="cancel-lore">${icon("x")} Cancelar</button>
        </div>
      </form>
    </div>
  `;
}

function renderLoreDetailInputs(fields, details = {}) {
  if (!fields.length) {
    return `<div class="banner">${icon("folder")} Las carpetas solo agrupan contenido. Usa resumen y descripcion para explicar que guardas dentro.</div>`;
  }
  return `
    <div class="lore-type-fields">
      ${fields
        .map(([key, label, kind]) => {
          const value = details[key] || "";
          return `
            <label class="field">
              <span>${escapeHtml(label)}</span>
              ${kind === "textarea" ? `<textarea name="${escapeAttr(key)}">${escapeHtml(value)}</textarea>` : `<input name="${escapeAttr(key)}" value="${escapeAttr(value)}" />`}
            </label>
          `;
        })
        .join("")}
    </div>
  `;
}

function openLoreFolder(folderId) {
  state.selectedLoreFolderId = folderId;
  state.loreFilter = "all";
  state.selectedLoreId = visibleLoreEntries().find((entry) => entry.parent_id === folderId)?.id || folderId;
  state.editingLoreId = null;
  state.loreFormType = null;
  state.route = "lore";
  render();
}

function renderNotes() {
  const notes = [...state.data.notes].sort((a, b) => new Date(b.updated_at || b.created_at || 0) - new Date(a.updated_at || a.created_at || 0));
  return `
    <section class="notes-layout">
      <aside class="panel">
        <div class="panel-header"><h3>${state.editingNoteId ? "Editar apunte" : "Apunte personal"}</h3></div>
        <div class="panel-body">${renderNoteForm()}</div>
      </aside>
      <div class="panel">
        <div class="panel-header">
          <h3>Mis apuntes</h3>
          <span class="status-pill">${notes.length}</span>
        </div>
        <div class="panel-body">
          <div class="notes-list">
            ${
              notes.length
                ? notes
                    .map(
                      (note) => `
                        <article class="note-card">
                          <h3>${escapeHtml(note.title)}</h3>
                          <p>${escapeHtml(note.body || "")}</p>
                          <div class="detail-meta">
                            ${(note.tags || []).map((tag) => `<span class="tag">${escapeHtml(tag)}</span>`).join("")}
                          </div>
                          <div class="card-actions">
                            <button type="button" class="icon-button" title="Editar" data-action="edit-note" data-id="${note.id}">${icon("pencil")}</button>
                            <button type="button" class="icon-button danger" title="Borrar" data-action="delete-note" data-id="${note.id}">${icon("trash-2")}</button>
                          </div>
                        </article>
                      `,
                    )
                    .join("")
                : renderEmpty("No tienes apuntes personales.")
            }
          </div>
        </div>
      </div>
    </section>
  `;
}

function renderNoteForm() {
  const note = state.data.notes.find((item) => item.id === state.editingNoteId) || {};
  return `
    <form class="form-grid" data-form="note">
      <input type="hidden" name="id" value="${escapeAttr(note.id || "")}" />
      <label class="field">
        <span>Titulo</span>
        <input name="title" value="${escapeAttr(note.title || "")}" required />
      </label>
      <label class="field">
        <span>Etiquetas</span>
        <input name="tags" value="${escapeAttr((note.tags || []).join(", "))}" placeholder="pacto, sospecha, mapa" />
      </label>
      <label class="field">
        <span>Contenido</span>
        <textarea name="body" required>${escapeHtml(note.body || "")}</textarea>
      </label>
      <div class="form-actions">
        <button class="primary" type="submit">${icon("save")} Guardar</button>
        ${state.editingNoteId ? `<button type="button" class="ghost" data-action="cancel-note">${icon("x")} Cancelar</button>` : ""}
      </div>
    </form>
  `;
}

function renderStats(dmMode) {
  const profiles = state.data.profiles;
  const ownUserId = state.session.user.id;
  const players = profiles.filter((profile) => profile.role !== "dm");
  const playerIds = new Set(players.map((profile) => profile.id));
  const visibleStats = isDM() ? state.data.stats.filter((card) => playerIds.has(card.user_id)) : state.data.stats.filter((card) => card.user_id === ownUserId);
  if (dmMode && !players.length) {
    return `
      <section class="dm-layout">
        <div class="panel">
          <div class="panel-header"><h3>${icon("skull")} Mesa del DM</h3></div>
          <div class="panel-body">${renderEmpty("El DM no tiene ficha de stats. Cuando los players creen personaje, aqui podras tocar sus datos. Para bichos usa Campo batalla.")}</div>
        </div>
      </section>
    `;
  }
  const selectedUserId = dmMode ? (players.some((profile) => profile.id === state.selectedStatsUserId) ? state.selectedStatsUserId : players[0]?.id) : ownUserId;
  const selectedProfile = profiles.find((profile) => profile.id === selectedUserId) || state.profile;
  const selectedCard = state.data.stats.find((card) => card.user_id === selectedUserId) || defaultStats(selectedUserId, selectedProfile);

  if (!dmMode) {
    return `
      <section class="player-stats-layout">
        <div class="panel character-sheet-panel">
          <div class="panel-header">
            <h3>${icon("scroll-text")} Ficha de ${escapeHtml(selectedProfile?.character_name || selectedCard.character_name || "personaje")}</h3>
            <span class="status-pill">${icon("coins")} ${escapeHtml(selectedCard.soul_coins || 0)} monedas de alma</span>
          </div>
          <div class="panel-body">
            <div class="player-sheet-grid">
              <aside class="sheet-bio">${renderPlayerStatSummary(selectedCard, selectedProfile)}</aside>
              <div class="sheet-stat-stack">${renderStatNumbers(selectedCard, "sheet-stat-grid")}</div>
            </div>
          </div>
        </div>
        <div class="panel">
          <div class="panel-header"><h3>${icon("camera")} Personaje y proficiencias</h3></div>
          <div class="panel-body">${renderProfileForm(selectedProfile)}</div>
        </div>
        <div class="panel">
          <div class="panel-header"><h3>${icon("clipboard-pen-line")} Mis datos de aventura</h3></div>
          <div class="panel-body">${renderPlayerStatsForm(selectedCard)}</div>
        </div>
      </section>
    `;
  }

  return `
    <section class="dm-stats-layout">
      <aside class="panel">
        <div class="panel-header">
          <h3>Personajes</h3>
          <span class="status-pill">${visibleStats.length}</span>
        </div>
        <div class="panel-body">${renderStatsList(profiles, selectedUserId)}</div>
      </aside>
      <div class="panel">
        <div class="panel-header">
          <h3>${escapeHtml(selectedProfile?.character_name || selectedCard.character_name || "Stats")}</h3>
          ${isDM() ? `<button type="button" class="primary" data-action="roll-stress" data-id="${selectedUserId}">${icon("dice-4")} Tirar stress 1d4</button>` : ""}
        </div>
        <div class="panel-body">
          <div class="dm-stat-editor">
            ${renderStatNumbers(selectedCard, "compact-stat-grid")}
            <div class="stats-form-shell">${renderStatsForm(selectedCard, selectedProfile)}${renderDMProfileForm(selectedProfile)}${renderMemoryAdmin(selectedProfile)}</div>
          </div>
        </div>
      </div>
    </section>
  `;
}

function renderStatsList(profiles, selectedUserId) {
  const players = profiles.filter((profile) => profile.role !== "dm");
  if (!players.length) return renderEmpty("Aun no hay players.");
  return `
    <div class="stats-list">
      ${players
        .map((profile) => {
          const card = state.data.stats.find((item) => item.user_id === profile.id) || defaultStats(profile.id, profile);
          return `
            <button type="button" class="stat-card ${selectedUserId === profile.id ? "active" : ""}" data-action="select-stats" data-id="${profile.id}">
              ${renderAvatar(profile, "tiny")}
              <span>
                <h3>${escapeHtml(profile.character_name || profile.display_name)}</h3>
                <p>${icon("heart-pulse")} HP ${Number(card.hp_current || 0)}/${Number(card.hp_max || 0)} - ${icon("flame")} Stress ${Number(card.stress || 0)}</p>
              </span>
            </button>
          `;
        })
        .join("")}
    </div>
  `;
}

function renderPlayerStatSummary(card, profile) {
  if (!card) return renderEmpty("Tu ficha de stats aun no esta creada.");
  const details = profile?.character_details || {};
  const linkedLore = (profile?.character_lore_ids || [])
    .map((id) => state.data.lore.find((entry) => entry.id === id))
    .filter(Boolean);
  return `
    <div class="profile-card">
      ${renderAvatar(profile || card, "large")}
      <div>
        <h3>${escapeHtml(profile?.character_name || card.character_name || "Personaje")}</h3>
        ${profile?.character_title ? `<p>${escapeHtml(profile.character_title)}</p>` : ""}
      </div>
    </div>
    ${profile?.avatar_url ? "" : `<div class="banner">${icon("camera")} Tu ficha necesita una foto del personaje.</div>`}
    ${profile?.character_description ? `<p class="detail-prose">${escapeHtml(profile.character_description)}</p>` : ""}
    ${card.notes ? `<p>${escapeHtml(card.notes || "")}</p>` : ""}
    ${renderMemories(details.memories || [])}
    ${renderCharacterFacts(details)}
    ${
      linkedLore.length
        ? `<div class="detail-section"><h4>Vinculos del personaje</h4><div class="relations-grid">${linkedLore
            .map((entry) => `<button type="button" class="relation-card" data-action="open-lore" data-id="${entry.id}">${icon(loreTypes[entry.type]?.icon || "link")} ${escapeHtml(entry.title)}</button>`)
            .join("")}</div></div>`
        : ""
    }
  `;
}

function renderCharacterFacts(details = {}) {
  const entries = Object.entries(details).filter(([, value]) => Boolean(value));
  if (!entries.length) return "";
  return `
    <div class="detail-section">
      <h4>Rasgos</h4>
      <div class="meta-grid">
        ${entries
          .filter(([key]) => !["memories", "secrets"].includes(key) || (key === "secrets" && isDM()))
          .map(([key, value]) => {
            const meta = detailMeta[key] || { label: labelize(key), icon: "circle-dot" };
            return `<span class="fact-chip">${icon(meta.icon)} <strong>${escapeHtml(meta.label)}</strong> ${escapeHtml(value)}</span>`;
          })
          .join("")}
      </div>
    </div>
  `;
}

function normalizeMemories(memories = []) {
  return Array.from({ length: 4 }, (_, index) => {
    const memory = memories[index] || {};
    return {
      id: memory.id || `memory-${index + 1}`,
      title: memory.title || "",
      body: memory.body || "",
      killed: Boolean(memory.killed),
    };
  });
}

function renderMemories(memories = []) {
  const visible = normalizeMemories(memories).filter((memory) => memory.title || memory.body);
  if (!visible.length) return "";
  return `
    <div class="detail-section">
      <h4>${icon("brain")} Recuerdos</h4>
      <div class="memory-grid">
        ${visible
          .map(
            (memory) => `
              <article class="memory-card ${memory.killed ? "memory-dead" : ""}">
                <span class="tag">${memory.killed ? `${icon("skull")} Memoria muerta` : `${icon("sparkles")} Recuerdo vivo`}</span>
                <h3>${escapeHtml(memory.title || "Recuerdo sin titulo")}</h3>
                <p>${escapeHtml(memory.body || "")}</p>
              </article>
            `,
          )
          .join("")}
      </div>
    </div>
  `;
}

function renderMemoryEditor(details = {}) {
  const memories = normalizeMemories(details.memories || []);
  return `
    <div class="detail-section memory-editor">
      <h4>${icon("brain")} Recuerdos largos del personaje</h4>
      <div class="memory-editor-grid">
        ${memories
          .map(
            (memory, index) => `
              <div class="memory-edit-card ${memory.killed ? "memory-dead" : ""}">
                <input type="hidden" name="memory_id_${index + 1}" value="${escapeAttr(memory.id)}" />
                <input type="hidden" name="memory_killed_${index + 1}" value="${memory.killed ? "true" : "false"}" />
                <label class="field"><span>Recuerdo ${index + 1}</span><input name="memory_title_${index + 1}" value="${escapeAttr(memory.title)}" ${memory.killed ? "readonly" : ""} /></label>
                <label class="field"><span>Pieza larga de lore</span><textarea name="memory_body_${index + 1}" ${memory.killed ? "readonly" : ""}>${escapeHtml(memory.body)}</textarea></label>
                ${memory.killed ? `<span class="inline-label">${icon("skull")} El DM ha matado este recuerdo.</span>` : ""}
              </div>
            `,
          )
          .join("")}
      </div>
    </div>
  `;
}

function renderMemoryAdmin(profile) {
  const memories = normalizeMemories(profile?.character_details?.memories || []).filter((memory) => memory.title || memory.body);
  if (!memories.length) return "";
  return `
    <div class="detail-section">
      <h4>${icon("skull")} Control de recuerdos</h4>
      <div class="memory-grid">
        ${memories
          .map(
            (memory) => `
              <article class="memory-card ${memory.killed ? "memory-dead" : ""}">
                <h3>${escapeHtml(memory.title || "Recuerdo sin titulo")}</h3>
                <p>${escapeHtml(memory.body || "")}</p>
                <button type="button" class="${memory.killed ? "ghost" : "danger"}" data-action="toggle-memory" data-id="${escapeAttr(profile.id)}" data-memory="${escapeAttr(memory.id)}">
                  ${memory.killed ? `${icon("sparkles")} Restaurar memoria` : `${icon("skull")} Matar memoria`}
                </button>
              </article>
            `,
          )
          .join("")}
      </div>
    </div>
  `;
}

function renderProfileForm(profile) {
  const details = profile?.character_details || {};
  const selectedLore = profile?.character_lore_ids || [];
  const selectedConditions = parseConditions(details.combat_conditions);
  const selectedTools = parseConditions(details.tool_proficiencies);
  const linkableLore = state.data.lore.filter((entry) => ["faction", "zone", "religion"].includes(entry.type));
  return `
    <form class="form-grid" data-form="profile">
      <h3>Mi personaje</h3>
      <label class="field">
        <span>Nombre visible</span>
        <input name="display_name" value="${escapeAttr(profile?.display_name || "")}" required />
      </label>
      <label class="field">
        <span>Nombre del personaje</span>
        <input name="character_name" value="${escapeAttr(profile?.character_name || "")}" required />
      </label>
      <input type="hidden" name="current_avatar_url" value="${escapeAttr(profile?.avatar_url || "")}" />
      <label class="field">
        <span>Cargar foto</span>
        <input name="avatar_file" type="file" accept="image/*" />
      </label>
      <label class="field">
        <span>Frase / vibe</span>
        <input name="character_title" value="${escapeAttr(profile?.character_title || "")}" placeholder="Devota rota, cazador de pactos..." />
      </label>
      <div class="grid-4">
        <label class="field"><span>Raza</span><input name="race" value="${escapeAttr(details.race || "")}" /></label>
        <label class="field"><span>Edad</span><input name="age" value="${escapeAttr(details.age || "")}" /></label>
        <label class="field"><span>Clase / rol</span><input name="role" value="${escapeAttr(details.role || "")}" /></label>
        <label class="field"><span>Pronombres</span><input name="pronouns" value="${escapeAttr(details.pronouns || "")}" /></label>
      </div>
      <div class="grid-3">
        <label class="field"><span>Faccion</span><input name="faction" value="${escapeAttr(details.faction || "")}" /></label>
        <label class="field"><span>Religion</span><input name="religion" value="${escapeAttr(details.religion || "")}" /></label>
        <label class="field"><span>Zona</span><input name="location" value="${escapeAttr(details.location || "")}" /></label>
      </div>
      <label class="field">
        <span>Personalidad visible</span>
        <textarea name="character_description">${escapeHtml(profile?.character_description || "")}</textarea>
      </label>
      <div class="grid-2">
        <label class="field"><span>Apariencia</span><textarea name="appearance">${escapeHtml(details.appearance || "")}</textarea></label>
        <label class="field"><span>Motivaciones</span><textarea name="motives">${escapeHtml(details.motives || "")}</textarea></label>
      </div>
      <div class="grid-2">
        <label class="field"><span>Alianzas</span><textarea name="alliances">${escapeHtml(details.alliances || "")}</textarea></label>
        <label class="field"><span>Recursos / rasgos</span><textarea name="resources">${escapeHtml(details.resources || "")}</textarea></label>
      </div>
      <div class="grid-2">
        <label class="field"><span>Buffos activos</span><textarea name="buffs" placeholder="Bless, aura, pocion...">${escapeHtml(details.buffs || "")}</textarea></label>
        <label class="field"><span>Debuffos activos</span><textarea name="debuffs" placeholder="Maldiciones, penalizadores, deuda...">${escapeHtml(details.debuffs || "")}</textarea></label>
      </div>
      ${renderMemoryEditor(details)}
      <div class="field">
        <span>Condiciones de combate</span>
        ${renderCheckList("combat_conditions", dndConditions.map((condition) => ({ value: condition, label: condition })), selectedConditions)}
      </div>
      <div class="field">
        <span>Proficiencias de herramientas</span>
        ${renderCheckList("tool_proficiencies", toolOptions.map((tool) => ({ value: tool, label: tool })), selectedTools)}
      </div>
      <label class="field">
        <span>Vincular con lore</span>
        ${renderCheckList(
          "character_lore_ids",
          linkableLore.map((entry) => ({ value: entry.id, label: `${entry.title} (${loreTypes[entry.type]?.singular || entry.type})` })),
          selectedLore,
        )}
      </label>
      <button class="primary" type="submit">${icon("camera")} Guardar personaje</button>
    </form>
  `;
}

function renderDMProfileForm(profile) {
  if (!profile || profile.role === "dm") return "";
  const details = profile.character_details || {};
  const selectedLore = profile.character_lore_ids || [];
  const selectedConditions = parseConditions(details.combat_conditions);
  const selectedTools = parseConditions(details.tool_proficiencies);
  const linkableLore = state.data.lore.filter((entry) => ["faction", "zone", "religion", "other"].includes(entry.type));
  return `
    <form class="form-grid dm-profile-form" data-form="dm-profile">
      <h3>${icon("id-card")} Ficha narrativa del player</h3>
      <input type="hidden" name="profile_id" value="${escapeAttr(profile.id)}" />
      <input type="hidden" name="current_avatar_url" value="${escapeAttr(profile.avatar_url || "")}" />
      <div class="grid-3">
        <label class="field"><span>Nombre visible</span><input name="display_name" value="${escapeAttr(profile.display_name || "")}" required /></label>
        <label class="field"><span>Personaje</span><input name="character_name" value="${escapeAttr(profile.character_name || "")}" required /></label>
        <label class="field"><span>Cargar foto</span><input name="avatar_file" type="file" accept="image/*" /></label>
      </div>
      <label class="field"><span>Frase / vibe</span><input name="character_title" value="${escapeAttr(profile.character_title || "")}" placeholder="Devota rota, cazador de pactos..." /></label>
      <div class="grid-4">
        <label class="field"><span>Raza</span><input name="race" value="${escapeAttr(details.race || "")}" /></label>
        <label class="field"><span>Edad</span><input name="age" value="${escapeAttr(details.age || "")}" /></label>
        <label class="field"><span>Clase / rol</span><input name="role" value="${escapeAttr(details.role || "")}" /></label>
        <label class="field"><span>Pronombres</span><input name="pronouns" value="${escapeAttr(details.pronouns || "")}" /></label>
      </div>
      <div class="grid-3">
        <label class="field"><span>Faccion</span><input name="faction" value="${escapeAttr(details.faction || "")}" /></label>
        <label class="field"><span>Religion</span><input name="religion" value="${escapeAttr(details.religion || "")}" /></label>
        <label class="field"><span>Zona</span><input name="location" value="${escapeAttr(details.location || "")}" /></label>
      </div>
      <label class="field"><span>Descripcion visible</span><textarea name="character_description">${escapeHtml(profile.character_description || "")}</textarea></label>
      <div class="grid-2">
        <label class="field"><span>Apariencia</span><textarea name="appearance">${escapeHtml(details.appearance || "")}</textarea></label>
        <label class="field"><span>Personalidad</span><textarea name="personality">${escapeHtml(details.personality || "")}</textarea></label>
      </div>
      <div class="grid-2">
        <label class="field"><span>Motivaciones</span><textarea name="motives">${escapeHtml(details.motives || "")}</textarea></label>
        <label class="field"><span>Recursos / rasgos</span><textarea name="resources">${escapeHtml(details.resources || "")}</textarea></label>
      </div>
      <div class="grid-2">
        <label class="field"><span>Alianzas</span><textarea name="alliances">${escapeHtml(details.alliances || "")}</textarea></label>
        <label class="field"><span>Buffos activos</span><textarea name="buffs">${escapeHtml(details.buffs || "")}</textarea></label>
        <label class="field"><span>Debuffos activos</span><textarea name="debuffs">${escapeHtml(details.debuffs || "")}</textarea></label>
      </div>
      ${renderMemoryEditor(details)}
      <div class="grid-2">
        <div class="field">
          <span>Condiciones de combate</span>
          ${renderCheckList("combat_conditions", dndConditions.map((condition) => ({ value: condition, label: condition })), selectedConditions)}
        </div>
        <div class="field">
          <span>Proficiencias de herramientas</span>
          ${renderCheckList("tool_proficiencies", toolOptions.map((tool) => ({ value: tool, label: tool })), selectedTools)}
        </div>
      </div>
      <label class="field">
        <span>Vincular con lore</span>
        ${renderCheckList(
          "character_lore_ids",
          linkableLore.map((entry) => ({ value: entry.id, label: `${entry.title} (${loreTypes[entry.type]?.singular || entry.type})` })),
          selectedLore,
        )}
      </label>
      <button class="primary" type="submit">${icon("save")} Guardar ficha del player</button>
    </form>
  `;
}

function renderStatNumbers(card, extraClass = "") {
  const keys = ["hp_current", "hp_max", "stress", "ac", "passive_perception", "passive_investigation", "passive_insight", "rations", "water", "inspiration", "exhaustion"];
  return `
    <div class="stats-numbers ${escapeAttr(extraClass)}">
      ${keys
        .map(
          (key) => `
            <div class="stat-number tone-${escapeAttr(statMeta[key]?.tone || "neutral")}">
              <span class="stat-icon">${icon(statMeta[key]?.icon || "circle-dot")}</span>
              <strong>${escapeHtml(card?.[key] ?? 0)}</strong>
              <span>${escapeHtml(statMeta[key]?.label || key)}</span>
            </div>
          `,
        )
        .join("")}
    </div>
  `;
}

function renderDieStage() {
  return `
    <div class="die-stage">
      <div class="die ${state.rollingUserId ? "rolling" : ""}" aria-live="polite"><span data-die-face>${escapeHtml(state.dieFace)}</span></div>
    </div>
  `;
}

function renderStatsForm(card, profile) {
  return `
    <form class="form-grid" data-form="stats">
      <input type="hidden" name="id" value="${escapeAttr(card?.id || "")}" />
      <input type="hidden" name="user_id" value="${escapeAttr(card?.user_id || profile?.id || "")}" />
      <input type="hidden" name="current_image_url" value="${escapeAttr(card?.image_url || "")}" />
      <div class="grid-3">
        <label class="field"><span>Personaje</span><input name="character_name" value="${escapeAttr(card?.character_name || profile?.character_name || "")}" /></label>
        <label class="field"><span>Foto ficha</span><input name="image_file" type="file" accept="image/*" /></label>
        <label class="field"><span>AC</span><input name="ac" type="number" value="${escapeAttr(card?.ac ?? 10)}" /></label>
      </div>
      <div class="grid-4">
        <label class="field"><span>HP actual</span><input name="hp_current" type="number" value="${escapeAttr(card?.hp_current ?? 0)}" /></label>
        <label class="field"><span>HP max</span><input name="hp_max" type="number" value="${escapeAttr(card?.hp_max ?? 0)}" /></label>
        <label class="field"><span>Stress</span><input name="stress" type="number" value="${escapeAttr(card?.stress ?? 0)}" /></label>
        <label class="field"><span>Exhaustion</span><input name="exhaustion" type="number" value="${escapeAttr(card?.exhaustion ?? 0)}" /></label>
      </div>
      <div class="grid-3">
        <label class="field"><span>PP</span><input name="passive_perception" type="number" value="${escapeAttr(card?.passive_perception ?? 10)}" /></label>
        <label class="field"><span>P. Inv</span><input name="passive_investigation" type="number" value="${escapeAttr(card?.passive_investigation ?? 10)}" /></label>
        <label class="field"><span>P. Ins</span><input name="passive_insight" type="number" value="${escapeAttr(card?.passive_insight ?? 10)}" /></label>
      </div>
      <div class="grid-3">
        <label class="field"><span>Raciones</span><input name="rations" type="number" value="${escapeAttr(card?.rations ?? 0)}" /></label>
        <label class="field"><span>Agua</span><input name="water" type="number" value="${escapeAttr(card?.water ?? 0)}" /></label>
        <label class="field"><span>Inspiracion</span><input name="inspiration" type="number" value="${escapeAttr(card?.inspiration ?? 0)}" /></label>
      </div>
      <label class="field"><span>Monedas de alma</span><input name="soul_coins" type="number" value="${escapeAttr(card?.soul_coins ?? 0)}" /></label>
      <label class="field"><span>Otros stats JSON</span><textarea name="other_stats">${escapeHtml(JSON.stringify(card?.other_stats || {}, null, 2))}</textarea></label>
      <label class="field"><span>Notas</span><textarea name="notes">${escapeHtml(card?.notes || "")}</textarea></label>
      <button class="primary" type="submit">${icon("save")} Guardar stats</button>
    </form>
  `;
}

function renderPlayerStatsForm(card) {
  return `
    <form class="form-grid" data-form="player-stats">
      <input type="hidden" name="user_id" value="${escapeAttr(state.session.user.id)}" />
      <div class="grid-4">
        <label class="field"><span>HP actual</span><input name="hp_current" type="number" value="${escapeAttr(card?.hp_current ?? 0)}" /></label>
        <label class="field"><span>HP max</span><input name="hp_max" type="number" value="${escapeAttr(card?.hp_max ?? 0)}" /></label>
        <label class="field"><span>Raciones</span><input name="rations" type="number" value="${escapeAttr(card?.rations ?? 0)}" /></label>
        <label class="field"><span>Agua</span><input name="water" type="number" value="${escapeAttr(card?.water ?? 0)}" /></label>
      </div>
      <div class="grid-3">
        <label class="field"><span>Inspiracion</span><input name="inspiration" type="number" value="${escapeAttr(card?.inspiration ?? 0)}" /></label>
        <label class="field"><span>PP</span><input name="passive_perception" type="number" value="${escapeAttr(card?.passive_perception ?? 10)}" /></label>
        <label class="field"><span>P. Ins</span><input name="passive_insight" type="number" value="${escapeAttr(card?.passive_insight ?? 10)}" /></label>
      </div>
      <label class="field"><span>Notas publicas para la mesa</span><textarea name="notes">${escapeHtml(card?.notes || "")}</textarea></label>
      <button class="primary" type="submit">${icon("save")} Guardar mis datos</button>
    </form>
  `;
}

function renderBattlefield() {
  const battleState = getBattleState();
  const currentMap = activeBattleMap(battleState);
  const mapCombatants = sortedCombatants().filter((combatant) => !combatant.map_id || combatant.map_id === currentMap.id);
  const combatants = mapCombatants.filter((combatant) => isDM() || combatant.type === "player" || combatant.visible_to_players !== false);
  const active = activeCombatant(combatants, battleState);
  const ownCombatant = mapCombatants.find((combatant) => combatant.user_id === state.session.user.id && combatant.type === "player");
  if (!state.selectedCombatantId && (isDM() ? combatants[0] : ownCombatant)) state.selectedCombatantId = (isDM() ? combatants[0] : ownCombatant).id;
  const selected = isDM() ? combatants.find((combatant) => combatant.id === state.selectedCombatantId) || active || combatants[0] : ownCombatant || active;
  const visiblePlayers = combatants.filter((combatant) => combatant.type === "player");
  const visibleMonsters = combatants.filter((combatant) => combatant.type !== "player");

  return `
    <section class="battle-layout">
      ${renderBattleRosterPanel(visiblePlayers, visibleMonsters, active, battleState)}
      <div class="panel battle-map-panel">
        <div class="panel-header">
          <h3>Campo tactico</h3>
          <div class="timeline-controls">
            <span class="status-pill">${icon(currentMap.hidden ? "eye-off" : "eye")} ${currentMap.hidden ? "Oculto a players" : "Visible"}</span>
            ${isDM() ? `<button type="button" class="ghost" data-action="toggle-map-hidden">${icon(currentMap.hidden ? "eye" : "eye-off")} ${currentMap.hidden ? "Mostrar" : "Ocultar"}</button>` : ""}
          </div>
        </div>
        <div class="panel-body">
          ${renderBattleMap(combatants, active?.id, battleState, currentMap)}
        </div>
      </div>
      <aside class="panel battle-design-panel">
        <div class="panel-header"><h3>${isDM() ? "Herramientas de diseno" : "Mi turno"}</h3></div>
        <div class="panel-body">
          ${
            isDM()
              ? renderMapDesignTools(battleState, currentMap)
              : `${renderPlayerInitiativeForm(ownCombatant, battleState)}${renderPlayerMapTools(ownCombatant, currentMap)}`
          }
        </div>
      </aside>
      ${
        isDM()
          ? `<section class="panel battle-entities-panel">
              <div class="panel-header"><h3>Fichas, monstruos y players</h3></div>
              <div class="panel-body">${renderBattleEntityTools(currentMap, selected, visiblePlayers, visibleMonsters)}</div>
            </section>`
          : ""
      }
    </section>
  `;
}

function renderBattleRosterPanel(players, monsters, active, battleState) {
  return `
    <aside class="panel battle-roster-panel">
      <div class="panel-header">
        <h3>Iniciativa</h3>
        <span class="status-pill">${icon("rotate-cw")} Ronda ${battleState.round || 1}</span>
      </div>
      <div class="panel-body">
        ${active ? renderTurnBanner(active) : renderEmpty("Aun no hay turno activo.")}
        <div class="roster-columns">
          <section class="roster-scroll">
            <h4>${icon("users")} Players</h4>
            <div class="combatant-list compact-combatants">${players.length ? players.map((combatant) => renderCombatantCard(combatant, active?.id === combatant.id)).join("") : renderEmpty("Sin players en este mapa.")}</div>
          </section>
          <section class="roster-scroll">
            <h4>${icon("skull")} Monstruos</h4>
            <div class="combatant-list compact-combatants">${monsters.length ? monsters.map((combatant) => renderCombatantCard(combatant, active?.id === combatant.id)).join("") : renderEmpty("Sin monstruos visibles.")}</div>
          </section>
        </div>
      </div>
    </aside>
  `;
}

function renderTurnBanner(combatant) {
  return `
    <div class="turn-banner">
      ${renderAvatar(combatant, "small")}
      <div>
        <span class="inline-label">Turno actual</span>
        <strong>${escapeHtml(combatant.name)}</strong>
      </div>
      <span class="status-pill">${icon("dices")} Init ${combatant.initiative ?? "?"}</span>
    </div>
  `;
}

function renderCombatantCard(combatant, active) {
  const conditions = parseConditions(combatant.conditions);
  return `
    <button type="button" class="combatant-card ${active ? "active" : ""}" data-action="select-combatant" data-id="${combatant.id}">
      ${renderAvatar(combatant, "tiny")}
      <span class="combatant-main">
        <strong>${escapeHtml(combatant.name)}</strong>
        <small>${escapeHtml(combatantTypeLabel(combatant.type))}${isDM() && combatant.visible_to_players === false ? ` - ${icon("eye-off")} oculto` : ""}</small>
      </span>
      <span class="combatant-stats">
        <span>${icon("dices")} ${escapeHtml(combatant.initiative ?? "-")}</span>
        <span>${icon("heart-pulse")} ${escapeHtml(combatant.hp_current ?? "?")}/${escapeHtml(combatant.hp_max ?? "?")}</span>
        <span>${icon("shield")} ${escapeHtml(combatant.ac ?? "?")}</span>
        ${conditions.length ? `<span>${icon("badge-alert")} ${escapeHtml(conditions.slice(0, 2).join(", "))}</span>` : ""}
      </span>
    </button>
  `;
}

function renderBattleMap(combatants, activeId, battleState, currentMap) {
  if (currentMap.hidden && !isDM()) {
    return `<div class="map-hidden">${icon("eye-off")} El mapa esta oculto mientras el DM lo prepara.</div>`;
  }
  const canClickMap = isDM() || combatants.some((combatant) => combatant.user_id === state.session.user.id && combatant.type === "player");
  const terrain = (currentMap.terrain || []).filter((cell) => isDM() || cell.visible !== false);
  const areas = (currentMap.areas || []).filter((area) => isDM() || area.visible !== false);
  const cells = [];
  const width = Number(currentMap.width || 12);
  const height = Number(currentMap.height || 8);
  for (let y = 0; y < height; y += 1) {
    for (let x = 0; x < width; x += 1) {
      const occupant = combatants.find((combatant) => Number(combatant.position_x ?? 0) === x && Number(combatant.position_y ?? 0) === y);
      const terrainCell = terrain.find((cell) => Number(cell.x) === x && Number(cell.y) === y);
      const terrainType = terrainCell?.type || "";
      const areaHits = areas.filter((area) => areaIncludesCell(area, x, y));
      cells.push(`
        <div class="map-cell ${canClickMap ? "map-cell-clickable" : ""} ${occupant ? "occupied" : ""} ${terrainType ? `terrain-${terrainType}` : ""} ${terrainCell?.visible === false ? "map-hidden-element" : ""} ${areaHits.length ? "area-hit" : ""}" data-action="${canClickMap ? "paint-map-cell" : ""}" data-x="${x}" data-y="${y}">
          ${areaHits.map((area) => `<span class="area-wash area-${escapeAttr(area.shape || "circle")} ${area.visible === false ? "map-hidden-element" : ""}"></span>`).join("")}
          ${
            occupant
              ? `<button type="button" class="map-token ${occupant.id === activeId ? "active" : ""} ${occupant.visible_to_players === false ? "map-hidden-token" : ""}" title="${escapeAttr(occupant.name)}" data-action="select-combatant" data-id="${occupant.id}" style="--token:${escapeAttr(tokenColors[occupant.type] || tokenColors.npc)}">${renderTokenFace(occupant)}</button>`
              : ""
          }
        </div>
      `);
    }
  }
  const bg = currentMap.background_url ? `background-image: linear-gradient(rgba(10,9,8,.32), rgba(10,9,8,.58)), url('${escapeAttr(currentMap.background_url)}');` : "";
  return `
    <div class="battle-map-scroll">
      <div class="battle-map" aria-label="Campo de batalla en cuadricula" style="--map-w:${width};--map-h:${height};${bg}">
        ${cells.join("")}
      </div>
    </div>
    <div class="battle-tools">
      <span class="status-pill">${icon("mouse-pointer-click")} Click para mover o colocar areas</span>
      <span class="status-pill">${icon("shield")} Paredes y obstaculos</span>
      <span class="status-pill">${icon("circle-dot")} Areas: cono, cubo, circulo, linea</span>
      <span class="status-pill">${icon("heart-pulse")} Vida visible en tracker</span>
    </div>
  `;
}

function renderMapDesignTools(battleState, currentMap) {
  return `
    <section class="battle-tool-surface">${renderMapManager(battleState, currentMap)}</section>
    <section class="battle-tool-surface">${renderTerrainEditor(currentMap)}</section>
    <section class="battle-tool-surface">${renderAreaEditor(currentMap)}</section>
  `;
}

function renderBattleEntityTools(currentMap, selected, players, monsters) {
  return `
    <section class="battle-tool-surface">${renderMonsterForm(currentMap)}</section>
    <section class="battle-tool-surface">${renderEntityRosterSummary(players, monsters)}</section>
    ${selected ? `<section class="battle-tool-surface battle-tool-wide">${renderCombatantControlForm(selected)}</section>` : ""}
  `;
}

function renderMapManager(battleState, currentMap) {
  const maps = battleMaps(battleState);
  return `
    <form class="form-grid map-settings" data-form="map-settings">
      <h3>Crear y preparar mapas</h3>
      <label class="field">
        <span>Mapa activo</span>
        <select name="active_map_id" data-action="select-active-map">
          ${maps.map((map) => `<option value="${map.id}" ${map.id === currentMap.id ? "selected" : ""}>${escapeHtml(map.name)}</option>`).join("")}
        </select>
      </label>
      <div class="grid-3">
        <label class="field"><span>Nombre</span><input name="map_name" value="${escapeAttr(currentMap.name)}" /></label>
        <label class="field"><span>Ancho</span><input name="map_width" type="number" min="4" max="120" value="${escapeAttr(currentMap.width)}" /></label>
        <label class="field"><span>Alto</span><input name="map_height" type="number" min="4" max="90" value="${escapeAttr(currentMap.height)}" /></label>
      </div>
      <input type="hidden" name="current_background_url" value="${escapeAttr(currentMap.background_url || "")}" />
      <label class="field"><span>Imagen de fondo</span><input name="background_file" type="file" accept="image/*" /></label>
      <div class="form-actions">
        <button class="primary" type="submit">${icon("save")} Guardar mapa</button>
        <button type="button" class="ghost" data-action="new-map">${icon("map-plus")} Nuevo mapa</button>
        <button type="button" class="danger" data-action="delete-map" data-id="${escapeAttr(currentMap.id)}" ${maps.length <= 1 ? "disabled" : ""}>${icon("trash-2")} Borrar mapa</button>
      </div>
    </form>
  `;
}

function renderTerrainEditor(currentMap) {
  const terrain = currentMap.terrain || [];
  return `
    <div class="form-grid terrain-editor">
      <h3>Editor de paredes y obstaculos</h3>
      <label class="field">
        <span>Modo raton</span>
        <select name="map_tool">
          <option value="move" ${selectedOption("map_tool", "move", "move")}>Mover ficha seleccionada</option>
          <option value="terrain" ${selectedOption("map_tool", "terrain", "move")}>Pintar terreno</option>
          <option value="area" ${selectedOption("map_tool", "area", "move")}>Poner area</option>
        </select>
      </label>
      <div class="grid-2">
        <label class="field">
          <span>Pincel</span>
          <select name="terrain_tool">
            <option value="wall" ${selectedOption("terrain_tool", "wall", "wall")}>Pared</option>
            <option value="obstacle" ${selectedOption("terrain_tool", "obstacle", "wall")}>Obstaculo</option>
            <option value="difficult" ${selectedOption("terrain_tool", "difficult", "wall")}>Dificil</option>
            <option value="object" ${selectedOption("terrain_tool", "object", "wall")}>Objeto</option>
            <option value="trap" ${selectedOption("terrain_tool", "trap", "wall")}>Trampa</option>
            <option value="effect" ${selectedOption("terrain_tool", "effect", "wall")}>Efecto</option>
            <option value="clear" ${selectedOption("terrain_tool", "clear", "wall")}>Borrar terreno</option>
          </select>
        </label>
        <button type="button" class="ghost" data-action="clear-map">${icon("eraser")} Limpiar mapa</button>
      </div>
      <label class="check-inline"><input name="terrain_visible" type="checkbox" ${checkedOption("terrain_visible", true)} /> Visible para players</label>
      <span class="inline-label">Selecciona pintar terreno y haz click sobre el mapa.</span>
      ${
        terrain.length
          ? `<div class="map-area-list terrain-list">${terrain.slice(0, 32).map((cell) => `<button type="button" class="tag terrain-tag terrain-${escapeAttr(cell.type || "wall")}" data-action="toggle-terrain-visible" data-id="${escapeAttr(terrainKey(cell))}">${icon(cell.visible === false ? "eye-off" : "eye")} ${escapeHtml(cell.type || "terreno")} ${Number(cell.x) + 1}-${Number(cell.y) + 1}</button>`).join("")}</div>`
          : `<span class="inline-label">Sin elementos de mapa todavia.</span>`
      }
    </div>
  `;
}

function renderAreaEditor(currentMap) {
  const areas = currentMap.areas || [];
  const centerX = Math.floor(Number(currentMap.width || 12) / 2);
  const centerY = Math.floor(Number(currentMap.height || 8) / 2);
  return `
    <form class="form-grid area-editor" data-form="map-editor">
      <h3>Efectos y areas</h3>
      <div class="grid-4">
        <label class="field"><span>Area</span><select name="area_shape"><option value="circle" ${selectedOption("area_shape", "circle", "circle")}>Circulo</option><option value="cone" ${selectedOption("area_shape", "cone", "circle")}>Cono</option><option value="cube" ${selectedOption("area_shape", "cube", "circle")}>Cubo</option><option value="line" ${selectedOption("area_shape", "line", "circle")}>Linea</option></select></label>
        <label class="field"><span>X</span><input name="area_x" type="number" value="${escapeAttr(remembered("area_x", centerX))}" min="0" max="${Number(currentMap.width || 12) - 1}" /></label>
        <label class="field"><span>Y</span><input name="area_y" type="number" value="${escapeAttr(remembered("area_y", centerY))}" min="0" max="${Number(currentMap.height || 8) - 1}" /></label>
        <label class="field"><span>Tamano</span><input name="area_size" type="number" value="${escapeAttr(remembered("area_size", 2))}" min="1" max="12" /></label>
      </div>
      <label class="field"><span>Sentido</span><select name="area_direction"><option value="E" ${selectedOption("area_direction", "E", "E")}>Este</option><option value="W" ${selectedOption("area_direction", "W", "E")}>Oeste</option><option value="N" ${selectedOption("area_direction", "N", "E")}>Norte</option><option value="S" ${selectedOption("area_direction", "S", "E")}>Sur</option><option value="NE" ${selectedOption("area_direction", "NE", "E")}>Noreste</option><option value="NW" ${selectedOption("area_direction", "NW", "E")}>Noroeste</option><option value="SE" ${selectedOption("area_direction", "SE", "E")}>Sureste</option><option value="SW" ${selectedOption("area_direction", "SW", "E")}>Suroeste</option></select></label>
      <label class="check-inline"><input name="area_visible" type="checkbox" ${checkedOption("area_visible", true)} /> Area visible para players</label>
      <label class="field"><span>Etiqueta</span><input name="area_label" placeholder="Bola de fuego, aura, oscuridad..." value="${escapeAttr(remembered("area_label", ""))}" /></label>
      <button class="primary" type="submit">${icon("shapes")} Anadir area exacta</button>
      <span class="inline-label">Tambien puedes elegir el modo area y hacer click directamente en el mapa.</span>
      ${
        areas.length
          ? `<div class="map-area-list">${areas.map((area) => `<button type="button" class="tag" data-action="toggle-area-visible" data-id="${area.id}">${icon(area.visible === false ? "eye-off" : "eye")} ${escapeHtml(area.label || area.shape)}</button><button type="button" class="tag" data-action="delete-area" data-id="${area.id}">${icon("x")}</button>`).join("")}</div>`
          : `<span class="inline-label">Sin areas activas.</span>`
      }
    </form>
  `;
}

function renderMonsterRoster(combatants) {
  const monsters = combatants.filter((combatant) => combatant.type !== "player");
  return `
    <div class="monster-roster">
      <h3>Monstruos, objetos y trampas</h3>
      <div class="combatant-list compact-combatants">
        ${monsters.length ? monsters.map((combatant) => renderCombatantCard(combatant, state.selectedCombatantId === combatant.id)).join("") : renderEmpty("Aun no hay criaturas en este mapa.")}
      </div>
    </div>
  `;
}

function renderEntityRosterSummary(players, monsters) {
  return `
    <div class="entity-roster-summary">
      <section class="entity-roster-column">
        <h3>${icon("users")} Players</h3>
        <div class="entity-scroll">${players.length ? players.map((combatant) => renderCombatantCard(combatant, state.selectedCombatantId === combatant.id)).join("") : renderEmpty("Sin players en este mapa.")}</div>
      </section>
      <section class="entity-roster-column">
        <h3>${icon("skull")} Monstruos y objetos</h3>
        <div class="entity-scroll">${monsters.length ? monsters.map((combatant) => renderCombatantCard(combatant, state.selectedCombatantId === combatant.id)).join("") : renderEmpty("Sin criaturas en este mapa.")}</div>
      </section>
    </div>
  `;
}

function renderPlayerInitiativeForm(combatant, battleState) {
  if (!battleState.initiative_requested && !combatant) {
    return renderEmpty("Cuando el DM pida iniciativa, aparecera aqui tu tirada.");
  }
  return `
    ${battleState.initiative_requested ? `<div class="banner">${icon("megaphone")} El DM esta pidiendo iniciativas.</div>` : ""}
    <form class="form-grid" data-form="initiative">
      <input type="hidden" name="id" value="${escapeAttr(combatant?.id || "")}" />
      <label class="field">
        <span>Tu iniciativa</span>
        <input name="initiative" type="number" value="${escapeAttr(combatant?.initiative ?? "")}" required />
      </label>
      <button class="primary" type="submit">${icon("send")} Enviar iniciativa</button>
    </form>
  `;
}

function renderPlayerMapTools(combatant, currentMap) {
  if (currentMap.hidden) return "";
  if (!combatant) {
    return `<div class="detail-section">${renderEmpty("Cuando tu ficha este en el mapa podras moverla y colocar areas.")}</div>`;
  }
  return `
    <div class="detail-section player-map-tools">
      <h3>Mi token y areas</h3>
      <div class="form-grid">
        <label class="field">
          <span>Modo raton</span>
          <select name="map_tool">
            <option value="move" ${selectedOption("map_tool", "move", "move")}>Mover mi ficha</option>
            <option value="area" ${selectedOption("map_tool", "area", "move")}>Poner area visible</option>
          </select>
        </label>
        <div class="grid-3">
          <label class="field"><span>Area</span><select name="area_shape"><option value="circle" ${selectedOption("area_shape", "circle", "circle")}>Circulo</option><option value="cone" ${selectedOption("area_shape", "cone", "circle")}>Cono</option><option value="cube" ${selectedOption("area_shape", "cube", "circle")}>Cubo</option><option value="line" ${selectedOption("area_shape", "line", "circle")}>Linea</option></select></label>
          <label class="field"><span>Tamano</span><input name="area_size" type="number" value="${escapeAttr(remembered("area_size", 2))}" min="1" max="12" /></label>
          <label class="field"><span>Sentido</span><select name="area_direction"><option value="E" ${selectedOption("area_direction", "E", "E")}>Este</option><option value="W" ${selectedOption("area_direction", "W", "E")}>Oeste</option><option value="N" ${selectedOption("area_direction", "N", "E")}>Norte</option><option value="S" ${selectedOption("area_direction", "S", "E")}>Sur</option><option value="NE" ${selectedOption("area_direction", "NE", "E")}>Noreste</option><option value="NW" ${selectedOption("area_direction", "NW", "E")}>Noroeste</option><option value="SE" ${selectedOption("area_direction", "SE", "E")}>Sureste</option><option value="SW" ${selectedOption("area_direction", "SW", "E")}>Suroeste</option></select></label>
        </div>
        <label class="field"><span>Etiqueta</span><input name="area_label" placeholder="Spirit guardians, cono de fuego..." value="${escapeAttr(remembered("area_label", ""))}" /></label>
        <span class="inline-label">Haz click en el mapa: en mover desplaza tu ficha; en area coloca el efecto.</span>
      </div>
    </div>
  `;
}

function renderMonsterForm(currentMap) {
  const centerX = Math.floor(Number(currentMap.width || 12) / 2);
  const centerY = Math.floor(Number(currentMap.height || 8) / 2);
  return `
    <form class="form-grid" data-form="monster">
      <h3>Anadir ficha</h3>
      <input type="hidden" name="map_id" value="${escapeAttr(currentMap.id)}" />
      <label class="field"><span>Tipo</span><select name="type"><option value="monster" ${selectedOption("type", "monster", "monster")}>Monstruo</option><option value="npc" ${selectedOption("type", "npc", "monster")}>NPC</option><option value="object" ${selectedOption("type", "object", "monster")}>Objeto</option><option value="trap" ${selectedOption("type", "trap", "monster")}>Trampa</option></select></label>
      <label class="field"><span>Importar statblock</span><textarea name="monster_block" placeholder="Pega aqui un statblock: nombre, AC/Armor Class, HP/Hit Points, notas..."></textarea></label>
      <label class="field"><span>Nombre</span><input name="name" placeholder="Diablo barbado, cultista..." /></label>
      <label class="field"><span>Foto</span><input name="avatar_file" type="file" accept="image/*" /></label>
      <label class="check-inline"><input name="visible_to_players" type="checkbox" ${checkedOption("visible_to_players", true)} /> Visible para players</label>
      <div class="grid-3">
        <label class="field"><span>Iniciativa</span><input name="initiative" type="number" value="10" /></label>
        <label class="field"><span>HP</span><input name="hp_max" type="number" value="20" /></label>
        <label class="field"><span>AC</span><input name="ac" type="number" value="13" /></label>
      </div>
      <div class="grid-2">
        <label class="field"><span>X</span><input name="position_x" type="number" value="${centerX}" min="0" max="${Number(currentMap.width || 12) - 1}" /></label>
        <label class="field"><span>Y</span><input name="position_y" type="number" value="${centerY}" min="0" max="${Number(currentMap.height || 8) - 1}" /></label>
      </div>
      <label class="field"><span>Notas</span><textarea name="notes" placeholder="Resistencia, objetivo, aura..."></textarea></label>
      <button class="primary" type="submit">${icon("skull")} Crear criatura</button>
    </form>
  `;
}

function renderCombatantControlForm(combatant) {
  const selectedConditions = parseConditions(combatant.conditions);
  const currentMap = activeBattleMap(getBattleState());
  return `
    <form class="form-grid" data-form="combatant">
      <h3>${escapeHtml(combatant.name)}</h3>
      <input type="hidden" name="id" value="${escapeAttr(combatant.id)}" />
      <input type="hidden" name="current_avatar_url" value="${escapeAttr(combatant.avatar_url || "")}" />
      <label class="field"><span>Foto</span><input name="avatar_file" type="file" accept="image/*" /></label>
      <label class="check-inline"><input name="visible_to_players" type="checkbox" ${combatant.visible_to_players === false ? "" : "checked"} /> Visible para players</label>
      <div class="grid-3">
        <label class="field"><span>Iniciativa</span><input name="initiative" type="number" value="${escapeAttr(combatant.initiative ?? "")}" /></label>
        <label class="field"><span>HP actual</span><input name="hp_current" type="number" value="${escapeAttr(combatant.hp_current ?? 0)}" /></label>
        <label class="field"><span>HP max</span><input name="hp_max" type="number" value="${escapeAttr(combatant.hp_max ?? 0)}" /></label>
      </div>
      <div class="grid-3">
        <label class="field"><span>AC</span><input name="ac" type="number" value="${escapeAttr(combatant.ac ?? 10)}" /></label>
        <label class="field"><span>X</span><input name="position_x" type="number" value="${escapeAttr(combatant.position_x ?? 0)}" min="0" max="${Number(currentMap.width || 12) - 1}" /></label>
        <label class="field"><span>Y</span><input name="position_y" type="number" value="${escapeAttr(combatant.position_y ?? 0)}" min="0" max="${Number(currentMap.height || 8) - 1}" /></label>
      </div>
      <div class="field"><span>Condiciones</span>${renderCheckList("conditions", dndConditions.map((condition) => ({ value: condition, label: condition })), selectedConditions)}</div>
      <label class="field"><span>Notas</span><textarea name="notes">${escapeHtml(combatant.notes || "")}</textarea></label>
      <div class="form-actions">
        <button class="primary" type="submit">${icon("save")} Guardar</button>
        <button type="button" class="danger" data-action="delete-combatant" data-id="${combatant.id}">${icon("trash-2")} Borrar</button>
      </div>
    </form>
  `;
}

function renderDiceRoom() {
  const rolls = [...state.data.diceRolls].sort((a, b) => new Date(b.created_at || 0) - new Date(a.created_at || 0)).slice(0, 30);
  return `
    <section class="dice-layout">
      <aside class="panel">
        <div class="panel-header"><h3>Dados 5e</h3></div>
        <div class="panel-body">
          <div class="dice-tray">
            ${diceOptions.map((sides) => `<button type="button" class="die-button" data-action="quick-roll" data-sides="${sides}">${icon(diceIcon(sides))}<span>d${sides}</span></button>`).join("")}
          </div>
          <div class="detail-section">
            <form class="form-grid" data-form="dice">
              <div class="grid-3">
                <label class="field"><span>Cantidad</span><input name="quantity" type="number" value="1" min="1" max="20" /></label>
                <label class="field"><span>Dado</span><select name="sides">${diceOptions.map((sides) => `<option value="${sides}">d${sides}</option>`).join("")}</select></label>
                <label class="field"><span>Mod</span><input name="modifier" type="number" value="0" /></label>
              </div>
              <label class="field"><span>Motivo</span><input name="label" placeholder="Percepcion, ataque, salvacion..." /></label>
              <button class="primary" type="submit">${icon("dices")} Tirar y compartir</button>
            </form>
          </div>
        </div>
      </aside>
      <div class="panel">
        <div class="panel-header">
          <h3>Historial compartido</h3>
          <span class="status-pill">${icon("users")} Todos lo ven</span>
        </div>
        <div class="panel-body">
          <div class="dice-log">
            ${
              rolls.length
                ? rolls.map((roll) => renderDiceRoll(roll)).join("")
                : renderEmpty("Todavia no se ha tirado ningun dado.")
            }
          </div>
        </div>
      </div>
    </section>
  `;
}

function renderDiceRoll(roll) {
  const profile = state.data.profiles.find((item) => item.id === roll.user_id);
  return `
    <article class="roll-card">
      ${renderAvatar(profile || { display_name: roll.roller_name }, "tiny")}
      <div>
        <strong>${escapeHtml(roll.roller_name || profile?.character_name || profile?.display_name || "Player")}</strong>
        <p>${escapeHtml(roll.label || "Tirada")} - ${escapeHtml(roll.formula)}: ${escapeHtml((roll.rolls || []).join(" + "))}${Number(roll.modifier || 0) ? ` ${Number(roll.modifier) > 0 ? "+" : "-"} ${Math.abs(Number(roll.modifier))}` : ""}</p>
      </div>
      <span class="roll-total">${escapeHtml(roll.total)}</span>
    </article>
  `;
}

function renderInventory() {
  const ownerId = isDM() ? state.selectedStatsUserId || state.data.profiles.find((profile) => profile.role !== "dm")?.id || "" : state.session.user.id;
  const items = state.data.inventory.filter((item) => isDM() || item.user_id === state.session.user.id);
  const ownerItems = items.filter((item) => item.user_id === ownerId || !isDM());
  const ownerStats = state.data.stats.find((card) => card.user_id === ownerId) || defaultStats(ownerId, state.data.profiles.find((p) => p.id === ownerId));
  const containers = inventoryContainersFor(ownerId);
  const selectedItem = ownerItems.find((item) => item.id === state.selectedInventoryItemId) || ownerItems[0] || null;
  state.selectedInventoryItemId = selectedItem?.id || null;
  return `
    <section class="inventory-layout">
      <aside class="panel">
        <div class="panel-header"><h3>${icon("coins")} Monedas de alma</h3><span class="status-pill">${escapeHtml(ownerStats.soul_coins || 0)}</span></div>
        <div class="panel-body">
          ${isDM() ? renderOwnerPicker(ownerId) : ""}
          ${isDM() ? renderSoulCoinForm(ownerId, ownerStats) : ""}
          ${renderInventoryContainerManager(ownerId, containers)}
          ${renderInventoryForm(ownerId, containers)}
        </div>
      </aside>
      <div class="panel inventory-matrix-panel">
        <div class="panel-header"><h3>${icon("boxes")} Inventario</h3><span class="status-pill">${ownerItems.length} objetos</span></div>
        <div class="panel-body">
          ${renderInventoryMatrix(ownerItems, selectedItem, containers)}
        </div>
      </div>
      <aside class="panel inventory-detail-panel">
        <div class="panel-header"><h3>${icon("search")} Detalle</h3></div>
        <div class="panel-body">${selectedItem ? renderItemDetail(selectedItem) : renderEmpty("Clica un cubo del inventario.")}</div>
      </aside>
    </section>
  `;
}

function inventoryContainersFor(ownerId) {
  const custom = (state.data.inventoryContainers || [])
    .filter((container) => container.user_id === ownerId)
    .map((container) => ({
      id: container.id,
      name: container.name || "Contenedor",
      icon: container.icon || "package",
      sort_order: Number(container.sort_order || 100),
      system: false,
    }));
  return [...defaultInventoryContainers, ...custom].sort((a, b) => Number(a.sort_order || 0) - Number(b.sort_order || 0));
}

function renderSoulCoinForm(ownerId, stats) {
  return `
    <form class="form-grid soul-form" data-form="soul-coins">
      <input type="hidden" name="user_id" value="${escapeAttr(ownerId)}" />
      <div class="grid-3">
        <label class="field"><span>Operacion</span><select name="coin_mode"><option value="add" ${selectedOption("coin_mode", "add", "add")}>Sumar</option><option value="set" ${selectedOption("coin_mode", "set", "add")}>Fijar</option></select></label>
        <label class="field"><span>Monedas</span><input name="soul_coins_delta" type="number" value="1" /></label>
        <label class="field"><span>Actual</span><input value="${escapeAttr(stats.soul_coins || 0)}" disabled /></label>
      </div>
      <button class="ghost" type="submit">${icon("coins")} Actualizar monedas</button>
    </form>
  `;
}

function renderOwnerPicker(ownerId) {
  const players = state.data.profiles.filter((profile) => profile.role !== "dm");
  return `
    <label class="field owner-picker">
      <span>Personaje</span>
      <select data-action="select-owner">
        ${players.map((profile) => `<option value="${profile.id}" ${ownerId === profile.id ? "selected" : ""}>${escapeHtml(profile.character_name || profile.display_name)}</option>`).join("")}
      </select>
    </label>
  `;
}

function renderInventoryForm(ownerId, containers = inventoryContainersFor(ownerId)) {
  const loreOptions = visibleLoreEntries().map((entry) => ({ value: entry.id, label: entry.title }));
  return `
    <form class="form-grid" data-form="inventory">
      <h3>Anadir objeto</h3>
      <input type="hidden" name="user_id" value="${escapeAttr(ownerId)}" />
      <label class="field"><span>Nombre</span><input name="name" required /></label>
      <label class="field"><span>Imagen</span><input name="image_file" type="file" accept="image/*" /></label>
      <div class="grid-2">
        <label class="field"><span>Rareza</span><select name="rarity">${Object.entries(rarityMeta).map(([key, meta]) => `<option value="${key}" ${selectedOption("rarity", key, "mundane")}>${meta.label}</option>`).join("")}</select></label>
        <label class="field"><span>Cantidad</span><input name="quantity" type="number" value="1" min="1" /></label>
      </div>
      <label class="field"><span>Almacenaje</span><select name="storage_slot">${containers.map((container) => `<option value="${escapeAttr(container.id)}" ${selectedOption("storage_slot", container.id, "mochila")}>${escapeHtml(container.name)}</option>`).join("")}</select></label>
      <label class="field"><span>Vincular lore</span>${renderCheckList("lore_ids", loreOptions, [])}</label>
      <label class="field"><span>Descripcion</span><textarea name="description"></textarea></label>
      <button class="primary" type="submit">${icon("package-plus")} Guardar objeto</button>
    </form>
  `;
}

function renderInventoryContainerManager(ownerId, containers) {
  const editing = (state.data.inventoryContainers || []).find((container) => container.id === state.editingInventoryContainerId && container.user_id === ownerId);
  return `
    <div class="inventory-containers-editor">
      <div class="inventory-container-list">
        ${containers
          .map(
            (container) => `
              <div class="container-row ${container.system ? "system" : ""}">
                <span>${icon(container.icon || "package")} ${escapeHtml(container.name)}</span>
                ${
                  container.system
                    ? `<span class="tag">base</span>`
                    : `<span class="card-actions">
                        <button type="button" class="icon-button" title="Editar contenedor" data-action="edit-inventory-container" data-id="${escapeAttr(container.id)}">${icon("pencil")}</button>
                        <button type="button" class="icon-button danger" title="Borrar contenedor" data-action="delete-inventory-container" data-id="${escapeAttr(container.id)}">${icon("trash-2")}</button>
                      </span>`
                }
              </div>
            `,
          )
          .join("")}
      </div>
      <form class="form-grid compact-form" data-form="inventory-container">
        <input type="hidden" name="id" value="${escapeAttr(editing?.id || "")}" />
        <input type="hidden" name="user_id" value="${escapeAttr(ownerId)}" />
        <div class="grid-2">
          <label class="field"><span>Contenedor</span><input name="name" value="${escapeAttr(editing?.name || "")}" placeholder="Faltriquera, baul, mula..." required /></label>
          <label class="field"><span>Icono</span><select name="icon">${inventoryContainerIcons.map(([value, label]) => `<option value="${value}" ${(editing?.icon || "package") === value ? "selected" : ""}>${label}</option>`).join("")}</select></label>
        </div>
        <label class="field"><span>Orden</span><input name="sort_order" type="number" value="${escapeAttr(editing?.sort_order ?? 100)}" /></label>
        <div class="form-actions">
          <button class="ghost" type="submit">${icon(editing ? "save" : "folder-plus")} ${editing ? "Guardar contenedor" : "Crear contenedor"}</button>
          ${editing ? `<button type="button" class="ghost" data-action="cancel-inventory-container">${icon("x")} Cancelar</button>` : ""}
        </div>
      </form>
    </div>
  `;
}

function renderInventoryMatrix(items, selectedItem, containers) {
  return `
    <div class="inventory-matrix">
      ${containers
        .map((container) => {
          const zoneItems = items.filter((item) => (item.storage_slot || "mochila") === container.id);
          return `
            <section class="inventory-zone zone-${escapeAttr(container.id)}">
              <div class="inventory-zone-head">
                <h3>${icon(container.icon || "package")} ${escapeHtml(container.name)}</h3>
                <span class="status-pill">${zoneItems.length}</span>
              </div>
              <div class="inventory-cubes">
                ${zoneItems.length ? zoneItems.map((item) => renderItemCube(item, selectedItem?.id === item.id)).join("") : `<span class="inventory-empty-slot"></span><span class="inventory-empty-slot"></span><span class="inventory-empty-slot"></span>`}
              </div>
            </section>
          `;
        })
        .join("")}
    </div>
  `;
}

function renderItemCube(item, selected) {
  const rarity = rarityMeta[item.rarity || "mundane"] || rarityMeta.mundane;
  return `
    <button type="button" class="item-cube ${selected ? "active" : ""}" style="--rarity:${escapeAttr(rarity.color)}" data-action="select-inventory-item" data-id="${escapeAttr(item.id)}" title="${escapeAttr(item.name)}">
      <span class="item-cube-art">${item.image_url ? `<img src="${escapeAttr(item.image_url)}" alt="" />` : icon(offerIcon(item))}</span>
      <span class="item-cube-qty">x${escapeHtml(item.quantity || 1)}</span>
    </button>
  `;
}

function renderItemDetail(item) {
  const rarity = rarityMeta[item.rarity || "mundane"] || rarityMeta.mundane;
  const links = (item.lore_ids || []).map((id) => state.data.lore.find((entry) => entry.id === id)).filter(Boolean);
  return `
    <article class="item-card item-detail-card" style="--rarity:${escapeAttr(rarity.color)}">
      ${item.image_url ? `<img src="${escapeAttr(item.image_url)}" alt="" />` : `<div class="item-rune">${icon("package")}</div>`}
      <div>
        <span class="tag">${escapeHtml(rarity.label)} x${escapeHtml(item.quantity || 1)}</span>
        <h3>${escapeHtml(item.name)}</h3>
        <span class="status-pill">${icon("boxes")} ${escapeHtml(storageLabel(item.storage_slot || "mochila", item.user_id))}</span>
        <p>${escapeHtml(item.description || "")}</p>
        <div class="detail-meta">${links.map((entry) => `<button type="button" class="tag" data-action="open-lore" data-id="${entry.id}">${icon(loreTypes[entry.type]?.icon || "link")} ${escapeHtml(entry.title)}</button>`).join("")}</div>
      </div>
    </article>
  `;
}

function storageLabel(slot, ownerId = "") {
  const container = inventoryContainersFor(ownerId).find((entry) => entry.id === slot);
  return container?.name || defaultInventoryContainers.find((entry) => entry.id === slot)?.name || "Mochila";
}

function renderContracts() {
  const editing = state.data.contracts.find((contract) => contract.id === state.editingContractId);
  const ownerId = editing?.user_id || (isDM() ? state.selectedStatsUserId || state.data.profiles.find((p) => p.role !== "dm")?.id : state.session.user.id);
  const contracts = state.data.contracts.filter((contract) => isDM() || contract.user_id === state.session.user.id);
  return `
    <section class="contracts-layout contracts-screen">
      <aside class="panel"><div class="panel-header"><h3>${editing ? "Editar pacto" : "Nuevo pacto"}</h3></div><div class="panel-body">${isDM() ? renderOwnerPicker(ownerId) : ""}${renderContractForm(ownerId, editing)}</div></aside>
      <div class="contract-stage">
        <div class="contract-ritual" aria-hidden="true">
          <span class="ritual-scroll"></span>
          <span class="ritual-sigil sigil-a"></span>
          <span class="ritual-sigil sigil-b"></span>
          <span class="ritual-embers"></span>
        </div>
        <div class="contracts-board">${contracts.length ? contracts.map(renderContractCard).join("") : renderEmpty("Aun no hay pactos escritos.")}</div>
      </div>
    </section>
  `;
}

function renderContractForm(ownerId, contract = {}) {
  return `
    <form class="form-grid" data-form="contract">
      <input type="hidden" name="id" value="${escapeAttr(contract.id || "")}" />
      <input type="hidden" name="user_id" value="${escapeAttr(ownerId || state.session.user.id)}" />
      <label class="field"><span>Demonio / entidad</span><input name="demon_name" value="${escapeAttr(contract.demon_name || "")}" placeholder="Bel, Veyra, un notario sin rostro..." required /></label>
      <label class="field"><span>Gana a cambio</span><textarea name="reward" required>${escapeHtml(contract.reward || "")}</textarea></label>
      <label class="field"><span>Precio</span><textarea name="cost" required>${escapeHtml(contract.cost || "")}</textarea></label>
      <label class="field"><span>Clausula oculta DM</span><textarea name="hidden_clause">${escapeHtml(contract.hidden_clause || "")}</textarea></label>
      <div class="form-actions">
        <button class="primary" type="submit">${icon("scroll-text")} ${contract.id ? "Guardar pacto" : "Sellar pacto"}</button>
        ${contract.id ? `<button type="button" class="ghost" data-action="cancel-contract">${icon("x")} Cancelar</button>` : ""}
      </div>
    </form>
  `;
}

function renderContractCard(contract) {
  return `
    <article class="contract-card">
      <span class="contract-dark-glow" aria-hidden="true"></span>
      <h3>${escapeHtml(contract.demon_name)}</h3>
      <p><strong>Recibe:</strong> ${escapeHtml(contract.reward)}</p>
      <p><strong>Paga:</strong> ${escapeHtml(contract.cost)}</p>
      ${isDM() && contract.hidden_clause ? `<p class="dm-secret"><strong>Clausula DM:</strong> ${escapeHtml(contract.hidden_clause)}</p>` : ""}
      ${
        isDM()
          ? `<div class="card-actions">
              <button type="button" class="icon-button" title="Editar" data-action="edit-contract" data-id="${escapeAttr(contract.id)}">${icon("pencil")}</button>
              <button type="button" class="icon-button danger" title="Borrar" data-action="delete-contract" data-id="${escapeAttr(contract.id)}">${icon("trash-2")}</button>
            </div>`
          : ""
      }
    </article>
  `;
}

function renderInfiltration() {
  const op = getInfiltrationState();
  const authorized = infiltrationAuthorizedProfile(op);
  const playerView = !isDM();
  const visibleClues = infiltrationVisibleClues(op);
  const visibleRoutes = infiltrationVisibleRoutes(op);
  const visibleInformants = infiltrationVisibleInformants(op);
  const visibleLocations = infiltrationVisibleLocations(op);
  return `
    <section class="infiltration-screen">
      ${isDM() ? renderInfiltrationDMControls(op, authorized) : renderInfiltrationPlayerSeal(op)}
      <div class="infiltration-command">
        <article class="panel infiltration-hero">
          <div class="panel-header">
            <h3>${icon("eye-off")} ${escapeHtml(op.config.title || "Operacion encubierta")}</h3>
            <span class="status-pill">${icon(op.config.city_alert ? "skull" : "shield")} ${op.config.city_alert ? "Alarma urbana" : "Canal frio"}</span>
          </div>
          <div class="panel-body">
            <div class="infiltration-brief">
              <div>
                <span class="inline-label">Informe sellado</span>
                <h2>Llegar a Zona Alta, encontrar aliados, abrir extraccion.</h2>
                <p>${escapeHtml(playerView ? "Solo ves rumores, rutas y contactos que la operacion ha logrado sacar de la ceniza." : op.config.dm_directive)}</p>
              </div>
              <div class="infiltration-access">
                <span class="role-pill">${icon("users")} Acceso: ${escapeHtml(authorized?.character_name || authorized?.display_name || "sin player asignado")}</span>
                <span class="role-pill">${icon(op.config.visible_to_player ? "eye" : "eye-off")} ${op.config.visible_to_player ? "visible al player" : "oculto al player"}</span>
              </div>
            </div>
            ${renderInfiltrationZoneMap(op, visibleRoutes)}
          </div>
        </article>
        <aside class="panel infiltration-side">
          <div class="panel-header"><h3>${icon("shield")} Identidad encubierta</h3></div>
          <div class="panel-body">${renderInfiltrationIdentity(op)}${renderInfiltrationResources(op)}${renderInfiltrationPreparations(op)}</div>
        </aside>
      </div>
      <section class="infiltration-grid">
        <div class="panel">
          <div class="panel-header"><h3>${icon("search")} Objetivos y acciones</h3><span class="status-pill">${visibleClues.length} pistas visibles</span></div>
          <div class="panel-body">${renderInfiltrationObjectives(op)}${renderInfiltrationActionPanel(op)}</div>
        </div>
        <div class="panel">
          <div class="panel-header"><h3>${icon("dices")} Decisiones resolubles</h3><span class="status-pill">D&D 5e</span></div>
          <div class="panel-body"><div class="decision-stack">${op.decisions.map((decision) => renderInfiltrationDecision(decision)).join("")}</div></div>
        </div>
      </section>
      <section class="infiltration-grid wide">
        <div class="panel">
          <div class="panel-header"><h3>${icon("scroll-text")} Expediente de inteligencia</h3><span class="status-pill">${visibleClues.length}/${op.clues.length}</span></div>
          <div class="panel-body">${renderInfiltrationDossier(visibleClues)}</div>
        </div>
        <div class="panel">
          <div class="panel-header"><h3>${icon("users")} Red de informadores</h3><span class="status-pill">${visibleInformants.length}</span></div>
          <div class="panel-body"><div class="informant-grid">${visibleInformants.map((informant) => renderInformantCard(informant, op)).join("")}</div></div>
        </div>
      </section>
      <section class="infiltration-grid wide">
        <div class="panel">
          <div class="panel-header"><h3>${icon("store")} Localizaciones explorables</h3><span class="status-pill">${visibleLocations.length}</span></div>
          <div class="panel-body"><div class="location-grid">${visibleLocations.map((location) => renderLocationIntel(location, op)).join("")}</div></div>
        </div>
        <div class="panel">
          <div class="panel-header"><h3>${icon("git-commit-horizontal")} Rutas entre zonas</h3><span class="status-pill">${visibleRoutes.length}/${op.routes.length}</span></div>
          <div class="panel-body"><div class="route-grid">${visibleRoutes.map((route) => renderRouteIntel(route)).join("")}</div></div>
        </div>
      </section>
      <section class="infiltration-grid wide">
        <div class="panel">
          <div class="panel-header"><h3>${icon("info")} Eventos urbanos</h3><span class="status-pill">Gritos del Abismo</span></div>
          <div class="panel-body"><div class="event-grid">${op.urbanEvents.filter((event) => isDM() || event.state !== "oculta").map(renderUrbanEventIntel).join("")}</div></div>
        </div>
        <div class="panel">
          <div class="panel-header"><h3>${icon("book-open")} MIC, Limes y magia</h3></div>
          <div class="panel-body">${renderMicAndMagic(op)}</div>
        </div>
      </section>
      <section class="panel infiltration-log-panel">
        <div class="panel-header"><h3>${icon("scroll-text")} Registro de operacion</h3></div>
        <div class="panel-body"><div class="infiltration-log">${(op.log || []).slice(0, 14).map((entry) => `<div><span>${escapeHtml(new Date(entry.at || Date.now()).toLocaleString())}</span><p>${escapeHtml(entry.text)}</p></div>`).join("")}</div></div>
      </section>
    </section>
  `;
}

function renderInfiltrationDMControls(op, authorized) {
  const players = state.data.profiles.filter((profile) => profile.role !== "dm");
  return `
    <section class="panel infiltration-dm-panel">
      <div class="panel-header">
        <h3>${icon("crown")} Consola DM de Red de Sombras</h3>
        <span class="status-pill">${authorized ? `Asignado a ${escapeHtml(authorized.character_name || authorized.display_name)}` : "sin asignar"}</span>
      </div>
      <div class="panel-body infiltration-dm-grid">
        <form class="form-grid" data-form="infiltration-config">
          <label class="field"><span>Player autorizado</span><select name="authorized_user_id"><option value="">Nadie</option>${players.map((profile) => `<option value="${profile.id}" ${op.config.authorized_user_id === profile.id ? "selected" : ""}>${escapeHtml(profile.character_name || profile.display_name)}</option>`).join("")}</select></label>
          <label class="check-row"><input name="visible_to_player" type="checkbox" ${op.config.visible_to_player ? "checked" : ""} /> Canal visible al player autorizado</label>
          <label class="check-row"><input name="city_alert" type="checkbox" ${op.config.city_alert ? "checked" : ""} /> Alarma urbana activa</label>
          <label class="field"><span>Fase</span><select name="phase">${["baja", "media", "alta", "extraccion"].map((value) => `<option value="${value}" ${op.config.phase === value ? "selected" : ""}>${labelize(value)}</option>`).join("")}</select></label>
          <label class="field"><span>Directiva DM</span><textarea name="dm_directive">${escapeHtml(op.config.dm_directive || "")}</textarea></label>
          <button class="primary" type="submit">${icon("save")} Guardar canal secreto</button>
        </form>
        <form class="form-grid" data-form="infiltration-clue">
          <h3>Anadir pista o rumor</h3>
          <div class="grid-2">
            <label class="field"><span>Categoria</span><input name="category" placeholder="Rutas ocultas, Seguridad..." required /></label>
            <label class="field"><span>Estado inicial</span><select name="state">${infiltrationClueStates.map((value) => `<option value="${value}">${labelize(value)}</option>`).join("")}</select></label>
          </div>
          <label class="field"><span>Titulo</span><input name="title" required /></label>
          <label class="field"><span>Resumen visible</span><textarea name="summary"></textarea></label>
          <label class="field"><span>Detalle</span><textarea name="details"></textarea></label>
          <label class="field"><span>Secreto DM</span><textarea name="dm_secret"></textarea></label>
          <button class="ghost" type="submit">${icon("plus")} Anadir al expediente</button>
        </form>
        <form class="form-grid" data-form="infiltration-resources">
          <h3>Recursos y sospecha</h3>
          <div class="grid-3">
            ${Object.entries(op.resources).map(([key, value]) => `<label class="field"><span>${labelize(key)}</span><input name="resource_${escapeAttr(key)}" type="number" value="${escapeAttr(value)}" /></label>`).join("")}
          </div>
          <div class="grid-3">
            ${Object.entries(op.suspicion).map(([key, value]) => `<label class="field"><span>Sospecha ${labelize(key)}</span><input name="suspicion_${escapeAttr(key)}" type="number" min="0" max="10" value="${escapeAttr(value)}" /></label>`).join("")}
          </div>
          <button class="ghost" type="submit">${icon("save")} Ajustar trackers</button>
        </form>
      </div>
    </section>
  `;
}

function renderInfiltrationPlayerSeal(op) {
  return `
    <div class="infiltration-player-seal">
      <span>${icon("eye-off")} Canal secreto activo</span>
      <strong>${escapeHtml(op.config.title || "Red de Sombras")}</strong>
    </div>
  `;
}

function renderInfiltrationIdentity(op) {
  const suspicion = clamp(op.resources.suspicion || 0, 0, 10);
  const rows = [
    ["Identidad", op.disguise.cover_identity],
    ["Apariencia", op.disguise.appearance],
    ["Olor", op.disguise.smell],
    ["Voz", op.disguise.voice],
    ["Armadura", op.disguise.armor],
    ["Conducta", op.disguise.social],
    ["Documentos", op.disguise.documents],
    ["MIC", op.disguise.mic],
  ];
  return `
    <div class="identity-core">
      <div class="suspicion-meter" style="--suspicion:${suspicion * 10}%">
        <span>Sospecha global</span>
        <strong>${suspicion}/10</strong>
        <i></i>
        <small>${escapeHtml(infiltrationSuspicionLabel(suspicion))}</small>
      </div>
      <div class="identity-facts">${rows.map(([label, value]) => `<span><b>${escapeHtml(label)}</b>${escapeHtml(value || "sin dato")}</span>`).join("")}</div>
      <div class="zone-suspicion">${Object.entries(op.suspicion).map(([key, value]) => renderSuspicionChip(key, value)).join("")}</div>
    </div>
  `;
}

function renderSuspicionChip(label, value) {
  const safe = clamp(value, 0, 10);
  return `<span class="suspicion-chip level-${Math.ceil(safe / 2)}"><b>${escapeHtml(labelize(label))}</b><i style="--level:${safe * 10}%"></i><em>${safe}</em></span>`;
}

function renderInfiltrationResources(op) {
  const meta = {
    gold: "coins",
    favors: "handshake",
    time: "clock",
    suspicion: "eye-off",
    cover: "shield",
    contacts: "users",
    documents: "scroll-text",
    equipment: "package",
    spells: "sparkles",
    known_routes: "git-commit-horizontal",
    allies_found: "search",
    allies_freed: "crown",
  };
  return `<div class="infiltration-resources">${Object.entries(op.resources).map(([key, value]) => `<span>${icon(meta[key] || "info")}<b>${escapeHtml(value)}</b><small>${escapeHtml(labelize(key))}</small></span>`).join("")}</div>`;
}

function renderInfiltrationPreparations(op) {
  return `
    <div class="preparation-rack">
      <h3>${icon("hammer")} Preparacion del infiltrado</h3>
      ${(op.preparations || [])
        .map(
          (prep) => `
            <button type="button" class="preparation-card status-${escapeAttr(prep.status)}" data-action="toggle-preparation" data-id="${escapeAttr(prep.id)}">
              <span>${escapeHtml(prep.name)}</span>
              <small>${escapeHtml(prep.cost)}</small>
              <em>${escapeHtml(prep.effect)}</em>
              <b>${escapeHtml(labelize(prep.status))}</b>
            </button>
          `,
        )
        .join("")}
    </div>
  `;
}

function renderInfiltrationZoneMap(op, routes) {
  return `
    <div class="zone-map">
      ${op.zones
        .map((zone) => {
          const routeCount = routes.filter((route) => route.from === zone.id || route.to === zone.id).length;
          return `
            <article class="zone-node access-${escapeAttr(zone.access)}">
              <span class="zone-status">${escapeHtml(labelize(zone.access))}</span>
              <h3>${escapeHtml(zone.name)}</h3>
              <p>${escapeHtml(zone.summary)}</p>
              <div class="zone-bars">
                <span>Seguridad <i style="--level:${clamp(zone.security, 0, 10) * 10}%"></i></span>
                <span>Magia <i style="--level:${clamp(zone.magic, 0, 10) * 10}%"></i></span>
              </div>
              <small>${escapeHtml(zone.factions)}</small>
              <strong>${routeCount} rutas visibles</strong>
            </article>
          `;
        })
        .join("")}
      <div class="zone-connections">${routes.map((route) => `<span class="route-wire state-${escapeAttr(route.state)}">${escapeHtml(route.name)} - ${escapeHtml(labelize(route.state))}</span>`).join("")}</div>
    </div>
  `;
}

function renderInfiltrationObjectives(op) {
  return `
    <div class="objective-track">
      ${op.objectives
        .map(
          (objective) => `
          <button type="button" class="objective-step status-${escapeAttr(objective.status)}" data-action="toggle-objective" data-id="${escapeAttr(objective.id)}" ${isDM() ? "" : "disabled"}>
            ${icon(objective.status === "completo" ? "shield" : objective.status === "activo" ? "search" : "scroll-text")}
            <span>${escapeHtml(objective.title)}</span>
            <small>${escapeHtml(labelize(objective.status))}</small>
          </button>
        `,
        )
        .join("")}
    </div>
  `;
}

function renderInfiltrationActionPanel(op) {
  return `
    <form class="infiltration-action-form" data-form="infiltration-action">
      <div class="grid-3">
        <label class="field"><span>Accion</span><select name="action_id">${infiltrationActionTemplates.map((action) => `<option value="${action.id}">${escapeHtml(action.label)}</option>`).join("")}</select></label>
        <label class="field"><span>Localizacion</span><select name="location_id">${op.locations.map((location) => `<option value="${location.id}">${escapeHtml(location.name)}</option>`).join("")}</select></label>
        <label class="field"><span>CD</span><select name="dc">${infiltrationDcOptions.map((dc) => `<option value="${dc.value}">${dc.label}</option>`).join("")}</select></label>
      </div>
      <div class="grid-3">
        <label class="field"><span>Tirada sugerida</span><select name="check_skill">${infiltrationSkillOptions.map((skill) => `<option value="${skill}">${escapeHtml(skill)}</option>`).join("")}</select></label>
        <label class="field"><span>Enfoque</span><input name="approach" placeholder="soborno, disfraz, sigilo, magia..." /></label>
        <label class="field"><span>Coste declarado</span><input name="cost" placeholder="1 tiempo, 10 oro, favor..." /></label>
      </div>
      <label class="field"><span>Plan del jugador / notas DM</span><textarea name="notes" placeholder="Que haces, como lo preparas, que intentas descubrir..."></textarea></label>
      <div class="form-actions">
        <button class="primary" type="submit">${icon("send")} Enviar decision resoluble</button>
      </div>
    </form>
  `;
}

function renderInfiltrationDecision(decision) {
  const options = decision.options || [];
  return `
    <article class="decision-card status-${escapeAttr(decision.status || "pendiente")}">
      <div class="decision-head">
        <div>
          <span class="inline-label">${escapeHtml(decision.zone || "ciudad")} - ${escapeHtml(decision.check_skill || "D&D 5e")} ${isDM() ? `CD ${escapeHtml(decision.dc || 15)}` : ""}</span>
          <h3>${escapeHtml(decision.situation)}</h3>
        </div>
        <span class="status-pill">${escapeHtml(labelize(decision.status || "pendiente"))}</span>
      </div>
      <div class="decision-options">
        ${options
          .map(
            (option) => `
              <button type="button" class="${decision.chosen === option.id ? "active" : ""}" data-action="choose-infiltration-option" data-decision="${escapeAttr(decision.id)}" data-id="${escapeAttr(option.id)}">
                <b>${escapeHtml(option.label)}</b>
                <small>${escapeHtml(option.cost)} - ${escapeHtml(option.risk)}</small>
                <em>${escapeHtml(option.reward || "")}</em>
              </button>
            `,
          )
          .join("")}
      </div>
      <form class="decision-roll" data-form="infiltration-decision">
        <input type="hidden" name="id" value="${escapeAttr(decision.id)}" />
        <div class="grid-3">
          <label class="field"><span>D20</span><input name="roll" type="number" min="1" max="20" value="10" /></label>
          <label class="field"><span>Mod</span><input name="modifier" type="number" value="0" /></label>
          <label class="field"><span>CD</span><input name="dc" type="number" value="${escapeAttr(decision.dc || 15)}" ${isDM() ? "" : "readonly"} /></label>
        </div>
        <div class="form-actions">
          <button class="ghost" type="submit">${icon("dices")} Resolver</button>
          ${isDM() ? `<button type="button" class="ghost" data-action="reveal-decision-consequence" data-id="${escapeAttr(decision.id)}">${icon("eye")} Revelar consecuencia</button>` : ""}
        </div>
      </form>
      ${decision.result ? `<p class="decision-result">${escapeHtml(decision.result)}</p>` : ""}
      ${isDM() && decision.hidden_consequence ? `<p class="dm-secret">${icon("eye-off")} ${escapeHtml(decision.hidden_consequence)}</p>` : ""}
    </article>
  `;
}

function renderInfiltrationDossier(clues) {
  const grouped = clues.reduce((acc, clue) => {
    acc[clue.category || "Sin categoria"] ||= [];
    acc[clue.category || "Sin categoria"].push(clue);
    return acc;
  }, {});
  return `<div class="intel-dossier">${Object.entries(grouped).map(([category, items]) => `<section><h3>${escapeHtml(category)}</h3><div class="intel-grid">${items.map(renderClueCard).join("")}</div></section>`).join("")}</div>`;
}

function renderClueCard(clue) {
  return `
    <article class="clue-card state-${escapeAttr(clue.state)}">
      <span class="tag">${escapeHtml(labelize(clue.state))}</span>
      <h4>${escapeHtml(clue.title)}</h4>
      <p>${escapeHtml(clue.summary || "")}</p>
      ${clue.state !== "rumor" && clue.state !== "oculta" ? `<small>${escapeHtml(clue.details || "")}</small>` : ""}
      ${isDM() && clue.dm_secret ? `<p class="dm-secret">${icon("eye-off")} ${escapeHtml(clue.dm_secret)}</p>` : ""}
      ${
        isDM()
          ? `<div class="state-buttons">${infiltrationClueStates.map((value) => `<button type="button" class="${clue.state === value ? "active" : ""}" data-action="set-clue-state" data-id="${escapeAttr(clue.id)}" data-state="${escapeAttr(value)}">${escapeHtml(labelize(value))}</button>`).join("")}</div>`
          : ""
      }
    </article>
  `;
}

function renderInformantCard(informant, op) {
  const clueNames = (informant.clue_ids || []).map((id) => op.clues.find((clue) => clue.id === id)?.title).filter(Boolean);
  return `
    <article class="informant-card status-${escapeAttr(informant.status)}">
      <div class="informant-top">
        <span class="informant-sigil">${icon(informant.traitor ? "skull" : "users")}</span>
        <div><h4>${escapeHtml(informant.name)}</h4><small>${escapeHtml(informant.type)} - ${escapeHtml(locationName(informant.location, op))}</small></div>
      </div>
      <div class="mini-stats">
        <span>Lealtad <b>${escapeHtml(informant.loyalty)}/5</b></span>
        <span>Riesgo <b>${escapeHtml(informant.risk)}/10</b></span>
        <span>Calidad <b>${escapeHtml(informant.quality)}/5</b></span>
      </div>
      <p><strong>Precio:</strong> ${escapeHtml(informant.price)}</p>
      <p><strong>Requisito:</strong> ${escapeHtml(informant.requirements)}</p>
      <p><strong>Pistas:</strong> ${escapeHtml(clueNames.join(", ") || "sin pista asignada")}</p>
      ${isDM() ? `<p class="dm-secret">${icon("eye-off")} ${escapeHtml(informant.complication || "")}</p>` : ""}
      <div class="state-buttons">
        <button type="button" data-action="pay-informant" data-id="${escapeAttr(informant.id)}">${icon("coins")} Pagar info</button>
        ${infiltrationInformantStates.map((value) => `<button type="button" class="${informant.status === value ? "active" : ""}" data-action="set-informant-status" data-id="${escapeAttr(informant.id)}" data-state="${escapeAttr(value)}">${escapeHtml(labelize(value))}</button>`).join("")}
      </div>
    </article>
  `;
}

function renderLocationIntel(location, op) {
  const clues = (location.clues || []).map((id) => op.clues.find((clue) => clue.id === id)).filter((clue) => clue && (isDM() || clue.state !== "oculta"));
  const informants = (location.informants || []).map((id) => op.informants.find((informant) => informant.id === id)).filter((informant) => informant && (isDM() || informant.status !== "no_reclutado"));
  return `
    <article class="location-card access-${escapeAttr(location.access)}">
      <span class="tag">${escapeHtml(zoneName(location.zone, op))}</span>
      <h4>${escapeHtml(location.name)}</h4>
      <div class="mini-stats">
        <span>Peligro <b>${escapeHtml(location.danger)}/10</b></span>
        <span>Vigilancia <b>${escapeHtml(location.vigilance)}/10</b></span>
        <span>${escapeHtml(labelize(location.access))}</span>
      </div>
      <p>${escapeHtml(location.actions)}</p>
      <small>Pistas visibles: ${escapeHtml(clues.map((clue) => clue.title).join(", ") || "ninguna")}</small>
      <small>Informadores: ${escapeHtml(informants.map((informant) => informant.name).join(", ") || "ninguno visible")}</small>
    </article>
  `;
}

function renderRouteIntel(route) {
  return `
    <article class="route-card state-${escapeAttr(route.state)}">
      <span class="tag">${escapeHtml(route.type)} - ${escapeHtml(route.direction)}</span>
      <h4>${escapeHtml(route.name)}</h4>
      <p>${escapeHtml(route.from)} -> ${escapeHtml(route.to)} - Riesgo: ${escapeHtml(route.risk)}</p>
      <small><strong>Requisitos:</strong> ${escapeHtml(route.requirements)}</small>
      <small><strong>Tiradas:</strong> ${escapeHtml(route.checks)}</small>
      <small><strong>Fallo:</strong> ${escapeHtml(isDM() || route.state !== "rumor" ? route.fail : "Consecuencia no confirmada")}</small>
      <small><strong>Aliados:</strong> ${escapeHtml(route.allies)}</small>
      ${
        isDM()
          ? `<div class="state-buttons">${infiltrationRouteStates.map((value) => `<button type="button" class="${route.state === value ? "active" : ""}" data-action="set-route-state" data-id="${escapeAttr(route.id)}" data-state="${escapeAttr(value)}">${escapeHtml(labelize(value))}</button>`).join("")}</div>`
          : ""
      }
    </article>
  `;
}

function renderUrbanEventIntel(event) {
  return `
    <article class="urban-event-card state-${escapeAttr(event.state)}">
      <span class="tag">${escapeHtml(labelize(event.state))}</span>
      <h4>${escapeHtml(event.title)}</h4>
      <p>${escapeHtml(event.hook)}</p>
      <small>${escapeHtml(event.checks)}</small>
      <small>${escapeHtml(event.consequences)}</small>
    </article>
  `;
}

function renderMicAndMagic(op) {
  return `
    <div class="mic-magic-grid">
      <article class="mic-card">
        <span class="tag">${escapeHtml(op.mic.status)}</span>
        <h4>${escapeHtml(op.mic.name)}</h4>
        <p>${escapeHtml(op.mic.identity)}</p>
        <p>${escapeHtml(op.mic.channeling)}</p>
        <p>${escapeHtml(op.mic.transit)}</p>
        <small><strong>Protecciones:</strong> ${escapeHtml(op.mic.protections)}</small>
        <small><strong>Manipulacion:</strong> ${escapeHtml(op.mic.tamper)}</small>
      </article>
      <div class="spell-grid">${op.spells.map((spell) => `<article><h4>${escapeHtml(spell.name)}</h4><p>${escapeHtml(spell.use)}</p><small><strong>Supera:</strong> ${escapeHtml(spell.beats)}</small><small><strong>No supera:</strong> ${escapeHtml(spell.fails)}</small><span class="tag">${escapeHtml(spell.suspicion)}</span></article>`).join("")}</div>
      <div class="checkpoint-grid">${op.checkpoints.map((checkpoint) => `<article><h4>${escapeHtml(checkpoint.name)}</h4><p>${escapeHtml(checkpoint.zone)} - seguridad ${escapeHtml(checkpoint.security)}/10</p><small><strong>Hechizos:</strong> ${escapeHtml(checkpoint.spells)}</small><small><strong>Revisa:</strong> ${escapeHtml(checkpoint.checks)}</small><small><strong>Debilidades:</strong> ${escapeHtml(isDM() ? checkpoint.weaknesses : "por descubrir")}</small><span class="tag">${escapeHtml(checkpoint.risk)}</span></article>`).join("")}</div>
    </div>
  `;
}

function renderShop() {
  const shop = getShopState();
  const offers = shop.offers || [];
  const pool = getShopPool();
  const buyerId = shopBuyerId();
  const buyerProfile = state.data.profiles.find((profile) => profile.id === buyerId) || state.profile;
  const buyerStats = state.data.stats.find((card) => card.user_id === buyerId) || defaultStats(buyerId, buyerProfile);
  return `
    <section class="shop-layout">
      <div class="panel shop-panel">
        <div class="panel-header">
          <h3>${icon("flame-kindling")} Bazar de las Tres Velas</h3>
          <div class="timeline-controls"><span class="status-pill">${icon("clock")} Renueva cada 24h</span>${isDM() ? `<button type="button" class="primary" data-action="reroll-shop">${icon("refresh-cw")} Renovar</button>` : ""}</div>
        </div>
        <div class="panel-body">
          <div class="bazaar-scene">
            <div class="merchant-art" aria-hidden="true"></div>
            <div class="bazaar-dialogue">
              <span class="inline-label">${icon("store")} Morthax el de las Tres Velas</span>
              <strong>"${escapeHtml(bazaarLine())}"</strong>
              <div class="bazaar-buyer">
                <span>${icon("user-round")} Compra para: ${escapeHtml(buyerProfile?.character_name || buyerProfile?.display_name || "Personaje")}</span>
                <span>${icon("coins")} ${escapeHtml(buyerStats.soul_coins || 0)} monedas de alma</span>
              </div>
              ${isDM() ? `<div class="bazaar-owner-picker">${renderOwnerPicker(buyerId)}</div>` : ""}
              <span class="dm-secret">${icon("eye-off")} Las clausulas reales solo las ve el DM.</span>
            </div>
          </div>
          <div class="shop-grid">${offers.length ? offers.map(renderShopOffer).join("") : renderEmpty("El tendero esta reorganizando sus maldiciones.")}</div>
        </div>
      </div>
      ${isDM() ? renderShopPoolEditor(pool) : ""}
    </section>
  `;
}

function bazaarLine() {
  const mood = bazaarLines[state.bazaarMood] ? state.bazaarMood : "welcome";
  const lines = bazaarLines[mood];
  const index = Math.floor(Date.now() / 7000) % lines.length;
  return lines[index];
}

function shopBuyerId() {
  if (!isDM()) return state.session.user.id;
  const selected = state.data.profiles.find((profile) => profile.id === state.selectedStatsUserId);
  return selected && selected.role !== "dm" ? selected.id : state.data.profiles.find((profile) => profile.role !== "dm")?.id || state.session.user.id;
}

function renderShopOffer(offer) {
  const rarity = rarityMeta[offer.rarity] || rarityMeta.common;
  const sold = Boolean(offer.sold_to);
  return `
    <article class="shop-card ${sold ? "sold" : ""}" style="--rarity:${escapeAttr(rarity.color)}">
      <div class="item-illustration shop-illustration">${icon(offer.icon || offerIcon(offer))}</div>
      <div class="shop-sigil">${icon("sparkles")}</div>
      <span class="tag">${escapeHtml(rarity.label)}</span>
      <h3>${escapeHtml(offer.name)}</h3>
      <p>${escapeHtml(offer.type || "objeto maldito")}</p>
      <strong>${icon("coins")} ${escapeHtml(offer.price)} monedas de alma</strong>
      ${isDM() ? `<p class="dm-secret">${icon("eye-off")} ${escapeHtml(offer.curse)}</p>` : ""}
      <button type="button" class="primary" data-action="buy-shop-item" data-id="${offer.id}" ${sold ? "disabled" : ""}>${sold ? "Vendido" : "Comprar"}</button>
    </article>
  `;
}

function renderShopPoolEditor(pool) {
  const editing = pool.find((item) => item.id === state.editingShopItemId) || {};
  return `
    <div class="panel shop-admin-panel">
      <div class="panel-header"><h3>${icon("store")} Pool del bazar</h3><span class="status-pill">${pool.length} objetos</span></div>
      <div class="panel-body admin-editor-grid">
        <form class="form-grid" data-form="shop-pool-item">
          <h3>${state.editingShopItemId ? "Editar objeto" : "Nuevo objeto"}</h3>
          <input type="hidden" name="id" value="${escapeAttr(editing.id || "")}" />
          <label class="field"><span>Nombre</span><input name="name" value="${escapeAttr(editing.name || "")}" required /></label>
          <div class="grid-3">
            <label class="field"><span>Rareza</span><select name="rarity">${Object.entries(rarityMeta).map(([key, meta]) => `<option value="${key}" ${String(editing.rarity || "common") === key ? "selected" : ""}>${escapeHtml(meta.label)}</option>`).join("")}</select></label>
            <label class="field"><span>Precio base</span><input name="price" type="number" min="1" value="${escapeAttr(editing.price || 1)}" /></label>
            <label class="field"><span>Icono</span><input name="icon" value="${escapeAttr(editing.icon || offerIcon(editing))}" placeholder="gem, scroll-text..." /></label>
          </div>
          <label class="field"><span>Tipo</span><input name="type" value="${escapeAttr(editing.type || "wondrous")}" /></label>
          <label class="field"><span>Maldicion oculta DM</span><textarea name="curse">${escapeHtml(editing.curse || "")}</textarea></label>
          <div class="form-actions">
            <button class="primary" type="submit">${icon("save")} Guardar pool</button>
            ${state.editingShopItemId ? `<button type="button" class="ghost" data-action="cancel-shop-item">${icon("x")} Cancelar</button>` : ""}
          </div>
        </form>
        <div class="admin-list shop-pool-list">
          ${pool
            .map(
              (item) => `
                <div class="admin-row-shell">
                  <button type="button" class="admin-row" data-action="edit-shop-item" data-id="${escapeAttr(item.id)}">${icon(item.icon || offerIcon(item))}<span>${escapeHtml(item.name)}</span><small>${escapeHtml(rarityMeta[item.rarity]?.label || item.rarity)}</small></button>
                  <button type="button" class="icon-button danger" title="Borrar" data-action="delete-shop-item" data-id="${escapeAttr(item.id)}">${icon("trash-2")}</button>
                </div>
              `,
            )
            .join("")}
        </div>
      </div>
    </div>
  `;
}

function renderCrafting() {
  const craft = tickCraftingState();
  const { ownerId, ownerProfile } = currentCraftOwner();
  const proficiencies = toolProficienciesForProfile(ownerProfile);
  const resources = getCraftingResources();
  const recipes = getCraftingRecipes();
  const visibleResources = resources.filter((resource) => proficiencies.has(resource.tool));
  const visibleRecipes = recipes.filter((recipe) => proficiencies.has(recipe.tool));
  const active = visibleResources.some((resource) => resource.name === craft.activeResource) ? craft.activeResource : visibleResources[0]?.name || "";
  const activeMeta = visibleResources.find((resource) => resource.name === active) || visibleResources[0];
  const ownerStats = state.data.stats.find((card) => card.user_id === ownerId) || defaultStats(ownerId, ownerProfile);
  return `
    <section class="crafting-layout">
      <div class="panel">
        <div class="panel-header">
          <h3>Farmeo idle en Averno</h3>
          <span class="status-pill">${icon("pickaxe")} Foco: ${escapeHtml(activeMeta?.name || "sin proficiencia")}</span>
        </div>
        <div class="panel-body">
          ${isDM() ? renderOwnerPicker(ownerId) : ""}
          <div class="craft-proficiency-line">
            <span class="inline-label">${icon("wrench")} Taller visible para ${escapeHtml(ownerProfile?.character_name || ownerProfile?.display_name || "personaje")}</span>
            <span class="status-pill">${escapeHtml(proficiencies.size)} proficiencias</span>
          </div>
          ${renderFarmActivity(activeMeta, craft)}
          <div class="idle-status">
            <div>
              <span class="inline-label">Progreso pasivo</span>
              <strong>${escapeHtml(Math.floor(craft.progress || 0))}%</strong>
            </div>
            <div class="idle-bar"><span style="width:${Math.min(100, Math.floor(craft.progress || 0))}%"></span></div>
          </div>
          ${
            visibleResources.length
              ? `<div class="resource-grid">
                  ${visibleResources
                    .map((resource) => {
                      const amount = Number(craft.resources?.[resource.name] || 0);
                      const activeClass = active === resource.name ? "active" : "";
                      return `
                        <article class="resource-card tool-card ${activeClass}" style="--tool-accent:${escapeAttr(toolAccent(resource.tool))}">
                          <div class="item-illustration tool-illustration">${icon(toolIcon(resource.tool))}</div>
                          <div class="tool-rune">${icon(toolIcon(resource.tool))}</div>
                          <div>
                            <h3>${escapeHtml(resource.name)}</h3>
                            <p>${icon("wrench")} ${escapeHtml(resource.tool)} - ${escapeHtml(resource.yield)}</p>
                            <span class="tag">${escapeHtml(resource.zone)}</span>
                          </div>
                          <strong>${escapeHtml(amount)}</strong>
                          <div class="card-actions">
                            <button type="button" class="ghost" data-action="set-farm-focus" data-id="${escapeAttr(resource.name)}">${icon("crosshair")} Foco</button>
                            <button type="button" class="primary" data-action="farm-resource" data-id="${escapeAttr(resource.name)}">${icon("pickaxe")} Farmear</button>
                          </div>
                        </article>
                      `;
                    })
                    .join("")}
                </div>`
              : renderEmpty("Este personaje no tiene proficiencias de herramientas marcadas en su ficha.")
          }
        </div>
      </div>
      <div class="panel">
        <div class="panel-header"><h3>Crafteos infernales</h3><span class="status-pill">${icon("hammer")} Exito dificil</span></div>
        <div class="panel-body">
          <div class="recipe-grid">
            ${visibleRecipes.length ? visibleRecipes.map((recipe) => renderRecipeCard(recipe, craft)).join("") : renderEmpty("Sin recetas visibles para estas proficiencias.")}
          </div>
        </div>
      </div>
      <div class="panel">
        <div class="panel-header"><h3>${icon("arrow-up-circle")} Upgrades de taller</h3><span class="status-pill">${icon("coins")} ${escapeHtml(ownerStats.soul_coins || 0)}</span></div>
        <div class="panel-body">${renderCraftingUpgrades(craft, ownerId, ownerStats)}</div>
      </div>
      ${isDM() ? renderCraftingAdmin(resources, recipes) : ""}
    </section>
  `;
}

function renderRecipeCard(recipe, craft) {
  const rarity = rarityMeta[recipe.rarity || "common"] || rarityMeta.common;
  const needs = Object.entries(recipe.needs || {});
  const ready = needs.every(([name, amount]) => Number(craft.resources?.[name] || 0) >= amount);
  return `
    <article class="recipe-card tool-card ${ready ? "ready" : ""}" style="--rarity:${escapeAttr(rarity.color)};--tool-accent:${escapeAttr(toolAccent(recipe.tool))}">
      <div class="item-illustration tool-illustration">${icon(recipe.icon || toolIcon(recipe.tool))}</div>
      <div class="tool-rune">${icon(toolIcon(recipe.tool))}</div>
      <span class="tag">${escapeHtml(rarity.label)} - ${escapeHtml(rarity.craftChance)}% base</span>
      <h3>${escapeHtml(recipe.name)}</h3>
      <p>${escapeHtml(recipe.effect)}</p>
      <div class="resource-needs">
        ${needs.map(([name, amount]) => `<span class="${Number(craft.resources?.[name] || 0) >= amount ? "ok" : ""}">${escapeHtml(name)} ${escapeHtml(craft.resources?.[name] || 0)}/${escapeHtml(amount)}</span>`).join("")}
      </div>
      <span class="tag">${icon("dices")} DC ${escapeHtml(recipe.difficulty)} - ${escapeHtml(recipe.tool)}</span>
      <button type="button" class="primary" data-action="craft-recipe" data-id="${escapeAttr(recipe.name)}" ${ready ? "" : "disabled"}>${icon("hammer")} Intentar craftear</button>
    </article>
  `;
}

function renderFarmActivity(resource, craft) {
  const active = Boolean(resource);
  return `
    <div class="farm-activity ${active ? "active" : "inactive"}" style="--tool-accent:${escapeAttr(toolAccent(resource?.tool || "none"))}">
      <div class="farm-motion farm-${escapeAttr(toolMotion(resource?.tool))}">${icon(toolIcon(resource?.tool))}</div>
      <div>
        <span class="inline-label">${active ? "Farmeo pasivo activo" : "Farmeo pasivo inactivo"}</span>
        <strong>${escapeHtml(resource?.name || "Sin foco")}</strong>
        <p>${active ? `El taller sigue trabajando entre sesiones. Ultimo pulso: ${new Date(craft.lastTick || Date.now()).toLocaleDateString("es-ES")}.` : "Marca una proficiencia y elige un foco para empezar."}</p>
      </div>
    </div>
  `;
}

function renderCraftingUpgrades(craft, ownerId, stats) {
  const owned = new Set(craft.upgrades || []);
  const proficiencies = toolProficienciesForProfile(currentCraftOwner().ownerProfile);
  const visibleUpgrades = getCraftingUpgrades().filter((upgrade) => proficiencies.has(upgrade.tool));
  return `
    <div class="upgrade-grid">
      ${visibleUpgrades.length
        ? visibleUpgrades
        .map((upgrade) => {
          const bought = owned.has(upgrade.id);
          const affordable = Number(stats.soul_coins || 0) >= Number(upgrade.cost || 0);
          return `
            <article class="upgrade-card ${bought ? "owned" : ""}" style="--tool-accent:${escapeAttr(toolAccent(upgrade.tool))}">
              <div class="item-illustration">${icon(upgrade.icon)}</div>
              <h3>${escapeHtml(upgrade.name)}</h3>
              <p>${escapeHtml(upgrade.description)}</p>
              <span class="tag">${icon(toolIcon(upgrade.tool))} ${escapeHtml(upgrade.tool)}</span>
              <span class="tag">${icon("coins")} ${escapeHtml(upgrade.cost)} monedas</span>
              <button type="button" class="primary" data-action="buy-craft-upgrade" data-id="${escapeAttr(upgrade.id)}" data-owner="${escapeAttr(ownerId)}" ${bought || !affordable ? "disabled" : ""}>${bought ? "Comprado" : "Comprar"}</button>
            </article>
          `;
        })
        .join("")
        : renderEmpty("No hay upgrades para las proficiencias de este personaje.")}
    </div>
  `;
}

function renderCraftingAdmin(resources, recipes) {
  const upgrades = getCraftingUpgrades();
  const editingResource = resources.find((resource) => resource.id === state.editingCraftResourceId) || {};
  const editingRecipe = recipes.find((recipe) => recipe.id === state.editingCraftRecipeId) || {};
  const editingUpgrade = upgrades.find((upgrade) => upgrade.id === state.editingCraftUpgradeId) || {};
  return `
    <div class="panel admin-forge-panel">
      <div class="panel-header"><h3>${icon("settings-2")} Forja del DM</h3><span class="status-pill">Pool editable</span></div>
      <div class="panel-body forge-admin-columns">
        <section class="forge-admin-column">
          <form class="form-grid" data-form="craft-resource">
            <h3>${state.editingCraftResourceId ? "Editar recurso" : "Nuevo recurso"}</h3>
            <input type="hidden" name="id" value="${escapeAttr(editingResource.id || "")}" />
            <label class="field"><span>Nombre</span><input name="name" value="${escapeAttr(editingResource.name || "")}" required /></label>
            <label class="field"><span>Herramienta</span><select name="tool">${toolOptions.map((tool) => `<option value="${escapeAttr(tool)}" ${String(editingResource.tool || "") === tool ? "selected" : ""}>${escapeHtml(tool)}</option>`).join("")}</select></label>
            <label class="field"><span>Zona</span><input name="zone" value="${escapeAttr(editingResource.zone || "Averno")}" /></label>
            <label class="field"><span>Resultado</span><textarea name="yield">${escapeHtml(editingResource.yield || "")}</textarea></label>
            <div class="form-actions">
              <button class="primary" type="submit">${icon("save")} Guardar recurso</button>
              ${state.editingCraftResourceId ? `<button type="button" class="ghost" data-action="cancel-craft-resource">${icon("x")} Cancelar</button>` : ""}
            </div>
          </form>
          <div class="admin-list forge-admin-list">
            <h3>Recursos</h3>
            ${resources.map((resource) => `<div class="admin-row-shell"><button type="button" class="admin-row" data-action="edit-craft-resource" data-id="${escapeAttr(resource.id)}">${icon(toolIcon(resource.tool))}<span>${escapeHtml(resource.name)}</span><small>${escapeHtml(resource.tool)}</small></button><button type="button" class="icon-button danger" title="Borrar" data-action="delete-craft-resource" data-id="${escapeAttr(resource.id)}">${icon("trash-2")}</button></div>`).join("")}
          </div>
        </section>
        <section class="forge-admin-column">
          <form class="form-grid" data-form="craft-recipe">
            <h3>${state.editingCraftRecipeId ? "Editar crafteo" : "Nuevo crafteo"}</h3>
            <input type="hidden" name="id" value="${escapeAttr(editingRecipe.id || "")}" />
            <label class="field"><span>Nombre</span><input name="name" value="${escapeAttr(editingRecipe.name || "")}" required /></label>
            <div class="grid-3">
              <label class="field"><span>Herramienta</span><select name="tool">${toolOptions.map((tool) => `<option value="${escapeAttr(tool)}" ${String(editingRecipe.tool || "") === tool ? "selected" : ""}>${escapeHtml(tool)}</option>`).join("")}</select></label>
              <label class="field"><span>Rareza</span><select name="rarity">${Object.entries(rarityMeta).map(([key, meta]) => `<option value="${key}" ${String(editingRecipe.rarity || "common") === key ? "selected" : ""}>${escapeHtml(meta.label)}</option>`).join("")}</select></label>
              <label class="field"><span>DC</span><input name="difficulty" type="number" value="${escapeAttr(editingRecipe.difficulty || 15)}" /></label>
            </div>
            <label class="field"><span>Necesidades JSON</span><textarea name="needs" placeholder='{"Icor de diablillo": 12}'>${escapeHtml(JSON.stringify(editingRecipe.needs || {}, null, 2))}</textarea></label>
            <label class="field"><span>Efecto</span><textarea name="effect">${escapeHtml(editingRecipe.effect || "")}</textarea></label>
            <div class="form-actions">
              <button class="primary" type="submit">${icon("save")} Guardar crafteo</button>
              ${state.editingCraftRecipeId ? `<button type="button" class="ghost" data-action="cancel-craft-recipe">${icon("x")} Cancelar</button>` : ""}
            </div>
          </form>
          <div class="admin-list forge-admin-list">
            <h3>Crafteos</h3>
            ${recipes.map((recipe) => `<div class="admin-row-shell"><button type="button" class="admin-row" data-action="edit-craft-recipe" data-id="${escapeAttr(recipe.id)}">${icon(recipe.icon || toolIcon(recipe.tool))}<span>${escapeHtml(recipe.name)}</span><small>${escapeHtml(recipe.tool)}</small></button><button type="button" class="icon-button danger" title="Borrar" data-action="delete-craft-recipe" data-id="${escapeAttr(recipe.id)}">${icon("trash-2")}</button></div>`).join("")}
          </div>
        </section>
        <section class="forge-admin-column">
          <form class="form-grid" data-form="craft-upgrade">
            <h3>${state.editingCraftUpgradeId ? "Editar upgrade" : "Nuevo upgrade"}</h3>
            <input type="hidden" name="id" value="${escapeAttr(editingUpgrade.id || "")}" />
            <label class="field"><span>Nombre</span><input name="name" value="${escapeAttr(editingUpgrade.name || "")}" required /></label>
            <div class="grid-2">
              <label class="field"><span>Herramienta</span><select name="tool">${toolOptions.map((tool) => `<option value="${escapeAttr(tool)}" ${String(editingUpgrade.tool || "") === tool ? "selected" : ""}>${escapeHtml(tool)}</option>`).join("")}</select></label>
              <label class="field"><span>Icono</span><input name="icon" value="${escapeAttr(editingUpgrade.icon || "arrow-up-circle")}" /></label>
            </div>
            <div class="grid-4">
              <label class="field"><span>Coste</span><input name="cost" type="number" min="0" value="${escapeAttr(editingUpgrade.cost || 1)}" /></label>
              <label class="field"><span>Velocidad</span><input name="speed" type="number" min="1" step="0.05" value="${escapeAttr(editingUpgrade.speed || 1.2)}" /></label>
              <label class="field"><span>Hallazgo</span><input name="find" type="number" min="0" step="0.01" value="${escapeAttr(editingUpgrade.find || 0.03)}" /></label>
              <label class="field"><span>Click</span><input name="click" type="number" min="0" value="${escapeAttr(editingUpgrade.click || 1)}" /></label>
            </div>
            <label class="field"><span>Descripcion</span><textarea name="description">${escapeHtml(editingUpgrade.description || "")}</textarea></label>
            <div class="form-actions">
              <button class="primary" type="submit">${icon("save")} Guardar upgrade</button>
              ${state.editingCraftUpgradeId ? `<button type="button" class="ghost" data-action="cancel-craft-upgrade">${icon("x")} Cancelar</button>` : ""}
            </div>
          </form>
          <div class="admin-list forge-admin-list">
            <h3>Upgrades</h3>
            ${upgrades.map((upgrade) => `<div class="admin-row-shell"><button type="button" class="admin-row" data-action="edit-craft-upgrade" data-id="${escapeAttr(upgrade.id)}">${icon(upgrade.icon || toolIcon(upgrade.tool))}<span>${escapeHtml(upgrade.name)}</span><small>${escapeHtml(upgrade.tool)}</small></button><button type="button" class="icon-button danger" title="Borrar" data-action="delete-craft-upgrade" data-id="${escapeAttr(upgrade.id)}">${icon("trash-2")}</button></div>`).join("")}
          </div>
        </section>
      </div>
    </div>
  `;
}

function currentCraftOwner() {
  const ownerId = isDM() ? state.selectedStatsUserId || state.data.profiles.find((profile) => profile.role !== "dm")?.id || state.session.user.id : state.session.user.id;
  const ownerProfile = state.data.profiles.find((profile) => profile.id === ownerId) || state.profile;
  return { ownerId, ownerProfile };
}

function toolProficienciesForProfile(profile) {
  return new Set(parseConditions(profile?.character_details?.tool_proficiencies));
}

function canUseCraftTool(tool) {
  return toolProficienciesForProfile(currentCraftOwner().ownerProfile).has(tool);
}

function toolIcon(tool) {
  return toolIcons[tool] || "wrench";
}

function toolAccent(tool) {
  let hash = 0;
  String(tool || "").split("").forEach((char) => {
    hash = (hash * 31 + char.charCodeAt(0)) % 9973;
  });
  return toolPalette[Math.abs(hash) % toolPalette.length];
}

function toolMotion(tool) {
  if (String(tool || "").toLowerCase().includes("herbalism")) return "gather";
  if (String(tool || "").toLowerCase().includes("cook")) return "stir";
  if (String(tool || "").toLowerCase().includes("calligrapher") || String(tool || "").toLowerCase().includes("forgery")) return "scribe";
  return "mine";
}

function getShopPool() {
  return normalizeShopPool(state.data.shop?.pool?.length ? state.data.shop.pool : infernalShopPool);
}

function getCraftingResources() {
  return normalizeCraftingResources(state.data.shop?.crafting_resources?.length ? state.data.shop.crafting_resources : avernusResources);
}

function getCraftingRecipes() {
  return normalizeCraftingRecipes(state.data.shop?.crafting_recipes?.length ? state.data.shop.crafting_recipes : avernusRecipes);
}

function getCraftingUpgrades() {
  return normalizeCraftingUpgrades(state.data.shop?.crafting_upgrades?.length ? state.data.shop.crafting_upgrades : defaultCraftingUpgrades);
}

function normalizeShopPool(pool = []) {
  return pool.map((item) => ({
    id: item.id || slugId(item.name),
    icon: item.icon || offerIcon(item),
    ...item,
  }));
}

function normalizeCraftingResources(resources = []) {
  return resources.map((resource) => ({ id: resource.id || slugId(`${resource.tool}-${resource.name}`), ...resource }));
}

function normalizeCraftingRecipes(recipes = []) {
  return recipes.map((recipe) => ({ id: recipe.id || slugId(`${recipe.tool}-${recipe.name}`), icon: recipe.icon || toolIcon(recipe.tool), ...recipe }));
}

function normalizeCraftingUpgrades(upgrades = []) {
  return upgrades.map((upgrade) => ({
    ...upgrade,
    id: upgrade.id || slugId(`${upgrade.tool}-${upgrade.name}`),
    icon: upgrade.icon || toolIcon(upgrade.tool),
    cost: Math.max(0, Number(upgrade.cost || 0)),
    speed: Math.max(1, Number(upgrade.speed || 1)),
    find: Math.max(0, Number(upgrade.find || 0)),
    click: Math.max(0, Number(upgrade.click || 0)),
  }));
}

function offerIcon(offer = {}) {
  const text = `${offer.type || ""} ${offer.name || ""}`.toLowerCase();
  if (text.includes("potion")) return "flask-conical";
  if (text.includes("scroll")) return "scroll-text";
  if (text.includes("ring")) return "circle";
  if (text.includes("armor")) return "shield";
  if (text.includes("weapon")) return "swords";
  if (text.includes("wand")) return "wand-sparkles";
  if (text.includes("boots")) return "footprints";
  if (text.includes("cloak")) return "shirt";
  if (text.includes("horn")) return "megaphone";
  return "gem";
}

function slugId(value) {
  return String(value || uuid())
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "")
    .slice(0, 80) || uuid();
}

function renderHunger() {
  const ownerId = isDM() ? state.selectedStatsUserId || state.data.profiles.find((p) => p.role !== "dm")?.id : state.session.user.id;
  const curses = state.data.hunger.filter((curse) => isDM() || curse.user_id === state.session.user.id);
  return `
    <section class="hunger-layout">
      <aside class="panel"><div class="panel-header"><h3>Maldicion de hambre</h3></div><div class="panel-body">${isDM() ? renderOwnerPicker(ownerId) : ""}<button type="button" class="primary" data-action="roll-hunger" data-id="${ownerId}">${icon("bone")} Generar hambre</button></div></aside>
      <div class="panel"><div class="panel-header"><h3>Manifestaciones</h3></div><div class="panel-body"><div class="lore-list hunger-scroll">${curses.length ? curses.map((curse) => `<article class="hunger-card"><h3>${escapeHtml(curse.title)}</h3><p>${escapeHtml(curse.effect)}</p><span class="tag">${escapeHtml(curse.severity)}</span></article>`).join("") : renderEmpty("Sin hambre activa.")}</div></div></div>
    </section>
  `;
}

async function onClick(event) {
  try {
    const routeButton = event.target.closest("[data-route]");
    if (routeButton) {
      playSfx("click");
      state.route = routeButton.dataset.route;
      if (state.route === "dm" && !isDM()) state.route = "timeline";
      saveUiState({ route: state.route });
      render();
      requestAnimationFrame(() => window.scrollTo({ top: 0, left: 0, behavior: "auto" }));
      return;
    }

    const action = event.target.closest("[data-action]");
    if (action) {
      const id = action.dataset.id;
      if (action.dataset.action !== "toggle-sound") playSfx(action.dataset.action);
      switch (action.dataset.action) {
        case "toggle-sound":
          toggleSound();
          break;
        case "auth-tab":
          state.authMode = action.dataset.mode;
          render();
          break;
        case "sign-out":
          await signOut();
          break;
        case "new-event":
          state.editingEventId = null;
          render();
          break;
        case "edit-event":
          state.editingEventId = id;
          render();
          break;
        case "cancel-event":
          state.editingEventId = null;
          render();
          break;
        case "delete-event":
          await deleteEvent(id);
          break;
        case "new-lore":
          state.loreFormType = state.loreFilter === "all" ? "character" : state.loreFilter;
          state.editingLoreId = "new";
          render();
          break;
        case "new-lore-folder":
          state.loreFilter = "folder";
          state.loreFormType = "folder";
          state.editingLoreId = "new";
          render();
          break;
        case "edit-lore":
          state.loreFormType = state.data.lore.find((entry) => entry.id === id)?.type || null;
          state.editingLoreId = id;
          render();
          break;
        case "cancel-lore":
          state.editingLoreId = null;
          state.loreFormType = null;
          render();
          break;
        case "delete-lore":
          await deleteLore(id);
          break;
        case "filter-lore":
          state.loreFilter = action.dataset.type;
          state.selectedLoreFolderId = null;
          state.selectedLoreId = null;
          state.loreFormType = null;
          render();
          break;
        case "clear-lore-folder":
          state.selectedLoreFolderId = null;
          state.selectedLoreId = null;
          state.loreFormType = null;
          render();
          break;
        case "open-lore":
          if (state.data.lore.find((entry) => entry.id === id)?.type === "folder") {
            openLoreFolder(id);
            break;
          }
          state.selectedLoreId = id;
          state.editingLoreId = null;
          state.route = "lore";
          render();
          break;
        case "new-note":
          state.editingNoteId = null;
          state.route = "notes";
          render();
          break;
        case "edit-note":
          state.editingNoteId = id;
          render();
          break;
        case "cancel-note":
          state.editingNoteId = null;
          render();
          break;
        case "delete-note":
          await deleteNote(id);
          break;
        case "select-stats":
          state.selectedStatsUserId = id;
          render();
          break;
        case "new-stat":
          state.route = "dm";
          state.selectedStatsUserId = state.data.profiles.find((profile) => profile.role !== "dm")?.id || state.selectedStatsUserId;
          render();
          break;
        case "roll-stress":
          await rollStress(id);
          break;
        case "reset-infiltration":
          await resetInfiltration();
          break;
        case "set-clue-state":
          await setClueState(id, action.dataset.state);
          break;
        case "set-route-state":
          await setRouteState(id, action.dataset.state);
          break;
        case "set-informant-status":
          await setInformantStatus(id, action.dataset.state);
          break;
        case "pay-informant":
          await payInformant(id);
          break;
        case "toggle-preparation":
          await togglePreparation(id);
          break;
        case "choose-infiltration-option":
          await chooseInfiltrationOption(action.dataset.decision, id);
          break;
        case "reveal-decision-consequence":
          await revealDecisionConsequence(id);
          break;
        case "toggle-objective":
          await toggleObjective(id);
          break;
        case "timeline-scroll":
          scrollTimeline(Number(action.dataset.dir || 1));
          break;
        case "request-initiative":
          await requestInitiative();
          break;
        case "next-turn":
          await advanceTurn(1);
          break;
        case "select-combatant":
          state.selectedCombatantId = id;
          render();
          break;
        case "delete-combatant":
          await deleteCombatant(id);
          break;
        case "toggle-map-hidden":
          await toggleMapHidden();
          break;
        case "paint-map-cell":
          await paintMapCell(Number(action.dataset.x), Number(action.dataset.y));
          break;
        case "clear-map":
          await clearMap();
          break;
        case "delete-area":
          await deleteMapArea(id);
          break;
        case "toggle-area-visible":
          await toggleAreaVisibility(id);
          break;
        case "toggle-terrain-visible":
          await toggleTerrainVisibility(id);
          break;
        case "new-map":
          await createBattleMap();
          break;
        case "delete-map":
          await deleteBattleMap(id);
          break;
        case "reroll-shop":
          await rerollShop();
          break;
        case "edit-shop-item":
          state.editingShopItemId = id;
          render();
          break;
        case "cancel-shop-item":
          state.editingShopItemId = null;
          render();
          break;
        case "delete-shop-item":
          await deleteShopPoolItem(id);
          break;
        case "select-inventory-item":
          state.selectedInventoryItemId = id;
          render();
          break;
        case "edit-inventory-container":
          state.editingInventoryContainerId = id;
          render();
          break;
        case "cancel-inventory-container":
          state.editingInventoryContainerId = null;
          render();
          break;
        case "delete-inventory-container":
          await deleteInventoryContainer(id);
          break;
        case "buy-shop-item":
          await buyShopItem(id);
          break;
        case "edit-contract":
          state.editingContractId = id;
          render();
          break;
        case "cancel-contract":
          state.editingContractId = null;
          render();
          break;
        case "delete-contract":
          await deleteContract(id);
          break;
        case "toggle-memory":
          await toggleMemory(id, action.dataset.memory);
          break;
        case "buy-craft-upgrade":
          await buyCraftUpgrade(id, action.dataset.owner);
          break;
        case "edit-craft-resource":
          state.editingCraftResourceId = id;
          render();
          break;
        case "edit-craft-recipe":
          state.editingCraftRecipeId = id;
          render();
          break;
        case "edit-craft-upgrade":
          state.editingCraftUpgradeId = id;
          render();
          break;
        case "delete-craft-resource":
          await deleteCraftingResource(id);
          break;
        case "delete-craft-recipe":
          await deleteCraftingRecipe(id);
          break;
        case "delete-craft-upgrade":
          await deleteCraftingUpgrade(id);
          break;
        case "cancel-craft-resource":
          state.editingCraftResourceId = null;
          render();
          break;
        case "cancel-craft-recipe":
          state.editingCraftRecipeId = null;
          render();
          break;
        case "cancel-craft-upgrade":
          state.editingCraftUpgradeId = null;
          render();
          break;
        case "farm-resource":
          farmResource(id);
          break;
        case "set-farm-focus":
          setFarmFocus(id);
          break;
        case "craft-recipe":
          await craftRecipe(id);
          break;
        case "roll-hunger":
          await rollHungerCurse(id);
          break;
        case "quick-roll":
          await saveDiceRoll({ quantity: 1, sides: Number(action.dataset.sides || 20), modifier: 0, label: `d${action.dataset.sides || 20}` });
          break;
        default:
          break;
      }
      return;
    }

    const loreCard = event.target.closest("[data-lore-id]");
    if (loreCard) {
      const item = state.data.lore.find((entry) => entry.id === loreCard.dataset.loreId);
      if (item?.type === "folder") {
        openLoreFolder(item.id);
        return;
      }
      state.selectedLoreId = loreCard.dataset.loreId;
      state.editingLoreId = null;
      render();
    }
  } catch (error) {
    showToast(error.message || "Accion no completada.");
    render();
  }
}

async function onSubmit(event) {
  const form = event.target.closest("form[data-form]");
  if (!form) return;
  event.preventDefault();
  const formData = new FormData(form);
  try {
    setBusy(true);
    playSfx(form.dataset.form);
    if (form.dataset.form === "login") await signIn(formData);
    if (form.dataset.form === "signup") await signUp(formData);
    if (form.dataset.form === "event") await saveEvent(formData);
    if (form.dataset.form === "lore") await saveLore(formData);
    if (form.dataset.form === "note") await saveNote(formData);
    if (form.dataset.form === "stats") await saveStats(formData);
    if (form.dataset.form === "player-stats") await savePlayerStats(formData);
    if (form.dataset.form === "profile") await saveProfile(formData);
    if (form.dataset.form === "dm-profile") await saveDMProfile(formData);
    if (form.dataset.form === "inventory") await saveInventoryItem(formData);
    if (form.dataset.form === "inventory-container") await saveInventoryContainer(formData);
    if (form.dataset.form === "soul-coins") await saveSoulCoins(formData);
    if (form.dataset.form === "contract") await saveContract(formData);
    if (form.dataset.form === "shop-pool-item") await saveShopPoolItem(formData);
    if (form.dataset.form === "craft-resource") await saveCraftingResource(formData);
    if (form.dataset.form === "craft-recipe") await saveCraftingRecipe(formData);
    if (form.dataset.form === "craft-upgrade") await saveCraftingUpgrade(formData);
    if (form.dataset.form === "infiltration-config") await saveInfiltrationConfig(formData);
    if (form.dataset.form === "infiltration-clue") await saveInfiltrationClue(formData);
    if (form.dataset.form === "infiltration-resources") await saveInfiltrationResources(formData);
    if (form.dataset.form === "infiltration-action") await saveInfiltrationAction(formData);
    if (form.dataset.form === "infiltration-decision") await resolveInfiltrationDecision(formData);
    if (form.dataset.form === "initiative") await saveInitiative(formData);
    if (form.dataset.form === "monster") await saveMonster(formData);
    if (form.dataset.form === "combatant") await saveCombatant(formData);
    if (form.dataset.form === "map-settings") await saveMapSettings(formData);
    if (form.dataset.form === "map-editor") await saveMapArea(formData);
    if (form.dataset.form === "dice") {
      await saveDiceRoll({
        quantity: numberValue(formData.get("quantity")) || 1,
        sides: numberValue(formData.get("sides")) || 20,
        modifier: numberValue(formData.get("modifier")),
        label: String(formData.get("label") || "").trim(),
      });
    }
  } catch (error) {
    showToast(error.message || "Algo fallo al guardar.");
  } finally {
    setBusy(false);
  }
}

function onInput(event) {
  if (event.target.name === "lore_search") {
    state.loreSearch = event.target.value;
    const visibleLore = filteredLore();
    if (!visibleLore.some((item) => item.id === state.selectedLoreId)) {
      state.selectedLoreId = visibleLore[0]?.id || null;
    }
    const selected = state.data.lore.find((item) => item.id === state.selectedLoreId) || visibleLore[0];
    const countNode = document.querySelector("[data-lore-count]");
    const listNode = document.querySelector("[data-lore-list]");
    const detailNode = document.querySelector("[data-lore-detail]");
    if (countNode) countNode.textContent = String(visibleLore.length);
    if (listNode) {
      listNode.innerHTML = renderLoreCards(visibleLore, selected);
      refreshIcons();
    }
    if (detailNode && !state.editingLoreId) {
      detailNode.innerHTML = renderLoreDetail(selected);
      refreshIcons();
    }
  }
}

async function onChange(event) {
  try {
    const action = event.target.closest("[data-action]");
    if (event.target.name) {
      state.ui.formSelections = {
        ...(state.ui.formSelections || {}),
        [event.target.name]: event.target.type === "checkbox" ? event.target.checked : event.target.value,
      };
      saveUiState({ formSelections: state.ui.formSelections });
    }
    if (action?.dataset.action === "change-lore-type") {
      state.loreFormType = event.target.value;
      render();
      return;
    }
    if (action?.dataset.action === "select-owner") {
      state.selectedStatsUserId = event.target.value;
      state.selectedInventoryItemId = null;
      state.editingInventoryContainerId = null;
      saveUiState({ selectedStatsUserId: state.selectedStatsUserId });
      render();
      return;
    }
    if (action?.dataset.action === "select-active-map") {
      await setActiveBattleMap(event.target.value);
    }
  } catch (error) {
    showToast(error.message || "No se pudo aplicar el cambio.");
    render();
  }
}

async function signIn(formData) {
  const email = String(formData.get("email") || "").trim();
  const password = String(formData.get("password") || "");
  if (hasSupabase) {
    const { data, error } = await supabase.auth.signInWithPassword({ email, password });
    if (error) throw error;
    state.session = data.session;
  } else {
    state.session = demoSignIn(email);
    localStorage.setItem(DEMO_SESSION_KEY, JSON.stringify(state.session));
  }
  await loadAll();
  showToast("Sesion iniciada.");
  render();
}

async function signUp(formData) {
  const email = String(formData.get("email") || "").trim();
  const password = String(formData.get("password") || "");
  const displayName = String(formData.get("display_name") || "").trim();
  const characterName = String(formData.get("character_name") || "").trim();
  const avatarFile = formData.get("avatar_file");
  let avatarUrl = String(formData.get("avatar_url") || "").trim();
  const characterTitle = String(formData.get("character_title") || "").trim();
  if (!avatarUrl && !hasFile(avatarFile)) throw new Error("La foto del personaje es obligatoria.");
  if (!hasSupabase) avatarUrl = await resolveImageInput(formData, "avatar_file", avatarUrl, "avatars");
  if (hasSupabase) {
    const { data, error } = await supabase.auth.signUp({
      email,
      password,
      options: { data: { display_name: displayName, character_name: characterName, avatar_url: avatarUrl, character_title: characterTitle } },
    });
    if (error) throw error;
    if (!data.session) {
      showToast("Cuenta creada. Revisa el email si Supabase pide confirmacion.");
      return;
    }
    state.session = data.session;
  } else {
    state.session = demoSignUp(email, displayName, characterName, avatarUrl, characterTitle);
    localStorage.setItem(DEMO_SESSION_KEY, JSON.stringify(state.session));
  }
  await loadAll({ displayName, characterName, avatarUrl, characterTitle });
  if (hasSupabase && hasFile(avatarFile)) {
    avatarUrl = await uploadImage(avatarFile, "avatars");
    const { error } = await supabase.from("profiles").update({ avatar_url: avatarUrl }).eq("id", state.session.user.id);
    if (error) throw error;
    await loadAll();
  }
  showToast("Cuenta creada.");
  render();
}

async function signOut() {
  if (hasSupabase) {
    const { error } = await supabase.auth.signOut();
    if (error) showToast(error.message);
  } else {
    localStorage.removeItem(DEMO_SESSION_KEY);
  }
  state.session = null;
  state.profile = null;
  state.data = emptyData();
  render();
}

async function loadAll(seedProfile = {}) {
  if (!state.session) return;
  if (hasSupabase) {
    await ensureSupabaseProfile(seedProfile);
    const requests = await Promise.all([
      supabase.from("profiles").select("*").order("display_name", { ascending: true }),
      supabase.from("timeline_events").select("*").order("sort_order", { ascending: true }),
      supabase.from("lore_entries").select("*").order("title", { ascending: true }),
      supabase.from("lore_links").select("*"),
      supabase.from("lore_entry_visibility").select("*"),
      supabase.from("player_notes").select("*").order("updated_at", { ascending: false }),
      supabase.from("stat_cards").select("*").order("updated_at", { ascending: false }),
      supabase.from("stress_rolls").select("*").order("created_at", { ascending: false }).limit(20),
      supabase.from("battle_combatants").select("*").order("initiative", { ascending: false, nullsFirst: false }),
      supabase.from("battle_states").select("*").eq("id", "main").maybeSingle(),
      supabase.from("dice_rolls").select("*").order("created_at", { ascending: false }).limit(50),
      supabase.from("inventory_items").select("*").order("created_at", { ascending: false }),
      supabase.from("inventory_containers").select("*").order("sort_order", { ascending: true }),
      supabase.from("infernal_contracts").select("*").order("created_at", { ascending: false }),
      supabase.from("hunger_curses").select("*").order("created_at", { ascending: false }),
      supabase.from("hunger_table_entries").select("*").order("roll", { ascending: true }),
      supabase.from("infernal_shop").select("*").eq("id", "main").maybeSingle(),
      supabase.from("infiltration_ops").select("*").eq("id", "main").maybeSingle(),
    ]);
    requests.forEach(({ error }) => {
      if (error) throw error;
    });
    state.data = {
      profiles: requests[0].data || [],
      events: requests[1].data || [],
      lore: requests[2].data || [],
      links: requests[3].data || [],
      loreVisibility: requests[4].data || [],
      notes: requests[5].data || [],
      stats: requests[6].data || [],
      rolls: requests[7].data || [],
      combatants: requests[8].data || [],
      battleState: requests[9].data || defaultBattleState(),
      diceRolls: requests[10].data || [],
      inventory: requests[11].data || [],
      inventoryContainers: requests[12].data || [],
      contracts: requests[13].data || [],
      hunger: requests[14].data || [],
      hungerTable: requests[15].data || [],
      shop: requests[16].data || defaultShopState(),
      infiltration: normalizeInfiltrationRecord(requests[17].data),
    };
    state.profile = state.data.profiles.find((profile) => profile.id === state.session.user.id) || null;
  } else {
    state.data = normalizeDemoData(readJson(DEMO_DATA_KEY) || emptyData());
    state.profile = state.data.profiles.find((profile) => profile.id === state.session.user.id) || null;
    state.data.notes = state.data.notes.filter((note) => note.user_id === state.session.user.id);
  }
  if (!state.selectedLoreId && state.data.lore[0]) state.selectedLoreId = state.data.lore[0].id;
  const firstPlayerId = state.data.profiles.find((profile) => profile.role !== "dm")?.id || "";
  if (!state.selectedStatsUserId || state.data.profiles.find((profile) => profile.id === state.selectedStatsUserId)?.role === "dm") {
    const stored = state.data.profiles.find((profile) => profile.id === state.ui.selectedStatsUserId && profile.role !== "dm")?.id;
    state.selectedStatsUserId = stored || firstPlayerId;
  }
}

async function ensureSupabaseProfile(seedProfile = {}) {
  const user = state.session.user;
  const { data, error } = await supabase.from("profiles").select("*").eq("id", user.id).maybeSingle();
  if (error) throw error;
  if (data) {
    state.profile = data;
    return;
  }
  const payload = {
    id: user.id,
    email: user.email,
    display_name: seedProfile.displayName || user.user_metadata?.display_name || user.email?.split("@")[0] || "Player",
    character_name: seedProfile.characterName || user.user_metadata?.character_name || "",
    avatar_url: seedProfile.avatarUrl || user.user_metadata?.avatar_url || "",
    character_title: seedProfile.characterTitle || user.user_metadata?.character_title || "",
    character_description: "",
    character_details: {},
    character_lore_ids: [],
    role: "player",
  };
  const inserted = await supabase.from("profiles").insert(payload).select("*").single();
  if (inserted.error) throw inserted.error;
  state.profile = inserted.data;
}

async function saveEvent(formData) {
  ensureDM();
  const id = String(formData.get("id") || "");
  const current = state.data.events.find((event) => event.id === id);
  const sortOrder = calculateSortOrder(
    String(formData.get("position") || "same"),
    String(formData.get("anchor_event_id") || ""),
    current,
  );
  const payload = compact({
    id: id || undefined,
    title: String(formData.get("title") || "").trim(),
    date_label: String(formData.get("date_label") || "").trim(),
    description: String(formData.get("description") || "").trim(),
    sort_order: sortOrder,
    created_by: state.session.user.id,
    updated_at: new Date().toISOString(),
  });

  if (hasSupabase) {
    const result = id
      ? await supabase.from("timeline_events").update(payload).eq("id", id)
      : await supabase.from("timeline_events").insert(payload);
    if (result.error) throw result.error;
  } else {
    const data = readJson(DEMO_DATA_KEY);
    if (id) {
      data.events = data.events.map((event) => (event.id === id ? { ...event, ...payload } : event));
    } else {
      data.events.push({ ...payload, id: uuid(), created_at: new Date().toISOString() });
    }
    saveDemo(data);
  }
  state.editingEventId = null;
  await reloadAndToast("Evento guardado.");
}

async function deleteEvent(id) {
  ensureDM();
  if (!confirm("Borrar este evento?")) return;
  if (hasSupabase) {
    const { error } = await supabase.from("timeline_events").delete().eq("id", id);
    if (error) throw error;
  } else {
    const data = readJson(DEMO_DATA_KEY);
    data.events = data.events.filter((event) => event.id !== id);
    saveDemo(data);
  }
  await reloadAndToast("Evento borrado.");
}

async function saveLore(formData) {
  ensureDM();
  const id = String(formData.get("id") || "");
  const imageUrl = await resolveImageInput(formData, "image_file", String(formData.get("current_image_url") || "").trim(), "lore");
  const details = {};
  const type = String(formData.get("type") || "character");
  (loreDetailFields[type] || loreDetailFields.other).forEach(([key]) => {
    const value = String(formData.get(key) || "").trim();
    if (value) details[key] = value;
  });
  const payload = compact({
    id: id || undefined,
    type,
    title: String(formData.get("title") || "").trim(),
    subtitle: String(formData.get("subtitle") || "").trim(),
    image_url: imageUrl,
    parent_id: String(formData.get("parent_id") || "") || null,
    summary: String(formData.get("summary") || "").trim(),
    description: String(formData.get("description") || "").trim(),
    details,
    updated_by: state.session.user.id,
    updated_at: new Date().toISOString(),
  });
  const relatedIds = formData.getAll("related_ids").map(String);
  const visibleUserIds = formData.getAll("visible_user_ids").map(String);
  const relationLabel = String(formData.get("relation_label") || "Relacionado con").trim();

  let savedId = id;
  if (hasSupabase) {
    const result = id
      ? await supabase.from("lore_entries").update(payload).eq("id", id).select("*").single()
      : await supabase.from("lore_entries").insert(payload).select("*").single();
    if (result.error) throw result.error;
    savedId = result.data.id;
    const deleted = await supabase.from("lore_links").delete().eq("source_id", savedId);
    if (deleted.error) throw deleted.error;
    if (relatedIds.length) {
      const inserted = await supabase.from("lore_links").insert(
        relatedIds.map((targetId) => ({
          source_id: savedId,
          target_id: targetId,
          relation_label: relationLabel,
        })),
      );
      if (inserted.error) throw inserted.error;
    }
    const deletedVisibility = await supabase.from("lore_entry_visibility").delete().eq("entry_id", savedId);
    if (deletedVisibility.error) throw deletedVisibility.error;
    if (visibleUserIds.length) {
      const insertedVisibility = await supabase.from("lore_entry_visibility").insert(visibleUserIds.map((userId) => ({ entry_id: savedId, user_id: userId })));
      if (insertedVisibility.error) throw insertedVisibility.error;
    }
  } else {
    const data = readJson(DEMO_DATA_KEY);
    if (id) {
      data.lore = data.lore.map((entry) => (entry.id === id ? { ...entry, ...payload } : entry));
    } else {
      savedId = uuid();
      data.lore.push({ ...payload, id: savedId, created_at: new Date().toISOString() });
    }
    data.links = data.links.filter((link) => link.source_id !== savedId);
    data.links.push(...relatedIds.map((targetId) => ({ id: uuid(), source_id: savedId, target_id: targetId, relation_label: relationLabel })));
    data.loreVisibility = data.loreVisibility.filter((row) => row.entry_id !== savedId);
    data.loreVisibility.push(...visibleUserIds.map((userId) => ({ id: uuid(), entry_id: savedId, user_id: userId })));
    saveDemo(data);
  }
  state.selectedLoreId = savedId;
  state.editingLoreId = null;
  state.loreFormType = null;
  await reloadAndToast("Ficha guardada.");
}

async function deleteLore(id) {
  ensureDM();
  if (!confirm("Borrar esta ficha de lore?")) return;
  if (hasSupabase) {
    const { error } = await supabase.from("lore_entries").delete().eq("id", id);
    if (error) throw error;
  } else {
    const data = readJson(DEMO_DATA_KEY);
    data.lore = data.lore.filter((entry) => entry.id !== id);
    data.links = data.links.filter((link) => link.source_id !== id && link.target_id !== id);
    data.loreVisibility = data.loreVisibility.filter((row) => row.entry_id !== id);
    saveDemo(data);
  }
  state.selectedLoreId = null;
  state.loreFormType = null;
  await reloadAndToast("Ficha borrada.");
}

async function saveNote(formData) {
  const id = String(formData.get("id") || "");
  const payload = compact({
    id: id || undefined,
    user_id: state.session.user.id,
    title: String(formData.get("title") || "").trim(),
    body: String(formData.get("body") || "").trim(),
    tags: String(formData.get("tags") || "")
      .split(",")
      .map((tag) => tag.trim())
      .filter(Boolean),
    updated_at: new Date().toISOString(),
  });
  if (hasSupabase) {
    const result = id
      ? await supabase.from("player_notes").update(payload).eq("id", id)
      : await supabase.from("player_notes").insert(payload);
    if (result.error) throw result.error;
  } else {
    const data = readJson(DEMO_DATA_KEY);
    if (id) {
      data.notes = data.notes.map((note) => (note.id === id ? { ...note, ...payload } : note));
    } else {
      data.notes.push({ ...payload, id: uuid(), created_at: new Date().toISOString() });
    }
    saveDemo(data);
  }
  state.editingNoteId = null;
  await reloadAndToast("Apunte guardado.");
}

async function deleteNote(id) {
  if (!confirm("Borrar este apunte?")) return;
  if (hasSupabase) {
    const { error } = await supabase.from("player_notes").delete().eq("id", id);
    if (error) throw error;
  } else {
    const data = readJson(DEMO_DATA_KEY);
    data.notes = data.notes.filter((note) => note.id !== id);
    saveDemo(data);
  }
  await reloadAndToast("Apunte borrado.");
}

async function saveStats(formData) {
  ensureDM();
  const imageUrl = await resolveImageInput(formData, "image_file", String(formData.get("current_image_url") || "").trim(), "stats");
  let otherStats = {};
  try {
    otherStats = JSON.parse(String(formData.get("other_stats") || "{}"));
  } catch {
    throw new Error("Otros stats debe ser JSON valido.");
  }
  const id = String(formData.get("id") || "");
  const payload = compact({
    id: id || undefined,
    user_id: String(formData.get("user_id") || ""),
    character_name: String(formData.get("character_name") || "").trim(),
    image_url: imageUrl,
    hp_current: numberValue(formData.get("hp_current")),
    hp_max: numberValue(formData.get("hp_max")),
    stress: numberValue(formData.get("stress")),
    ac: numberValue(formData.get("ac")),
    passive_perception: numberValue(formData.get("passive_perception")),
    passive_investigation: numberValue(formData.get("passive_investigation")),
    passive_insight: numberValue(formData.get("passive_insight")),
    rations: numberValue(formData.get("rations")),
    water: numberValue(formData.get("water")),
    inspiration: numberValue(formData.get("inspiration")),
    exhaustion: numberValue(formData.get("exhaustion")),
    soul_coins: numberValue(formData.get("soul_coins")),
    other_stats: otherStats,
    notes: String(formData.get("notes") || "").trim(),
    updated_by: state.session.user.id,
    updated_at: new Date().toISOString(),
  });
  if (!payload.user_id) throw new Error("Selecciona un player.");
  const targetProfile = state.data.profiles.find((profile) => profile.id === payload.user_id);
  if (!targetProfile || targetProfile.role === "dm") throw new Error("El DM no tiene ficha de stats.");

  if (hasSupabase) {
    const { error } = await supabase.from("stat_cards").upsert(payload, { onConflict: "user_id" });
    if (error) throw error;
  } else {
    const data = readJson(DEMO_DATA_KEY);
    const index = data.stats.findIndex((card) => card.user_id === payload.user_id);
    if (index >= 0) data.stats[index] = { ...data.stats[index], ...payload };
    else data.stats.push({ ...payload, id: uuid(), created_at: new Date().toISOString() });
    saveDemo(data);
  }
  await reloadAndToast("Stats guardados.");
}

async function savePlayerStats(formData) {
  const userId = state.session.user.id;
  const profile = state.data.profiles.find((item) => item.id === userId) || state.profile;
  const current = state.data.stats.find((card) => card.user_id === userId) || defaultStats(userId, profile);
  const payload = compact({
    ...current,
    id: current.id || undefined,
    user_id: userId,
    character_name: current.character_name || profile?.character_name || "",
    image_url: current.image_url || profile?.avatar_url || "",
    hp_current: numberValue(formData.get("hp_current")),
    hp_max: numberValue(formData.get("hp_max")),
    rations: numberValue(formData.get("rations")),
    water: numberValue(formData.get("water")),
    inspiration: numberValue(formData.get("inspiration")),
    passive_perception: numberValue(formData.get("passive_perception")),
    passive_insight: numberValue(formData.get("passive_insight")),
    notes: String(formData.get("notes") || "").trim(),
    updated_by: userId,
    updated_at: new Date().toISOString(),
  });
  if (hasSupabase) {
    const { error } = await supabase.from("stat_cards").upsert(payload, { onConflict: "user_id" });
    if (error) throw error;
  } else {
    const data = readJson(DEMO_DATA_KEY);
    const index = data.stats.findIndex((card) => card.user_id === userId);
    if (index >= 0) data.stats[index] = { ...data.stats[index], ...payload };
    else data.stats.push({ ...payload, id: uuid(), created_at: new Date().toISOString() });
    saveDemo(data);
  }
  await reloadAndToast("Tus datos estan actualizados.");
}

async function saveProfile(formData) {
  const avatarUrl = await resolveImageInput(formData, "avatar_file", String(formData.get("current_avatar_url") || "").trim(), "avatars");
  if (!avatarUrl) throw new Error("La foto del personaje es obligatoria.");
  const details = {};
  characterDetailKeys.forEach((key) => {
    const value = String(formData.get(key) || "").trim();
    if (value) details[key] = value;
  });
  const combatConditions = formData.getAll("combat_conditions").map(String);
  if (combatConditions.length) details.combat_conditions = combatConditions.join(", ");
  const toolProficiencies = formData.getAll("tool_proficiencies").map(String);
  if (toolProficiencies.length) details.tool_proficiencies = toolProficiencies.join(", ");
  const existingMemories = normalizeMemories(state.profile?.character_details?.memories || []);
  const memories = Array.from({ length: 4 }, (_, index) => {
    const position = index + 1;
    const existing = existingMemories[index] || {};
    const id = String(formData.get(`memory_id_${position}`) || existing.id || `memory-${position}`);
    return {
      id,
      title: String(formData.get(`memory_title_${position}`) || "").trim(),
      body: String(formData.get(`memory_body_${position}`) || "").trim(),
      killed: String(formData.get(`memory_killed_${position}`) || "") === "true" || Boolean(existing.killed),
    };
  }).filter((memory) => memory.title || memory.body || memory.killed);
  if (memories.length) details.memories = memories;
  const payload = {
    display_name: String(formData.get("display_name") || "").trim(),
    character_name: String(formData.get("character_name") || "").trim(),
    avatar_url: avatarUrl,
    character_title: String(formData.get("character_title") || "").trim(),
    character_description: String(formData.get("character_description") || "").trim(),
    character_details: details,
    character_lore_ids: formData.getAll("character_lore_ids").map(String),
  };

  if (hasSupabase) {
    const { error } = await supabase.from("profiles").update(payload).eq("id", state.session.user.id);
    if (error) throw error;
  } else {
    const data = readJson(DEMO_DATA_KEY);
    data.profiles = data.profiles.map((profile) => (profile.id === state.session.user.id ? { ...profile, ...payload, updated_at: new Date().toISOString() } : profile));
    saveDemo(data);
  }
  await reloadAndToast("Personaje actualizado.");
}

async function saveDMProfile(formData) {
  ensureDM();
  const profileId = String(formData.get("profile_id") || "");
  const profile = state.data.profiles.find((item) => item.id === profileId);
  if (!profile || profile.role === "dm") throw new Error("Selecciona un player.");
  const avatarUrl = await resolveImageInput(formData, "avatar_file", String(formData.get("current_avatar_url") || "").trim(), "avatars");
  if (!avatarUrl) throw new Error("La ficha necesita una foto del personaje.");
  const details = {};
  characterDetailKeys.forEach((key) => {
    const value = String(formData.get(key) || "").trim();
    if (value) details[key] = value;
  });
  const combatConditions = formData.getAll("combat_conditions").map(String);
  if (combatConditions.length) details.combat_conditions = combatConditions.join(", ");
  const toolProficiencies = formData.getAll("tool_proficiencies").map(String);
  if (toolProficiencies.length) details.tool_proficiencies = toolProficiencies.join(", ");
  const existingMemories = normalizeMemories(profile.character_details?.memories || []);
  const memories = Array.from({ length: 4 }, (_, index) => {
    const position = index + 1;
    const existing = existingMemories[index] || {};
    const id = String(formData.get(`memory_id_${position}`) || existing.id || `memory-${position}`);
    return {
      id,
      title: String(formData.get(`memory_title_${position}`) || "").trim(),
      body: String(formData.get(`memory_body_${position}`) || "").trim(),
      killed: String(formData.get(`memory_killed_${position}`) || "") === "true" || Boolean(existing.killed),
    };
  }).filter((memory) => memory.title || memory.body || memory.killed);
  if (memories.length) details.memories = memories;
  const payload = {
    display_name: String(formData.get("display_name") || "").trim(),
    character_name: String(formData.get("character_name") || "").trim(),
    avatar_url: avatarUrl,
    character_title: String(formData.get("character_title") || "").trim(),
    character_description: String(formData.get("character_description") || "").trim(),
    character_details: details,
    character_lore_ids: formData.getAll("character_lore_ids").map(String),
    updated_at: new Date().toISOString(),
  };

  if (hasSupabase) {
    const { error } = await supabase.from("profiles").update(payload).eq("id", profileId);
    if (error) throw error;
  } else {
    const data = readJson(DEMO_DATA_KEY);
    data.profiles = data.profiles.map((item) => (item.id === profileId ? { ...item, ...payload } : item));
    saveDemo(data);
  }
  await reloadAndToast("Ficha del player actualizada.");
}

async function toggleMemory(profileId, memoryId) {
  ensureDM();
  const profile = state.data.profiles.find((item) => item.id === profileId);
  if (!profile) throw new Error("No encuentro ese personaje.");
  const memories = normalizeMemories(profile.character_details?.memories || []).map((memory) => (memory.id === memoryId ? { ...memory, killed: !memory.killed } : memory));
  const payload = {
    character_details: {
      ...(profile.character_details || {}),
      memories: memories.filter((memory) => memory.title || memory.body || memory.killed),
    },
  };
  if (hasSupabase) {
    const { error } = await supabase.from("profiles").update(payload).eq("id", profileId);
    if (error) throw error;
  } else {
    const data = readJson(DEMO_DATA_KEY);
    data.profiles = data.profiles.map((item) => (item.id === profileId ? { ...item, ...payload, updated_at: new Date().toISOString() } : item));
    saveDemo(data);
  }
  await reloadAndToast("Memoria actualizada.");
}

async function saveInventoryItem(formData) {
  const userId = isDM() ? String(formData.get("user_id") || state.session.user.id) : state.session.user.id;
  const imageUrl = await resolveImageInput(formData, "image_file", "", "inventory");
  const payload = {
    user_id: userId,
    name: String(formData.get("name") || "").trim(),
    image_url: imageUrl,
    rarity: String(formData.get("rarity") || "mundane"),
    quantity: Math.max(1, numberValue(formData.get("quantity")) || 1),
    storage_slot: String(formData.get("storage_slot") || "mochila"),
    lore_ids: formData.getAll("lore_ids").map(String),
    description: String(formData.get("description") || "").trim(),
    created_by: state.session.user.id,
    created_at: new Date().toISOString(),
  };
  if (!payload.name) throw new Error("El objeto necesita nombre.");
  if (hasSupabase) {
    const { error } = await supabase.from("inventory_items").insert(payload);
    if (error) throw error;
  } else {
    const data = readJson(DEMO_DATA_KEY);
    data.inventory.unshift({ ...payload, id: uuid() });
    saveDemo(data);
  }
  await reloadAndToast("Objeto anadido al inventario.");
}

async function saveInventoryContainer(formData) {
  const userId = isDM() ? String(formData.get("user_id") || "") : state.session.user.id;
  if (!userId) throw new Error("Selecciona un personaje para el contenedor.");
  const id = String(formData.get("id") || "");
  const payload = compact({
    id: id || undefined,
    user_id: userId,
    name: String(formData.get("name") || "").trim(),
    icon: String(formData.get("icon") || "package"),
    sort_order: numberValue(formData.get("sort_order")) || 100,
    updated_at: new Date().toISOString(),
  });
  if (!payload.name) throw new Error("El contenedor necesita nombre.");
  if (defaultInventoryContainers.some((container) => container.id === id)) throw new Error("Los contenedores base no se editan.");
  if (hasSupabase) {
    const result = id
      ? await supabase.from("inventory_containers").update(payload).eq("id", id).eq("user_id", userId)
      : await supabase.from("inventory_containers").insert(payload);
    if (result.error) throw result.error;
  } else {
    const data = readJson(DEMO_DATA_KEY);
    data.inventoryContainers ||= [];
    if (id) {
      data.inventoryContainers = data.inventoryContainers.map((container) => (container.id === id && container.user_id === userId ? { ...container, ...payload } : container));
    } else {
      data.inventoryContainers.push({ ...payload, id: uuid(), created_at: new Date().toISOString() });
    }
    saveDemo(data);
  }
  state.editingInventoryContainerId = null;
  await reloadAndToast("Contenedor guardado.");
}

async function deleteInventoryContainer(id) {
  const container = (state.data.inventoryContainers || []).find((item) => item.id === id);
  if (!container) throw new Error("No encuentro ese contenedor.");
  if (defaultInventoryContainers.some((item) => item.id === id)) throw new Error("Los contenedores base no se borran.");
  if (isDM()) {
    ensureDM();
  } else if (container.user_id !== state.session.user.id) {
    throw new Error("Solo puedes borrar tus contenedores.");
  }
  if (!confirm(`Borrar el contenedor "${container.name}"? Sus objetos pasaran a Mochila.`)) return;
  if (hasSupabase) {
    const moved = await supabase.from("inventory_items").update({ storage_slot: "mochila" }).eq("user_id", container.user_id).eq("storage_slot", id);
    if (moved.error) throw moved.error;
    const deleted = await supabase.from("inventory_containers").delete().eq("id", id).eq("user_id", container.user_id);
    if (deleted.error) throw deleted.error;
  } else {
    const data = readJson(DEMO_DATA_KEY);
    data.inventory = (data.inventory || []).map((item) => (item.user_id === container.user_id && item.storage_slot === id ? { ...item, storage_slot: "mochila" } : item));
    data.inventoryContainers = (data.inventoryContainers || []).filter((item) => item.id !== id);
    saveDemo(data);
  }
  state.editingInventoryContainerId = null;
  await reloadAndToast("Contenedor borrado.");
}

async function saveSoulCoins(formData) {
  ensureDM();
  const userId = String(formData.get("user_id") || "");
  const targetProfile = state.data.profiles.find((profile) => profile.id === userId);
  if (!targetProfile || targetProfile.role === "dm") throw new Error("El DM no tiene monedas ni stats.");
  const mode = String(formData.get("coin_mode") || "add");
  const delta = numberValue(formData.get("soul_coins_delta"));
  const current = state.data.stats.find((card) => card.user_id === userId) || defaultStats(userId, state.data.profiles.find((profile) => profile.id === userId));
  const nextValue = Math.max(0, mode === "set" ? delta : Number(current.soul_coins || 0) + delta);
  const payload = compact({
    ...current,
    id: current.id || undefined,
    user_id: userId,
    soul_coins: nextValue,
    updated_by: state.session.user.id,
    updated_at: new Date().toISOString(),
  });
  if (hasSupabase) {
    const { error } = await supabase.from("stat_cards").upsert(payload, { onConflict: "user_id" });
    if (error) throw error;
  } else {
    const data = readJson(DEMO_DATA_KEY);
    const index = data.stats.findIndex((card) => card.user_id === userId);
    if (index >= 0) data.stats[index] = { ...data.stats[index], ...payload };
    else data.stats.push({ ...payload, id: uuid(), created_at: new Date().toISOString() });
    saveDemo(data);
  }
  await reloadAndToast("Monedas de alma actualizadas.");
}

async function saveContract(formData) {
  const id = String(formData.get("id") || "");
  if (id && !isDM()) throw new Error("Solo el DM puede editar pactos.");
  const payload = compact({
    id: id || undefined,
    user_id: isDM() ? String(formData.get("user_id") || state.session.user.id) : state.session.user.id,
    demon_name: String(formData.get("demon_name") || "").trim(),
    reward: String(formData.get("reward") || "").trim(),
    cost: String(formData.get("cost") || "").trim(),
    hidden_clause: String(formData.get("hidden_clause") || "").trim(),
    created_by: state.session.user.id,
    updated_at: new Date().toISOString(),
  });
  if (!payload.demon_name || !payload.reward || !payload.cost) throw new Error("El pacto necesita entidad, recompensa y precio.");
  if (hasSupabase) {
    const result = id
      ? await supabase.from("infernal_contracts").update(payload).eq("id", id)
      : await supabase.from("infernal_contracts").insert({ ...payload, created_at: new Date().toISOString() });
    const { error } = result;
    if (error) throw error;
  } else {
    const data = readJson(DEMO_DATA_KEY);
    if (id) data.contracts = data.contracts.map((contract) => (contract.id === id ? { ...contract, ...payload } : contract));
    else data.contracts.unshift({ ...payload, id: uuid(), created_at: new Date().toISOString() });
    saveDemo(data);
  }
  state.editingContractId = null;
  await reloadAndToast("Pacto sellado.");
}

async function deleteContract(id) {
  ensureDM();
  if (!confirm("Borrar este pacto?")) return;
  if (hasSupabase) {
    const { error } = await supabase.from("infernal_contracts").delete().eq("id", id);
    if (error) throw error;
  } else {
    const data = readJson(DEMO_DATA_KEY);
    data.contracts = data.contracts.filter((contract) => contract.id !== id);
    saveDemo(data);
  }
  if (state.editingContractId === id) state.editingContractId = null;
  await reloadAndToast("Pacto borrado.");
}

async function requestInitiative() {
  ensureDM();
  const players = state.data.profiles.filter((profile) => profile.role !== "dm");
  const existing = state.data.combatants.filter((combatant) => combatant.type === "player");
  const rows = players.map((profile, index) => {
    const card = state.data.stats.find((item) => item.user_id === profile.id) || defaultStats(profile.id, profile);
    const current = existing.find((combatant) => combatant.user_id === profile.id);
    return compact({
      id: current?.id,
      user_id: profile.id,
      type: "player",
      map_id: activeBattleMap(getBattleState()).id,
      name: profile.character_name || profile.display_name,
      avatar_url: profile.avatar_url || card.image_url || "",
      visible_to_players: true,
      initiative: null,
      hp_current: card.hp_current,
      hp_max: card.hp_max,
      ac: card.ac,
      position_x: current?.position_x ?? index,
      position_y: current?.position_y ?? 6,
      updated_by: state.session.user.id,
      updated_at: new Date().toISOString(),
    });
  });

  if (hasSupabase) {
    const stateResult = await supabase.from("battle_states").upsert({ id: "main", initiative_requested: true, active_combatant_id: null, round: 1, updated_by: state.session.user.id }, { onConflict: "id" });
    if (stateResult.error) throw stateResult.error;
    if (rows.length) {
      const { error } = await supabase.from("battle_combatants").upsert(rows, { onConflict: "user_id" });
      if (error) throw error;
    }
  } else {
    const data = readJson(DEMO_DATA_KEY);
    data.battleState = { ...defaultBattleState(), ...(data.battleState || {}), initiative_requested: true, active_combatant_id: null, round: 1 };
    rows.forEach((row) => {
      const index = data.combatants.findIndex((combatant) => combatant.user_id === row.user_id && combatant.type === "player");
      if (index >= 0) data.combatants[index] = { ...data.combatants[index], ...row };
      else data.combatants.push({ ...row, id: uuid(), created_at: new Date().toISOString() });
    });
    saveDemo(data);
  }
  await reloadAndToast("Iniciativas solicitadas.");
}

async function saveInitiative(formData) {
  const id = String(formData.get("id") || "");
  const initiative = numberValue(formData.get("initiative"));
  let combatant = state.data.combatants.find((item) => item.id === id);
  if (!combatant) {
    const profile = state.profile;
    const card = state.data.stats.find((item) => item.user_id === state.session.user.id) || defaultStats(state.session.user.id, profile);
    combatant = {
      id: uuid(),
      user_id: state.session.user.id,
      type: "player",
      name: profile.character_name || profile.display_name,
      avatar_url: profile.avatar_url || "",
      visible_to_players: true,
      hp_current: card.hp_current,
      hp_max: card.hp_max,
      ac: card.ac,
      position_x: 0,
      position_y: 6,
    };
  }
  const payload = { ...combatant, initiative, updated_at: new Date().toISOString() };
  if (hasSupabase) {
    const { error } = await supabase.from("battle_combatants").upsert(payload, { onConflict: "user_id" });
    if (error) throw error;
  } else {
    const data = readJson(DEMO_DATA_KEY);
    const index = data.combatants.findIndex((item) => item.id === payload.id || (item.user_id === payload.user_id && item.type === "player"));
    if (index >= 0) data.combatants[index] = { ...data.combatants[index], ...payload };
    else data.combatants.push({ ...payload, created_at: new Date().toISOString() });
    saveDemo(data);
  }
  await maybeSetFirstTurn();
  await reloadAndToast("Iniciativa enviada.");
}

async function saveMonster(formData) {
  ensureDM();
  const imported = parseMonsterBlock(String(formData.get("monster_block") || ""));
  const battleState = getBattleState();
  const targetMap = battleMaps(battleState).find((map) => map.id === String(formData.get("map_id"))) || activeBattleMap(battleState);
  const hpMax = numberValue(formData.get("hp_max")) || imported.hp || 1;
  const avatarUrl = await resolveImageInput(formData, "avatar_file", "", "tokens");
  const notes = [String(formData.get("notes") || "").trim(), imported.raw].filter(Boolean).join("\n\n");
  const payload = {
    type: String(formData.get("type") || "monster"),
    name: String(formData.get("name") || "").trim() || imported.name,
    avatar_url: avatarUrl,
    visible_to_players: formData.has("visible_to_players"),
    map_id: targetMap.id,
    initiative: numberValue(formData.get("initiative")) || imported.initiative || 10,
    hp_current: hpMax,
    hp_max: hpMax,
    ac: numberValue(formData.get("ac")) || imported.ac || 10,
    position_x: clamp(numberValue(formData.get("position_x")), 0, Number(targetMap.width || 12) - 1),
    position_y: clamp(numberValue(formData.get("position_y")), 0, Number(targetMap.height || 8) - 1),
    notes,
    created_by: state.session.user.id,
    updated_by: state.session.user.id,
    updated_at: new Date().toISOString(),
  };
  if (!payload.name) throw new Error("La criatura necesita nombre.");

  let createdId = "";
  if (hasSupabase) {
    const { data, error } = await supabase.from("battle_combatants").insert(payload).select("id").single();
    if (error) throw error;
    createdId = data?.id || "";
  } else {
    const data = readJson(DEMO_DATA_KEY);
    createdId = uuid();
    data.combatants.push({ ...payload, id: createdId, created_at: new Date().toISOString() });
    saveDemo(data);
  }
  if (createdId) state.selectedCombatantId = createdId;
  await maybeSetFirstTurn();
  await reloadAndToast("Ficha anadida al mapa.");
}

async function saveCombatant(formData) {
  ensureDM();
  const id = String(formData.get("id") || "");
  const avatarUrl = await resolveImageInput(formData, "avatar_file", String(formData.get("current_avatar_url") || "").trim(), "tokens");
  const currentMap = activeBattleMap(getBattleState());
  const payload = {
    avatar_url: avatarUrl,
    visible_to_players: formData.has("visible_to_players"),
    initiative: formData.get("initiative") === "" ? null : numberValue(formData.get("initiative")),
    hp_current: numberValue(formData.get("hp_current")),
    hp_max: numberValue(formData.get("hp_max")),
    ac: numberValue(formData.get("ac")),
    position_x: clamp(numberValue(formData.get("position_x")), 0, Number(currentMap.width || 12) - 1),
    position_y: clamp(numberValue(formData.get("position_y")), 0, Number(currentMap.height || 8) - 1),
    conditions: formData.getAll("conditions").map(String).join(", "),
    notes: String(formData.get("notes") || "").trim(),
    updated_by: state.session.user.id,
    updated_at: new Date().toISOString(),
  };
  if (hasSupabase) {
    const { error } = await supabase.from("battle_combatants").update(payload).eq("id", id);
    if (error) throw error;
  } else {
    const data = readJson(DEMO_DATA_KEY);
    data.combatants = data.combatants.map((combatant) => (combatant.id === id ? { ...combatant, ...payload } : combatant));
    saveDemo(data);
  }
  await reloadAndToast("Combatiente actualizado.");
}

async function deleteCombatant(id) {
  ensureDM();
  if (!confirm("Borrar este combatiente?")) return;
  if (hasSupabase) {
    const { error } = await supabase.from("battle_combatants").delete().eq("id", id);
    if (error) throw error;
  } else {
    const data = readJson(DEMO_DATA_KEY);
    data.combatants = data.combatants.filter((combatant) => combatant.id !== id);
    if (data.battleState?.active_combatant_id === id) data.battleState.active_combatant_id = null;
    saveDemo(data);
  }
  state.selectedCombatantId = null;
  await reloadAndToast("Combatiente borrado.");
}

async function advanceTurn(direction) {
  ensureDM();
  const combatants = sortedCombatants().filter((combatant) => combatant.initiative !== null && combatant.initiative !== undefined);
  if (!combatants.length) throw new Error("No hay iniciativas listas.");
  const battleState = getBattleState();
  const currentIndex = Math.max(0, combatants.findIndex((combatant) => combatant.id === battleState.active_combatant_id));
  const nextIndex = (currentIndex + direction + combatants.length) % combatants.length;
  const nextRound = direction > 0 && nextIndex === 0 ? Number(battleState.round || 1) + 1 : Number(battleState.round || 1);
  await saveBattleState({ ...battleState, active_combatant_id: combatants[nextIndex].id, round: nextRound, initiative_requested: false });
  state.selectedCombatantId = combatants[nextIndex].id;
  await reloadAndToast(`Turno de ${combatants[nextIndex].name}.`);
}

async function maybeSetFirstTurn() {
  const combatants = sortedCombatants().filter((combatant) => combatant.initiative !== null && combatant.initiative !== undefined);
  const battleState = getBattleState();
  if (battleState.active_combatant_id || !combatants.length || !isDM()) return;
  await saveBattleState({ ...battleState, active_combatant_id: combatants[0].id, initiative_requested: false });
}

async function saveBattleState(payload) {
  if (hasSupabase) {
    const { error } = await supabase.from("battle_states").upsert({ ...payload, id: "main", updated_by: state.session.user.id, updated_at: new Date().toISOString() }, { onConflict: "id" });
    if (error) throw error;
  } else {
    const data = readJson(DEMO_DATA_KEY);
    data.battleState = { ...defaultBattleState(), ...payload, updated_at: new Date().toISOString() };
    saveDemo(data);
  }
}

async function toggleMapHidden() {
  ensureDM();
  const battleState = getBattleState();
  const map = activeBattleMap(battleState);
  const updated = { ...map, hidden: !map.hidden };
  await saveBattleState(withUpdatedActiveMap(battleState, updated));
  await reloadAndToast(map.hidden ? "Mapa visible para players." : "Mapa oculto a players.");
}

async function setActiveBattleMap(mapId) {
  ensureDM();
  const battleState = getBattleState();
  const map = battleMaps(battleState).find((item) => item.id === String(mapId));
  if (!map || map.id === battleState.active_map_id) return;
  state.selectedCombatantId = null;
  await saveBattleState({ ...battleState, active_map_id: map.id });
  await loadAll();
  render();
}

async function paintMapCell(x, y) {
  const battleState = getBattleState();
  const map = activeBattleMap(battleState);
  const mapTool = document.querySelector('select[name="map_tool"]')?.value || "move";
  if (!isDM() && map.hidden) throw new Error("El mapa esta oculto mientras el DM lo prepara.");
  if (!isDM() && !["move", "area"].includes(mapTool)) throw new Error("Solo puedes mover tu ficha o poner areas.");
  if (mapTool === "move") {
    const ownCombatant = state.data.combatants.find((combatant) => combatant.user_id === state.session.user.id && combatant.type === "player" && (!combatant.map_id || combatant.map_id === map.id));
    const targetId = isDM() ? state.selectedCombatantId : ownCombatant?.id;
    if (!targetId) throw new Error("No hay ficha seleccionada para mover.");
    await moveCombatantTo(targetId, x, y, map.id);
    return;
  }
  if (mapTool === "area") {
    const draftedArea = readAreaForm(x, y);
    const area = { ...draftedArea, visible: isDM() ? draftedArea.visible : true, created_by: state.session.user.id };
    await saveBattleState(withUpdatedActiveMap(battleState, { ...map, areas: [...(map.areas || []), area] }));
    await loadAll();
    render();
    return;
  }
  ensureDM();
  const terrainTool = document.querySelector('select[name="terrain_tool"]')?.value || "wall";
  const terrainVisible = document.querySelector('input[name="terrain_visible"]')?.checked ?? true;
  const terrain = [...(map.terrain || [])].filter((cell) => !(Number(cell.x) === x && Number(cell.y) === y));
  if (terrainTool !== "clear") terrain.push({ id: uuid(), x, y, type: terrainTool, visible: terrainVisible });
  await saveBattleState(withUpdatedActiveMap(battleState, { ...map, terrain }));
  await loadAll();
  render();
}

async function moveCombatantTo(id, x, y, mapId) {
  const combatant = state.data.combatants.find((item) => item.id === id);
  if (!combatant) throw new Error("No encuentro esa ficha.");
  if (!isDM() && (combatant.user_id !== state.session.user.id || combatant.type !== "player")) {
    throw new Error("Solo puedes mover tu propio personaje.");
  }
  const payload = { position_x: x, position_y: y, map_id: mapId, updated_by: state.session.user.id, updated_at: new Date().toISOString() };
  if (hasSupabase) {
    const { error } = await supabase.from("battle_combatants").update(payload).eq("id", id);
    if (error) throw error;
  } else {
    const data = readJson(DEMO_DATA_KEY);
    data.combatants = data.combatants.map((combatant) => (combatant.id === id ? { ...combatant, ...payload } : combatant));
    saveDemo(data);
  }
  await loadAll();
  render();
}

async function clearMap() {
  ensureDM();
  if (!confirm("Borrar paredes, obstaculos y areas del mapa?")) return;
  const battleState = getBattleState();
  const map = activeBattleMap(battleState);
  await saveBattleState(withUpdatedActiveMap(battleState, { ...map, terrain: [], areas: [] }));
  await reloadAndToast("Mapa limpiado.");
}

async function saveMapArea(formData) {
  ensureDM();
  const battleState = getBattleState();
  const map = activeBattleMap(battleState);
  const area = readAreaForm(numberValue(formData.get("area_x")), numberValue(formData.get("area_y")), formData);
  await saveBattleState(withUpdatedActiveMap(battleState, { ...map, areas: [...(map.areas || []), area] }));
  await reloadAndToast("Area anadida al mapa.");
}

async function deleteMapArea(id) {
  ensureDM();
  const battleState = getBattleState();
  const map = activeBattleMap(battleState);
  await saveBattleState(withUpdatedActiveMap(battleState, { ...map, areas: (map.areas || []).filter((area) => area.id !== id) }));
  await reloadAndToast("Area eliminada.");
}

async function toggleAreaVisibility(id) {
  ensureDM();
  const battleState = getBattleState();
  const map = activeBattleMap(battleState);
  const areas = (map.areas || []).map((area) => (area.id === id ? { ...area, visible: area.visible === false } : area));
  await saveBattleState(withUpdatedActiveMap(battleState, { ...map, areas }));
  await reloadAndToast("Visibilidad de area actualizada.");
}

async function toggleTerrainVisibility(id) {
  ensureDM();
  const battleState = getBattleState();
  const map = activeBattleMap(battleState);
  const terrain = (map.terrain || []).map((cell) => (terrainKey(cell) === id ? { ...cell, visible: cell.visible === false } : cell));
  await saveBattleState(withUpdatedActiveMap(battleState, { ...map, terrain }));
  await reloadAndToast("Visibilidad de elemento actualizada.");
}

async function saveMapSettings(formData) {
  ensureDM();
  const battleState = getBattleState();
  const maps = battleMaps(battleState);
  const selectedMap = maps.find((map) => map.id === String(formData.get("active_map_id"))) || activeBattleMap(battleState);
  const backgroundUrl = await resolveImageInput(formData, "background_file", String(formData.get("current_background_url") || selectedMap.background_url || ""), "maps");
  const updated = {
    ...selectedMap,
    name: String(formData.get("map_name") || selectedMap.name).trim() || selectedMap.name,
    width: clamp(numberValue(formData.get("map_width")), 4, 120),
    height: clamp(numberValue(formData.get("map_height")), 4, 90),
    background_url: backgroundUrl,
  };
  await saveBattleState(withUpdatedActiveMap({ ...battleState, active_map_id: updated.id }, updated));
  await reloadAndToast("Mapa actualizado.");
}

async function createBattleMap() {
  ensureDM();
  const battleState = getBattleState();
  const map = {
    id: uuid(),
    name: `Mapa ${battleMaps(battleState).length + 1}`,
    width: 12,
    height: 8,
    hidden: true,
    terrain: [],
    areas: [],
    background_url: "",
  };
  await saveBattleState({ ...battleState, active_map_id: map.id, maps: [...battleMaps(battleState), map] });
  await reloadAndToast("Nuevo mapa creado y oculto.");
}

async function deleteBattleMap(mapId) {
  ensureDM();
  const battleState = getBattleState();
  const maps = battleMaps(battleState);
  if (maps.length <= 1) throw new Error("Deja al menos un mapa en la campana.");
  const target = maps.find((map) => map.id === mapId) || activeBattleMap(battleState);
  if (!confirm(`Borrar "${target.name}"? Las fichas de ese mapa se moveran al siguiente.`)) return;
  const nextMap = maps.find((map) => map.id !== target.id) || maps[0];
  const nextState = {
    ...battleState,
    active_map_id: nextMap.id,
    maps: maps.filter((map) => map.id !== target.id),
  };
  await saveBattleState(nextState);
  if (hasSupabase) {
    const { error } = await supabase.from("battle_combatants").update({ map_id: nextMap.id, updated_by: state.session.user.id, updated_at: new Date().toISOString() }).eq("map_id", target.id);
    if (error) throw error;
  } else {
    const data = readJson(DEMO_DATA_KEY);
    data.combatants = (data.combatants || []).map((combatant) => (combatant.map_id === target.id ? { ...combatant, map_id: nextMap.id } : combatant));
    data.battleState = { ...defaultBattleState(), ...nextState, active_map_id: nextMap.id };
    saveDemo(data);
  }
  state.selectedCombatantId = null;
  await reloadAndToast(`Mapa "${target.name}" borrado.`);
}

async function saveDiceRoll({ quantity, sides, modifier, label }) {
  const safeQuantity = clamp(Number(quantity || 1), 1, 20);
  const safeSides = diceOptions.includes(Number(sides)) ? Number(sides) : 20;
  const safeModifier = Number(modifier || 0);
  const rolls = Array.from({ length: safeQuantity }, () => Math.floor(Math.random() * safeSides) + 1);
  const total = rolls.reduce((sum, value) => sum + value, 0) + safeModifier;
  const formula = `${safeQuantity}d${safeSides}${safeModifier ? `${safeModifier > 0 ? "+" : ""}${safeModifier}` : ""}`;
  const payload = {
    user_id: state.session.user.id,
    roller_name: state.profile?.character_name || state.profile?.display_name || state.session.user.email,
    label: label || formula,
    formula,
    quantity: safeQuantity,
    sides: safeSides,
    modifier: safeModifier,
    rolls,
    total,
    created_at: new Date().toISOString(),
  };

  if (hasSupabase) {
    const { error } = await supabase.from("dice_rolls").insert(payload);
    if (error) throw error;
  } else {
    const data = readJson(DEMO_DATA_KEY);
    data.diceRolls.unshift({ ...payload, id: uuid() });
    data.diceRolls = data.diceRolls.slice(0, 80);
    saveDemo(data);
  }
  await reloadAndToast(`${payload.roller_name} tira ${formula}: ${total}.`);
}

function defaultShopState() {
  return {
    id: "main",
    generated_at: new Date().toISOString(),
    pool: normalizeShopPool(infernalShopPool),
    crafting_resources: normalizeCraftingResources(avernusResources),
    crafting_recipes: normalizeCraftingRecipes(avernusRecipes),
    crafting_upgrades: normalizeCraftingUpgrades(defaultCraftingUpgrades),
    offers: generateShopOffers(infernalShopPool),
  };
}

function getShopState() {
  const shop = { ...defaultShopState(), ...(state.data.shop || {}) };
  shop.pool = normalizeShopPool(shop.pool?.length ? shop.pool : infernalShopPool);
  shop.crafting_resources = normalizeCraftingResources(shop.crafting_resources?.length ? shop.crafting_resources : avernusResources);
  shop.crafting_recipes = normalizeCraftingRecipes(shop.crafting_recipes?.length ? shop.crafting_recipes : avernusRecipes);
  shop.crafting_upgrades = normalizeCraftingUpgrades(shop.crafting_upgrades?.length ? shop.crafting_upgrades : defaultCraftingUpgrades);
  const age = Date.now() - new Date(shop.generated_at || 0).getTime();
  if (!shop.offers?.length || age > 24 * 60 * 60 * 1000) {
    return { ...shop, generated_at: new Date().toISOString(), offers: generateShopOffers(shop.pool) };
  }
  return shop;
}

function generateShopOffers(pool = infernalShopPool) {
  const normalizedPool = normalizeShopPool(pool);
  const weighted = normalizedPool.flatMap((item) => {
    const weight = item.rarity === "legendary" ? 1 : item.rarity === "very_rare" ? 2 : item.rarity === "rare" ? 4 : item.rarity === "uncommon" ? 9 : 14;
    return Array.from({ length: weight }, () => item);
  });
  const offers = [];
  while (offers.length < Math.min(3, normalizedPool.length) && weighted.length) {
    const item = weighted[Math.floor(Math.random() * weighted.length)];
    if (!offers.some((offer) => offer.name === item.name)) {
      const rarity = rarityMeta[item.rarity] || rarityMeta.common;
      offers.push({
        id: uuid(),
        ...item,
        price: Math.max(1, Math.ceil((item.price || rarity.price) * (0.78 + Math.random() * 0.42))),
        sold_to: null,
      });
    }
  }
  return offers;
}

async function rerollShop() {
  ensureDM();
  const current = getShopState();
  const shop = { ...current, id: "main", generated_at: new Date().toISOString(), offers: generateShopOffers(current.pool) };
  await saveShopConfig(shop);
  state.bazaarMood = "reroll";
  playSfx("reroll-shop");
  await reloadAndToast("El bazar ha cambiado sus mercancias.");
}

async function saveShopConfig(shop) {
  const payload = {
    ...shop,
    id: "main",
    updated_by: state.session.user.id,
    updated_at: new Date().toISOString(),
  };
  if (hasSupabase) {
    const { error } = await supabase.from("infernal_shop").upsert(payload, { onConflict: "id" });
    if (error) throw error;
  } else {
    const data = readJson(DEMO_DATA_KEY);
    data.shop = payload;
    saveDemo(data);
  }
}

async function saveShopPoolItem(formData) {
  ensureDM();
  const shop = getShopState();
  const id = String(formData.get("id") || "") || slugId(formData.get("name"));
  const item = {
    id,
    name: String(formData.get("name") || "").trim(),
    rarity: String(formData.get("rarity") || "common"),
    price: Math.max(1, numberValue(formData.get("price")) || 1),
    type: String(formData.get("type") || "wondrous").trim(),
    icon: String(formData.get("icon") || "gem").trim(),
    curse: String(formData.get("curse") || "").trim(),
  };
  if (!item.name) throw new Error("El objeto necesita nombre.");
  const pool = normalizeShopPool(shop.pool).filter((entry) => entry.id !== id);
  pool.unshift(item);
  await saveShopConfig({ ...shop, pool });
  state.editingShopItemId = null;
  await reloadAndToast("Pool del bazar actualizado.");
}

async function deleteShopPoolItem(id) {
  ensureDM();
  if (!confirm("Borrar este objeto del pool del bazar?")) return;
  const shop = getShopState();
  await saveShopConfig({ ...shop, pool: normalizeShopPool(shop.pool).filter((item) => item.id !== id) });
  if (state.editingShopItemId === id) state.editingShopItemId = null;
  await reloadAndToast("Objeto eliminado del pool.");
}

async function saveCraftingResource(formData) {
  ensureDM();
  const shop = getShopState();
  const id = String(formData.get("id") || "") || slugId(`${formData.get("tool")}-${formData.get("name")}`);
  const resource = {
    id,
    name: String(formData.get("name") || "").trim(),
    tool: String(formData.get("tool") || "Smith's tools"),
    zone: String(formData.get("zone") || "Averno").trim(),
    yield: String(formData.get("yield") || "").trim(),
  };
  if (!resource.name) throw new Error("El recurso necesita nombre.");
  const resources = normalizeCraftingResources(shop.crafting_resources).filter((entry) => entry.id !== id);
  resources.unshift(resource);
  await saveShopConfig({ ...shop, crafting_resources: resources });
  state.editingCraftResourceId = null;
  await reloadAndToast("Recurso de farmeo guardado.");
}

async function saveCraftingRecipe(formData) {
  ensureDM();
  const shop = getShopState();
  let needs = {};
  try {
    needs = JSON.parse(String(formData.get("needs") || "{}"));
  } catch {
    throw new Error("Necesidades debe ser JSON valido.");
  }
  const id = String(formData.get("id") || "") || slugId(`${formData.get("tool")}-${formData.get("name")}`);
  const recipe = {
    id,
    name: String(formData.get("name") || "").trim(),
    tool: String(formData.get("tool") || "Smith's tools"),
    rarity: String(formData.get("rarity") || "common"),
    difficulty: numberValue(formData.get("difficulty")) || 15,
    needs,
    effect: String(formData.get("effect") || "").trim(),
    icon: toolIcon(String(formData.get("tool") || "")),
  };
  if (!recipe.name) throw new Error("El crafteo necesita nombre.");
  const recipes = normalizeCraftingRecipes(shop.crafting_recipes).filter((entry) => entry.id !== id);
  recipes.unshift(recipe);
  await saveShopConfig({ ...shop, crafting_recipes: recipes });
  state.editingCraftRecipeId = null;
  await reloadAndToast("Crafteo guardado.");
}

async function saveCraftingUpgrade(formData) {
  ensureDM();
  const shop = getShopState();
  const id = String(formData.get("id") || "") || slugId(`${formData.get("tool")}-${formData.get("name")}`);
  const upgrade = {
    id,
    name: String(formData.get("name") || "").trim(),
    tool: String(formData.get("tool") || "Smith's tools"),
    icon: String(formData.get("icon") || toolIcon(String(formData.get("tool") || ""))).trim(),
    cost: Math.max(0, numberValue(formData.get("cost")) || 0),
    speed: Math.max(1, Number(formData.get("speed") || 1)),
    find: Math.max(0, Number(formData.get("find") || 0)),
    click: Math.max(0, numberValue(formData.get("click")) || 0),
    description: String(formData.get("description") || "").trim(),
  };
  if (!upgrade.name) throw new Error("El upgrade necesita nombre.");
  const upgrades = normalizeCraftingUpgrades(shop.crafting_upgrades).filter((entry) => entry.id !== id);
  upgrades.unshift(upgrade);
  await saveShopConfig({ ...shop, crafting_upgrades: upgrades });
  state.editingCraftUpgradeId = null;
  await reloadAndToast("Upgrade de taller guardado.");
}

async function deleteCraftingResource(id) {
  ensureDM();
  if (!confirm("Borrar este recurso de farmeo?")) return;
  const shop = getShopState();
  await saveShopConfig({ ...shop, crafting_resources: normalizeCraftingResources(shop.crafting_resources).filter((resource) => resource.id !== id) });
  if (state.editingCraftResourceId === id) state.editingCraftResourceId = null;
  await reloadAndToast("Recurso eliminado.");
}

async function deleteCraftingRecipe(id) {
  ensureDM();
  if (!confirm("Borrar este crafteo?")) return;
  const shop = getShopState();
  await saveShopConfig({ ...shop, crafting_recipes: normalizeCraftingRecipes(shop.crafting_recipes).filter((recipe) => recipe.id !== id) });
  if (state.editingCraftRecipeId === id) state.editingCraftRecipeId = null;
  await reloadAndToast("Crafteo eliminado.");
}

async function deleteCraftingUpgrade(id) {
  ensureDM();
  if (!confirm("Borrar este upgrade de taller?")) return;
  const shop = getShopState();
  await saveShopConfig({ ...shop, crafting_upgrades: normalizeCraftingUpgrades(shop.crafting_upgrades).filter((upgrade) => upgrade.id !== id) });
  if (state.editingCraftUpgradeId === id) state.editingCraftUpgradeId = null;
  await reloadAndToast("Upgrade eliminado.");
}

async function buyShopItem(offerId) {
  const shop = getShopState();
  const offer = shop.offers.find((item) => item.id === offerId);
  if (!offer) return;
  if (offer.sold_to) {
    state.bazaarMood = "sold";
    throw new Error("Ese objeto ya ha sido comprado.");
  }
  const data = hasSupabase ? null : readJson(DEMO_DATA_KEY);
  const buyerId = shopBuyerId();
  const buyerProfile = state.data.profiles.find((profile) => profile.id === buyerId) || state.profile;
  const stats = state.data.stats.find((card) => card.user_id === buyerId) || defaultStats(buyerId, buyerProfile);
  if (!stats || Number(stats.soul_coins || 0) < Number(offer.price || 0)) {
    state.bazaarMood = "poor";
    playSfx("deny");
    throw new Error("No hay suficientes monedas de alma para ese comprador.");
  }
  const updatedStats = { ...stats, soul_coins: Number(stats.soul_coins || 0) - Number(offer.price || 0) };
  const updatedOffers = shop.offers.map((item) => (item.id === offerId ? { ...item, sold_to: buyerId } : item));
  const inventoryItem = {
    id: uuid(),
    user_id: buyerId,
    name: offer.name,
    rarity: offer.rarity,
    quantity: 1,
    storage_slot: "mochila",
    description: `Comprado en el bazar demoniaco. ${isDM() ? offer.curse : ""}`.trim(),
    lore_ids: [],
    image_url: "",
    created_by: state.session.user.id,
    created_at: new Date().toISOString(),
  };
  if (hasSupabase) {
    const statPayload = { ...updatedStats, user_id: buyerId };
    if (!statPayload.id) delete statPayload.id;
    let result = stats.id
      ? await supabase.from("stat_cards").update({ soul_coins: updatedStats.soul_coins }).eq("id", stats.id)
      : await supabase.from("stat_cards").upsert(statPayload, { onConflict: "user_id" });
    if (result.error) throw result.error;
    result = await supabase.from("infernal_shop").upsert({ ...shop, offers: updatedOffers }, { onConflict: "id" });
    if (result.error) throw result.error;
    result = await supabase.from("inventory_items").insert(inventoryItem);
    if (result.error) throw result.error;
  } else {
    const statIndex = data.stats.findIndex((card) => card.user_id === buyerId);
    if (statIndex >= 0) data.stats[statIndex] = { ...data.stats[statIndex], ...updatedStats };
    else data.stats.push({ ...updatedStats, id: uuid(), created_at: new Date().toISOString() });
    data.shop = { ...shop, offers: updatedOffers };
    data.inventory.unshift(inventoryItem);
    saveDemo(data);
  }
  state.bazaarMood = "bought";
  playSfx("buy-shop-item");
  await reloadAndToast(`${offer.name} comprado para ${buyerProfile?.character_name || buyerProfile?.display_name || "personaje"}.`);
}

function defaultCraftingState() {
  return {
    resources: {},
    activeResource: avernusResources[0]?.name || "",
    progress: 0,
    lastTick: Date.now(),
    crafted: [],
    upgrades: [],
  };
}

function readCraftingState() {
  return { ...defaultCraftingState(), ...(readJson(CRAFTING_STATE_KEY) || {}) };
}

function saveCraftingState(craft) {
  localStorage.setItem(CRAFTING_STATE_KEY, JSON.stringify({ ...craft, lastTick: Date.now() }));
}

function tickCraftingState() {
  const craft = readCraftingState();
  const now = Date.now();
  const elapsedMinutes = Math.min(10080, Math.max(0, (now - Number(craft.lastTick || now)) / 60000));
  if (craft.activeResource && elapsedMinutes > 0) {
    const resource = getCraftingResources().find((item) => item.name === craft.activeResource);
    const upgradeStats = craftingUpgradeStats(craft, resource?.tool);
    craft.progress = Number(craft.progress || 0) + elapsedMinutes * 0.03 * upgradeStats.speed;
    while (craft.progress >= 100) {
      craft.progress -= 100;
      const chance = 0.16 + upgradeStats.find;
      if (Math.random() < chance) {
        craft.resources[craft.activeResource] = Number(craft.resources[craft.activeResource] || 0) + 1;
      }
    }
  }
  craft.lastTick = now;
  saveCraftingState(craft);
  return craft;
}

function craftingUpgradeStats(craft, tool = "") {
  const owned = new Set(craft.upgrades || []);
  return getCraftingUpgrades().reduce(
    (acc, upgrade) => {
      if (!owned.has(upgrade.id)) return acc;
      if (tool && upgrade.tool !== tool) return acc;
      acc.speed *= Number(upgrade.speed || 1);
      acc.find += Number(upgrade.find || 0);
      acc.click += Number(upgrade.click || 0);
      return acc;
    },
    { speed: 1, find: 0, click: 0 },
  );
}

async function buyCraftUpgrade(upgradeId, ownerId) {
  const upgrade = getCraftingUpgrades().find((item) => item.id === upgradeId);
  if (!upgrade) return;
  const targetUserId = isDM() ? ownerId || state.selectedStatsUserId : state.session.user.id;
  if (!targetUserId || (!isDM() && targetUserId !== state.session.user.id)) throw new Error("No puedes comprar upgrades para otro personaje.");
  const ownerProfile = state.data.profiles.find((profile) => profile.id === targetUserId) || state.profile;
  if (!toolProficienciesForProfile(ownerProfile).has(upgrade.tool)) throw new Error("Ese personaje no tiene la proficiencia de herramienta para este upgrade.");
  const craft = tickCraftingState();
  if ((craft.upgrades || []).includes(upgrade.id)) return;
  const stats = state.data.stats.find((card) => card.user_id === targetUserId) || defaultStats(targetUserId, state.data.profiles.find((profile) => profile.id === targetUserId));
  if (Number(stats.soul_coins || 0) < Number(upgrade.cost || 0)) throw new Error("No hay suficientes monedas de alma.");
  craft.upgrades = [...(craft.upgrades || []), upgrade.id];
  saveCraftingState(craft);
  const updatedStats = { ...stats, soul_coins: Number(stats.soul_coins || 0) - Number(upgrade.cost || 0), updated_by: state.session.user.id, updated_at: new Date().toISOString() };
  if (hasSupabase) {
    const statPayload = { ...updatedStats, user_id: targetUserId };
    if (!statPayload.id) delete statPayload.id;
    const { error } = await supabase.from("stat_cards").upsert(statPayload, { onConflict: "user_id" });
    if (error) throw error;
  } else {
    const data = readJson(DEMO_DATA_KEY);
    const index = data.stats.findIndex((card) => card.user_id === targetUserId);
    if (index >= 0) data.stats[index] = { ...data.stats[index], ...updatedStats };
    else data.stats.push({ ...updatedStats, id: uuid(), created_at: new Date().toISOString() });
    saveDemo(data);
  }
  await reloadAndToast(`${upgrade.name} comprado.`);
}

function setFarmFocus(resourceName) {
  const craft = tickCraftingState();
  const resource = getCraftingResources().find((item) => item.name === resourceName);
  if (!resource || !canUseCraftTool(resource.tool)) {
    showToast("Ese taller no aparece porque el personaje no tiene esa proficiencia.");
    render();
    return;
  }
  craft.activeResource = resourceName;
  craft.progress = Math.min(Number(craft.progress || 0), 95);
  saveCraftingState(craft);
  showToast(`Farmeo enfocado en ${resourceName}.`);
  render();
}

function farmResource(resourceName) {
  const craft = tickCraftingState();
  const resource = getCraftingResources().find((item) => item.name === resourceName);
  if (!resource) return;
  if (!canUseCraftTool(resource.tool)) {
    showToast("Sin proficiencia no puedes farmear ese recurso.");
    render();
    return;
  }
  craft.activeResource = resourceName;
  const upgradeStats = craftingUpgradeStats(craft, resource.tool);
  craft.progress = Number(craft.progress || 0) + 12 + upgradeStats.click;
  let found = false;
  if (craft.progress >= 100) {
    craft.progress -= 100;
    found = Math.random() < 0.26 + upgradeStats.find;
    if (found) craft.resources[resourceName] = Number(craft.resources[resourceName] || 0) + 1;
  }
  saveCraftingState(craft);
  showToast(found ? `Has encontrado ${resourceName}.` : "El Averno no suelta nada util todavia.");
  render();
}

async function craftRecipe(recipeName) {
  const craft = tickCraftingState();
  const recipe = getCraftingRecipes().find((item) => item.name === recipeName);
  if (!recipe) return;
  if (!canUseCraftTool(recipe.tool)) throw new Error("Este personaje no tiene la proficiencia necesaria.");
  const needs = Object.entries(recipe.needs || {});
  const ready = needs.every(([name, amount]) => Number(craft.resources?.[name] || 0) >= amount);
  if (!ready) throw new Error("Faltan recursos.");
  needs.forEach(([name, amount]) => {
    craft.resources[name] = Number(craft.resources[name] || 0) - amount;
  });
  const rarity = rarityMeta[recipe.rarity || "common"] || rarityMeta.common;
  const success = Math.random() * 100 < Number(rarity.craftChance || 10);
  saveCraftingState(craft);
  if (!success) {
    showToast("La forja falla. Los materiales se queman y algo se rie desde el humo.");
    render();
    return;
  }
  const userId = isDM() ? state.selectedStatsUserId || state.data.profiles.find((p) => p.role !== "dm")?.id || state.session.user.id : state.session.user.id;
  const item = {
    id: uuid(),
    user_id: userId,
    name: recipe.name,
    image_url: "",
    rarity: recipe.rarity || "common",
    quantity: 1,
    storage_slot: "mochila",
    lore_ids: [],
    description: `Crafteado en Averno. ${recipe.effect}`,
    created_by: state.session.user.id,
    created_at: new Date().toISOString(),
  };
  if (hasSupabase) {
    const { error } = await supabase.from("inventory_items").insert(item);
    if (error) throw error;
  } else {
    const data = readJson(DEMO_DATA_KEY);
    data.inventory.unshift(item);
    saveDemo(data);
  }
  await reloadAndToast(`${recipe.name} creado. Milagro caro, como debe ser.`);
}

function canUseHunger() {
  return isDM() || state.data.hunger.some((entry) => entry.user_id === state.session?.user?.id || entry.enabled_user_id === state.session?.user?.id);
}

function getInfiltrationState() {
  const op = normalizeInfiltrationRecord(state.data.infiltration);
  state.data.infiltration = op;
  return op;
}

function canUseInfiltration() {
  const op = getInfiltrationState();
  return isDM() || (op.config.visible_to_player && op.config.authorized_user_id === state.session?.user?.id);
}

function infiltrationAuthorizedProfile(op = getInfiltrationState()) {
  return state.data.profiles.find((profile) => profile.id === op.config.authorized_user_id) || null;
}

function infiltrationVisibleClues(op) {
  return isDM() ? op.clues : op.clues.filter((clue) => clue.state && clue.state !== "oculta");
}

function infiltrationVisibleRoutes(op) {
  return isDM() ? op.routes : op.routes.filter((route) => route.state && route.state !== "desconocida");
}

function infiltrationVisibleInformants(op) {
  return isDM() ? op.informants : op.informants.filter((informant) => informant.status && informant.status !== "no_reclutado");
}

function infiltrationVisibleLocations(op) {
  if (isDM()) return op.locations;
  const visibleClueIds = new Set(infiltrationVisibleClues(op).map((clue) => clue.id));
  return op.locations.filter((location) => location.access === "accesible" || location.access === "parcial" || (location.clues || []).some((id) => visibleClueIds.has(id)));
}

function infiltrationSuspicionLabel(value) {
  if (value <= 2) return "Sin sospecha";
  if (value <= 5) return "Observado";
  if (value <= 8) return "Investigado";
  return "Descubierto o perseguido";
}

function zoneName(id, op = getInfiltrationState()) {
  return op.zones.find((zone) => zone.id === id)?.name || id;
}

function locationName(id, op = getInfiltrationState()) {
  return op.locations.find((location) => location.id === id)?.name || id;
}

function normalizeInfiltrationRecord(record) {
  const base = defaultInfiltrationState();
  if (!record) return base;
  const payload = record.state ? { ...(record.state || {}), config: record.config || record.state.config || {} } : record;
  const mergeById = (baseItems, incomingItems) => {
    const incoming = new Map((incomingItems || []).filter((item) => item?.id).map((item) => [item.id, item]));
    const merged = baseItems.map((item) => ({ ...item, ...(incoming.get(item.id) || {}) }));
    (incomingItems || []).forEach((item) => {
      if (item?.id && !baseItems.some((baseItem) => baseItem.id === item.id)) merged.push(item);
    });
    return merged;
  };
  return {
    ...base,
    ...payload,
    id: "main",
    config: { ...base.config, ...(payload.config || {}) },
    resources: { ...base.resources, ...(payload.resources || {}) },
    disguise: { ...base.disguise, ...(payload.disguise || {}) },
    preparations: mergeById(base.preparations, payload.preparations),
    suspicion: { ...base.suspicion, ...(payload.suspicion || {}) },
    objectives: mergeById(base.objectives, payload.objectives),
    zones: mergeById(base.zones, payload.zones),
    routes: mergeById(base.routes, payload.routes),
    locations: mergeById(base.locations, payload.locations),
    clues: mergeById(base.clues, payload.clues),
    informants: mergeById(base.informants, payload.informants),
    decisions: mergeById(base.decisions, payload.decisions),
    urbanEvents: mergeById(base.urbanEvents, payload.urbanEvents),
    spells: mergeById(base.spells, payload.spells),
    mic: { ...base.mic, ...(payload.mic || {}) },
    checkpoints: mergeById(base.checkpoints, payload.checkpoints),
    log: payload.log?.length ? payload.log : base.log,
  };
}

function withInfiltrationLog(op, text, type = "system") {
  return {
    ...op,
    log: [{ id: uuid(), at: new Date().toISOString(), text, type }, ...(op.log || [])].slice(0, 80),
  };
}

async function saveInfiltration(nextOp, message = "Red de Sombras actualizada.") {
  const op = normalizeInfiltrationRecord(nextOp);
  op.config.updated_at = new Date().toISOString();
  if (hasSupabase) {
    const { config, ...statePayload } = op;
    const { error } = await supabase.from("infiltration_ops").upsert(
      {
        id: "main",
        config,
        state: statePayload,
        updated_by: state.session.user.id,
        updated_at: new Date().toISOString(),
      },
      { onConflict: "id" },
    );
    if (error) throw error;
  } else {
    const data = readJson(DEMO_DATA_KEY);
    data.infiltration = op;
    saveDemo(data);
  }
  await reloadAndToast(message);
}

async function saveInfiltrationConfig(formData) {
  ensureDM();
  const op = getInfiltrationState();
  const next = withInfiltrationLog(
    {
      ...op,
      config: {
        ...op.config,
        authorized_user_id: String(formData.get("authorized_user_id") || ""),
        visible_to_player: formData.has("visible_to_player"),
        city_alert: formData.has("city_alert"),
        phase: String(formData.get("phase") || "baja"),
        dm_directive: String(formData.get("dm_directive") || "").trim(),
      },
    },
    "El DM actualizo permisos, visibilidad o fase de la operacion.",
    "dm",
  );
  await saveInfiltration(next, "Canal secreto actualizado.");
}

async function saveInfiltrationResources(formData) {
  ensureDM();
  const op = getInfiltrationState();
  const resources = { ...op.resources };
  const suspicion = { ...op.suspicion };
  Object.keys(resources).forEach((key) => {
    if (formData.has(`resource_${key}`)) resources[key] = numberValue(formData.get(`resource_${key}`));
  });
  Object.keys(suspicion).forEach((key) => {
    if (formData.has(`suspicion_${key}`)) suspicion[key] = clamp(numberValue(formData.get(`suspicion_${key}`)), 0, 10);
  });
  await saveInfiltration(withInfiltrationLog({ ...op, resources, suspicion }, "El DM ajusto recursos y sospecha.", "dm"), "Trackers ajustados.");
}

async function saveInfiltrationClue(formData) {
  ensureDM();
  const op = getInfiltrationState();
  const clue = {
    id: uuid(),
    category: String(formData.get("category") || "Otros").trim(),
    title: String(formData.get("title") || "").trim(),
    state: String(formData.get("state") || "rumor"),
    summary: String(formData.get("summary") || "").trim(),
    details: String(formData.get("details") || "").trim(),
    dm_secret: String(formData.get("dm_secret") || "").trim(),
    location: "",
  };
  if (!clue.title) throw new Error("La pista necesita titulo.");
  await saveInfiltration(withInfiltrationLog({ ...op, clues: [clue, ...op.clues] }, `Nueva pista creada: ${clue.title}.`, "dm"), "Pista anadida.");
}

async function resetInfiltration() {
  ensureDM();
  await saveInfiltration(defaultInfiltrationState(), "Operacion reiniciada.");
}

async function setClueState(id, nextState) {
  ensureDM();
  const op = getInfiltrationState();
  const nextClues = op.clues.map((clue) => (clue.id === id ? { ...clue, state: nextState } : clue));
  const clue = nextClues.find((item) => item.id === id);
  await saveInfiltration(withInfiltrationLog({ ...op, clues: nextClues }, `Pista "${clue?.title || id}" marcada como ${labelize(nextState)}.`, "intel"), "Estado de pista cambiado.");
}

async function setRouteState(id, nextState) {
  ensureDM();
  const op = getInfiltrationState();
  const routes = op.routes.map((route) => (route.id === id ? { ...route, state: nextState } : route));
  const resources = { ...op.resources, known_routes: routes.filter((route) => !["desconocida", "rumor"].includes(route.state)).length };
  const route = routes.find((item) => item.id === id);
  await saveInfiltration(withInfiltrationLog({ ...op, routes, resources }, `Ruta "${route?.name || id}" pasa a ${labelize(nextState)}.`, "route"), "Ruta actualizada.");
}

async function setInformantStatus(id, nextState) {
  if (!canUseInfiltration()) throw new Error("No tienes acceso a esta red.");
  const op = getInfiltrationState();
  const informant = op.informants.find((item) => item.id === id);
  if (!informant) throw new Error("Informador no encontrado.");
  const informants = op.informants.map((item) => (item.id === id ? { ...item, status: nextState } : item));
  let clues = [...op.clues];
  let resources = { ...op.resources };
  let suspicion = { ...op.suspicion };
  if (["contactado", "reclutado"].includes(nextState)) {
    resources.contacts = informants.filter((item) => ["contactado", "reclutado"].includes(item.status)).length;
    clues = clues.map((clue) => (informant.clue_ids || []).includes(clue.id) && clue.state === "oculta" ? { ...clue, state: nextState === "reclutado" ? "parcial" : "rumor" } : clue);
  }
  if (nextState === "quemado" || nextState === "traidor") {
    suspicion.guardias = clamp((suspicion.guardias || 0) + 1, 0, 10);
    resources.contacts = Math.max(0, Number(resources.contacts || 0) - 1);
  }
  const verb = nextState === "reclutado" ? "reclutado y empieza a filtrar pistas" : `marcado como ${labelize(nextState)}`;
  await saveInfiltration(withInfiltrationLog({ ...op, informants, clues, resources, suspicion }, `${informant.name} queda ${verb}.`, "informant"), "Informador actualizado.");
}

async function payInformant(id) {
  if (!canUseInfiltration()) throw new Error("No tienes acceso a esta red.");
  const op = getInfiltrationState();
  const informant = op.informants.find((item) => item.id === id);
  if (!informant) throw new Error("Informador no encontrado.");
  let resources = { ...op.resources };
  resources.gold = Math.max(0, Number(resources.gold || 0) - 5);
  resources.contacts = Math.max(Number(resources.contacts || 0), 1);
  const clues = op.clues.map((clue) => {
    if (!(informant.clue_ids || []).includes(clue.id)) return clue;
    if (clue.state === "oculta") return { ...clue, state: "rumor" };
    if (clue.state === "rumor") return { ...clue, state: "parcial" };
    return clue;
  });
  const informants = op.informants.map((item) => (item.id === id && item.status === "no_reclutado" ? { ...item, status: "contactado" } : item));
  await saveInfiltration(withInfiltrationLog({ ...op, informants, clues, resources }, `${informant.name} cobra y filtra informacion progresiva.`, "informant"), "Informador pagado.");
}

async function togglePreparation(id) {
  if (!canUseInfiltration()) throw new Error("No tienes acceso a esta red.");
  const op = getInfiltrationState();
  const preparations = (op.preparations || []).map((prep) => {
    if (prep.id !== id) return prep;
    return { ...prep, status: prep.status === "preparado" ? "pendiente" : "preparado" };
  });
  const preparedCount = preparations.filter((prep) => prep.status === "preparado").length;
  const resources = { ...op.resources, cover: Math.min(10, 4 + preparedCount), equipment: Math.max(op.resources.equipment || 0, Math.ceil(preparedCount / 2)) };
  await saveInfiltration(withInfiltrationLog({ ...op, preparations, resources }, "Preparacion del infiltrado actualizada.", "prep"), "Preparacion actualizada.");
}

async function chooseInfiltrationOption(decisionId, optionId) {
  if (!canUseInfiltration()) throw new Error("No tienes acceso a esta red.");
  const op = getInfiltrationState();
  const decisions = op.decisions.map((decision) => (decision.id === decisionId ? { ...decision, chosen: optionId, status: "elegida" } : decision));
  const decision = decisions.find((item) => item.id === decisionId);
  const option = decision?.options?.find((item) => item.id === optionId);
  await saveInfiltration(withInfiltrationLog({ ...op, decisions }, `Decision elegida: ${decision?.situation || decisionId} -> ${option?.label || optionId}.`, "decision"), "Decision marcada.");
}

async function saveInfiltrationAction(formData) {
  if (!canUseInfiltration()) throw new Error("No tienes acceso a esta red.");
  const op = getInfiltrationState();
  const template = infiltrationActionTemplates.find((action) => action.id === String(formData.get("action_id"))) || infiltrationActionTemplates[0];
  const location = op.locations.find((item) => item.id === String(formData.get("location_id"))) || op.locations[0];
  const decision = {
    id: uuid(),
    situation: `${template.label} en ${location?.name || "la ciudad"}`,
    zone: location?.zone || "baja",
    location: location?.id || "",
    status: "pendiente",
    chosen: "plan",
    check_skill: String(formData.get("check_skill") || template.skill),
    dc: numberValue(formData.get("dc")) || template.dc,
    result: "",
    hidden_consequence: `Puede desbloquear: ${(template.unlocks || []).join(", ") || "rumores menores"}. Riesgo base: ${template.risk}.`,
    unlock_clue_ids: template.unlocks || [],
    options: [
      {
        id: "plan",
        label: String(formData.get("approach") || "").trim() || template.label,
        cost: String(formData.get("cost") || template.cost || "tiempo").trim(),
        risk: template.risk,
        reward: String(formData.get("notes") || "").trim() || "Resolver informacion, ruta o complicacion.",
      },
    ],
  };
  await saveInfiltration(withInfiltrationLog({ ...op, decisions: [decision, ...op.decisions] }, `Nuevo plan enviado: ${decision.situation}.`, "decision"), "Plan enviado a la Red de Sombras.");
}

async function resolveInfiltrationDecision(formData) {
  if (!canUseInfiltration()) throw new Error("No tienes acceso a esta red.");
  const op = getInfiltrationState();
  const id = String(formData.get("id") || "");
  const roll = clamp(numberValue(formData.get("roll")), 1, 20);
  const modifier = numberValue(formData.get("modifier"));
  const dc = numberValue(formData.get("dc")) || 15;
  const total = roll + modifier;
  let tier = "fallo";
  if (roll === 20) tier = "exito critico";
  else if (roll === 1 || total <= dc - 8) tier = "fallo grave";
  else if (total >= dc) tier = "exito";
  else if (total >= dc - 4) tier = "exito parcial";
  const decisions = op.decisions.map((decision) => {
    if (decision.id !== id) return decision;
    const result = `${tier.toUpperCase()}: ${roll}+${modifier}=${total} contra CD ${dc}. ${infiltrationResultText(tier, decision)}`;
    return { ...decision, dc, result, status: tier.includes("exito") ? "resuelta" : "complicada" };
  });
  const decision = decisions.find((item) => item.id === id);
  let clues = [...op.clues];
  let resources = { ...op.resources };
  let suspicion = { ...op.suspicion };
  if (tier === "exito critico" || tier === "exito") {
    (decision?.unlock_clue_ids || []).forEach((clueId) => {
      clues = clues.map((clue) => (clue.id === clueId && clue.state === "oculta" ? { ...clue, state: tier === "exito critico" ? "confirmada" : "parcial" } : clue));
    });
    resources.suspicion = Math.max(0, Number(resources.suspicion || 0) - (tier === "exito critico" ? 1 : 0));
  } else {
    const zone = decision?.zone || "baja";
    suspicion[zone] = clamp((suspicion[zone] || 0) + (tier === "fallo grave" ? 2 : 1), 0, 10);
    resources.suspicion = clamp((resources.suspicion || 0) + (tier === "fallo grave" ? 2 : 1), 0, 10);
  }
  await saveInfiltration(withInfiltrationLog({ ...op, decisions, clues, resources, suspicion }, `Decision resuelta: ${decision?.situation || id} -> ${tier} (${total}/${dc}).`, "roll"), "Decision resuelta.");
}

function infiltrationResultText(tier, decision = {}) {
  if (tier === "exito critico") return "Obtienes informacion extra, reduces exposicion o confirmas una ruta.";
  if (tier === "exito") return "Obtienes la pista principal o preparas el siguiente paso.";
  if (tier === "exito parcial") return "Avanzas, pero la informacion llega incompleta y sube la presion.";
  if (tier === "fallo grave") return `Complicacion seria: ${decision.hidden_consequence || "la ciudad aprende tu olor."}`;
  return "No obtienes lo que buscabas y aparece una complicacion menor.";
}

async function revealDecisionConsequence(id) {
  ensureDM();
  const op = getInfiltrationState();
  const decisions = op.decisions.map((decision) => (decision.id === id ? { ...decision, result: `${decision.result ? `${decision.result}\n` : ""}Consecuencia revelada: ${decision.hidden_consequence || "El DM introduce una complicacion."}` } : decision));
  await saveInfiltration(withInfiltrationLog({ ...op, decisions }, "El DM revelo una consecuencia oculta.", "dm"), "Consecuencia revelada.");
}

async function toggleObjective(id) {
  ensureDM();
  const order = ["pendiente", "activo", "completo", "bloqueado"];
  const op = getInfiltrationState();
  const objectives = op.objectives.map((objective) => {
    if (objective.id !== id) return objective;
    const next = order[(order.indexOf(objective.status) + 1) % order.length] || "pendiente";
    return { ...objective, status: next };
  });
  await saveInfiltration(withInfiltrationLog({ ...op, objectives }, "El DM actualizo el tracker de objetivo.", "dm"), "Objetivo actualizado.");
}

async function rollHungerCurse(userId) {
  ensureDM();
  const table = state.data.hungerTable?.length ? state.data.hungerTable : defaultHungerTable();
  const pick = table[Math.floor(Math.random() * table.length)];
  const curse = {
    user_id: userId,
    title: pick.title,
    effect: pick.effect,
    severity: pick.severity,
    created_by: state.session.user.id,
    created_at: new Date().toISOString(),
  };
  if (hasSupabase) {
    const { error } = await supabase.from("hunger_curses").insert(curse);
    if (error) throw error;
  } else {
    const data = readJson(DEMO_DATA_KEY);
    data.hunger.unshift({ ...curse, id: uuid() });
    saveDemo(data);
  }
  await reloadAndToast("La maldicion de hambre se manifiesta.");
}

function defaultHungerTable() {
  return hungerCravings.map((craving, index) => {
    const roll = index + 1;
    const severity = roll >= 97 ? "abisal" : roll >= 86 ? "alta" : roll >= 61 ? "media" : "menor";
    const pressure =
      severity === "abisal"
        ? "La necesidad no parece metabolica: algo con ojos bajo la piel lo reclama y susurra un precio."
        : severity === "alta"
          ? "La tripa se retuerce como una cadena viva; ignorarla deja una marca visible hasta el siguiente descanso."
          : severity === "media"
            ? "El hambre convierte cada olor parecido en una amenaza y una promesa."
            : "La boca sabe a hierro frio y ceniza humeda hasta que se cumple el antojo.";
    return {
      title: `Hambre ${roll}: ${craving}`,
      severity,
      effect: `${pressure} Debe conseguir o devorar: ${craving}. Si no lo hace antes de cerrar la sesion, el DM puede sumar stress, imponer una complicacion o despertar una deuda infernal.`,
    };
  });
}

async function rollStress(userId) {
  ensureDM();
  if (!userId) return;
  const targetProfile = state.data.profiles.find((profile) => profile.id === userId);
  if (!targetProfile || targetProfile.role === "dm") throw new Error("El DM no tira stress: usa bichos en el campo de batalla.");
  state.rollingUserId = userId;
  state.dieFace = "?";
  render();
  const stopAnimation = animateDie();
  await wait(950);
  let result;
  if (hasSupabase) {
    const response = await supabase.rpc("apply_stress_roll", { target_user: userId, die_size: 4 });
    if (response.error) throw response.error;
    result = Array.isArray(response.data) ? response.data[0] : response.data;
  } else {
    result = demoRollStress(userId);
  }
  stopAnimation(result?.rolled || 1);
  state.rollingUserId = null;
  state.dieFace = result?.rolled || 1;
  await loadAll();
  showToast(`Stress +${result?.rolled || 1}. Total: ${result?.resulting_stress ?? "?"}.`);
  render();
}

function animateDie() {
  const node = document.querySelector("[data-die-face]");
  const interval = window.setInterval(() => {
    if (node) node.textContent = String(Math.floor(Math.random() * 4) + 1);
  }, 80);
  return (finalValue) => {
    window.clearInterval(interval);
    if (node) node.textContent = String(finalValue);
  };
}

function calculateSortOrder(position, anchorId, current) {
  if (position === "same" && current) return Number(current.sort_order || 0);
  const events = [...state.data.events]
    .filter((event) => event.id !== current?.id)
    .sort((a, b) => Number(a.sort_order || 0) - Number(b.sort_order || 0));
  const anchorIndex = events.findIndex((event) => event.id === anchorId);
  if (position === "before" && anchorIndex >= 0) {
    const previous = events[anchorIndex - 1];
    const anchor = events[anchorIndex];
    return previous ? (Number(previous.sort_order) + Number(anchor.sort_order)) / 2 : Number(anchor.sort_order) - 1024;
  }
  if (position === "after" && anchorIndex >= 0) {
    const anchor = events[anchorIndex];
    const next = events[anchorIndex + 1];
    return next ? (Number(anchor.sort_order) + Number(next.sort_order)) / 2 : Number(anchor.sort_order) + 1024;
  }
  return events.length ? Math.max(...events.map((event) => Number(event.sort_order || 0))) + 1024 : 1024;
}

function defaultStats(userId, profile = {}) {
  return {
    id: "",
    user_id: userId,
    character_name: profile?.character_name || "",
    image_url: profile?.avatar_url || "",
    hp_current: 10,
    hp_max: 10,
    stress: 0,
    ac: 10,
    passive_perception: 10,
    passive_investigation: 10,
    passive_insight: 10,
    rations: 0,
    water: 0,
    inspiration: 0,
    exhaustion: 0,
    soul_coins: 0,
    other_stats: {},
    notes: "",
  };
}

function defaultBattleState() {
  return {
    id: "main",
    initiative_requested: false,
    active_combatant_id: null,
    round: 1,
    map_hidden: false,
    map_terrain: [],
    map_areas: [],
    map_width: 12,
    map_height: 8,
    map_background_url: "",
    active_map_id: "main-map",
    maps: [],
  };
}

function getBattleState() {
  return state.data.battleState || defaultBattleState();
}

function sortedCombatants() {
  return [...(state.data.combatants || [])].sort((a, b) => {
    const aInit = a.initiative === null || a.initiative === undefined ? -999 : Number(a.initiative);
    const bInit = b.initiative === null || b.initiative === undefined ? -999 : Number(b.initiative);
    if (bInit !== aInit) return bInit - aInit;
    return String(a.name || "").localeCompare(String(b.name || ""));
  });
}

function activeCombatant(combatants, battleState) {
  return combatants.find((combatant) => combatant.id === battleState.active_combatant_id) || combatants.find((combatant) => combatant.initiative !== null && combatant.initiative !== undefined) || null;
}

function areaIncludesCell(area, x, y) {
  const ax = Number(area.x || 0);
  const ay = Number(area.y || 0);
  const size = Number(area.size || 1);
  const dx = x - ax;
  const dy = y - ay;
  const dir = area.direction || "E";
  if (area.shape === "circle") return Math.hypot(dx, dy) <= size;
  if (area.shape === "cube") return Math.abs(dx) <= size && Math.abs(dy) <= size;
  const vectors = {
    E: [1, 0],
    W: [-1, 0],
    N: [0, -1],
    S: [0, 1],
    NE: [1, -1],
    NW: [-1, -1],
    SE: [1, 1],
    SW: [-1, 1],
  };
  const [vx, vy] = vectors[dir] || vectors.E;
  const magnitude = Math.hypot(vx, vy) || 1;
  const ux = vx / magnitude;
  const uy = vy / magnitude;
  const forward = dx * ux + dy * uy;
  const lateral = Math.abs(dx * -uy + dy * ux);
  if (area.shape === "line") return forward >= -0.25 && forward <= size * 2 + 0.25 && lateral <= 0.56;
  if (area.shape === "cone") return forward >= -0.25 && forward <= size * 2 + 0.25 && lateral <= Math.max(0.72, forward * 0.62);
  return false;
}

function battleMaps(battleState) {
  if (Array.isArray(battleState.maps) && battleState.maps.length) return battleState.maps;
  return [
    {
      id: "main-map",
      name: "Averno",
      width: battleState.map_width || 12,
      height: battleState.map_height || 8,
      hidden: Boolean(battleState.map_hidden),
      terrain: battleState.map_terrain || [],
      areas: battleState.map_areas || [],
      background_url: battleState.map_background_url || "",
    },
  ];
}

function activeBattleMap(battleState) {
  const maps = battleMaps(battleState);
  return maps.find((map) => map.id === battleState.active_map_id) || maps[0];
}

function withUpdatedActiveMap(battleState, updatedMap) {
  const maps = battleMaps(battleState).map((map) => (map.id === updatedMap.id ? updatedMap : map));
  if (!maps.some((map) => map.id === updatedMap.id)) maps.push(updatedMap);
  return {
    ...battleState,
    active_map_id: updatedMap.id,
    maps,
    map_hidden: updatedMap.hidden,
    map_terrain: updatedMap.terrain || [],
    map_areas: updatedMap.areas || [],
    map_width: updatedMap.width,
    map_height: updatedMap.height,
    map_background_url: updatedMap.background_url || "",
  };
}

function readAreaForm(x, y, source = null) {
  const get = (name, fallback = "") => (source?.get ? source.get(name) : document.querySelector(`[name="${name}"]`)?.value) ?? fallback;
  const checked = (name, fallback = true) => (source?.has ? source.has(name) : document.querySelector(`[name="${name}"]`)?.checked) ?? fallback;
  return {
    id: uuid(),
    shape: String(get("area_shape", "circle")),
    x: clamp(Number(x), 0, 119),
    y: clamp(Number(y), 0, 89),
    size: clamp(numberValue(get("area_size", 2)) || 1, 1, 12),
    direction: String(get("area_direction", "E")),
    visible: checked("area_visible", true),
    label: String(get("area_label", "")).trim(),
  };
}

function terrainKey(cell) {
  return String(cell.id || `${cell.x}-${cell.y}-${cell.type || "terrain"}`);
}

function combatantTypeLabel(type) {
  if (type === "player") return "Player";
  if (type === "monster") return "Monstruo";
  if (type === "npc") return "NPC";
  if (type === "object") return "Objeto";
  if (type === "trap") return "Trampa";
  return "Ficha";
}

function parseMonsterBlock(raw) {
  const text = String(raw || "").trim();
  if (!text) return {};
  const lines = text.split(/\r?\n/).map((line) => line.trim()).filter(Boolean);
  const ac = Number((text.match(/(?:Armor Class|AC|CA)\s*[: ]\s*(\d+)/i) || [])[1] || 0);
  const hp = Number((text.match(/(?:Hit Points|HP|Puntos de golpe|PG)\s*[: ]\s*(\d+)/i) || [])[1] || 0);
  const initiative = Number((text.match(/(?:Initiative|Iniciativa)\s*[: +]?\s*([+-]?\d+)/i) || [])[1] || 0);
  return {
    name: lines[0] || "Criatura importada",
    ac,
    hp,
    initiative,
    raw: `Statblock importado:\n${text}`,
  };
}

function parseConditions(value) {
  if (Array.isArray(value)) return value.filter(Boolean);
  return String(value || "")
    .split(",")
    .map((item) => item.trim())
    .filter(Boolean);
}

function renderTokenFace(combatant) {
  const conditions = parseConditions(combatant.conditions);
  const face = combatant.avatar_url ? `<img src="${escapeAttr(combatant.avatar_url)}" alt="" />` : `<span>${escapeHtml(initials(combatant.name))}</span>`;
  return `${face}${conditions.length ? `<span class="token-conditions">${escapeHtml(conditions.slice(0, 2).map((c) => c[0]).join(""))}</span>` : ""}`;
}

function scrollTimeline(direction) {
  const node = document.querySelector("[data-timeline-scroll]");
  if (!node) return;
  node.scrollBy({ left: direction * Math.round(node.clientWidth * 0.78), behavior: "smooth" });
}

function diceIcon(sides) {
  if (sides === 4) return "dice-4";
  if (sides === 6) return "dice-6";
  return "dices";
}

function renderAvatar(subject = {}, size = "small") {
  const image = subject.avatar_url || subject.image_url;
  const label = subject.character_name || subject.name || subject.display_name || "PJ";
  return `
    <span class="avatar avatar-${size}">
      ${image ? `<img src="${escapeAttr(image)}" alt="" loading="lazy" />` : `<span>${escapeHtml(initials(label))}</span>`}
    </span>
  `;
}

function profileName(userId) {
  const profile = state.data.profiles.find((item) => item.id === userId);
  return profile?.character_name || profile?.display_name || "Personaje";
}

async function resolveImageInput(formData, fileField, currentUrl, folder) {
  const file = formData.get(fileField);
  if (hasFile(file)) return uploadImage(file, folder);
  return currentUrl;
}

async function uploadImage(file, folder) {
  if (!hasFile(file)) return "";
  if (!file.type.startsWith("image/")) throw new Error("El archivo debe ser una imagen.");
  if (file.size > 5 * 1024 * 1024) throw new Error("La imagen debe pesar menos de 5MB.");
  const processed = await stylizeImageFile(file);
  if (!hasSupabase) return blobToDataUrl(processed);

  const path = `${folder}/${state.session.user.id}/${Date.now()}-${uuid()}.jpg`;
  const { error } = await supabase.storage.from(IMAGE_BUCKET).upload(path, processed, {
    cacheControl: "3600",
    contentType: "image/jpeg",
    upsert: true,
  });
  if (error) throw error;
  const { data } = supabase.storage.from(IMAGE_BUCKET).getPublicUrl(path);
  return data.publicUrl;
}

async function stylizeImageFile(file) {
  try {
    const source = await fileToDataUrl(file);
    const image = await loadImage(source);
    const maxSize = 1400;
    const scale = Math.min(1, maxSize / Math.max(image.width, image.height));
    const canvas = document.createElement("canvas");
    canvas.width = Math.max(1, Math.round(image.width * scale));
    canvas.height = Math.max(1, Math.round(image.height * scale));
    const ctx = canvas.getContext("2d");
    ctx.filter = "sepia(28%) saturate(78%) contrast(116%) brightness(88%)";
    ctx.drawImage(image, 0, 0, canvas.width, canvas.height);
    ctx.filter = "none";
    ctx.globalCompositeOperation = "overlay";
    ctx.fillStyle = "rgba(132, 39, 24, 0.16)";
    ctx.fillRect(0, 0, canvas.width, canvas.height);
    ctx.globalCompositeOperation = "multiply";
    const gradient = ctx.createRadialGradient(canvas.width * 0.5, canvas.height * 0.4, 0, canvas.width * 0.5, canvas.height * 0.5, Math.max(canvas.width, canvas.height) * 0.72);
    gradient.addColorStop(0, "rgba(255, 232, 180, 0.08)");
    gradient.addColorStop(1, "rgba(18, 8, 6, 0.34)");
    ctx.fillStyle = gradient;
    ctx.fillRect(0, 0, canvas.width, canvas.height);
    return await new Promise((resolve) => canvas.toBlob((blob) => resolve(blob || file), "image/jpeg", 0.88));
  } catch {
    return file;
  }
}

function loadImage(source) {
  return new Promise((resolve, reject) => {
    const image = new Image();
    image.onload = () => resolve(image);
    image.onerror = () => reject(new Error("No se pudo procesar la imagen."));
    image.src = source;
  });
}

function blobToDataUrl(blob) {
  return new Promise((resolve, reject) => {
    const reader = new FileReader();
    reader.onload = () => resolve(reader.result);
    reader.onerror = () => reject(new Error("No se pudo leer la imagen."));
    reader.readAsDataURL(blob);
  });
}

function renderCheckList(name, options, selected = []) {
  const selectedSet = new Set(selected);
  if (!options.length) return `<div class="check-list empty">No hay opciones todavia.</div>`;
  return `
    <div class="check-list">
      ${options
        .map(
          (option) => `
            <label>
              <input type="checkbox" name="${escapeAttr(name)}" value="${escapeAttr(option.value)}" ${selectedSet.has(option.value) ? "checked" : ""} />
              <span>${escapeHtml(option.label)}</span>
            </label>
          `,
        )
        .join("")}
    </div>
  `;
}

function remembered(name, fallback = "") {
  return state.ui?.formSelections?.[name] ?? fallback;
}

function selectedOption(name, value, fallback = "") {
  return String(remembered(name, fallback)) === String(value) ? "selected" : "";
}

function checkedOption(name, fallback = true) {
  return Boolean(remembered(name, fallback)) ? "checked" : "";
}

function fileToDataUrl(file) {
  return new Promise((resolve, reject) => {
    const reader = new FileReader();
    reader.onload = () => resolve(reader.result);
    reader.onerror = () => reject(new Error("No se pudo leer la imagen."));
    reader.readAsDataURL(file);
  });
}

function hasFile(file) {
  return file instanceof File && file.size > 0;
}

function initials(value) {
  return String(value || "?")
    .split(/\s+/)
    .filter(Boolean)
    .slice(0, 2)
    .map((part) => part[0]?.toUpperCase())
    .join("") || "?";
}

function normalizeDemoData(data) {
  let changed = !data.combatants || !data.diceRolls || !data.battleState || !data.loreVisibility || !data.inventory || !data.inventoryContainers || !data.contracts || !data.hungerTable || !data.shop || !data.infiltration;
  data.combatants ||= [];
  data.diceRolls ||= [];
  data.battleState ||= defaultBattleState();
  data.battleState = { ...defaultBattleState(), ...data.battleState };
  data.battleState.maps = battleMaps(data.battleState);
  data.battleState.active_map_id ||= data.battleState.maps[0]?.id || "main-map";
  const fallbackMapId = data.battleState.maps[0]?.id || data.battleState.active_map_id || "main-map";
  data.combatants = data.combatants.map((combatant) => {
    if (combatant.map_id) return combatant;
    changed = true;
    return { ...combatant, map_id: fallbackMapId };
  });
  data.inventory ||= [];
  data.inventory = data.inventory.map((item) => ({ storage_slot: "mochila", ...item }));
  data.inventoryContainers ||= [];
  data.contracts ||= [];
  data.hunger ||= [];
  data.hungerTable ||= [];
  data.shop = { ...defaultShopState(), ...(data.shop || {}) };
  data.shop.pool = normalizeShopPool(data.shop.pool?.length ? data.shop.pool : infernalShopPool);
  data.shop.crafting_resources = normalizeCraftingResources(data.shop.crafting_resources?.length ? data.shop.crafting_resources : avernusResources);
  data.shop.crafting_recipes = normalizeCraftingRecipes(data.shop.crafting_recipes?.length ? data.shop.crafting_recipes : avernusRecipes);
  data.shop.crafting_upgrades = normalizeCraftingUpgrades(data.shop.crafting_upgrades?.length ? data.shop.crafting_upgrades : defaultCraftingUpgrades);
  data.infiltration = normalizeInfiltrationRecord(data.infiltration);
  data.loreVisibility ||= [];
  data.importedLore ||= [];
  data.rolls ||= [];
  data.profiles ||= [];
  data.profiles = data.profiles.map((profile) => {
    const characterDetails = inferDefaultToolProficiencies({ ...profile, character_details: profile.character_details || {} });
    if (profile.role !== "dm" && !profile.character_details?.tool_proficiencies && characterDetails.tool_proficiencies) changed = true;
    return {
      avatar_url: "",
      character_title: "",
      character_description: "",
      character_lore_ids: [],
      ...profile,
      character_details: characterDetails,
    };
  });
  const playerIds = new Set(data.profiles.filter((profile) => profile.role !== "dm").map((profile) => profile.id));
  if (data.stats.some((card) => !playerIds.has(card.user_id))) changed = true;
  data.stats = data.stats.filter((card) => playerIds.has(card.user_id));
  if (changed) saveDemo(data);
  return data;
}

function inferDefaultToolProficiencies(profile = {}) {
  const details = { ...(profile.character_details || {}) };
  if (profile.role !== "dm" && !details.tool_proficiencies) {
    const signature = `${profile.character_name || ""} ${details.role || ""}`.toLowerCase();
    details.tool_proficiencies = signature.includes("selene") || signature.includes("maga")
      ? "Cartographer's tools, Calligrapher's supplies, Alchemist's supplies"
      : "Smith's tools, Herbalism kit, Thieves' tools";
  }
  return details;
}

function demoSignIn(email) {
  const data = normalizeDemoData(readJson(DEMO_DATA_KEY) || emptyData());
  let profile = data.profiles.find((item) => item.email.toLowerCase() === email.toLowerCase());
  if (!profile) {
    profile = {
      id: uuid(),
      email,
      display_name: email.split("@")[0],
      character_name: email.split("@")[0],
      avatar_url: "",
      character_title: "",
      character_description: "",
      character_details: {},
      character_lore_ids: [],
      role: "player",
      created_at: new Date().toISOString(),
    };
    data.profiles.push(profile);
    data.stats.push({ ...defaultStats(profile.id, profile), id: uuid(), created_at: new Date().toISOString() });
    saveDemo(data);
  }
  return { user: { id: profile.id, email: profile.email, user_metadata: {} }, access_token: "demo" };
}

function demoSignUp(email, displayName, characterName, avatarUrl, characterTitle) {
  const data = normalizeDemoData(readJson(DEMO_DATA_KEY) || emptyData());
  const profile = {
    id: uuid(),
    email,
    display_name: displayName,
    character_name: characterName,
    avatar_url: avatarUrl,
    character_title: characterTitle,
    character_description: "",
    character_details: {},
    character_lore_ids: [],
    role: "player",
    created_at: new Date().toISOString(),
  };
  data.profiles.push(profile);
  data.stats.push({ ...defaultStats(profile.id, profile), id: uuid(), created_at: new Date().toISOString() });
  saveDemo(data);
  return { user: { id: profile.id, email: profile.email, user_metadata: { display_name: displayName, character_name: characterName, avatar_url: avatarUrl, character_title: characterTitle } }, access_token: "demo" };
}

function demoRollStress(userId) {
  const rolled = Math.floor(Math.random() * 4) + 1;
  const data = normalizeDemoData(readJson(DEMO_DATA_KEY) || emptyData());
  let card = data.stats.find((item) => item.user_id === userId);
  if (!card) {
    const profile = data.profiles.find((item) => item.id === userId);
    card = { ...defaultStats(userId, profile), id: uuid(), created_at: new Date().toISOString() };
    data.stats.push(card);
  }
  card.stress = Number(card.stress || 0) + rolled;
  card.updated_at = new Date().toISOString();
  data.rolls.push({
    id: uuid(),
    user_id: userId,
    die_size: 4,
    rolled,
    resulting_stress: card.stress,
    created_by: state.session.user.id,
    created_at: new Date().toISOString(),
  });
  saveDemo(data);
  return { rolled, resulting_stress: card.stress };
}

function ensureDemoData() {
  if (readJson(DEMO_DATA_KEY)) return;
  const dmId = "demo-dm";
  saveDemo({
    profiles: [
      {
        id: dmId,
        email: "dm@demo.local",
        display_name: "DM",
        character_name: "La Mesa",
        avatar_url: "",
        character_title: "Custodio de la campana",
        character_description: "",
        character_details: {},
        character_lore_ids: [],
        role: "dm",
        created_at: new Date().toISOString(),
      },
    ],
    events: [],
    lore: [],
    links: [],
    loreVisibility: [],
    notes: [],
    stats: [],
    rolls: [],
    battleState: defaultBattleState(),
    combatants: [],
    diceRolls: [],
    inventory: [],
    inventoryContainers: [],
    contracts: [],
    hunger: [],
    hungerTable: [],
    shop: defaultShopState(),
    infiltration: defaultInfiltrationState(),
    importedLore: [],
  });
}

function saveDemo(data) {
  localStorage.setItem(DEMO_DATA_KEY, JSON.stringify(data));
}

function clearLegacyDemoKeys() {
  ["archivo-infernal-demo-data-v5", "archivo-infernal-demo-data-v6", "archivo-infernal-demo-session-v1"].forEach((key) => localStorage.removeItem(key));
}

function readJson(key) {
  try {
    return JSON.parse(localStorage.getItem(key));
  } catch {
    return null;
  }
}

function readUiState() {
  return readJson(UI_STATE_KEY) || { route: "timeline", formSelections: {} };
}

function saveUiState(patch) {
  state.ui = { ...(state.ui || {}), ...patch };
  localStorage.setItem(UI_STATE_KEY, JSON.stringify(state.ui));
}

function soundEnabled() {
  return state.ui?.soundOn !== false;
}

function toggleSound() {
  const next = !soundEnabled();
  saveUiState({ soundOn: next });
  if (next) playSfx("toggle-sound");
  render();
}

function playSfx(kind = "click") {
  if (!soundEnabled()) return;
  try {
    const AudioContext = window.AudioContext || window.webkitAudioContext;
    if (!AudioContext) return;
    const ctx = playSfx.ctx || new AudioContext();
    playSfx.ctx = ctx;
    if (ctx.state === "suspended") ctx.resume();
    const patterns = {
      "buy-shop-item": [196, 247, 330],
      deny: [132, 92],
      "reroll-shop": [155, 196, 155],
      contract: [110, 164, 220],
      dice: [320, 220, 380],
      "craft-recipe": [146, 196, 246],
      "craft-upgrade": [174, 233, 293],
      "toggle-sound": [260, 390],
      click: [190],
    };
    const freqs = patterns[kind] || (String(kind).includes("delete") ? [130, 88] : patterns.click);
    const now = ctx.currentTime;
    freqs.forEach((freq, index) => {
      const osc = ctx.createOscillator();
      const gain = ctx.createGain();
      osc.type = kind === "deny" || String(kind).includes("delete") ? "sawtooth" : "triangle";
      osc.frequency.setValueAtTime(freq, now + index * 0.055);
      gain.gain.setValueAtTime(0.0001, now + index * 0.055);
      gain.gain.exponentialRampToValueAtTime(0.055, now + index * 0.055 + 0.015);
      gain.gain.exponentialRampToValueAtTime(0.0001, now + index * 0.055 + 0.14);
      osc.connect(gain);
      gain.connect(ctx.destination);
      osc.start(now + index * 0.055);
      osc.stop(now + index * 0.055 + 0.15);
    });
  } catch {
    // Sound is a tiny flourish; the app should never fail because audio is blocked.
  }
}

async function reloadAndToast(message) {
  await loadAll();
  showToast(message);
  render();
}

function showToast(message) {
  state.toast = message;
  window.clearTimeout(showToast.timer);
  showToast.timer = window.setTimeout(() => {
    state.toast = "";
    render();
  }, 3600);
}

function renderToast() {
  return state.toast ? `<div class="toast" role="status">${escapeHtml(state.toast)}</div>` : "";
}

function renderBanner(text) {
  return `<div class="banner">${icon("info")} <span>${escapeHtml(text)}</span></div>`;
}

function renderEmpty(text) {
  return `<div class="empty-state">${escapeHtml(text)}</div>`;
}

function isDM() {
  return state.profile?.role === "dm";
}

function ensureDM() {
  if (!isDM()) throw new Error("Solo el DM puede hacer eso.");
}

function setBusy(value) {
  state.busy = value;
}

function numberValue(value) {
  const number = Number(value);
  return Number.isFinite(number) ? number : 0;
}

function clamp(value, min, max) {
  return Math.min(max, Math.max(min, Number(value || 0)));
}

function compact(object) {
  return Object.fromEntries(Object.entries(object).filter(([, value]) => value !== undefined));
}

function labelize(key) {
  return key
    .replaceAll("_", " ")
    .replace(/\b\w/g, (letter) => letter.toUpperCase())
    .replace("Dm", "DM");
}

function wait(ms) {
  return new Promise((resolve) => window.setTimeout(resolve, ms));
}

function uuid() {
  if (window.crypto?.randomUUID) return window.crypto.randomUUID();
  return `id-${Date.now()}-${Math.random().toString(16).slice(2)}`;
}

function escapeHtml(value) {
  return String(value ?? "")
    .replaceAll("&", "&amp;")
    .replaceAll("<", "&lt;")
    .replaceAll(">", "&gt;")
    .replaceAll('"', "&quot;")
    .replaceAll("'", "&#039;");
}

function escapeAttr(value) {
  return escapeHtml(value);
}

function icon(name) {
  return `<i data-lucide="${name}" aria-hidden="true"></i>`;
}

function refreshIcons() {
  window.requestAnimationFrame(() => {
    if (window.lucide) {
      window.lucide.createIcons({
        attrs: {
          width: 18,
          height: 18,
          "stroke-width": 1.8,
        },
      });
    }
  });
}
