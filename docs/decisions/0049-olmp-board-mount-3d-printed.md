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

3D-printed L-bracket, [hardware/3d-printed/olmp-board-mount.scad](../../hardware/3d-printed/olmp-board-mount.scad):

- **Wall** (vertical face): 24 x 35 x 4mm, 2x M3 clearance holes
  (3.4mm) 15.5mm apart, centered — matches the FRONT-layer hole
  markup exactly. Board's own bolts pass through into this wall (same
  scheme as the laser-cut version, no separate board-side hardware).
- **Base** (horizontal foot): 34 x 24 x 5mm, with a slide slot for a
  T-nut/M5 bolt — stadium shape, 5.5mm wide, ~26.8mm total length
  (21.3mm straight + rounded ends), matching the TOP-layer slot
  markup. Slot's long axis is the slide-adjustment direction along the
  extrusion.
- **Corner gusset**: small triangular brace behind the wall (away from
  the board's mounting face), sized to clear both M3 holes, added for
  rigidity since this wall takes the switch-actuation impact.
- Wall thickness upsized to 4mm from the sketch's acrylic-scale
  ~2.4mm — PLA needs more material here than a laser-cut sheet would,
  given repeated mechanical impact from switch actuation.
- **Real assumption, not yet verified**: no clearance pocket for the
  board's connectors (on the reverse side per the user) — the design
  assumes the board's own bolts provide enough standoff. If the
  connector housings foul the wall in a test fit, this needs a
  pocket/recess added on the inner face.

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
