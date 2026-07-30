# Bill of Materials

Consolidated shopping list, compiled from all ADRs in [docs/decisions/](decisions/).
Each line links back to the ADR that decided it — check there for context,
rationale, and any unresolved caveats (several items below are marked
**verify** and should not be treated as final until confirmed against
physical hardware).

**2026-07-29: pivoted to reusing the Ortur LM2 S2's own controller,
drivers, motors, wiring, and limit switches** instead of a new grblHAL
controller build ([0041](decisions/0041-ortur-electronics-reuse.md)).
The controller board, stepper drivers, and steppers below are no longer
being purchased — see "No longer needed" below. The full original
custom-controller BOM is preserved on the `custom-controller-fallback`
git branch.

## Purchased / in hand

- MGN12 linear rail + MGN12H carriage block (Y-axis) — bought 2026-07-22
- 2040 V-slot aluminum extrusion — bought 2026-07-22
- DiGiYes GT2 20T idler pulley (toothless/smooth) — bought 2026-07-22
- 1-Pack Assembled 2040 V Gantry Plate Kit — all 3 confirmed in hand (2026-07-22)
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
- Silicone air tubing — already had on hand
- Assorted M3/M5 screws, washers, T-nuts — already had, leftover from a previous build
- Zip ties — already had
- Cable clips — in hand (2026-07-29)
- Spiral cable wrap sleeving — in hand (2026-07-29)
- 6-Way ATC/ATO blade fuse block (both, main rail + K40 rail) — in hand (2026-07-29)
- ATC/ATO fuse assortment, 1A-40A full range — in hand (2026-07-29), closes the gap the fuse block kit's own included set didn't cover (3A/2A)
- Switched power strip — already had on hand
- 110-120V AC panic-paddle safety switch (table saw/milling machine style, large red stop-sign paddle) — in hand (2026-07-29), wired ahead of the power strip as the sole emergency shutoff, [0024](decisions/0024-e-stop-wiring.md)

**Not part of this design** ([0041](decisions/0041-ortur-electronics-reuse.md), 2026-07-29
electronics-reuse pivot): grblHAL T41U5XBB breakout board, Teensy 4.1,
STEPPERONLINE NEMA17 steppers, STEPPERONLINE DM542T drivers, 16 AWG
stranded silicone wire, KW12-3-style SPDT microswitches — this design
reuses the Ortur LM2 S2's own controller, drivers, motors, wiring, and
limit switches instead. (Also **no longer needed**, from the earlier
2026-07-29 E-stop rework, [0024](decisions/0024-e-stop-wiring.md)): 22mm
mushroom E-stop switch, 24VDC SPDT relay.

