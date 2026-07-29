# Bill of Materials

Consolidated shopping list, compiled from all ADRs in [docs/decisions/](decisions/).
Each line links back to the ADR that decided it — check there for context,
rationale, and any unresolved caveats (several items below are marked
**verify** and should not be treated as final until confirmed against
physical hardware).

## Purchased / in hand

- MGN12 linear rail + MGN12H carriage block (Y-axis) — bought 2026-07-22
- STEPPERONLINE NEMA17 stepper, 59Ncm, 2A/phase (all 3) — bought 2026-07-22
- 2040 V-slot aluminum extrusion — bought 2026-07-22
- DiGiYes GT2 20T idler pulley (toothless/smooth) — bought 2026-07-22
- 1-Pack Assembled 2040 V Gantry Plate Kit — bought 2026-07-22 — **verify qty**: need 3 total (2 X-axis legs + 1 Y-axis carriage), confirm order covers all 3
- 6mm GT2 timing belt — bought 2026-07-22
- Socobeta NEMA17 motor mount bracket — bought 2026-07-22
- Mean Well LRS-350-24 PSU — bought 2026-07-22
- 3DMAN GT2 belt clamp, 9x40mm — bought 2026-07-22
- BEMONOC GT2 20T drive pulley (toothed) — bought 2026-07-22
- Inside Hidden Corner Bracket, 90°, M5, 20-series — bought 2026-07-22
- AquaMiracle air pump — bought 2026-07-22
- M8 swivel leveling feet — bought 2026-07-22
- Caster wheel connector, 2020-series, M8 tapped — bought 2026-07-22
- Black acrylic sheet stock — bought 2026-07-22
- STEPPERONLINE DM542T stepper driver — bought 2026-07-22

**Ordering this evening**: LaserTree K40 laser module, grblHAL Teensy 4.1
breakout board (T41U5XBB), Teensy 4.1 (pre-configured for CNC).

## Structural (frame)

