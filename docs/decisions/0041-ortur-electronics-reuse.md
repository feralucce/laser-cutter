# 0041. Motion electronics: reuse Ortur LM2 S2 controller, drivers, motors, wiring, switches

Date: 2026-07-29
Status: Accepted (supersedes [0011](0011-x-axis-dual-motor.md), [0017](0017-stepper-motor-selection.md),
[0022](0022-controller-board-selection.md), [0026](0026-t41u5xbb-pin-mapping.md),
[0027](0027-grblhal-auto-square-config.md), [0037](0037-stepper-driver-selection.md))

## Context

This machine started as a ground-up custom build: new frame, new motion
system, and new electronics (grblHAL T41U5XBB + Teensy 4.1 controller,
STEPPERONLINE NEMA17 motors, STEPPERONLINE DM542T drivers), because the
project's starting point — an Ortur LM2 S2 already extended to 800x1200mm
with a 10W module — was assumed to need dual independently-driven,
firmware-synced X motors ([0011](0011-x-axis-dual-motor.md)) to keep a
1200mm-span gantry square, and the Ortur's stock closed-firmware GRBL
1.1f board can't do that kind of ganged/auto-square axis at all.

That assumption turns out to be wrong for this build. The Ortur LM2 S2,
at this exact 800x1200mm frame size, already drives its gantry/rail axis
(800mm, per [0043](0043-adopt-ortur-axis-convention.md)) with a **single
NEMA17 motor whose shaft is extended (via coupler + standoff) to reach
across and drive both sides of the gantry from one continuous shaft** —
manually squared once and locked in place. Squaring is inherent to the
mechanism (both sides are physically the same rotating shaft, not two
motors being kept in sync), not a firmware or electronic concern at all.
This is close to, but not exactly, the "single motor + mechanical link"
option [0011](0011-x-axis-dual-motor.md) originally considered and
rejected in favor of firmware ganging; that rejection was based on a
shaft/belt coupling across a long span being an unproven risk. It isn't
unproven — the Ortur has been cutting with a 10W module at this exact
frame size using exactly this mechanism. A K40-compatible adapter board
exists that lets the Ortur's stock controller drive the K40 laser module
in place of its own diode driver, closing the last gap (laser control)
that seemed to require a new controller.

Reusing the Ortur's controller, drivers, motors, wiring, and switches
removes the entire custom-electronics scope this project had taken on
(controller board selection/wiring/firmware, driver selection, motor
selection) without weakening anything — the mechanism is already proven
at this machine's actual size and load class, just with a lighter head.

## Decision

**Reuse from the existing Ortur LM2 S2 build, as-is:**
- Controller board (stock, GRBL 1.1f firmware)
- Stepper drivers (whatever the Ortur board integrates/uses)
- Steppers: **1 motor with an extended shaft (coupler + standoff) driving
  both sides of the gantry** on the rail/gantry-travel axis (Y, 800mm,
  per [0043](0043-adopt-ortur-axis-convention.md)); 1 separate motor on
  the beam/carriage axis (X, 1200mm) — this replaces this build's earlier
  assumption of 2 independently-driven motors on that axis
- Wiring harness
- Limit switches (X and Y homing switches)
- Laser control: via a K40-compatible adapter board that translates the
  Ortur controller's laser-control output to what the K40 module expects
  — exact product/model not yet identified, needs sourcing

**Squaring**: inherent to the mechanism — one continuous shaft (coupler +
standoff) turns both sides of the gantry together, so there's nothing to
electronically keep in sync. Squaring is a one-time mechanical alignment
at assembly (shaft/coupler position, locked with set screws), not a
runtime or firmware concern. No `$8`/`$170`/`$347-349` tuning, no
ganged-axis firmware build, and — unlike the originally-considered dual-
motor approach — no possibility of the two sides drifting out of sync
over time, since they're mechanically one shaft.

**Superseded ADRs**, no longer applicable to this build:
- [0011](0011-x-axis-dual-motor.md) — the "two independently-driven
  motors, synced in firmware" approach doesn't apply at all; this axis
  uses one motor and one continuous extended shaft instead
- [0017](0017-stepper-motor-selection.md) — motors are reused from the
  Ortur, not purchased
- [0022](0022-controller-board-selection.md) — controller is the Ortur's
  own stock board, not a new grblHAL Teensy build
- [0026](0026-t41u5xbb-pin-mapping.md) — no T41U5XBB in this build, pin
  mapping is moot
- [0027](0027-grblhal-auto-square-config.md) — no firmware auto-squaring;
  squaring is mechanical, done once at assembly
- [0037](0037-stepper-driver-selection.md) — drivers are reused from the
  Ortur, not purchased

**Still valid, unaffected by this ADR:**
- Frame dimensions/footprint ([0009](0009-frame-dimensions-final.md),
  [0035](0035-frame-corner-topology-rework.md)) and extrusion profile
  ([0010](0010-extrusion-profile-2040.md)) — new 2040 frame + gantry beam
  still being built, just carrying reused motion electronics instead of
  new ones
- Laser module selection ([0002](0002-laser-module-selection.md)) — K40
  unchanged
- Axis topology/naming ([0014](0014-axis-naming-convention.md)) — X/Y
  roles unchanged
- Gantry plates ([0040](0040-x-axis-v-wheel-gantry.md)) and laser
  carriage ([0032](0032-y-axis-laser-carriage.md)) — both already flagged
  as open, not-yet-designed work; unaffected by which controller drives
  the motors that move them

## Consequences

- Eliminates essentially the entire custom-electronics track of this
  project: no controller board to solder/wire/flash, no driver modules
  to mount, no motors to source, no firmware ganging to configure, no
  runtime `$` squaring tuning to commission.
- New open item: identify and source the specific K40-compatible adapter
  board that lets the Ortur's stock controller drive the K40 module —
  not yet a named product.
- Limit switch mounting design ([0033](0033-limit-switch-selection.md))
  is still real, open work (the new 2040 frame needs its own switch
  mounts), but the switch part itself and its hole spacing are now a
  known/reused quantity rather than an estimate pending physical
  hardware.
- Wiring harness is reused rather than newly run — the existing wiring
  diagram ([docs/reference/wiring-diagram.svg](../reference/wiring-diagram.svg))
  and fusing/gauge ADRs ([0025](0025-24v-rail-fusing.md),
  [0030](0030-24v-wire-gauge.md)) described a from-scratch harness for
  the new controller; that harness plan no longer applies and should be
  treated as historical, not a task to execute.
- The custom-controller design this project had built up through 2026-07-29
  is preserved in full on the `custom-controller-fallback` git branch, in
  case the Ortur-reuse approach hits a hardware blocker (e.g. the K40
  adapter board doesn't exist/work as expected) and this project needs to
  fall back to it.
