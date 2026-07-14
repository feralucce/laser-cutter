# 0032. Y-axis laser carriage: beam rail orientation + K40 mounting bracket

Date: 2026-07-14
Status: Accepted

## Context

[0021](0021-y-axis-motor-system.md) explicitly left this open: the part
that actually rides the gantry beam's MGN12 rail and holds the K40 — the
single most important physical part in the machine — was never designed.
Flagged as the top-priority gap in the 2026-07-14 full-repo review.

Two things needed deciding together, since the bracket's shape depends on
the first:

**1. Which face of the beam does the Y-rail mount to?** Never decided —
existing ADRs cover the beam's own dimensions ([0009](0009-frame-dimensions-final.md)),
its extrusion profile ([0010](0010-extrusion-profile-2040.md)), and the
X-axis guide rails' orientation ("wide-face-vertical, narrow face up" —
[0016](0016-gantry-end-plate-rework.md)), but never the beam's own
rail-mounting face. The same bending-stiffness logic that set the X-rail
orientation applies here too: the beam itself sags under its own span
(800mm) plus the traveling Y-carriage + K40 load, so it should stand on
its wide (40mm) face for maximum resistance to vertical bending, same as
the X guide rails. Following that, the Y-rail mounts to the beam's
**front (operator/bed-facing) wide face** — a vertical plane — so the
MGN12 block's own flat mounting face ends up vertical too, facing forward,
in the same plane as the beam's front face. This matches how conventional
gantry-style laser/CNC builds (including the Ortur this project started
from) mount their X-carriage: bolt a plate flat to the block's forward
face, then let that plate extend downward below the beam to carry the
tool head, pointing straight down at the bed.

**2. The K40's own mounting-plate hole pattern is not published anywhere.**
Checked LaserTree's product page and manual references — confirmed
mechanically only that it ships with "a sliding plate with M5/M3 mounting
holes" and a 115mm height-adjustment slide rail, but no seller or manual
excerpt gives exact hole spacing. Same situation as the corner bracket
research in [0028](0028-corner-bracket-hardware-selection.md) — this is a
real gap in available documentation, not something more searching will
fix. Designing around it the same way: generous elongated slots instead of
fixed-position holes, verified/trimmed once the module is physically in
hand.

Material category: **3D-printed PLA-CF**, not laminated laser-cut acrylic
like the gantry end plates ([0016](0016-gantry-end-plate-rework.md)).
Reasoning parallels the frame feet decision ([0012](0012-corner-joints-and-feet.md)):
this bracket bridges two different mounting interfaces (the block's flat
bolt pattern and the K40's lower, offset slide-mount) in a genuinely 3D,
cantilevered shape — a single printed piece with ribbing handles that
better than laminated flat sheet, which was only a good fit for the end
plates' problem (capturing a bracket leg in a real T-slot channel).
[0003](0003-parts-sourcing-constraint.md)'s PLA-CF heat-clearance caveat
applies directly here, more than anywhere else in the build so far — this
bracket sits right next to the laser's own heat/exhaust path.

## Decision

- **Beam rail mounting**: Y-axis MGN12 rail mounts to the beam's front
  (operator/bed-facing) wide face, beam standing wide-face-vertical
  (matching the X guide rails' orientation logic). The carriage block's
  mounting face is therefore vertical, facing forward/outward from the
  beam.
- **Carriage bracket**: single 3D-printed PLA-CF part with three zones:
  1. **Block-mount zone**: flat face matching the MGN12H block's standard
     20x20mm M3 bolt pattern (same pattern already used for the X-carriage
     end plates, [0013](0013-gantry-end-plate-design.md)) — bolts flat
     against the block's forward face.
  2. **Offset/standoff zone**: extends downward from the block-mount zone,
     clearing below the beam's bottom edge (beam is 40mm tall as
     installed; working offset estimate ~60-80mm from block face to K40
     mount zone, to be confirmed once the rail/block stack-up height is
     known at assembly) — ribbed for stiffness given the cantilevered
     900g K40 load ([0002](0002-laser-module-selection.md)).
  3. **K40 mount zone**: two vertical elongated slots (not fixed holes),
     working estimate 6mm wide x 25mm tall, spaced at a placeholder 30mm
     apart, sized for M5 bolts matching the K40's sliding-plate holes —
     **must be verified/adjusted against the actual module once in hand**,
     same honest caveat as [0028](0028-corner-bracket-hardware-selection.md)'s
     bracket dimensions. These slots double as a height/focus adjustment
     mechanism for free — loosen, slide, retighten, same working principle
     as the interim 10W module's own Z-focus slider.
- **Belt clamp mounting**: 2x M4 clearance holes on the block-mount zone
  (near the top, in-plane with the beam's Y-belt travel direction, which
  is horizontal along the beam) — same [3DMAN 9x40mm clamp](0020-belt-clamp-selection.md)
  used elsewhere in the build.
- **Cable management tie-in**: a small integrated anchor loop near the top
  of the bracket for the tension line, and a zip-tie pass-through slot for
  the spiral-wrapped K40 power/PWM + air-assist bundle, per
  [0031](0031-cable-management.md).

Category: 3D printed PLA-CF ([0003](0003-parts-sourcing-constraint.md)).

Parametric model: [hardware/3d-printed/y-carriage-k40-bracket.scad](../../hardware/3d-printed/y-carriage-k40-bracket.scad)
(OpenSCAD), exported to
[y-carriage-k40-bracket.stl](../../hardware/3d-printed/y-carriage-k40-bracket.stl).
All the "verify against real hardware" dimensions (K40 slot width/height/
spacing, standoff height) are named parameters at the top of the file —
adjust and re-render there once the K40 and rail/block hardware are
physically in hand, rather than re-modeling from scratch.

## Consequences

- Closes the single biggest gap found in the 2026-07-14 repo review —
  there is now a designed part connecting the Y-carriage to the K40,
  where before there was none.
- Decides the beam's rail-mounting orientation as a side effect — worth
  noting explicitly since no earlier ADR covered it, and future work
  referencing "the beam" should assume this orientation.
- PLA-CF heat clearance: the standoff/K40-mount zones must stay clear of
  the module's air-assist nozzle and beam-exit path — the bracket should
  only contact the K40's housing/sliding-plate area, which the module's
  own body already manages thermally, not any area in the actual cutting
  heat/smoke path.
- Weight/moment note: 900g (K40) + an estimated ~150-200g (PLA-CF bracket)
  cantilevered ~60-80mm off the MGN12H block is well within the block's
  rated load capacity in absolute terms, but the offset should be kept as
  short as practically possible (not padded further than needed for
  clearance) to minimize flex/chatter during cutting moves — consistent
  with the deflection-vs-kerf-width reasoning used throughout this build
  ([0010](0010-extrusion-profile-2040.md), [0014](0014-axis-naming-convention.md)).
- The K40 slot dimensions and the beam-to-block-face standoff distance are
  both explicitly flagged as working estimates — don't print the final
  version until the K40 module and rail/block hardware are physically in
  hand to confirm both. The frame feet ([0012](0012-corner-joints-and-feet.md))
  still have this same "decided but not modeled" gap, separately.
- Not yet done: slicing/print settings (wall count, infill, orientation
  beyond the flat-print recommendation noted in the .scad file's header).
