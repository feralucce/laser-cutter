# 0015. Y-axis motor system: fixed motors, GT2 belt, off-the-shelf mounts

Date: 2026-07-13
Status: Accepted

## Context

The Y-axis (fixed 800mm axis, dual motors per [0011](0011-y-axis-dual-motor.md))
needs an actual drive mechanism — the MGN12 carriage itself has no motor,
it just rides the rail passively.

Two belt topologies were considered:

- **Fixed motor + idler, moving belt loop** (belt clamped to the carriage,
  motor and idler both bolted to the frame, neither moves).
- **Fixed belt, moving motor** (belt anchored at both ends, motor rides the
  carriage with its pulley captured against the stationary belt) — this is
  what the current Ortur uses.

Ortur's approach minimizes gantry weight and BOM for a light engraving
machine, but doesn't fit this build: it would add each motor's own mass
(~200-350g) onto the already-loaded Y-carriages (which carry the 2040 beam,
X-rail, and eventual K40 + carriage), doubled since we use two motors
([0011](0011-y-axis-dual-motor.md)) — working against the reason dual
motors were chosen (more torque for a heavier gantry, not more weight added
to it). It also requires motor wiring to flex with the moving gantry
(added to the drag chain alongside the laser's own wiring) and needs extra
idler/guide bearings just to keep belt wrap on the motor's pulley. Fixed
motor/moving belt is the standard on load-bearing CNC-grade motion systems
generally, consistent with the more robust choices made throughout this
build (MGN12 over V-wheels, 2040 over 2020, dual motors).

Belt width: 6mm GT2 is standard for CNC/laser gantries and handles moving
masses well under ~8kg without issue; 9mm only pays off above that or for
very heavy/fast gantries. Our estimated moving mass is well under threshold.

## Decision

- **Topology**: fixed motor + fixed idler, closed-loop belt, belt clamped to
  the carriage. Two full sets (one per Y-rail).
- **Motor**: standard NEMA17 stepper, two total (per [0011](0011-y-axis-dual-motor.md)).
- **Belt**: 6mm GT2 timing belt, closed loop.
- **Pulleys**: GT2 20-tooth, 5mm bore (NEMA17 shaft) on the motor side; a
  matching idler pulley (bearing, no teeth needed) at the far end of each
  rail.
- **Motor mount**: off-the-shelf aluminum bracket/plate made for 2020/2040
  extrusion — not 3D printed, since this is a constantly-tensioned anchor
  point and off-the-shelf aluminum avoids any PLA-CF creep/flex risk there.
- **Idler mount**: off-the-shelf idler pulley kit (bearing + standoff +
  bracket) for T-slot extrusion, same rationale as the motor mount.

Category: all off-the-shelf components.

## Consequences

- Motor and idler mounts are both bolted to the frame — no wiring needs to
  flex with the gantry except the laser module's own power/PWM leads.
- Two belt loops, two motor mounts, two idler mounts, four pulleys (2
  driven + 2 idler) needed total for the Y-axis.
- Still open: the belt clamp/clip that anchors the belt to each carriage —
  not yet designed (was going to be part of the now-deleted gantry end
  plate, [0013](0013-gantry-end-plate-design.md), which is being reworked).
- Belt tension is adjusted via the idler mount's position (typically an
  adjustable slot), not by re-anchoring the belt itself.