| Part | Qty | Source / link | ADR |
|---|---|---|---|
| 2040 V-slot aluminum extrusion, cut to length: 2x 1200mm (frame long sides, rails mount outside face), 2x 800mm (frame end pieces, mount outside the 1200mm pieces' ends), 1x 800mm (gantry beam) | 5 pieces | generic 2040 stock, any supplier | [0010](decisions/0010-extrusion-profile-2040.md), [0035](decisions/0035-frame-corner-topology-rework.md), [0039](decisions/0039-y-axis-single-rail-dual-block.md) |
| Inside Hidden Corner Bracket, 90°, M5, 20-series | 1x 20-pack (need 16: 8 gantry + 8 frame, 2 per corner) | [Amazon](https://www.amazon.com/Pack-Inside-Hidden-Corner-Bracket/dp/B06XZ3Z82M) | [0028](decisions/0028-corner-bracket-hardware-selection.md) — **verify** leg length/set-screw position against physical part before cutting end caps |
| Caster wheel connector, 2020-series, M8 tapped | 1x 6-pack (need 4) | [Amazon](https://www.amazon.com/Connection-Connector-Aluminum-Extrusion-Thickness/dp/B0BW8SBLK8/) | [0034](decisions/0034-frame-feet-off-the-shelf.md) |
| M8 swivel leveling feet | 1x 6-pack (need 4) | [Amazon](https://www.amazon.com/Helonge-Levelers-Adjustable-Furniture-Workbench/dp/B08KXDFJ3M) | [0034](decisions/0034-frame-feet-off-the-shelf.md) |

## Motion system

| Part | Qty | Source / link | ADR |
|---|---|---|---|
| 1-Pack Assembled 2040 V Gantry Plate Kit (aluminum plate, black-treated, 87x88x3mm, 6 POM wheels pre-mounted) | 3: one per connection point — 2 for X-axis gantry legs (one per leg), 1 for the Y-axis carriage | [Amazon](https://www.amazon.com/Assembled-Kit-Compatible-Aluminum-Extrusion/dp/B0B99WTBSY/), ~$18.99 each (confirmed via [WoodArtSupply](https://woodartsupply.com/products/1-pack-assembled-2040-v-gantry-plate-kit-with-6pcs-v-solid-pom-wheels-only-compatible-with-2040-4040-series-v-slot-aluminum-extrusion-profiles-linear-rail-3d-printer-cnc-machine) carrying the identical item), ~$56.97 total | [0040](decisions/0040-x-axis-v-wheel-gantry.md), [0039](decisions/0039-y-axis-single-rail-dual-block.md) — replaces the custom PLA-CF plate + separate wheel-kit plan; **not yet redesigned**: gantry end cap's carriage-attachment zone still cut for MGN12H's bolt pattern, needs redrawing to bolt to this plate's fixed hole pattern instead |
| MGN12 linear rail + MGN12H carriage block | 1x 800mm rail (Y-axis, single rail on beam), 2x carriage blocks (both on the one Y rail) | generic MGN12 supplier — confirmed pricing at [LiMo Bearing](https://limobearing.com/mgn12c-mgn12h-mini-linear-sliding-rail): 800mm rail+block $21.07, spare slider $5.71 | [0008](decisions/0008-motion-system-mgn12-rails.md), [0039](decisions/0039-y-axis-single-rail-dual-block.md) — rail still provides the primary precise travel path; wheels above are reinforcement only, not a replacement |
| STEPPERONLINE NEMA17 stepper, 59Ncm, 2A/phase | 3 (2x X, 1x Y) | [Amazon](https://www.amazon.com/STEPPERONLINE-Stepper-Bipolar-Connector-compatible/dp/B00PNEQKC0) | [0017](decisions/0017-stepper-motor-selection.md) |
| Socobeta NEMA17 motor mount bracket | 1x 5-pack (need 3) | [Amazon](https://www.amazon.com/Socobeta-Stepper-Mounting-Bracket-Aluminum/dp/B0FPMDHTHD) | [0018](decisions/0018-motor-and-idler-mounts.md) |
| BEMONOC GT2 20T drive pulley, 5mm bore | 3 | [Amazon](https://www.amazon.com/BEMONOC-Timing-Pulley-Teeth-Printer/dp/B014ID115W) | [0019](decisions/0019-drive-pulley-selection.md) |
| DiGiYes GT2 20T idler pulley (smooth), 5mm bore | 3 | [Amazon](https://www.amazon.com/gp/product/B0BSPC7D9S/) | [0018](decisions/0018-motor-and-idler-mounts.md) |
| Idler mount hardware: M5 socket-head bolts + washers/spacers | 3 sets | generic hardware | [0018](decisions/0018-motor-and-idler-mounts.md) |
| 6mm GT2 timing belt, closed loop | 2x ~1200mm loop (X) + 1x ~800mm loop (Y) | generic GT2 6mm stock | [0015](decisions/0015-x-axis-motor-system.md) |
| 3DMAN GT2 belt clamp, 9x40mm | 1x 10-pack (need 6: 4 X + 2 Y) | [Amazon](https://www.amazon.com/3Dman-Timing-Aluminum-Clamp-9X40mm/dp/B08XVVQW6G/) | [0020](decisions/0020-belt-clamp-selection.md) |
| STEPPERONLINE DM542T stepper driver, 1.0-4.2A, 20-50VDC | 3 (X1, X2/A, Y) | [Amazon](https://www.amazon.com/STEPPERONLINE-1-0-4-2A-20-50VDC-Micro-step-Resolutions/dp/B06Y5VPSFN) | [0037](decisions/0037-stepper-driver-selection.md) — current DIP switches set at commissioning |
| KW12-3-style SPDT microswitch (limit switches) | 1x 10-pack (need 3: X, A, Y) | [BOJACK — Amazon](https://www.amazon.com/BOJACK-Switch-Momentary-Roller-250VAC/dp/B09NKYG5YQ) | [0033](decisions/0033-limit-switch-selection.md) — **verify** mounting-hole spacing against actual part |

## Electronics & power

| Part | Qty | Source / link | ADR |
|---|---|---|---|
| grblHAL Teensy 4.1 breakout board (T41U5XBB) | 1 | [Brookwood Design](https://brookwood-design-77.myshopify.com/products/t41u5xbb-board-kit) | [0022](decisions/0022-controller-board-selection.md) |
| Teensy 4.1 (pre-configured for CNC) | 1 | [ProtoSupplies](https://protosupplies.com/product/teensy41-cnc/) | [0022](decisions/0022-controller-board-selection.md) |
| Mean Well LRS-350-24 PSU (24V, 14.6A) | 1 | generic Mean Well supplier | [0023](decisions/0023-power-supply-selection.md) |
| 6-Way ATC/ATO blade fuse block, with fuses + LED indicator | 2 (one per rail — main rail + K40 rail) | [Amazon](https://www.amazon.com/Negative-Connections-Indicator-Standard-Terminals/dp/B08FQQ292L) | [0025](decisions/0025-24v-rail-fusing.md) |
| Blade fuses: 10A (main + K40 branch), 3A x3 (X1/X2/Y), 2A (controller) | 1 main 10A + 3x 3A + 1x 2A + 1x 10A (K40) = 6 fuses | usually included in the fuse block kit above; buy an assorted pack separately if not | [0025](decisions/0025-24v-rail-fusing.md) |
| 16 AWG stranded silicone wire, red + black | 1+ spool pair (by length, per actual run lengths) | [BNTECHGO — Amazon](https://www.amazon.com/BNTECHGO-Gauge-Silicone-Wire-Temperature/dp/B01KCPKRHS) | [0030](decisions/0030-24v-wire-gauge.md) — **simplified to one gauge for the whole machine** (was 16/18/20 AWG split by branch), single purchase instead of three spools; 16 AWG clears every branch's fuse rating with margin |
| 22mm mushroom E-stop switch, 2NC, latching | 1 | [mxuteuk — Amazon](https://www.amazon.com/mxuteuk-Mushroom-Self-Locking-Emergency-Button/dp/B09TSTTXN3) | [0024](decisions/0024-e-stop-wiring.md) |
| 24VDC SPDT relay, ≥15A, with socket | 1 | [Amazon](https://www.amazon.com/Enclosed-Power-Relay-24VDC-SPDT/dp/B007ULO6PW) | [0024](decisions/0024-e-stop-wiring.md) |
| Spiral cable wrap sleeving | as needed | generic | [0031](decisions/0031-cable-management.md) |

~~Elastic cord/spring + cable anchors~~ — not needed. User already owns a
ceiling-suspended VR headset cable management system and will route the
spiral-wrapped bundle up to that instead of tensioning it along the frame
([0031](decisions/0031-cable-management.md)).

## Laser & air assist

| Part | Qty | Source / link | ADR |
|---|---|---|---|
| LaserTree K40 laser module (40W+, ships with 24V/8A adapter + sliding plate) | 1 | [LaserTree](https://lasertree.com/products/laser-tree-k40-40w-optical-power-laser-module) | [0002](decisions/0002-laser-module-selection.md) |
| AquaMiracle 1000GPH air pump (35W) | 1 | generic aquarium/hydroponic supplier | [0005](decisions/0005-air-assist-pump-update.md) |
| Silicone air tubing, 4mm ID x 8mm OD | as needed | [Hohitto, 50m — Amazon](https://www.amazon.com/Hohitto-Approx-164ft-thickness-industrial-applications/dp/B0C5TQVMX1) | [0005](decisions/0005-air-assist-pump-update.md) |

## Fasteners & consumables (not separately tracked by ADR — generic hardware)

- Assorted M3 and M5 socket-head/button-head screws, washers, T-nuts (2040/2020 standard)
- M5 bolts for extrusion end-bore mounting (gantry end caps, corner joints)
- Zip ties (cable management pass-throughs)

## 3D-printed parts (PLA-CF)

No parts left in this category — the K40 carriage bracket and limit
switch mounts have both moved to laser-cut acrylic (below).

~~Y-axis laser carriage bracket (K40 mount)~~ — no longer needed. The K40
now bolts directly to the aluminum wheel-holder plate's own hole grid
([0039](decisions/0039-y-axis-single-rail-dual-block.md)); [hardware/3d-printed/y-carriage-k40-bracket.scad](../hardware/3d-printed/y-carriage-k40-bracket.scad)
is kept in the repo for reference but is not built.

## Laser-cut parts (black acrylic)

| Part | Qty | Material | Design file | ADR |
|---|---|---|---|---|
| Gantry end cap (2-layer laminate, front+back pair x 2 ends) | 8 pieces (4 plate-pairs x 2 layers) | 3mm black acrylic (exception to the 5mm default) | [hardware/laser-cut/gantry-end-cap.svg](../hardware/laser-cut/gantry-end-cap.svg) | [0036](decisions/0036-gantry-end-cap-redesign.md) — **verify** L-bracket slot dimensions and straddle-zone length against physical hardware |
| Limit switch mount bracket | 3 | 5mm black acrylic (default) | not yet designed — [hardware/3d-printed/limit-switch-mount.scad](../hardware/3d-printed/limit-switch-mount.scad) kept for reference only, needs redesign as a flat/joined acrylic part | [0033](decisions/0033-limit-switch-selection.md) — **not yet designed**: needs flat-pattern redesign (was a 3D-printed L-bracket), plus still-open switch hole-spacing verification |
| (all other future laser-cut parts) | — | 5mm black acrylic (default) | — | [0029](decisions/0029-laser-cut-material-selection.md) |

## Deferred / not part of this BOM

- Z-focus slider reprint for the interim 10W module — blocked on caliper measurements, not yet designed
- 3D-printed carrier for the spare 10W Ortur module — deferred, "not now"

## Known open verification items (do not treat these dimensions as final)

- Corner bracket leg length / set-screw position ([0028](decisions/0028-corner-bracket-hardware-selection.md))
- K40 sliding-plate mounting hole spacing ([0032](decisions/0032-y-axis-laser-carriage.md))
- Limit switch mounting-hole spacing ([0033](decisions/0033-limit-switch-selection.md))
- Gantry end cap L-bracket slot dimensions and straddle-zone length ([0036](decisions/0036-gantry-end-cap-redesign.md))
- Gantry end cap carriage-attachment zone: still cut for MGN12H's 20x20mm pattern, needs redesigning for the V-wheel gantry plate's own bolt pattern ([0040](decisions/0040-x-axis-v-wheel-gantry.md)) — sourcing decided, mechanical redesign not started
- K40 direct-mount to the wheel-holder plate: the plate's hole grid is fixed (not custom-drilled for the K40), may need new holes drilled once the K40's actual sliding-plate hole spacing is confirmed against physical hardware ([0032](decisions/0032-y-axis-laser-carriage.md), [0039](decisions/0039-y-axis-single-rail-dual-block.md))
