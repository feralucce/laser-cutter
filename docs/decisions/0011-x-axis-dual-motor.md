# 0011. X-axis: dual independently-driven steppers, synced in firmware

Date: 2026-07-13
Status: Superseded by [0041](0041-ortur-electronics-reuse.md) (topology finalized 2026-07-13, see [0014](0014-axis-naming-convention.md))

## Context

The whole gantry (800mm beam + Y-rail + carriage) travels along the long
1200mm axis on two parallel MGN12 rails ([0008](0008-motion-system-mgn12-rails.md)),
one per side, and needs to stay synchronized so the gantry doesn't rack out
of square. Per [0014](0014-axis-naming-convention.md), this is the
**X**-axis — the guide rails were deliberately placed on the long axis
(rather than the fixed 800mm axis) to keep the gantry beam itself short and
light, minimizing the moving assembly's mass/inertia. The stationary
frame's own weight doesn't matter, since it never moves.

Two approaches were considered for keeping the two rails synchronized:

- **Single motor + mechanical link** (shaft or belt connecting both sides to
  one stepper): simpler electronically, but relies on a rigid mechanical
  coupling across the 1200mm span, which adds its own alignment/backlash
  concerns and puts the full load on one motor.
- **Dual independently-driven steppers**, one per side, each with its own
  driver, synchronized electronically (moved as a mirrored pair in
  firmware/controller config): more torque available across the gantry, no
  mechanical coupling shaft to keep aligned, and better suited to a heavier
  gantry load.

We're currently building around the K40 (~900g, [0002](0002-laser-module-selection.md)),
but there's a real possibility of moving to a substantially heavier module
later (up to ~1.4lb/~635g+ class, i.e. beyond the K40). Dual motors give
headroom for that without redesigning the X-axis drive. This is also the
heaviest-loaded pair of rails in the machine (they carry the whole gantry,
including the Y-axis's own rail/carriage/motor) — putting dual motors here
gives enough torque margin to move that load smoothly even though the span
is longer (1200mm) than the beam it's carrying (800mm). The resulting
deflection at this span (~0.12-0.18mm estimated, see
[0014](0014-axis-naming-convention.md)) remains well under laser kerf
width, so the mass/inertia benefit of a short beam wasn't traded against a
meaningful accuracy cost.

## Decision

Use **two independently-driven NEMA17 steppers on the X-axis**, one per
rail, synchronized in firmware (mirrored X/X2 axis config) rather than a
single motor with a mechanical coupling shaft.

## Consequences

- More torque available for the X-axis as a whole, and headroom for a
  heavier laser module later without changing the drive approach.
- No mechanical shaft/coupling to keep aligned across the 1200mm span —
  removes that failure/misalignment mode entirely.
- Requires a controller board with a dual-X (or X + mirrored A-axis) driver
  configuration — this becomes a requirement for the controller board
  selection (still an open decision).
- Both motors need to be homed/squared correctly (typically via dual limit
  switches, one per side) so the gantry doesn't rack out of square over
  time — an explicit homing/squaring step in the electrical/firmware design,
  not just physical assembly.
