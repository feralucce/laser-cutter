# 0014. Axis naming and gantry topology: X = 1200mm guide rails, Y = 800mm beam

Date: 2026-07-13
Status: Accepted (topology changed 2026-07-13 — see note below; supersedes all
earlier versions of this ADR)

## Context

This ADR has been revised twice already (see the correction note at the
bottom for that history). This revision is different: it's not a bugfix,
it's a genuine topology decision.

**The topology**: "gantry" means the whole moving assembly — the beam plus
the carriage that rides on it. Two ways to arrange it on the 800mm x 1200mm
frame ([0009](0009-frame-dimensions-final.md)):

- **Guide rails on the short (800mm) sides, beam spans the long (1200mm)
  gap.** The guide rails carry the heaviest load (the whole gantry
  assembly), so keeping them short minimizes their deflection under that
  traveling load (deflection scales with span³). Tradeoff: the beam itself
  has to be long (1200mm) to span the gap, adding moving mass/inertia.
- **Guide rails on the long (1200mm) sides, beam spans the short (800mm)
  gap.** The beam — the thing that actually accelerates back and forth —
  stays light and short. The stationary frame can be as heavy/rigid as
  needed for free, since it never moves. Tradeoff: the guide rails, now
  spanning 1200mm instead of 800mm, deflect more under the traveling load.

Quantifying that tradeoff: extending the guide-rail span from 800mm to
1200mm increases worst-case deflection (simply-supported, concentrated
load, midspan) from roughly 0.02-0.05mm to roughly **0.12-0.18mm** — still
well under laser kerf width (0.1-0.3mm) and plywood's own thickness
variance, so not a functional problem, just less margin.

**Decision driver**: minimizing the moving gantry's mass/inertia (lighter,
more responsive motion, less strain on motors and belts, less
vibration/overshoot at speed) was judged more valuable than the extra rail
deflection margin, given the deflection at either span size is small enough
not to matter practically. The stationary frame's weight is free — "not
concerned about curb weight" for parts that don't move.

## Decision

- **X-axis = the long axis (1200mm).** Two guide rails
  ([0007](0007-frame-footprint-constraints.md)/[0009](0009-frame-dimensions-final.md)),
  fixed to the frame, MGN12-mounted. The **whole gantry** (800mm beam +
  carriage) travels along these, driven by **dual motors**
  ([0011](0011-x-axis-dual-motor.md)) since two rails must stay
  synchronized.
- **Y-axis = the fixed 800mm axis.** A single MGN12 rail mounted on the
  gantry beam itself. The **laser carriage** travels along it, driven by a
  single motor.

This deliberately diverges from Ortur's own number convention (their
kit extends what they call "Y" to reach 800mm) — that fact was true of
*their* internal architecture, not a binding constraint on ours. Our
machine's internal topology is a free choice within the shared 800x1200mm
outer footprint; we're using X/Y here per the role each axis plays in this
build (X = whole-assembly travel, matching the letter used when this
topology was first proposed in conversation), not to match Ortur's
firmware settings.

## Consequences

- [0008](0008-motion-system-mgn12-rails.md), [0011](0011-x-axis-dual-motor.md)
  (renamed back from "y-axis"), and [0015](0015-x-axis-motor-system.md)
  (renamed back from "y-axis") all updated to match: dual motors and the
  two guide rails are **X** (1200mm); the gantry beam's single rail and
  carriage are **Y** (800mm).
- [0016](0016-gantry-end-plate-rework.md) updated: the end plate connects
  the Y-axis beam to the carriage riding the X-axis guide rails (previously
  documented the other way around).
- [0016](0016-gantry-end-plate-rework.md)'s plate also gets an explicit
  orientation note: the guide rail extrusion is mounted wide-face-vertical
  (per the earlier rigidity decision, using the stronger Ix bending axis),
  so the carriage's usable mounting face is vertical/side-facing in the
  final assembly, not horizontal — the plate's 2D shape doesn't change, but
  it's installed rotated 90° from a "flat shelf" orientation. This wasn't
  documented explicitly before, which caused confusion.
- This is the final settled topology and naming for this build. Future
  ADRs should build on this without re-deriving it.

## Correction history (earlier versions of this ADR)

1. First version: X = long axis (whole-gantry travel), Y = 800mm (carriage
   axis) — based on the user's initial description, before checking Ortur's
   real convention.
2. Second version: flipped to Y = 800mm (whole-gantry-travel, guide rails,
   matching Ortur's `$131` kit behavior), X = long axis (carriage/beam
   span) — corrected after research into Ortur's Y-extension kit, but this
   revision *also* had the mechanical roles backwards relative to what was
   intended (conflated "which letter is 800mm" with "which member plays
   which role").
3. Third version (this one): topology itself changed — guide rails moved
   to the long 1200mm axis for mass/inertia reasons, beam is the short
   800mm member. Axis letters reassigned accordingly (X = 1200mm guide
   rails/whole-gantry travel, Y = 800mm beam/carriage travel) — back to the
   same letters as version 1, now for a deliberate, reasoned topology
   choice rather than by default.
