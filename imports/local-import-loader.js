(() => {
  const DATA_KEY = "archivo-infernal-demo-data-v5";
  const mergeById = (existing, incoming) => {
    const map = new Map((existing || []).map((item) => [item.id, item]));
    (incoming || []).forEach((item) => map.set(item.id, { ...(map.get(item.id) || {}), ...item }));
    return [...map.values()];
  };
  fetch("./imports/notion-local-import.json")
    .then((response) => response.json())
    .then((importData) => {
      const current = JSON.parse(localStorage.getItem(DATA_KEY) || "{}");
      const next = {
        ...current,
        events: mergeById(current.events, importData.timeline_events),
        lore: mergeById(current.lore, importData.lore_entries),
        links: mergeById(current.links, importData.lore_links),
        hungerTable: importData.hunger_table,
      };
      localStorage.setItem(DATA_KEY, JSON.stringify(next));
      console.log("Import completado", {
        eventos: importData.timeline_events.length,
        lore: importData.lore_entries.length,
        links: importData.lore_links.length,
        hambre: importData.hunger_table.length,
      });
      location.reload();
    });
})();