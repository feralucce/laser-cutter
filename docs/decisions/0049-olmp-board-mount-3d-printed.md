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
a genuine L-bracket — direct translation of the reference sketch's
three views:

- **Vertical wall**: the FRONT layer's exact outline (flat bottom
  edge, short left edge, one long curved sweep up to the narrow
  top-right strip that carries the board holes), as a thin **2.5mm**
  plate (matches the SIDE layer's rect8, drawn 2.424mm) — not a solid
  extrusion. Printed solid PLA-CF, no added ribs/gusset needed.
  **Narrowed to 29.55mm** (was 40.08mm, matching the foot) per a
  follow-up edit to the FRONT layer — left edge held in place so it
  still aligns with the foot's left edge; the wall intentionally no
  longer spans the foot's full width. Holes moved left with it (still
  15.5mm apart, same height).
- **Horizontal foot**: a plain rectangle, **40.08mm wide** (unchanged,
  wider than the wall — intentional, per the same edit), thin
  **2.5mm** plate (SIDE layer's rect9, drawn 2.432mm) at the wall's
  base, extending 28.373mm in depth (rect9's drawn length) — a real L
  cross-section, not a solid wedge. Left-aligned with the wall.
- **M3 board holes**: exact FRONT-layer circle positions, 15.5mm
  apart, 3.2mm diameter as drawn, through the wall only.
- **M5 slide slot**: TOP-layer stadium size (5.34mm wide, 26.6mm
  long), through the foot only, long axis parallel to the front wall
  (along the width axis). **Depth position centered** in the foot
  (14.19mm from both the wall and the back edge) rather than the
  TOP layer's off-center position (10.86mm from the near edge) — so
  there's equal clearance for the bolt head on either side.
- **Real assumption, not yet verified**: no clearance cut for the
  board's connectors (reverse side, per the user) — the board's own
  bolts are assumed to give enough standoff.

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
