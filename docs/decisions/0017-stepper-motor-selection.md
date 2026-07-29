# 0017. Stepper motor: STEPPERONLINE NEMA17, 59Ncm

Date: 2026-07-13
Status: Superseded by [0041](0041-ortur-electronics-reuse.md)

## Context

X-axis (dual motor, [0011](0011-x-axis-dual-motor.md)) and Y-axis (single
motor) both need NEMA17 steppers per the motor system design
([0015](0015-x-axis-motor-system.md)). Needed: standard NEMA17 body (fits
the off-the-shelf motor mounts), 5mm D-shaft (standard GT2 pulley bore),
enough torque for a belt-driven gantry axis at our load, from a reliable/
well-documented source.

## Decision

**STEPPERONLINE NEMA17 Bipolar, 59Ncm (84oz·in) holding torque, 2A, 48mm
body, 4-lead with 1m cable + connector.**
https://www.amazon.com/STEPPERONLINE-Stepper-Bipolar-Connector-compatible/dp/B00PNEQKC0

59Ncm gives real margin over what a belt-driven axis needs at this load
(not just barely adequate) — matches the pattern of choosing headroom over
minimum-spec throughout this build. STEPPERONLINE is a widely-used,
well-documented brand for this exact application (Voron/RepRap/OpenBuilds
builds), and the motor ships with a pre-terminated cable, reducing wiring
work.

**Quantity: 3** — 2 for X-axis (dual motor), 1 for Y-axis (single motor).
A 5-pack may be worth buying instead for spares / a head start on the
carriage-axis motor deferred earlier in this build.

Category: off-the-shelf.

## Consequences

- Motor mount brackets and pulleys ([0015](0015-x-axis-motor-system.md))
  need to match this motor's standard NEMA17 mounting pattern (31x31mm
  screw holes, ~22mm shaft boss) and 5mm shaft — standard, no compatibility
  risk expected.
- 48mm body length is slightly longer than the cheapest NEMA17 variants
  (typically ~34-40mm) — worth double-checking clearance in the motor mount
  area once that bracket is finalized.
- Driver/controller board selection (still open) needs to handle up to 2A
  per phase for this motor.
