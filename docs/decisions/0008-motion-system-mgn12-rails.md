# 0008. Motion system: MGN12 linear rails on both axes

Date: 2026-07-13
Status: Accepted

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

Use **MGN12 linear rail** (rail + carriage block) for both the X-axis
(gantry/carriage) and Y-axis (gantry ends), mounted to the extrusion via
T-nuts. Category: off-the-shelf component.

## Consequences

- Meaningfully more rigid/precise motion than V-slot wheels, which should
  directly help cut quality/accuracy on thick hardwood ply.
- Costs more than bare V-slot wheels, and mounting needs reasonable
  alignment during assembly (alignment jigs for this exact combination are
  commonly available, including 3D-printable ones).
- Rail mounting holes are on a fixed pitch (typically 50mm), so T-nut
  placement in the extrusion slot needs to match that pitch.
- Two rails + two carriage blocks needed on the Y-axis (one per side) to
  keep the gantry square, plus one rail + block on the X-axis for the laser
  carriage.
