# Architecture

## Current repository layout

- `game/`: standalone Gradle Android project; the root repository remains the PlayGround wrapper and its existing scripts/files are preserved.
- `game/core/`: Android application module with the game entry activity, scenes, actors, items, levels, resources, and manifest.
- `game/PD-classes/`: shared Noosa/OpenGL/game support classes used by the app module.
- `game/gradle/` and `game/gradlew`: pinned wrapper distribution for reproducible project builds.

## Existing runtime model

The app starts in `PixelDungeon`, which loads `TitleScene`. Scenes manage presentation and transitions; `StartScene` selects a hero, `InterlevelScene` handles level transitions/save restoration, and `GameScene` presents the active floor. `Dungeon` owns the current hero, level, floor depth, and run state. `Level` implementations generate and hold tile-map state; `Actor`/`Char`/`Hero` resolve discrete turns. Items and buffs implement much of the existing combat, inventory, and survival loop. Bundles serialize run data, while preferences/global badge and ranking data use existing legacy storage patterns.

The Android namespace and Java packages remain `com.watabou.pixeldungeon`. The Android `applicationId` is independently set to `com.playground.emberbound` so the prototype can be installed as a distinct app without mass-renaming legacy classes. The app label and version are configured in `game/build.gradle`.

## Extension direction

Build the town as a new scene/state boundary rather than turning a dungeon floor into a hub. Keep persistent town data separate from transient run state. Define a versioned, serializable town model for unlocked services, inventory/materials, quests, and resident state; use explicit load/save transitions and avoid coupling UI widgets directly to serialization. Reuse existing scene, window, item, and bundle patterns where suitable, but keep new town logic isolated enough to test.

### Legacy persistence map (source inspection)

- `Dungeon.saveGame()` serializes active-run data, while `Dungeon.saveLevel()` persists the current level separately. `Dungeon.saveAll()` writes both for a living hero; the run bundle includes hero/run progress, inventory-related state, quests, statistics, journal, and other run data.
- `Dungeon.loadGame(..., fullLoad)` restores run data; full loads also restore chapters, quests, room state, and map sizing. `Dungeon.init()` resets run-scoped state before creating a new hero.
- `GameScene.pause()` calls `Dungeon.saveAll()`. Scene destruction alone is not a documented guarantee that the active run is saved. `Preferences` stores options such as audio/display settings and selected class/challenges, not the planned town world state.
- Death and victory paths call `Dungeon.deleteGame(...)`; deletion can remove run and level files. Ankh resurrection has a distinct path that deletes the run file while retaining level files.
- `InterlevelScene` handles new and continued runs, including `Dungeon.init()` and `Dungeon.loadGame()` transitions.

This mapping is based on source inspection, not runtime fault-injection or lifecycle tests. It reinforces that town state intended to survive new runs, death, and victory must not be stored only in run files that these paths reset or delete. A separate, versioned town save with explicit save/transition behavior is the likely direction; its storage and atomicity policy still need to be designed and tested. New persistent fields need stable keys, defaults for older saves, and round-trip tests. New town interactions should not spend dungeon turns.

## Current constraints

This is legacy Java/Android code with a fixed-resolution pixel-art scene framework, not a modern Android View UI. It builds with the checked-in Gradle 8.13 wrapper and Android Gradle Plugin 8.9.1 on JDK 17 in the current environment. No emulator/device runtime check has yet been performed. The source's old minimum SDK and original title artwork are unchanged at this stage.
