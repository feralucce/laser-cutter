# 0004. Air assist: Ktondic pump

Date: 2026-07-13
Status: Superseded by [0005](0005-air-assist-pump-update.md)

## Context

The K40 module ([0002](0002-laser-module-selection.md)) needs air assist. Two
sources are on hand: a Ktondic 35 L/min dedicated air assist pump (already
owned, with the water trap/filter/regulator plumbing already worked out from
prior use), and a 25 gallon shop compressor.

Recommended air assist flow for a 40W diode module is roughly 30-50 L/min for
cutting, up to ~60 L/min for heavy cutting. The Ktondic sits right in that
range and is purpose-built: steady continuous flow, no oil/moisture in the
line. The shop compressor can supply far more air, but compressor output is
hot and moist — it condenses as it cools, and water reaching the lens can
crack it instantly. Using the compressor safely would need an inline water
trap, coalescing filter, regulator, and on/off valve, plus something to
smooth out the tank refill on/off cycling. All solvable, but more plumbing
and failure modes than a job like this needs.

## Decision

Standardize on the **Ktondic pump** as the air assist source for this and
future builds. Category: off-the-shelf component.

Current unit is 35 L/min. A higher-flow Ktondic unit may be purchased later
to add margin for cutting (up toward the ~60 L/min heavy-cutting
recommendation) — same brand/interface, just more airflow headroom.

The 25 gallon compressor stays available for other shop uses but is not part
of the laser cutter design.

## Consequences

- No inline water trap/coalescing filter/dryer needed in the design — the
  Ktondic pump doesn't require it.
- The build should assume a simple hose/nozzle path from pump to the K40's
  air assist port, not a compressor-fed manifold.
- If a higher-flow Ktondic is bought later, no redesign needed beyond
  possibly a different hose barb size — treat as a drop-in replacement.
