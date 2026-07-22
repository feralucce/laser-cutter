# 0040. X-axis: V-wheel gantry plates (replaces MGN12 rail)

Date: 2026-07-22

Status: Accepted (shopping list / BOM only — see "Not yet done" below;
supersedes the X-axis portion of [0008](0008-motion-system-mgn12-rails.md))

## Context

The X-axis's two 1200mm MGN12 rails are the single most expensive line
item in the motion system: $63.26 for both sides (confirmed pricing,
LiMo Bearing), against $27.98 for two complete 2040-compatible V-wheel
gantry plate kits (Creality3D Parts — 1 plate + 4 Delrin mini V-wheels +
spacers/screws per kit, sized for 2040 V-slot specifically) — a $35.28
saving on the axis carrying the longest, and thus costliest, rails in the
machine.

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

**X-axis**: two Creality3D Parts 2040 V-slot Mini V Gantry Plate sets (one
per side) — https://www.creality3dparts.com/product/2040-v-slot-openbuilds-v-gantry-plat-set-slide-pulley-aluminum-profiles-wheels/
— $13.99 each, $27.98 total. Each kit: 1 plate, 4 Delrin mini V-wheels, 2
aluminum spacers (6mm), 2 eccentric spacers (6mm, for wheel preload/tension
adjustment), mounting screws, shims.

Category: off-the-shelf ([0003](0003-parts-sourcing-constraint.md)).

## Consequences

- BOM saving: $35.28 on the X-axis motion hardware vs. the MGN12 rail
  approach.
- Accepts the wear-point tradeoff on the heaviest-loaded axis in the
  machine — Delrin-on-aluminum wear and periodic re-tensioning (via the
  eccentric spacers) replace MGN12's maintenance-free preloaded blocks.
  Flagged once, not to be re-litigated: cost was judged to outweigh this
  for the long rails specifically.
- **Not yet done — real follow-on work, deliberately deferred**: the
  gantry end cap ([hardware/laser-cut/gantry-end-cap.svg](../../hardware/laser-cut/gantry-end-cap.svg),
  [0036](0036-gantry-end-cap-redesign.md)) currently cuts its bottom
  "carriage attachment zone" for the MGN12H block's 20x20mm bolt pattern.
  This V-wheel gantry plate has its own, different mounting hole pattern —
  the end cap's carriage-attachment geometry needs to be redrawn to match
  it before this can actually be built. This ADR records the sourcing
  decision only; the mechanical redesign is a separate, not-yet-started
  task.
- BOM updated to reflect this swap (Motion system section).
