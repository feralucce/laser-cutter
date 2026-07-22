# 0038. Y-axis dual-rail carriage: beam upgraded to 2060, two MGN12 rails

Date: 2026-07-15
Status: Accepted (upgrades the **beam only** — [0010](0010-extrusion-profile-2040.md)'s
2040 choice still stands for the rest of the frame; supersedes the
beam-specific portions of [0032](0032-y-axis-laser-carriage.md) and
[0036](0036-gantry-end-cap-redesign.md))

## Context

The K40 (~900g, [0002](0002-laser-module-selection.md)) hangs off the
Y-carriage bracket at an offset from the single MGN12 block it was
designed around ([0032](0032-y-axis-laser-carriage.md)). A single rail can
probably take the static weight without breaking, but the cantilevered
moment from that offset load lets the carriage tilt/flex under it — a
real stiffness concern for a laser, where any deflection changes focus
distance and beam pointing, not just a load-rating question. Consistent
with this build's established pattern of choosing headroom over
minimum-spec ([0010](0010-extrusion-profile-2040.md), [0011](0011-x-axis-dual-motor.md),
[0014](0014-axis-naming-convention.md)), decided to add a second rail
rather than accept the single-rail cantilever.

**Same-face fit check**: MGN12H blocks are 27mm wide x 45.4mm long. Two
side by side need &#8805;54mm of face width before even adding a gap — the
2040 beam's 40mm wide face physically cannot fit two. Confirmed 2060
(20x60mm) has **3 T-slots per 60mm face**, standard 20mm spacing (slots at
10/30/50mm from one edge, same repeating pattern as 2020/2040). Using the
two *outer* slots gives rail centers 40mm apart:

- Rail 1 (slot at 10mm): block spans -3.5 to 23.5mm (slight overhang past
  the near edge, normal/harmless for this style of mount)
- Rail 2 (slot at 50mm): block spans 36.5 to 63.5mm (same overhang, far
  edge)
- 13mm clear gap between the two blocks

This resolves the physical fit problem while keeping the two rails as far
apart as the profile allows (better moment resistance than using adjacent
slots would give).

## Decision

- **Beam extrusion**: upgrade from 2040 to **2060** — beam only, not the
  rest of the frame (1200mm X-rails and 800mm end pieces stay 2040 per
  [0010](0010-extrusion-profile-2040.md)). Still wide-face-vertical
  (matching the existing rigidity convention), so the beam's installed
  height grows from 40mm to 60mm.
- **Y-axis rails**: **two** MGN12 rails (was one, [0008](0008-motion-system-mgn12-rails.md)),
  mounted on the beam's front wide face using the two outer T-slots
  (40mm apart, center-to-center).
- **Drive**: unchanged — still one motor, one belt
  ([0021](0021-y-axis-motor-system.md)). Both rails are passive support for
  the same rigid carriage; they don't need independent synchronization the
  way the X-axis's dual *motors* do, since it's one carriage riding two
  rails, not two separately-driven carriages.
- **Y-carriage bracket** ([0032](0032-y-axis-laser-carriage.md)): widened
  to carry two MGN12H mounting patterns (20x20mm each, [0013](0013-gantry-end-plate-design.md)),
  centers 40mm apart, matching the new rail spacing.
- **Gantry end caps** ([0036](0036-gantry-end-cap-redesign.md)): reference
  geometry updated from the 2040 (20x40mm) footprint to 2060 (20x60mm).

Category: off-the-shelf extrusion + rail/block hardware ([0003](0003-parts-sourcing-constraint.md)).

## Consequences

- Closes the single-rail cantilever-moment concern — the K40's load now
  distributes across two widely-spaced support points instead of twisting
  one block.
- BOM changes: beam material 2040→2060 (800mm length), +1 MGN12 rail
  (800mm) and +1 MGN12H block for the Y-axis (was 1 rail/1 block, now 2/2).
- 2060 is heavier and costs more per meter than 2040 — accepted the same
  way this build has repeatedly traded material cost for stiffness
  ([0010](0010-extrusion-profile-2040.md)'s own 2020-vs-2040 tradeoff).
  The extra mass adds to what the X-axis dual motors need to move, but
  [0011](0011-x-axis-dual-motor.md) already built in headroom for a
  heavier gantry than this.
- [hardware/3d-printed/y-carriage-k40-bracket.scad](../../hardware/3d-printed/y-carriage-k40-bracket.scad)
  and [hardware/laser-cut/gantry-end-cap.svg](../../hardware/laser-cut/gantry-end-cap.svg)
  both updated for the new beam cross-section and dual-block pattern.
- The Y-carriage's straddle-zone offset ([0032](0032-y-axis-laser-carriage.md))
  will need re-checking once physically assembled — the beam is now 20mm
  taller (60mm vs 40mm), which shifts exactly where its bottom edge sits
  relative to the carriage block, on top of that dimension already being
  a working estimate.
