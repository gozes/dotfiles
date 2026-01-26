Kanata configuration — full README

This README explains the `config.kbd` in this directory (Kanata-managed
Dvorak layout) and walks through concepts, tuning, testing, and common
customizations. It's written as a hands-on tutorial so you can safely tweak
behavior and verify changes.

1. What this config does
- Purpose: Provide a Dvorak typing layout with home-row modifiers, multiple
  momentary layers, and a nested gateway so you can reach an additional
  navigation layer while holding Space.
- Key behaviors implemented in `config.kbd`:
  - Kanata-managed Dvorak base layer (typing)
  - Home-row mods on Dvorak home-row keys (tap = letter, hold = modifier)
  - Tap-hold layer keys (Space, Caps, Tab, Enter) that tap normally and
    activate momentary layers while held
  - Nested gateway: while holding Space (l1), the physical `n` key becomes
    momentary layer l3
  - Right Alt hold-only opens a media layer (l6)

2. File to edit
- `kanata/config.kbd` — the configuration you already have. The top of the
  file contains a short usage comment block; the rest is the actual Kanata
  configuration (aliases, layers, and mappings).

3. Important variables
- `tap-time` and `hold-time` (ms) at the top of `config.kbd` control how
  quickly Kanata decides a press is a tap versus a hold. Default values:
  - `tap-time 200` — maximum ms to consider a press a tap
  - `hold-time 200` — minimum ms considered a hold

4. Home-row mods (how they work)
- The home-row keys on Dvorak are mapped so a short tap sends the letter and
  a hold sends a modifier. Example aliases in the config:
  - `@A` -> `(tap-hold $tap-time $hold-time a lmet)` — tap 'a', hold Left Meta
  - `@O` -> tap 'o', hold Left Alt
  - `@E` -> tap 'e', hold Left Shift
  - `@U` -> tap 'u', hold Left Ctrl
  - `@H/@T/@N/@S` are mirrored on the right half to provide symmetric
    modifier access.

5. Layers overview
- `base` — Dvorak typing layer. Uses the home-row mod aliases and layer keys.
- `l1` — Primary function layer (Vial-style layer 1 port). Accessed while
  holding Space (via `@SPC_L1`). In this config physical `n` becomes `@N_L3`
  inside `l1` to momentarily open `l3`.
- `l2` — Numbers (Caps Lock hold -> l2)
- `l3` — Navigation / editing (nested gateway from `l1`).
- `l4` — Mouse controls (Tab hold -> l4). Includes mouse buttons and wheel
  helpers (`MWU`, `MWD`, `MWL`, `MWR`).
- `l5` — Function keys / extra navigation (Enter hold -> l5).
- `l6` — Media (Right Alt hold-only -> l6).

6. Nested gateway pattern
- While holding Space the keyboard switches to `l1`. In `l1` the physical
  `n` key is configured as a gateway (`@N_L3`) which, while held, switches to
  `l3`. This lets you reach nav/edit controls without losing the space
  held state — a compact way to access many keys.

7. Tuning tap/hold behavior
- Common issues:
  - Taps registering as holds: increase `tap-time` (try +50ms increments)
  - Holds registering as taps: increase `hold-time` or reduce `tap-time`
- Recommended procedure:
  1) Make a small change (e.g., `tap-time 250`).
  2) Save `config.kbd` and reload Kanata (see next section).
  3) Test a single home-row key and observe tap vs hold. Repeat until
     behavior feels natural.

8. Reloading / testing
- How you reload depends on how you run Kanata. Common approaches:
  - If you run a user service: `systemctl --user restart kanata` (if you
    have a service unit named that way).
  - If you run Kanata from a GUI app or menu, quit and relaunch the app.
  - If you have a control utility (some setups provide `kanatactl`), use its
    reload or restart command.
- Testing checklist after reload:
  1) Tap a home-row key (e.g., the `a` key alias) — it should send the
     letter.
  2) Hold the same home-row key — it should act as its modifier.
  3) Tap Space — a space is inserted. Hold Space — `l1` should be active.
  4) While still holding Space, hold physical `n` — `l3` should be active.
  5) Hold Right Alt (not tapping) — `l6` should be active.

9. Troubleshooting
- If a layer doesn't activate: confirm the alias is used in the `base`
  layer (e.g., `@SPC_L1` appears at the space position) and `process-unmapped-keys`
  is set appropriately.
- If modifiers are not sent: check for conflicting aliases or other layers that
  may remap the same physical key.
- To debug layers quickly: temporarily map a visible key such as `f12` in
  each layer so you can see when a layer is active.

10. Common customizations
- Change a home-row modifier: edit its alias in the `(defalias ...)` block.
  Example: make `@A` hold send Left Control instead of Left Meta.
  Replace `(tap-hold $tap-time $hold-time a lmet)` with
  `(tap-hold $tap-time $hold-time a lctl)`.
- Add a permanent mapping to `l1`: open the `(deflayer l1 ...)` section and
  replace an `XX` with the desired key or alias (watch for physical layout
  ordering in the defsrc block).

11. Example: change Space to be dual-role but act as Enter on double-tap
- This is an advanced customization and requires chaining behaviors. The
  simplest approach is to add a specialized alias using a tap-hold-tap pattern
  supported by your Kanata installation (if available). If you want this,
  tell me and I will write the specific snippet for your config.

12. Where to go next
- Ask me to:
  1) Add a short README in another format (plain text or a printable cheat
     sheet) — choose 1.
  2) Implement a small customization (examples above) and apply it — choose 2.
  3) Walk through step-by-step tuning with live edits and tests — choose 3.

Appendix: quick map references
- Physical source layout (from `config.kbd` `defsrc` block) and `base`
  layer are defined in `kanata/config.kbd` — use those as the canonical
  mapping when editing layers.

License: your personal config — keep or adapt as you like.
