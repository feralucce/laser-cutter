# 0021. Y-axis motor system: single motor, reusing X-axis hardware selections

Date: 2026-07-13
Status: Accepted

## Context

The Y-axis (800mm, [0014](0014-axis-naming-convention.md)) is a single
MGN12 rail mounted on the gantry beam itself, driving the laser carriage.
Only one rail — no synchronization concern, so a single motor suffices
(vs. the X-axis's dual motors, [0011](0011-x-axis-dual-motor.md)).

Same topology reasoning as X ([0015](0015-x-axis-motor-system.md)) applies:
fixed motor + fixed idler at opposite ends of the beam, closed-loop belt,
belt clamped to the carriage — keeps the carriage itself light for
accurate/responsive motion, same rationale as keeping the whole gantry
light on X.

Key difference from X: motor and idler mount to the **gantry beam itself**
(via T-nuts in its slots), not the fixed frame, since the beam is the
moving structure this axis's rail lives on. This is already factored into
the beam's moving-mass budget from [0014](0014-axis-naming-convention.md)'s
topology decision — the beam was kept short (800mm) specifically to keep
total moving mass down, and the Y-motor/idler are an unavoidable part of
that assembly's mass, not an oversight.

## Decision

Reuse the X-axis hardware selections, single quantity:

- **Motor**: [STEPPERONLINE NEMA17, 59Ncm](0017-stepper-motor-selection.md)
  — 1 unit (already covered by the 3-unit purchase: 2x X + 1x Y).
- **Drive pulley**: [GT2 20T, 5mm bore](0019-drive-pulley-selection.md) — 1
  unit (already covered by the 3-unit purchase).
- **Motor mount**: [Socobeta bracket](0018-motor-and-idler-mounts.md) — 1
  unit (already covered by the 5-pack).
- **Idler**: [DiGiYes smooth pulley](0018-motor-and-idler-mounts.md),
  bolt-on-T-nut mount — 1 unit. Combined with X-axis's 2 idlers, **3 total**
  idler pulleys needed across the machine — worth confirming the sourced
  product's pack size covers this.
- **Belt**: 6mm GT2, closed loop, cut to a shorter length matching the
  800mm span (vs. X's 1200mm).
- **Belt clamps**: [3DMAN 9x40mm](0020-belt-clamp-selection.md) — 2 units
  (one per belt end, at the carriage). Combined with X-axis's 4, **6 total**
  across the machine — still within the 10-pack already selected.

Category: all off-the-shelf, per prior ADRs.

## Consequences

- No new hardware sourcing needed beyond confirming idler pulley quantity —
  everything else is already covered by existing purchases sized with
  spares.
- Motor/idler mount to the beam via T-nuts in its slots, same fastening
  method as the frame-mounted X-axis hardware, just a different host
  member.
- **Still open**: the laser carriage itself (the part riding the beam's
  MGN12 rail, holding the K40, with its own belt clamp mounting points) —
  this is the "carriage motion" design deferred earlier in this project,
  not covered by this ADR.
