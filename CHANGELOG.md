# Changelog

Notable changes to Emberbound are recorded here. This prototype does not yet have a user-facing town or new town gameplay systems.

## [0.1.0] — 2026-11-03

### Added
- Integrated the Gradle-adapted Pixel Dungeon 1.9.1 Android project under `game/`, preserving the existing PlayGround root files and scripts.
- Set the Android app label to Emberbound and application ID to `com.playground.emberbound`; retained legacy Java packages to reduce migration risk.
- Replaced the introductory story text with original Hearth-setting text.
- Added design, architecture, implementation roadmap, testing, changelog, and licensing documentation, including an initial source-level map of run persistence and deletion paths.
- Verified a JDK 17 debug build with the checked-in Gradle wrapper; see `TESTING.md`.

### Retained / not yet implemented
- The existing Pixel Dungeon classes, generated dungeons, combat, items, quests, and run flows remain the playable foundation; they have not been comprehensively re-tested in this integration.
- Hearth is currently story text only. Persistent town state, town services, new progression, and additional RPG systems are future work.
- No emulator/device runtime test has been performed.
