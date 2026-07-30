# 0044. Laser module: switch to LaserTree K30 (30W optical)

Date: 2026-07-29
Status: Accepted (supersedes [0002](0002-laser-module-selection.md))

## Context

[0002](0002-laser-module-selection.md) picked the K40 over the K30
because the stated goal at the time was reliably cutting 1/2" (12.7mm)
Baltic birch plywood in one pass — the K30 was found borderline for that
(LaserTree's own chart rates it for 15mm in one pass, but an independent
MDF test needed ~4 passes at 12mm).

The actual, real-world use case is different: primarily cutting **3mm
and 6mm** Baltic birch plywood, with **12mm as an occasional case that
can be laminated from thinner layers** rather than needing routine
single-pass 12mm cutting. Under that actual usage, the K30's one-pass
15mm rating clears the 12mm ceiling with margin, and the borderline
concern that ruled it out in 0002 doesn't apply — 3/6mm are trivial for
a 30W module.

## Decision

**LaserTree K30** (30W optical, ~34.2W measured), $449, 710g, 66x64x134mm,
24V/5A (120W) — https://lasertree.com (K30 30W Optical Power Laser Module).

## Consequences

- **Lighter carriage load**: 710g vs the K40's 900g — a real plus for
  the captured-belt carriage design ([0042](0042-captured-belt-drive.md))
  and the not-yet-designed laser carriage ([0032](0032-y-axis-laser-carriage.md)),
  both still open tasks. Any dimension/weight-budget reasoning in older
  ADRs referencing "900g K40" should be read as 710g going forward.
- **Lower cost**: $449 vs $549.
- **Lower power draw**: 24V/5A (120W) vs 24V/6A (144W) — worth
  double-checking against the PSU headroom ([0023](0023-power-supply-selection.md)),
  though the PSU was already sized well above either module's draw.
- **Mounting interface not yet confirmed identical to the K40's**: 0002
  recorded the K40's mounting as a sliding plate with M5/M3 holes and a
  115mm height-adjustment slide rail. Whether the K30 shares this exact
  interface (same LaserTree K-series family, so plausible) isn't
  confirmed — worth checking against the physical module once in hand,
  same "verify against real hardware" caveat this project already
  applies elsewhere.
- Air assist, PSU, and all other downstream requirements from 0002 are
  otherwise unaffected — the K30 still needs external air assist and its
  own bundled 24V supply, same as the K40 did.
- BOM's "still ordering" line updated to K30.
