# 0023. Power supply: Mean Well LRS-350-24 for motors/controller/air pump

Date: 2026-07-13
Status: Accepted (corrected 2026-07-13 — see note below)

## Context

The K40 kit contents (confirmed via LaserTree's own product photo) include
a **24V/8A (192W) power adapter**, a matching driver-adapter input cable,
sliding plate, spare lens, air tube, and other accessories — the module
ships fully self-powered. This corrects an earlier version of this ADR,
which incorrectly concluded (from a conflicting/lower-confidence search
result, likely describing a different lower-power LaserTree module's
accessory) that the K40 needed a separately-sourced supply.

Since the K40 comes with its own adapter and matching input cable clearly
designed to plug straight in, the simplest approach is to use it as-is for
the laser, rather than discarding it to fold the K40 into a shared rail.

That leaves the **main machine PSU** to cover only the steppers, controller
board, and air pump:

- 3x NEMA17 steppers ([0017](0017-stepper-motor-selection.md)): ~144W
  generous worst-case (2A/phase x 24V x 3 motors, accounting for
  simultaneous multi-axis moves)
- Controller board ([0022](0022-controller-board-selection.md)) + logic/
  limit switches: ~10W
- AquaMiracle air pump ([0005](0005-air-assist-pump-update.md)): 35W
- **Total: ~189W**

With standard 25-30% headroom for reliability/longevity, target ~245-250W
minimum.

## Decision

**Mean Well LRS-350-24**: 350W, 24V, 14.6A output, enclosed metal case,
built-in cooling fan. ~$29-37 depending on retailer.

Powers all steppers, the controller board, and the air pump. The K40 uses
its own included 24V/8A adapter independently, not this rail.

Category: off-the-shelf.

## Consequences

- Two separate power supplies (this one + the K40's included adapter)
  rather than one shared rail — slightly more wiring than a fully
  consolidated approach, but avoids discarding a perfectly good included
  adapter and its matching input cable.
- ~100-160W headroom over calculated worst-case load — comfortable margin
  without being oversized.
- Mean Well is a well-established, reliable brand standard in the CNC/3D
  printer community — low risk choice for a component every other system
  depends on.
- Wiring will need to fan out this 24V rail to the controller board's
  power input and each stepper driver — worth planning the distribution
  (terminal blocks, fusing per branch) as part of the wiring design, not
  yet done.

## Correction note

The original version of this ADR sized a single 450W supply intended to
also power the K40, based on a mistaken belief the module shipped without
its own supply. Corrected after the user shared the K40's actual box
contents photo showing an included 24V/8A adapter.