**Ordered, not yet in hand (2026-07-29)**: LaserTree K40 laser module —
briefly switched to the K30 ([0044](decisions/0044-laser-module-k30.md)),
reverted back to K40 ([0045](decisions/0045-revert-to-k40.md)) for the
power headroom (can dial down, can't exceed a module's capacity) before
ordering. Still needed: a K40-compatible adapter board that lets the
Ortur's stock controller drive the module — specific product not yet
identified ([0041](decisions/0041-ortur-electronics-reuse.md)).
Everything else in this BOM is in hand.

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
| 1-Pack Assembled 2040 V Gantry Plate Kit (aluminum plate, black-treated, 87x88x3mm, 6 POM wheels pre-mounted) | 3: one per connection point — 2 for X-axis gantry legs (one per leg), 1 for the Y-axis carriage | [Amazon](https://www.amazon.com/Assembled-Kit-Compatible-Aluminum-Extrusion/dp/B0B99WTBSY/), ~$18.99 each (confirmed via [WoodArtSupply](https://woodartsupply.com/products/1-pack-assembled-2040-v-gantry-plate-kit-with-6pcs-v-solid-pom-wheels-only-compatible-with-2040-4040-series-v-slot-aluminum-extrusion-profiles-linear-rail-3d-printer-cnc-machine) carrying the identical item), ~$56.97 total | [0040](decisions/0040-x-axis-v-wheel-gantry.md), [0039](decisions/0039-y-axis-single-rail-dual-block.md) — replaces the custom PLA-CF plate + separate wheel-kit plan; **not yet redesigned**: needs redrawing for both the aluminum plate's fixed bolt pattern and a captured-belt channel under each wheel ([0042](decisions/0042-captured-belt-drive.md)) |
| MGN12 linear rail + MGN12H carriage block | 1x 800mm rail (Y-axis, single rail on beam), 2x carriage blocks (both on the one Y rail) | generic MGN12 supplier — confirmed pricing at [LiMo Bearing](https://limobearing.com/mgn12c-mgn12h-mini-linear-sliding-rail): 800mm rail+block $21.07, spare slider $5.71 | [0008](decisions/0008-motion-system-mgn12-rails.md), [0039](decisions/0039-y-axis-single-rail-dual-block.md) — rail still provides the primary precise travel path; wheels above are reinforcement only, not a replacement |
| Socobeta NEMA17 motor mount bracket | 1x 5-pack (need 2: 1 Y shaft motor, 1 X carriage motor) | [Amazon](https://www.amazon.com/Socobeta-Stepper-Mounting-Bracket-Aluminum/dp/B0FPMDHTHD) | [0018](decisions/0018-motor-and-idler-mounts.md) — mounts the Ortur's 2 reused motors ([0041](decisions/0041-ortur-electronics-reuse.md), [0043](decisions/0043-adopt-ortur-axis-convention.md)) on the new frame; the standoff supporting the Y shaft's far end is a separate, not-yet-designed part |
| BEMONOC GT2 20T drive pulley, 5mm bore | 3 | [Amazon](https://www.amazon.com/BEMONOC-Timing-Pulley-Teeth-Printer/dp/B014ID115W) | [0019](decisions/0019-drive-pulley-selection.md) — **open**: compatibility with captured-belt routing not yet checked, [0042](decisions/0042-captured-belt-drive.md); Ortur's own pulley is the fallback |
| DiGiYes GT2 20T idler pulley (smooth), 5mm bore | 3 | [Amazon](https://www.amazon.com/gp/product/B0BSPC7D9S/) | [0018](decisions/0018-motor-and-idler-mounts.md) — same captured-belt compatibility caveat as the drive pulley above |
| 6mm GT2 timing belt, closed loop | 2x ~1200mm loop (X) + 1x ~800mm loop (Y) | generic GT2 6mm stock | [0015](decisions/0015-x-axis-motor-system.md) |

**Motors and drivers**: reused from the existing Ortur LM2 S2 build, not
purchased — 1 NEMA17 with an extended shaft (coupler + standoff, driving
both sides of the gantry from one continuous shaft) on Y (800mm, gantry/
rail axis), 1 NEMA17 on X (1200mm, beam/carriage axis), driven by the
Ortur's own onboard drivers ([0041](decisions/0041-ortur-electronics-reuse.md),
[0043](decisions/0043-adopt-ortur-axis-convention.md)).

**Belt routing**: captured belt drive (belt runs under each gantry/carriage
wheel, over the drive pulley) — [0042](decisions/0042-captured-belt-drive.md),
not the open-loop clamped-both-ends style. The 3DMAN belt clamps bought
for that earlier approach are not part of this design.

~~Idler mount hardware: M5 socket-head bolts + washers/spacers~~ — the
purchased bolt-on-T-nut kit is no longer available; replaced with a
3D-printed PLA-CF idler mount instead (see 3D-printed parts, below).

## Electronics & power

| Part | Qty | Source / link | ADR |
|---|---|---|---|
| K40-compatible adapter board (lets the Ortur's stock controller drive the K40 module) | 1 | not yet identified | [0041](decisions/0041-ortur-electronics-reuse.md), [0045](decisions/0045-revert-to-k40.md) — **open**: specific product not yet sourced |
| Mean Well LRS-350-24 PSU (24V, 14.6A) | 1 | generic Mean Well supplier | [0023](decisions/0023-power-supply-selection.md) |

**Controller, drivers, wiring harness, and limit switches**: reused from
the existing Ortur LM2 S2 build ([0041](decisions/0041-ortur-electronics-reuse.md)),
not purchased.

Fuse coverage confirmed (2026-07-29): the fuse block kit's included set
(20A/15A/10A/7.5A/5A) didn't have the 3A/2A ratings this design needs —
closed by adding a full-range ATC/ATO assortment pack (1A-40A), which
covers every rating [0025](decisions/0025-24v-rail-fusing.md) calls for
exactly as speced. **Note**: [0025](decisions/0025-24v-rail-fusing.md)'s
per-branch fusing plan was written for the new stepper/controller wiring
this project was originally building — now that motors/controller/wiring
are reused from the Ortur ([0041](decisions/0041-ortur-electronics-reuse.md)),
that harness has its own existing fusing; the fuse block's role narrows to
the K40 rail only. Not yet re-checked against the actual reused harness.

~~Elastic cord/spring + cable anchors~~ — not needed. User already owns a
ceiling-suspended VR headset cable management system and will route the
spiral-wrapped bundle up to that instead of tensioning it along the frame
([0031](decisions/0031-cable-management.md)).

## Laser & air assist

| Part | Qty | Source / link | ADR |
|---|---|---|---|
| AquaMiracle 1000GPH air pump (35W) | 1 | generic aquarium/hydroponic supplier | [0005](decisions/0005-air-assist-pump-update.md) |

~~Silicone air tubing~~ — already had on hand.

## Fasteners & consumables (not separately tracked by ADR — generic hardware)

All items below already had, leftover from a previous build:

- ~~Assorted M3 and M5 socket-head/button-head screws, washers, T-nuts (2040/2020 standard)~~
- ~~M5 bolts for extrusion end-bore mounting (gantry end caps, corner joints)~~
- ~~Zip ties (cable management pass-throughs)~~

## 3D-printed parts (PLA-CF)

| Part | Qty | Design file | ADR |
|---|---|---|---|
| Idler mount bracket | 3 (X1, X2, Y) | [JeSc HyperCube XY Idler T16 v2.0](https://www.printables.com/model/56963-jesc-hypercube-xy-idler-t16-v20/files), downloaded to [Printables/](../Printables/) | [0018](decisions/0018-motor-and-idler-mounts.md) — **not yet verified**: bore/OD/width fit against the already-purchased DiGiYes GT2 20T idler pulley (both idlers are toothless, so this isn't a tooth-count mismatch question) |

The K40 carriage bracket and limit switch mounts have both moved to
laser-cut acrylic (below) — not printed.

~~Y-axis laser carriage bracket (K40 mount)~~ — no longer needed. The K40
now bolts directly to the aluminum wheel-holder plate's own hole grid
([0039](decisions/0039-y-axis-single-rail-dual-block.md)); [hardware/3d-printed/y-carriage-k40-bracket.scad](../hardware/3d-printed/y-carriage-k40-bracket.scad)
is kept in the repo for reference but is not built.

## Laser-cut parts (black acrylic)

| Part | Qty | Material | Design file | ADR |
|---|---|---|---|---|
| Gantry end cap (2-layer laminate, front+back pair x 2 ends) | 8 pieces (4 plate-pairs x 2 layers) | 3mm black acrylic (exception to the 5mm default) | [hardware/laser-cut/gantry-end-cap.svg](../hardware/laser-cut/gantry-end-cap.svg) | [0036](decisions/0036-gantry-end-cap-redesign.md) — **verify** L-bracket slot dimensions and straddle-zone length against physical hardware |
| Limit switch mount bracket | 2 (X and Y — the Ortur's own X switches, per [0041](decisions/0041-ortur-electronics-reuse.md), reused as-is) | 5mm black acrylic (default) | not yet designed — [hardware/3d-printed/limit-switch-mount.scad](../hardware/3d-printed/limit-switch-mount.scad) kept for reference only, needs redesign as a flat/joined acrylic part | [0033](decisions/0033-limit-switch-selection.md) — **not yet designed**: needs flat-pattern redesign (was a 3D-printed L-bracket) for the new 2040 frame; switch part and hole spacing are now a known/reused quantity (Ortur's own switches, [0041](decisions/0041-ortur-electronics-reuse.md)) rather than an estimate |
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
- Idler mount bracket (JeSc HyperCube XY Idler T16 v2.0, printed): bore/OD/width fit against the DiGiYes GT2 20T idler pulley not yet confirmed (both toothless, so it's a dimension check, not a tooth-count mismatch) ([0018](decisions/0018-motor-and-idler-mounts.md))
