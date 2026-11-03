# Emberbound — Android game source

This subproject is the Android game foundation integrated into PlayGround. The first milestone keeps the original turn-based, grid-based Pixel Dungeon game loop and pixel-art assets while giving the app its own Android application ID and a new introductory setting.

## Build

Use JDK 17 and the checked-in Gradle wrapper:

```sh
export JAVA_HOME=/path/to/jdk-17
export PATH="$JAVA_HOME/bin:$PATH"
bash gradlew :core:assembleDebug --no-daemon
```

The debug APK is written to `core/build/outputs/apk/debug/core-debug.apk`.

## Source and attribution

- This tree was sourced from [00-Evan/pixel-dungeon-gradle](https://github.com/00-Evan/pixel-dungeon-gradle), a Gradle-adapted project that identifies itself as the original Pixel Dungeon code adapted for modern Android build tools.
- The original game is by Oleg Dolya; the upstream README points to [watabou/pixel-dungeon](https://github.com/watabou/pixel-dungeon) and [the Pixel Dungeon site](https://watabou.itch.io/pixel-dungeon).
- Original copyright notices are retained in source files. See [`LICENSE.txt`](LICENSE.txt) and the root [`LICENSES.md`](../LICENSES.md).
- The application label is Emberbound and its application ID is `com.playground.emberbound`. Legacy Java packages remain unchanged to minimize migration risk.

This is an early prototype, not a finished or independently rebalanced RPG. The original Pixel Dungeon title artwork and many original systems remain in place while the project grows incrementally.
