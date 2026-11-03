# Implementation Roadmap — Emberbound

This roadmap distinguishes the integrated Pixel Dungeon foundation from features still to be built. A milestone is complete only when its acceptance checks are met and recorded in `TESTING.md`.

## Milestone 0 — Integrate and establish the baseline

**Status: source integrated; debug build verified.**

- Keep the existing PlayGround repository files and scripts intact; place the Android game in `game/`.
- Integrate the Gradle-adapted Pixel Dungeon source, retain its notices and license text, and assign Emberbound its own Android application ID.
- Document the design, source layout, license/provenance caveats, build steps, and test status.
- Build the debug APK on JDK 17.

**Acceptance:** `:core:assembleDebug` succeeds and produces `game/core/build/outputs/apk/debug/core-debug.apk`. Device installation and gameplay are not part of this verified milestone.

## Milestone 1 — Map and test legacy persistence

**Status: initial source map documented; behavior tests are still pending.**

- Trace title, new-game, inter-level, death, victory, and resume transitions.
- Identify what is stored in run bundles versus preferences and where those stores are cleared.
- Add focused tests or a small testable model for save/restore compatibility and lifecycle edge cases.
- Record behavior for existing saves before changing serialization.

**Acceptance:** existing run save/resume behavior remains intact; tests cover load defaults and a round trip for any new persisted values.

## Milestone 2 — Persistent Hearth foundation

- Add an explicit Hearth scene/state instead of representing town as a dungeon floor.
- Define a versioned town-state model independent of transient dungeon-run data.
- Implement reliable save/load, defaults for absent/older state, and return-to-town/new-expedition transitions.
- Provide clear touch navigation, including a way to enter an expedition and return after a run.

**Acceptance:** town state survives app restart and multiple expeditions; returning to town does not corrupt or unexpectedly resume/erase run state.

## Milestone 3 — Useful town services and first progression loop

- Add a small, coherent service slice (for example healer, merchant, and expedition board) with working interactions, costs, and feedback.
- Reward expedition outcomes with resources or unlocks that can be used in Hearth.
- Keep all hub actions outside the dungeon turn simulation.

**Acceptance:** a player can complete an expedition, make a meaningful town decision with its reward, and launch another expedition with the town change preserved.

## Milestone 4 — Content and deeper RPG systems

- Expand town residents/services, crafting, quests, equipment, consumables, spells, and tactical effects incrementally.
- Prioritize additions that create choices in the existing turn-based grid combat and retain the four established class identities.
- Add migration-safe persistence and tests for each new durable system.

**Acceptance:** each added system is playable, has a documented purpose, handles save/load, and has relevant automated or reproducible manual checks.

## Milestone 5 — Mobile usability and release readiness

- Review touch targets, text legibility, screen scaling, lifecycle handling, and accessibility on representative Android devices.
- Revisit Android minimum/target SDK, branding/title assets, crash handling, and distribution requirements deliberately.
- Audit source and asset licensing and provide required notices/source availability before any public binary distribution.

**Acceptance:** debug/release builds and installation/start/new-game/save-resume/return flows are verified on a device or emulator; release and licensing checks are documented. Do not describe the project as release-ready before this milestone passes.
