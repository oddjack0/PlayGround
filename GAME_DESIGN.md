# Game Design — Emberbound

## Vision

Grow the included Pixel Dungeon foundation into a mobile, turn-based roguelike RPG where expeditions into a dangerous dungeon support a persistent home town. Keep the compact grid tactics, readable pixel-art presentation, consequential turns, and approachable touch controls of the source game.

## Current playable foundation

The integrated Android project currently retains the source game's four hero classes, generated dungeon floors, tactical movement and combat, loot, equipment, consumables, quests, bosses, save/resume, and win/death flows. The app is branded **Emberbound** at the Android package level. The introductory story names the town of Hearth, but Hearth is not yet a playable or persistent location.

## Intended player loop

1. Visit Hearth to review progression, prepare, and interact with residents and services.
2. Choose a hero and expedition objective, then descend into a generated dungeon.
3. Explore tile by tile, manage health, hunger, equipment, magic, and resources, and make tactical decisions under turn pressure.
4. Complete quests and recover materials and relics; retreat or risk a deeper descent.
5. Return to Hearth so that upgrades, relationships, crafting, and town progression persist across runs.

## Design pillars

- **Turn clarity:** player actions advance the simulation predictably; no real-time reflex checks.
- **Risk with agency:** dangerous encounters have readable choices such as positioning, retreat, consumables, and class abilities.
- **Persistent purpose:** expeditions contribute to long-lived town and character progression, not just a single run score.
- **Mobile-first readability:** large touch targets, concise panels, strong tile contrast, and minimal modal friction.
- **Respect the foundation:** extend the original Java/Android architecture and preserve its notices and assets unless a deliberate replacement is documented.

## Planned town and progression

Hearth is intended as a persistent, explorable hub, entered between expeditions. Planned initial services are a healer, merchant, blacksmith/crafter, quest board, and expedition gate. Implement these as useful gameplay interactions rather than decorative menus. The first town slice should support returning from a run, saving town state, and launching another run without losing that state.

Character progression should build on the existing Warrior, Mage, Rogue, and Huntress identities before adding new classes. New items, spells, recipes, quests, and combat effects should each have clear tactical uses and be integrated with existing save/restore behavior.

## Out of scope for the first milestones

- Replacing the grid-based turn system or moving to a real-time action engine.
- Online accounts, multiplayer, monetization, or server dependencies.
- Claiming the town, new services, or new classes are implemented before they can be played and tested.
