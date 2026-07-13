# 0023. Power supply: Mean Well LRS-350-24 for motors and controller

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

The AquaMiracle air pump ([0005](0005-air-assist-pump-update.md)) will
also be powered externally (its own wall power), not from the machine's
main PSU — it's a standalone aquarium-style pump with its own plug, no
reason to integrate it into the machine's DC rail.

That leaves the **main machine PSU** to cover only the steppers and
controller board:

- 3x NEMA17 steppers ([0017](0017-stepper-motor-selection.md)): ~144W
  generous worst-case (2A/phase x 24V x 3 motors, accounting for
  simultaneous multi-axis moves)
- Controller board ([0022](0022-controller-board-selection.md)) + logic/
  limit switches: ~10W
- **Total: ~154W**

With standard 25-30% headroom for reliability/longevity, target ~193-200W
minimum.

## Decision

**Mean Well LRS-350-24**: 350W, 24V, 14.6A output, enclosed metal case,
built-in cooling fan. ~$29-37 depending on retailer.

Powers all steppers and the controller board only. The K40 uses its own
included 24V/8A adapter, and the air pump uses its own external power —
neither draws from this rail.

Even though calculated load (~154W) is now well under this PSU's capacity,
keeping the 350W unit rather than downsizing further: the cost difference
between common Mean Well sizes is small, and the extra headroom is cheap
insurance for any future addition (lighting, exhaust fan, etc.) without
needing a PSU swap.

Category: off-the-shelf.

## Consequences

- Two independent power paths in the shop (this PSU + K40's adapter + air
  pump's own plug) rather than one shared rail — more wall outlets/wiring
  runs, but each stays simple and independent, and avoids discarding
  perfectly good included/dedicated power hardware.
- ~196W headroom over calculated load — generous margin, deliberately kept
  even though a smaller PSU would technically suffice.
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
contents photo showing an included 24V/8A adapter. Further corrected to
remove the air pump's load, which is powered externally rather than from
this rail.
