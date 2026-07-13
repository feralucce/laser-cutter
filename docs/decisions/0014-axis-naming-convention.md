# 0014. Axis naming convention: X = long axis, Y = fixed 800mm axis

Date: 2026-07-13
Status: Accepted

## Context

Earlier ADRs ([0008](0008-motion-system-mgn12-rails.md),
[0011](0011-x-axis-dual-motor.md)) used X/Y labels inconsistently with the
convention the source machine (Ortur LM2 S2) actually uses, creating a risk
of confusion once we get to controller/firmware config, where X/Y labels
must match real wiring.

To settle this, we checked what Ortur itself calls the axis that the
800mm extension kit extends. Multiple listings for the Ortur kit explicitly
call it a "**Y-axis** Extension Kit," and the GRBL parameter changed to
unlock the extended range is **`$131`** — the standard GRBL Y-axis
max-travel setting (`$130`=X, `$131`=Y, `$132`=Z). This is confirmed
independently by a LightBurn forum user who reset `$131=850mm` to get the
extended range working.

So per Ortur's own naming and the actual GRBL setting involved: **the
800mm axis is Y**, not X.

## Decision

Standardize this project's axis naming on:

- **Y-axis = the fixed 800mm axis** (the downdraft-table-constrained axis,
  [0007](0007-frame-footprint-constraints.md)/[0009](0009-frame-dimensions-final.md)).
  The gantry beam spans this axis; the laser carriage travels along it.
- **X-axis = the long/flexible axis** (up to 1219mm,
  [0009](0009-frame-dimensions-final.md)). The whole gantry (crossbeam +
  both end carriages) travels along this axis, driven by dual motors
  ([0011](0011-x-axis-dual-motor.md)).

This matches Ortur's own convention and the standard GRBL `$130`/`$131`
axis mapping, minimizing confusion when we get to controller/firmware setup.

## Consequences

- [0008](0008-motion-system-mgn12-rails.md) and
  [0011](0011-x-axis-dual-motor.md) have been corrected/renamed to use this
  naming (0011 renamed from "Y-axis dual motor" to "X-axis dual motor").
- Any future ADR, wiring diagram, or firmware config should follow this
  convention: X = long axis (whole-gantry travel, dual motor), Y = 800mm
  axis (gantry beam/carriage travel).
