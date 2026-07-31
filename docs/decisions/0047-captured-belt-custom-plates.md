# 0047. Y-axis gantry plates: back to captured belt, custom laser-cut acrylic

Date: 2026-07-29
Status: Accepted (supersedes [0046](0046-shaft-driven-open-belt.md); reinstates the captured-belt approach from [0042](0042-captured-belt-drive.md))

## Context

[0046](0046-shaft-driven-open-belt.md) moved away from captured-belt
routing specifically to avoid needing to match the purchased aluminum
V-wheel plate's exact wheel geometry. That constraint is now gone: the
user is designing **custom gantry plates from scratch** (reusing only
the wheels/wheel-bolts from the purchased kit, not the kit's own plate),
directly informed by two real reference files
(`Printables/yplateleft.stl`, `Printables/yplateright.stl`) that already
solve this exact captured-belt layout — motor or bearing centered, 2 top
wheels flanking the shaft, a bottom wheel, and 2040 mounting holes. With
a real reference geometry in hand, captured-belt is no longer a fitting
problem — it's just a matter of drawing the plate.

Two further changes from that reference:
- **3 bottom wheels instead of 1** (2 top unchanged) — more load support
  under the gantry's weight, all 3 using the same wide/eccentric-nut-
  clearance hole style the reference used for its single bottom wheel.
- **4 additional M5 holes per plate for corner L-brackets** — the
  "FOR 20 SERIES ALUMINUM PROFILE RAIL" corner bracket (26mm tall leg,
  25mm long leg, M5, hole 6mm in from the bend), seated in the 2040
  beam's own V-slot channel and bolted to the plate, for squareness/
  rigidity — not a flat face-mount bracket.
- **Material: laser-cut black acrylic, not 3D-printed PLA-CF.** The
  shaft-far-end bearing bracket ([shaft-far-end-bearing-mount.scad](../../hardware/3d-printed/shaft-far-end-bearing-mount.scad))
  and the first pass at this plate ([y-gantry-plate.scad](../../hardware/3d-printed/y-gantry-plate.scad))
  were both designed as 3D-printed parts before this correction — both
  superseded, kept for reference/coordinate history only.

## Decision

**Design file**: [hardware/laser-cut/y-gantry-plate.svg](../../hardware/laser-cut/y-gantry-plate.svg)
— two variants (motor side, bearing side), 80mm x 165mm, 5mm black
acrylic (working assumption, not yet confirmed against load).

Hole layout (both variants share everything except the center mount):
- **2040 mount**: 2x M5 clearance, 20mm apart on centerline (top)
- **Center mount**: NEMA17 (4x M3 on 31x31mm square + 22mm shaft-
  clearance bore) on the motor plate; single 16.2mm bore for a 625ZZ
  bearing on the far-end plate
- **Top wheels**: 2x, 5.2mm, flanking the shaft/motor position (10, 70)
- **Bottom wheels**: 3x, 7.2mm (eccentric-nut clearance), at (10, 40, 70)
  — X positions match the top wheels' edges plus the reference's
  original centerline position
- **L-brackets**: 4x, 5.2mm M5 clearance, 6mm inset from each edge (2
  upper, 2 lower)

**Superseded**: [0046](0046-shaft-driven-open-belt.md) (open belt loop,
2 pulleys) — captured-belt routing from [0042](0042-captured-belt-drive.md)
is reinstated. [0018](0018-motor-and-idler-mounts.md)'s idler
pulley/mount and [0019](0019-drive-pulley-selection.md)'s drive pulley
selections still apply to the X-axis (unaffected), but no longer apply
to the Y-axis the way 0046 had them wired up.

## Consequences

- The purchased BEMONOC/DiGiYes pulleys and 3DMAN belt clamps
  ([0046](0046-shaft-driven-open-belt.md)'s reinstated hardware) are no
  longer part of the Y-axis mechanism — still usable on X, which keeps
  its own motor/pulley/belt-clamp setup unaffected by this ADR.
- Wheels and wheel-bolts are reused from the purchased aluminum V-wheel
  plate kit (0040) — its own plate is not used, only its wheel hardware.
- **Not yet confirmed**: 5mm acrylic thickness is a default assumption
  (project standard, 0029), not verified against the actual load these
  plates carry (motor/bearing + shaft + wheels + belt tension). The
  reference 3D-printed plates were 8mm; worth a real check before
  committing to a full cut.
- **Not yet confirmed**: bottom wheel X-alignment (10, 40, 70) was
  inferred from the reference's top-wheel/centerline positions, not
  directly specified — flagged for the user to confirm.
- 3D-printed versions of both the gantry plate and the far-end bearing
  bracket are superseded and kept only for reference/coordinate history,
  not built.
