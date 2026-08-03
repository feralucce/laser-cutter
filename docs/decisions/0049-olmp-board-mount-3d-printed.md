# 0049. OLMP-V1.2C board mount: 3D-printed, interim

Date: 2026-08-03
Status: Accepted (interim; the laser-cut acrylic version from the same
commit as this ADR remains the intended long-term part once the new
machine is cutting)

## Context

The old Ortur is being torn down for parts and the new machine isn't
running yet, so nothing can be laser-cut right now. The OLMP-V1.2C
board (12V/GND/PWM/KEY, integrated pushbutton, carries the 1200mm-axis
limit switch) needs a mount now, not once the laser is back online.

User provided a scaled reference sketch
([Reference/olmp-board-mount-build reference.svg](../../Reference/olmp-board-mount-build%20reference.svg),
FRONT/TOP/SIDE layers, holes marked with grey infill) and a reference
STL of a standard 30mm corner L-bracket
([Reference/scb_30.stl](../../Reference/scb_30.stl)) to show the
general shape being targeted — not a literal trace, just the L-bracket
silhouette. Board itself: 20x20mm, 2x M3 bolts (2.8mm measured)
15.5mm center-to-center (confirmed again from the FRONT-layer holes).
The board must be slidable along the V-slot extrusion to position the
limit switch correctly once the gantry is assembled.

## Decision

3D-printed part, [hardware/3d-printed/olmp-board-mount.scad](../../hardware/3d-printed/olmp-board-mount.scad),
a **direct translation of the reference sketch's three views, not a
reinterpretation**:

- **Body**: the FRONT layer's exact outline (flat bottom edge, short
  left edge, one long curved sweep up to the narrow top-right strip
  that carries the board holes) extruded straight through by the TOP
  layer's depth (25.849mm). One solid piece, no separate wall/base
  split, no added ribs — printed **solid PLA-CF**, which is its own
  reinforcement, so no gusset.
- **M3 board holes**: exact FRONT-layer circle positions, 15.5mm
  apart, 3.2mm diameter as drawn, running the full depth.
- **M5 slide slot**: exact TOP-layer stadium position/size (5.34mm
  wide, 26.6mm long), cut straight through vertically so a bolt
  dropped in from the top is reachable — a blind pocket was tried
  first and rejected, since at the slot's (u,d) position the body is
  already ~34mm tall, deep enough to trap the bolt with no way to
  tighten it from above.
- **Two real assumptions, not yet verified**: (1) the TOP-layer
  rectangle (25.849mm) and the SIDE-layer's matching rectangle
  (28.373mm) disagree by ~2.5mm on depth — used the TOP value since
  the slot's own position is defined relative to it; (2) no clearance
  cut for the board's connectors (reverse side, per the user) — the
  board's own bolts are assumed to give enough standoff.

## Consequences

- This becomes the build's 2nd 3D-printed part (with
  `gt2-fixing-clamp.stl`), out of necessity — not a reversal of the
  laser-cut-by-default preference ([0048](0048-captured-belt-both-axes-no-idler.md)).
- The laser-cut acrylic version
  ([hardware/laser-cut/olmp-board-mount.svg](../../hardware/laser-cut/olmp-board-mount.svg))
  is not superseded — once the new machine is running, it's still the
  intended long-term part. This ADR only covers the interim print.
- Real open follow-up: physically test-fit the print against the
  board before trusting the connector clearance assumption above.
