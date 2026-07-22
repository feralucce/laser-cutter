# 0040. X-axis: V-wheel gantry plates (replaces MGN12 rail)

Date: 2026-07-22

Status: Accepted (shopping list / BOM only — see "Not yet done" below;
supersedes the X-axis portion of [0008](0008-motion-system-mgn12-rails.md))

## Context

The X-axis's two 1200mm MGN12 rails are the single most expensive line
item in the motion system: $63.26 for both sides (confirmed pricing,
LiMo Bearing) — real money to save on the axis carrying the longest, and
thus costliest, rails in the machine.

**Sourcing update (2026-07-22)**: rather than buying a pre-made "gantry
plate + wheels" bundle (a Creality3D Parts kit was initially priced here
at $13.99/side), the connection point will instead be a **custom universal
mounting plate** — [hardware/laser-cut/20x40.stl](../../hardware/laser-cut/20x40.stl),
90.5x80.5x7mm, 4 corner mounting holes plus a diamond-grid hole/slot
pattern for flexible bolt-through mounting — with **V-wheels sourced
separately** and bolted to it. Same underlying decision (V-wheels over
MGN12 for this axis), different hardware path: a flexible custom plate
instead of a fixed pre-made one, so it can also serve as the connection
point for the Y-axis carriage per the user's plan to standardize on one
plate design across both. Confirmed pricing: a 10-pack of assembled
Delrin Mini V-Wheels (wheel + MR105ZZ bearing + 6mm eccentric spacer) runs
$16.00 (eBay) — 8 needed (2 sides x 4 wheels), 2 spares included.

This reopens the same precision/wear tradeoff [0008](0008-motion-system-mgn12-rails.md)
originally weighed (V-wheels vs. MGN12), on the axis where it bites
hardest: X carries the heaviest load in the machine (the whole gantry —
beam + Y-rail + carriage + K40, [0011](0011-x-axis-dual-motor.md)).
Accepted deliberately: the long-rail cost was judged to outweigh the
wear-point concern for this build.

The Y-axis carriage is unaffected — it keeps its single MGN12 rail with
two carriage blocks ([0039](0039-y-axis-single-rail-dual-block.md)), which
was evaluated separately and kept on its own merits.

## Decision

**X-axis gantry legs**: 2x custom universal mounting plate
([hardware/laser-cut/20x40.stl](../../hardware/laser-cut/20x40.stl), one
per side) + 8x assembled Delrin Mini V-Wheel (wheel + MR105ZZ bearing +
6mm eccentric spacer), sourced as a 10-pack —
https://www.ebay.com/itm/404701554316 — $16.00.

Category: off-the-shelf wheels, user-designed plate
([0003](0003-parts-sourcing-constraint.md)).

## Consequences

- Accepts the wear-point tradeoff on the heaviest-loaded axis in the
  machine — Delrin-on-aluminum wear and periodic re-tensioning (via the
  eccentric spacers) replace MGN12's maintenance-free preloaded blocks.
  Flagged once, not to be re-litigated: cost was judged to outweigh this
  for the long rails specifically.
- **Not yet done — real follow-on work, deliberately deferred**: the
  gantry end cap ([hardware/laser-cut/gantry-end-cap.svg](../../hardware/laser-cut/gantry-end-cap.svg),
  [0036](0036-gantry-end-cap-redesign.md)) currently cuts its bottom
  "carriage attachment zone" for the MGN12H block's 20x20mm bolt pattern.
  The custom plate has its own, different mounting hole pattern — the end
  cap's carriage-attachment geometry needs to be redrawn to bolt to it
  instead. This ADR records the sourcing decision only; the mechanical
  redesign is a separate, not-yet-started task, waiting on the user's
  planned reference photos of the plate as a complete assembled unit.
- Also not yet decided: how many of these plates the Y-axis carriage
  needs, and how it attaches to the existing rail/block/K40-bracket stack
  ([0039](0039-y-axis-single-rail-dual-block.md)) — the user's stated intent
  is to standardize on this plate for both connection points, but that
  design work hasn't started.
- BOM updated to reflect this swap (Motion system section).
