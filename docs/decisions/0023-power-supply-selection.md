# 0023. Power supply: shared 24V rail, Mean Well LRS-450-24

Date: 2026-07-13
Status: Accepted

## Context

[0002](0002-laser-module-selection.md) flagged the K40 needs 24V/6A but
assumed this would come from its own included supply. Research now shows
the K40 does **not** ship with a power supply — one must be sourced
separately.

Since the K40 (24V), steppers ([0017](0017-stepper-motor-selection.md),
24V-driven per [0015](0015-x-axis-motor-system.md)/[0021](0021-y-axis-motor-system.md)),
and controller ([0022](0022-controller-board-selection.md)) all run on the
same 24V rail, a single shared PSU is simpler than sourcing two separate
supplies — one BOM item, less wiring, no cross-supply grounding concerns.

Load estimate:
- K40 module: 144W (24V x 6A, [0002](0002-laser-module-selection.md))
- 3x NEMA17 steppers: ~144W generous worst-case (2A/phase x 24V x 3 motors,
  accounting for simultaneous multi-axis moves)
- AquaMiracle air pump: 35W ([0005](0005-air-assist-pump-update.md))
- Controller board + logic/limit switches: ~10W
- **Total: ~333W**

Standard PSU sizing practice adds 25-30% headroom above calculated max
load for reliability/longevity — target ~430-450W minimum.

## Decision

**Mean Well LRS-450-24**: 450W, 24V, 18.8A output, enclosed metal case,
built-in cooling fan, short-circuit/overload/overvoltage/over-temperature
protection. ~$65-73 depending on retailer.

Single shared PSU for the K40, all steppers, and the controller board.

Category: off-the-shelf.

## Consequences

- One PSU to source/wire instead of two — simpler BOM and wiring harness.
- ~117-135W headroom over calculated worst-case combined load — comfortable
  margin without being oversized.
- Mean Well is a well-established, reliable brand standard in the CNC/3D
  printer community — low risk choice for a component every other system
  depends on.
- Wiring will need to fan out this single 24V rail to the K40, the
  controller board's power input, and each stepper driver — worth planning
  the distribution (terminal blocks, fusing per branch) as part of the
  wiring design, not yet done.
