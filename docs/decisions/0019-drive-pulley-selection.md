# 0019. Drive pulley (motor gear) selection

Date: 2026-07-13
Status: Accepted

## Context

[0015](0015-x-axis-motor-system.md) specified GT2 20-tooth, 5mm bore
pulleys for the motor side of each belt loop, but no specific product had
been sourced yet.

## Decision

**[BEMONOC 2GT Timing Pulley, 20 teeth, 5mm bore, for GT2 6mm belt](https://www.amazon.com/BEMONOC-Timing-Pulley-Teeth-Printer/dp/B014ID115W)**

Matches spec exactly: 20-tooth, 5mm bore (fits the
[0017](0017-stepper-motor-selection.md) motor's shaft), sized for the 6mm
GT2 belt ([0015](0015-x-axis-motor-system.md)), set-screw mounting.

Quantity: 3 (one per motor — 2x X-axis, 1x Y-axis, [0011](0011-x-axis-dual-motor.md)).

Category: off-the-shelf.

## Consequences

- Completes the drive-side hardware list for the belt loops: motor
  ([0017](0017-stepper-motor-selection.md)), drive pulley (this ADR),
  idler pulley (pending link, [0018](0018-motor-and-idler-mounts.md)),
  motor mount ([0018](0018-motor-and-idler-mounts.md)).
- Still open: belt clamp/clip to anchor the belt to each carriage.
