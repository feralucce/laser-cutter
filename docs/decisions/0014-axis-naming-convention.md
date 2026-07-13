# 0014. Axis naming convention: Y = 800mm guide rails, X = gantry beam span

Date: 2026-07-13
Status: Accepted (corrected 2026-07-13 — see note below)

## Context

Earlier ADRs used X/Y labels inconsistently, creating a risk of confusion
once we get to controller/firmware config, where X/Y labels must match real
wiring. To settle this, we checked what Ortur itself calls the axis that the
800mm extension kit extends.

Multiple listings for the Ortur kit explicitly call it a "**Y-axis**
Extension Kit," and the GRBL parameter changed to unlock the extended range
is **`$131`** — the standard GRBL Y-axis max-travel setting (`$130`=X,
`$131`=Y, `$132`=Z). Confirmed independently by a LightBurn forum user who
reset `$131=850mm` to get the extended range working.

On the real Ortur/typical gantry-laser architecture, the axis the kit
extends is the one **the whole gantry (crossbeam + carriage + its own rail)
travels along**, riding two parallel fixed rails — not the axis the laser
carriage travels along the crossbeam itself. So:

- **Y = the axis the whole gantry travels along** (two fixed guide rails,
  extended to 800mm by Ortur's kit).
- **X = the axis the carriage travels along the gantry beam** (native
  ~400mm on stock Ortur, custom-extended further on non-stock builds).

This also lines up with the structural constraint from
[0007](0007-frame-footprint-constraints.md): the fixed 800mm axis is where
the machine's frame rests on the downdraft table, which is inherently the
**guide rail spacing** (the two rails the gantry rides), not the gantry
beam's own span.

There's also a structural reason to prefer this mapping, not just naming
convention: the guide rails carry the heaviest moving load (the whole
gantry assembly, including the second axis's own rail/carriage/motor),
while the gantry beam only carries the carriage + laser module. Since
deflection scales with span³, putting the **heavier load on the shorter
span** (800mm) and the **lighter load on the longer span** (~1.2m)
minimizes worst-case sag more effectively than the reverse.

## Decision

Standardize this project's axis naming on:

- **Y-axis = the fixed 800mm axis.** Two parallel guide rails
  ([0007](0007-frame-footprint-constraints.md)/[0009](0009-frame-dimensions-final.md)),
  fixed to the frame. The **whole gantry** (crossbeam + X-rail + carriage)
  travels along these, driven by **dual motors**
  ([0011](0011-y-axis-dual-motor.md)) since two rails must stay
  synchronized.
- **X-axis = the long/flexible axis** (up to 1219mm,
  [0009](0009-frame-dimensions-final.md)). A single MGN12 rail mounted on
  the gantry beam itself; the **laser carriage** travels along it, driven
  by a single motor.

This matches Ortur's own convention, the GRBL `$130`/`$131` mapping, the
downdraft table's structural constraint, and the deflection-minimizing
load/span pairing.

## Consequences

- [0008](0008-motion-system-mgn12-rails.md) and
  [0011](0011-y-axis-dual-motor.md) corrected to match: dual motors and
  the two guide rails are **Y** (not X); the gantry beam's single rail and
  carriage are **X** (not Y).
- [0013](0013-gantry-end-plate-design.md)'s design is being reworked (SVG
  deleted for now) — any rework should reference the corrected Y-axis
  carriage blocks as what the end plate attaches to.
- Any future ADR, wiring diagram, or firmware config should follow this
  corrected convention.

## Correction note

This ADR originally had the letters right (Y=800mm) but the *mechanical
roles* backwards — it described Y as the carriage/gantry-beam axis and X as
the whole-gantry-travel axis, the opposite of Ortur's real architecture.
Corrected in place since the error was caught before any hardware was
ordered against it.
