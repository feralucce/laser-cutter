# 0013. Gantry end plate design

Date: 2026-07-13
Status: Accepted

## Context

The gantry crossbeam (2040, per [0010](0010-extrusion-profile-2040.md)) needs
to attach to the two Y-axis MGN12 carriage blocks
([0008](0008-motion-system-mgn12-rails.md), [0014](0014-axis-naming-convention.md))
at each end — the carriages riding the two guide rails that the whole
gantry travels along. Both mounting
interfaces are flat faces, which allows a single flat laser-cut plate rather
than a bent/welded bracket:

- The MGN12H carriage block has a 20mm x 20mm M3 bolt pattern on its top
  face.
- The 2040 beam's wide (40mm) face has two T-slots spaced 20mm apart,
  matching the standard 20-series M5 T-nut/screw standard.

The beam's end sits on top of the plate (screwed down into its own T-slots
via T-nuts), and the carriage block sits underneath (screwed up into its
threaded top holes) — no bent metal or 3D-printed part needed.

## Decision

Laser-cut flat plate, 50mm x 90mm, 3mm corner radius:

- Two M5 clearance holes (5.5mm dia), 20mm apart, centered on the plate
  width — for the 2040 beam's T-slot mounting.
- Four M3 clearance holes (3.5mm dia) in a 20x20mm square pattern — for the
  MGN12H carriage block.
- 15mm minimum edge margin around all holes for material strength in
  plywood/acrylic.

Design file: [hardware/laser-cut/gantry-end-plate.svg](../../hardware/laser-cut/gantry-end-plate.svg).
Category: laser cut ([0003](0003-parts-sourcing-constraint.md)).

## Consequences

- No 3D-printed or bent-metal bracket needed for this joint — a flat plate
  cut on the current laser handles it.
- Plate material/thickness not yet chosen (plywood vs acrylic, thickness) —
  needs to be picked before cutting; 15mm edge margins give some flexibility
  here.
- Two of these plates needed per machine (one per side of the gantry).
- All future laser-cut SVGs for this project include a 100mm x 10mm scale
  bar for import verification, per standing convention.
- **Open issue**: the gantry beam spans the long/flexible axis (X, up to
  1219mm) — it connects the two Y-axis guide rails, which are spaced apart
  by this dimension. The beam must be shorter than that spacing — it spans
  between the two carriages, which sit inboard of the Y-rails (mounted on
  the extrusion's inward-facing wide face). Exact beam length = the chosen
  X-axis spacing minus the Y-rail extrusion width, MGN12 rail/carriage
  offset, and this end plate's thickness, on both sides. Not yet
  calculated — needs final rail offset and plate material thickness before
  cutting the beam to length.
  Separately, the two **Y-axis guide rails themselves** are each 800mm long
  (the fixed axis, [0007](0007-frame-footprint-constraints.md)) — that
  figure is not affected by this clearance issue, since it's the guide
  rails' own length, not the beam's span.
