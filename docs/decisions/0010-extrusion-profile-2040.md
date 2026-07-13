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
