# 0045. Laser module: revert to K40 — power headroom over K30

Date: 2026-07-29
Status: Accepted (supersedes [0044](0044-laser-module-k30.md); reinstates [0002](0002-laser-module-selection.md)'s K40 choice)

## Context

[0044](0044-laser-module-k30.md) switched to the K30 based on real usage
being primarily 3mm/6mm plywood with 12mm as an occasional laminated
case. That reasoning wasn't wrong, but it undervalued one asymmetry:
**laser power can always be dialed down in software, but never dialed up
past a module's physical capacity.** A K40 run at K30-equivalent power
for the common 3/6mm jobs costs nothing extra day-to-day, while keeping
the headroom to single-pass thicker/denser material later without being
capped by the module itself.

The user has already placed the order for the K40.

## Decision

**Revert to the LaserTree K40** (40W+ optical, ~44W measured), $549,
900g, 66x66x134mm, 24V/6A (144W) — reinstating [0002](0002-laser-module-selection.md)'s
original selection and its full reasoning.

## Consequences

- BOM reverted: "still ordering" line, adapter board reference, and
  known-open-verification-items entries all go back to referencing the
  K40 (as they did before [0044](0044-laser-module-k30.md)).
- Carriage/mounting weight budget reverts to 900g (not 710g) — any
  not-yet-designed part sized against the laser module's mass (laser
  carriage, [0032](0032-y-axis-laser-carriage.md); captured-belt gantry
  plate, [0042](0042-captured-belt-drive.md)) should use the K40's
  figure.
- K40's mounting interface (sliding plate, M5/M3 holes, 115mm height-
  adjust slide, [0032](0032-y-axis-laser-carriage.md)) is the one
  already documented from 0002 — no new verification item introduced by
  this revert, unlike 0044's open question about the K30's interface.
- Power draw reverts to 24V/6A (144W) from the K30's 120W — already
  accounted for in the PSU sizing ([0023](0023-power-supply-selection.md)).
