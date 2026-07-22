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
$16.00 (eBay) — **12 needed in total**: 8 for the X-axis gantry legs (2
sides x 4 wheels) plus 4 for the Y-axis carriage, which also gets a wheel
set as anti-wiggle reinforcement alongside its rail
([0039](0039-y-axis-single-rail-dual-block.md)) — 2x 10-pack covers this
with 8 spares.

This reopens the same precision/wear tradeoff [0008](0008-motion-system-mgn12-rails.md)
originally weighed (V-wheels vs. MGN12), on the axis where it bites
hardest: X carries the heaviest load in the machine (the whole gantry —
beam + Y-rail + carriage + K40, [0011](0011-x-axis-dual-motor.md)).
Accepted deliberately: the long-rail cost was judged to outweigh the
wear-point concern for this build.

The Y-axis carriage keeps its single MGN12 rail with two carriage blocks
([0039](0039-y-axis-single-rail-dual-block.md)) as its primary travel
path — that part was evaluated separately and kept on its own merits —
but it also picks up 4 of the wheels priced here, as reinforcement rather
than replacement (see 0039's own update).

**Reference photos (2026-07-22)**: the user provided photos of this exact
plate design as a complete assembled unit — 4 wheels bolted through the
grid holes, riding a 2040 extrusion, plus a second (2020-sized) plate from
the same reference build shown just to illustrate the general concept
(not part of this machine — nor is the DC gearmotor shown in one photo,
unrelated to this build's NEMA17 steppers). This visually confirms the
plate+wheel mounting mechanism assumed above.

**Front/back plate pair, not a single plate**: each wheel location
actually needs **two** of these plates — a front plate and a matching
back plate — connected by standoffs on the wheel bolts, sandwiching the
extrusion between them. The wheels sit spaced off the plate by whatever
gap is needed to properly seat against the extrusion's faces (exact
standoff length is a **VERIFY** item, set once the plate/wheel/extrusion
stack is physically test-fitted). This is what actually gives the
assembly positive retention against tipping — a single plate resting
wheels against one face has nothing stopping it from lifting off under
the K40's cantilever moment; a front+back pair captures the extrusion
between two wheel sets the same way a rail block does.

## Decision

**X-axis gantry legs**: 2x front plate + 2x back plate (4 total,
[hardware/laser-cut/20x40.stl](../../hardware/laser-cut/20x40.stl), one
front/back pair per side) + 8x assembled Delrin Mini V-Wheel (wheel +
MR105ZZ bearing + 6mm eccentric spacer).

**Y-axis carriage** ([0039](0039-y-axis-single-rail-dual-block.md)): 1x
front plate + 1x back plate (2 total, same design) + 4x the same wheel,
mounted alongside the existing rail/block bracket as anti-wiggle
reinforcement.

**Total plates**: 6 (4 for X, 2 for Y). **Total wheels**: 12, sourced as
2x 10-packs — https://www.ebay.com/itm/404701554316 — $16.00 each, $32.00
total. Plus standoff hardware (spacers/threaded rod connecting each
front/back pair) — length not yet determined, generic hardware once set.

**Print settings**: all 6 plates printed in **PLA-CF**, **0.2mm layer
height**, **2 walls**, **15% infill** — same material family as the other
3D-printed brackets in this build ([0032](0032-y-axis-laser-carriage.md)),
consistent settings across all of them.

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
- Not yet decided: exactly how the Y-axis plate/wheel set physically
  attaches to the existing rail/block/K40-bracket stack
  ([0039](0039-y-axis-single-rail-dual-block.md)) — quantity (1 plate, 4
  wheels) is settled, the integration geometry isn't.
- BOM updated to reflect this swap (Motion system section).
