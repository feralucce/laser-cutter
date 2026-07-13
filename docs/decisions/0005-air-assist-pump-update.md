# 0005. Air assist: switch to AquaMiracle 1000GPH commercial air pump

Date: 2026-07-13
Status: Accepted

## Context

[0004](0004-air-assist-pump.md) standardized on the Ktondic 35 L/min pump.
That's being replaced with an **AquaMiracle Aquarium Air Pump, Commercial Air
Pump with Aluminum Housing, 1000GPH** (35W).

Aquarium "GPH" ratings aren't a literal air-volume conversion — cross
referencing AquaMiracle's own L/min figures on comparable models (e.g. their
25W/635GPH unit is spec'd at 40 L/min, and a 35W DC variant is spec'd at
68 L/min), the 1000GPH/35W unit's actual output works out to roughly
**60-70 L/min at ~27kPa (~3.9 PSI)**, not the 264 L/min a naive
gallons-to-liters conversion would suggest.

That flow rate lands in the "heavy cutting" range recommended for a 40W
diode module (vs. 30-50 L/min for general cutting), giving more margin than
the Ktondic's 35 L/min. It's also the same category of pump under the hood
(diaphragm-style, low pressure/high volume) as most dedicated laser air
assist pumps — using an aquarium/hydroponic air pump for this purpose is
common practice, not a compromise. The aluminum housing is a plus for heat
dissipation under continuous duty during longer cuts.

## Decision

Use the **AquaMiracle 1000GPH commercial air pump** as the air assist source
going forward, replacing the Ktondic. Category: off-the-shelf component.

## Consequences

- More airflow margin for cutting 1/2" Baltic birch than the Ktondic offered.
- Fitting size is a non-issue: silicone tubing is used throughout and stretches
  over whatever barb size the pump has, so no adapter is needed regardless of
  outlet size.
- Still no compressor-style moisture/oil concerns — same simple hose/nozzle
  path from pump to module as before, no inline filter/dryer needed.
