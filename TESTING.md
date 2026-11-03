# Testing and Verification

## Current verified checks

| Check | Result | Notes |
|---|---|---|
| Android debug build | **Passed** | From `game/`: `JAVA_HOME=/usr/lib/jvm/temurin-17-jdk-amd64 PATH=/usr/lib/jvm/temurin-17-jdk-amd64/bin:$PATH bash gradlew :core:assembleDebug --no-daemon` completed successfully on 2026-11-03. |
| APK output | **Produced** | `game/core/build/outputs/apk/debug/core-debug.apk` (debug-signed build). |
| Emulator/device installation | **Not run** | No installation or runtime check is claimed. |
| Gameplay, save/resume, town | **Not run / not implemented** | The Hearth text is introductory narrative only; no playable town or town persistence exists yet. |

The build emitted Java deprecation notes and a Gradle warning that deprecated features will be incompatible with Gradle 9.0. These did not fail this build. No automated unit or instrumentation test suite was run as part of the current baseline. Legacy save transitions have had an initial source inspection (summarized in `ARCHITECTURE.md`), but have not been verified by runtime tests or process/lifecycle fault injection.

## Reproduce the build

Requires JDK 17 and Android SDK components configured for the checked-in project (compile SDK 36). From the repository root:

```sh
cd game
export JAVA_HOME=/path/to/jdk-17
export PATH="$JAVA_HOME/bin:$PATH"
bash gradlew :core:assembleDebug --no-daemon
```

Expected output:

```text
game/core/build/outputs/apk/debug/core-debug.apk
```

## Manual smoke test when an Android device/emulator is available

The following is a planned verification checklist, not a claim that the flows have already been tested:

1. Install and launch the debug APK; verify the app opens without an immediate crash.
2. Start a new game, select each available hero class, and verify the dungeon renders and accepts touch input.
3. Exercise movement, combat, inventory/equipment, a floor transition, and an available quest or item interaction.
4. Background and resume the app; verify expected run state restoration.
5. Exercise death and victory flows if practical; verify a new run can be started afterward.
6. Check a range of screen sizes/orientations supported by the legacy game and record any UI defects.

## Future test gates

- Before changing legacy persistence: add coverage for save restoration, missing/default fields, and lifecycle transitions.
- Before claiming Hearth persistence: test town-state round trips, version migration/default behavior, and preservation across process restart and multiple dungeon runs.
- Before a release claim: perform installation and runtime smoke tests on representative Android versions and document device/OS details, APK identity, and results.
