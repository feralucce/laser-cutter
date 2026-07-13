# 0008. Motion system: MGN12 linear rails on both axes

Date: 2026-07-13
Status: Accepted (axis naming corrected 2026-07-13, see note below)

## Context

Two options were considered for X/Y motion on the aluminum extrusion frame:

- **V-slot wheels** (what the current Ortur uses): POM/Delrin wheels ride
  directly in the extrusion's V-groove. Cheapest, no separate rail to buy,
  but plastic-on-aluminum wear, needs periodic tensioning, and is the least
  rigid/precise option — more prone to play under lateral cutting loads.
- **MGN12 linear rail**: separate hardened-steel rail + ball-bearing block,
  bolted to the extrusion face via T-nuts dropped into the slot (a
  well-established combination in the maker community, not a hack).
  Meaningfully more rigid and precise, better load capacity.

Given the K40 module ([0002](0002-laser-module-selection.md)) is heavier
(~900g) than what the current machine was designed around, and the goal is
clean cuts through 1/2" hardwood plywood (not just engraving), the extra
rigidity of MGN12 matters more here than it would for a light engraving-only
machine.

Availability check: MGN12 rail is sold in common stock lengths (100mm up to
1500mm in ~100mm increments) by multiple suppliers, and custom-cut lengths
are a normal, cheap option beyond that — so whatever exact lengths the frame
needs (see [0009](0009-frame-dimensions-final.md)), sourcing isn't a
constraint.

## Decision

Use **MGN12 linear rail** (rail + carriage block) for both the Y-axis
(gantry beam/laser carriage, spans the fixed 800mm axis) and X-axis (gantry
ends, spans the long/flexible axis — whole gantry travels here), mounted to
the extrusion via T-nuts. Category: off-the-shelf component.

## Consequences

- Meaningfully more rigid/precise motion than V-slot wheels, which should
  directly help cut quality/accuracy on thick hardwood ply.
- Costs more than bare V-slot wheels, and mounting needs reasonable
  alignment during assembly (alignment jigs for this exact combination are
  commonly available, including 3D-printable ones).
- Rail mounting holes are on a fixed pitch (typically 50mm), so T-nut
  placement in the extrusion slot needs to match that pitch.
- Two rails + two carriage blocks needed on the X-axis (one per side) to
  keep the gantry square, plus one rail + block on the Y-axis for the laser
  carriage.

## Note: axis naming correction

Originally this ADR called the 800mm carriage-travel axis "X" and the long
whole-gantry-travel axis "Y" — backwards from Ortur/GRBL convention. Per
research into the Ortur LM2's own extension kit (which explicitly extends
the **Y**-axis via GRBL `$131` to reach 800mm — see
[the axis naming decision](0014-axis-naming-convention.md)), this ADR was
corrected so that **Y = the fixed 800mm axis** (gantry beam/carriage travel)
and **X = the long/flexible axis** (whole gantry travel, dual motors per
[0011](0011-y-axis-dual-motor.md)). All text above reflects the corrected
naming.
