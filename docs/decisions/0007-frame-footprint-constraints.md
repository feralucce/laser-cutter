# 0007. Frame footprint constraint: 800mm axis fixed by downdraft table

Date: 2026-07-13
Status: Accepted

## Context

The new gantry frame must sit on the existing downdraft table
([0006](0006-bed-and-enclosure-scope.md)), which was originally built around
the current Ortur's 800mm x 1.2m cutting area (plus extra clearance for the
Ortur's V-slot wheel gantry overhang).

Critically, the machine's frame physically rests on the downdraft table's own
structural frame along the 800mm axis. That's not just a work-area number —
it's a structural mounting dimension, so it **cannot change** for the new
build regardless of rail/carriage type chosen. The 1.2m axis has no such
structural dependency and can be shortened if the new design needs it (e.g.
if a different rail/gantry type has different overhang requirements than the
Ortur's V-slot wheels).

## Decision

- **800mm axis: fixed.** The new frame's outer dimension on this axis must
  match the downdraft table's structural frame, full stop.
- **1.2m axis: flexible, can be shortened.** Final length depends on the
  rail/carriage type chosen (still an open decision) and its overhang
  requirements, not on the downdraft table.
- Actual usable *cutting* work area on each axis will be somewhat smaller
  than the frame's outer dimensions once rail overhang/gantry travel limits
  are accounted for — exact numbers depend on the rail type decision.

## Consequences

- Any frame/rail design proposal must treat 800mm as a hard outer-dimension
  ceiling on that axis, not a target to hit approximately.
- The 1.2m axis gives some design freedom — if a lighter/shorter-overhang
  rail system is chosen, the frame (and required floor space) could shrink
  below 1.2m without losing capability, since that axis was originally sized
  around the Ortur's V-slot wheel gantry, not a hard structural requirement.
- We still need exact downdraft table structural measurements (mounting
  points/edges the frame will rest on) before finalizing frame dimensions —
  flagged as open for the next design step.
