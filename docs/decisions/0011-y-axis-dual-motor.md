# 0011. Y-axis: dual independently-driven steppers, synced in firmware

Date: 2026-07-13
Status: Accepted

## Context

The Y-axis gantry rides on two parallel MGN12 rails
([0008](0008-motion-system-mgn12-rails.md)), one per side, and needs to stay
synchronized so the gantry doesn't rack out of square. Two approaches:

- **Single motor + mechanical link** (shaft or belt connecting both sides to
  one stepper): simpler electronically, but relies on a rigid mechanical
  coupling across the 800mm span, which adds its own alignment/backlash
  concerns and puts the full load on one motor.
- **Dual independently-driven steppers**, one per side, each with its own
  driver, synchronized electronically (moved as a mirrored pair in
  firmware/controller config): more torque available across the gantry, no
  mechanical coupling shaft to keep aligned, and better suited to a heavier
  gantry load.

We're currently building around the K40 (~900g, [0002](0002-laser-module-selection.md)),
but there's a real possibility of moving to a substantially heavier module
later (up to ~1.4lb/~635g+ class, i.e. beyond the K40). Dual motors give
headroom for that without redesigning the Y-axis drive.

## Decision

Use **two independently-driven NEMA17 steppers on the Y-axis**, one per
rail, synchronized in firmware (mirrored Y/Y2 axis config) rather than a
single motor with a mechanical coupling shaft.

## Consequences

- More torque available for the Y-axis as a whole, and headroom for a
  heavier laser module later without changing the drive approach.
- No mechanical shaft/coupling to keep aligned across the 800mm span —
  removes that failure/misalignment mode entirely.
- Requires a controller board with a dual-Y (or Y + mirrored A-axis) driver
  configuration — this becomes a requirement for the controller board
  selection (still an open decision).
- Both motors need to be homed/squared correctly (typically via dual limit
  switches, one per side) so the gantry doesn't rack out of square over
  time — an explicit homing/squaring step in the electrical/firmware design,
  not just physical assembly.
