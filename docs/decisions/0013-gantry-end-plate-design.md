# 0013. Gantry end plate design

Date: 2026-07-13
Status: Accepted

## Context

The gantry crossbeam (2040, per [0010](0010-extrusion-profile-2040.md)) needs
to attach to the two Y-axis MGN12 carriage blocks
([0008](0008-motion-system-mgn12-rails.md)) at each end. Both mounting
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
