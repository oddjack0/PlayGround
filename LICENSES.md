# Licensing and Attribution Notes

This file records the known provenance of the integrated game source; it is not legal advice or a complete dependency/asset audit.

## Pixel Dungeon source

- The Android game tree in `game/` was obtained from [00-Evan/pixel-dungeon-gradle](https://github.com/00-Evan/pixel-dungeon-gradle), a Gradle-adapted project identifying itself as the original Pixel Dungeon adapted for modern Android build tools.
- The upstream project references the original [watabou/pixel-dungeon repository](https://github.com/watabou/pixel-dungeon) and [Pixel Dungeon site](https://watabou.itch.io/pixel-dungeon), and attributes the original game to Oleg Dolya.
- `game/LICENSE.txt` contains the GNU General Public License, version 3. Source-file notices are retained in the integrated code. Review the license and applicable notices before modifying or distributing the covered work.
- The included upstream material has not received an independent file-by-file copyright, license, or asset audit. In particular, upstream documentation has contained inconsistent references to Shattered Pixel Dungeon despite describing an original Pixel Dungeon adaptation. Treat exact asset provenance and licensing as unresolved until verified against source history and individual notices.

## Other components

- The project uses the Android Gradle Plugin, Android SDK, and Gradle wrapper. Their license terms are separate from the game's source license; consult the corresponding official license notices when redistributing relevant components.
- No separate third-party dependency or bundled-asset inventory has yet been prepared. Check module dependencies, fonts, sound, images, and source notices before public distribution.

## Distribution checklist

Before distributing an APK or other binary, verify the applicable GPLv3 obligations for the combined work, include required license and copyright notices, make corresponding source and build scripts available as required, and determine whether any bundled assets have additional terms. The repository retains the license text but has not yet implemented an in-app legal-notices screen or completed a distribution compliance review.
