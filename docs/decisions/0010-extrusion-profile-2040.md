# 0010. Frame extrusion profile: 2040 over 2020

Date: 2026-07-13
Status: Accepted

## Context

With MGN12 rail selected for motion ([0008](0008-motion-system-mgn12-rails.md))
and frame dimensions finalized at 800x1200mm
([0009](0009-frame-dimensions-final.md)), the frame extrusion profile needed
picking: 2020 (20x20mm) vs 2040 (20x40mm) V-slot aluminum extrusion.

2040's wider face gives a bigger, flatter reference surface to mount the
MGN12 rail against without needing to mill/true an edge for alignment — the
extra width does that job. It also increases resistance to twist/deflection
over an 800-1200mm span compared to 2020, which matters for keeping paired
Y-axis rails coplanar and parallel (a twisted or sagging gantry beam
directly translates into an out-of-square gantry and inaccurate cuts).

Tradeoff: 2040 costs more per meter and is heavier than 2020, but both the
K40's weight ([0002](0002-laser-module-selection.md)) and the goal of clean
cuts through 1/2" hardwood plywood favor the stiffer option.

## Decision

Use **2040 V-slot aluminum extrusion** for the frame. Category: off-the-shelf
component.

## Consequences

- Easier, more reliable MGN12 rail alignment during assembly — no edge
  milling/truing step needed.
- Better resistance to twist/deflection over the 800-1200mm spans than 2020
  would offer, supporting more accurate/square gantry motion.
- Slightly higher material cost and frame weight than 2020 — accepted
  tradeoff given the cutting-quality goals of this build.
- T-slot/T-nut mounting hardware and MGN12 rail attachment method are
  unaffected — 2040 uses the same slot/T-nut standard as 2020 in this
  extrusion family.

## Addendum: 2060 considered and rejected

2060 (20x60mm) was evaluated as a stiffer alternative — published moment of
inertia (Ix, wide face vertical) is 149.34x10⁻⁹ m⁴ vs 2040's 48.16x10⁻⁹ m⁴,
about 3.1x stiffer, at an estimated 135-165% of 2040's per-meter cost.

Calculated deflection for 2040 under the heaviest module under consideration
(~1.4lb/0.635kg, per [0011](0011-x-axis-dual-motor.md)'s future-headroom
note) at midspan of an 800mm beam, using the standard simply-supported
concentrated-load formula (δ = FL³/48EI): **~0.02mm**, or ~0.05mm padded
generously for carriage hardware weight and the beam's own self-weight sag.
That's roughly two orders of magnitude below laser kerf width (0.1-0.3mm)
and well below plywood's own thickness variance — not something that would
show up in cut quality.

2040 has large margin at this load class. 2060's extra stiffness would only
start to matter for multi-kilogram loads or much longer spans than this
build uses, so the cost premium wouldn't buy anything practically useful
here. Decision stands: **2040**.
