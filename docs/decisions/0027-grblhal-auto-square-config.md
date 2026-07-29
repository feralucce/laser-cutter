# 0027. grblHAL auto-squaring configuration for the ganged X-axis

Date: 2026-07-14
Status: Superseded by [0041](0041-ortur-electronics-reuse.md)

## Context

[0011](0011-x-axis-dual-motor.md) calls for X1/X2 synced in firmware as a
mirrored pair, and [0026](0026-t41u5xbb-pin-mapping.md) wires X2 to the
board's **A** axis outputs/limit input. What was still missing: how
grblHAL is actually told to treat A as X's ganged partner rather than an
independent 4th axis.

Researched this directly against grblHAL's own source (`my_machine.h`
template, shared across grblHAL board families including the Teensy 4.x/
iMXRT1062 driver the T41U5XBB uses) and community discussion:

- **Ganging is a compile-time firmware choice**, not a runtime `$`
  setting. It's controlled by `#define`s in `my_machine.h`:
  ```
  #define X_GANGED       1
  #define X_AUTO_SQUARE  1
  ```
  This requires a board map that supports more than 3 motors — confirmed
  true for the T41U5XBB (5-axis capable, [0022](0022-controller-board-selection.md)).
- **Standard prebuilt binaries do not have this enabled.** The T41U5XBB's
  listed prebuilt options (`3 axis usb no opts`, `5 axis usb no opts`,
  etc.) are generic axis-count builds — none of them pre-enable X-ganging.
  Getting X_GANGED/X_AUTO_SQUARE requires either using grblHAL's web
  builder with these options checked, or compiling
  [phil-barrett/grblHAL-teensy-4.x](https://github.com/phil-barrett/grblHAL-teensy-4.x)
  from source with a modified `my_machine.h`.
- A related option, `X_GANGED_LIM_MAX`, would make A's limit input act as
  a *max*-travel switch instead. We don't want that: per
  [0011](0011-x-axis-dual-motor.md)'s squaring approach, A's limit switch
  needs to independently detect its own side's min-travel homing trigger
  (that's the whole point of auto-squaring — each side homes to its own
  switch, and grblHAL corrects any skew between them). So this stays
  **unset**.
- Beyond the compile-time flags, several runtime `$` settings finish the
  configuration, but their actual values can't be responsibly picked until
  the machine is physically wired and can be homed at least once:
  - `$22` — Homing enable (must be `1`, prerequisite for squaring to run
    at all)
  - `$8` — Ganged Dir Invert Mask — whether X2's direction needs
    inverting depends on how the motor ends up physically wired/mounted,
    unknowable in advance
  - `$170` — Auto Square Offset for the X axis (fine pulloff trim to
    correct small residual skew) — this is a measured correction value,
    only meaningful after the gantry has actually been homed and checked
    for square
  - `$347` / `$348` / `$349` — Dual Axis Length Fail percent/min/max
    (how much skew is tolerated before grblHAL alarms instead of
    correcting) — reasonable defaults exist but the right value depends on
    the actual gantry's mechanical slop, not something to guess now

## Decision

- Build (or web-build) custom grblHAL firmware for the T41U5XBB with:
  ```
  #define X_GANGED       1
  #define X_AUTO_SQUARE  1
  ```
  and `X_GANGED_LIM_MAX` left disabled, so A's limit switch acts as X2's
  own min-travel/squaring reference switch rather than a max-travel
  switch.
- Defer setting `$8`, `$170`, `$347`, `$348`, `$349` to first commissioning
  (after the gantry is wired and can be jogged/homed) rather than guessing
  values now. `$22=1` can and should be set as soon as the firmware is
  flashed, since it's a prerequisite with no ambiguity.

Category: firmware/software configuration, not a physical part — no BOM
impact.

## Consequences

- Closes the compile-time half of this open item — there's now a concrete
  firmware build target instead of an open question.
- The board can no longer just use an off-the-shelf prebuilt binary;
  whoever flashes it needs to either use grblHAL's web builder with these
  options selected, or build from source. Worth doing this as one of the
  first steps once the board arrives, since re-flashing later after wiring
  is still easy but best not deferred indefinitely.
- The runtime `$` tuning ($8, $170, $347-349) is explicitly a
  commissioning-time task, not something resolved by this ADR — tracked as
  follow-on work, same pattern as [0016](0016-gantry-end-plate-rework.md)'s
  "must be checked against actual hardware" items.
- If a Z-axis or rotary attachment is added later ([0022](0022-controller-board-selection.md)'s
  headroom note), the firmware will need X_GANGED/X_AUTO_SQUARE preserved
  across any rebuild that also enables those axes.
