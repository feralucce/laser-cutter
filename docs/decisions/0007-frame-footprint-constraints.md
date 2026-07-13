# 0007. Frame footprint constraint: 800mm axis fixed by downdraft table

Date: 2026-07-13
Status: Superseded by [0009](0009-frame-dimensions-final.md)

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
- Downdraft table framing is 2x4 dimensional lumber, oriented on the narrow
  face — the machine frame rests on the ~1.5" (38mm) actual-width top
  surface, with the ~3.5" (89mm) actual dimension running vertically as the
  joist height. Any frame feet/rail supports on the 800mm axis need to work
  with this ~38mm-wide mounting surface.
- The flexible axis has a hard ceiling regardless: **must not exceed 4 feet
  (1219mm)**.
- Estimated (not yet measured) current frame footprint on the fixed 800mm
  axis: base Ortur LM2 S2 published overall frame dimension on this axis is
  ~500-550mm (two published sources: 570x550x175mm and 540x500x150mm
  overall W x D x H, against a 400x430mm work area — the ~500-550mm figure
  is the frame dimension on the axis matching the ~400-430mm work-area
  component). The 800mm extension kit adds ~400mm of travel on this axis,
  so estimated current overall frame footprint ≈ **900-950mm**. This is an
  estimate from published base-machine specs (which vary ~50mm across
  sources) plus the kit's known extension — a direct measurement of the
  actual current machine is still needed to confirm before finalizing new
  frame dimensions.
- Still need: total table length (informational only, since the flexible
  axis is capped at 1219mm regardless), table height, and a direct
  measurement of the current machine's outer frame width on the 800mm axis
  to confirm the estimate above.
