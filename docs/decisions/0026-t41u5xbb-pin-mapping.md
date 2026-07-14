# 0026. T41U5XBB pin/header mapping

Date: 2026-07-14
Status: Accepted

## Context

The T41U5XBB's screw terminals are grouped and labeled by function on the
board's silkscreen (per its v2.07 manual), rather than numbered generically:

- **Stepper motor outputs**: one 4-pin group (G/Stp/Dir/En) per axis — X,
  Y, Z, A, B. 5V signals.
- **Limit switch inputs**: one per axis (X, Y, Z, A, B). Opto-isolated, 5V.
- **Control inputs**: Halt/Stop, Door, Feed/Hold, Cycle/Start. Opto-isolated, 5V.
- **Probe input**: opto-isolated, 5V.
- **Spindle group** (output): PWM, Direction, Enable, Ground — 5V TTL. Plus
  a separate 0-10V analog output (needs a 12V+ external feed to the
  amplifier if used).
- **Relay groups** (output): Flood, Mist, Spindle, Vac/Dust Collector, Aux0,
  Aux1, Aux2 — available as both direct relay-coil-driving outputs and 5V
  TTL (SSR-compatible) outputs.
- **Digital input**: 4 general-purpose Schmitt-triggered pins (St0-St3).
- **I2C header**, **Vac/DC trigger** input, **12V** and **5V** power
  terminals.

This machine only needs 3 real stepper motors — X1, X2 (ganged, per
[0011](0011-x-axis-dual-motor.md)'s "X + mirrored A-axis" plan), and Y —
plus the K40's control signal and the E-stop's Halt input
([0024](0024-e-stop-wiring.md)). Everything else on the board is either
reserved for future use or unused for now.

Confirmed from grblHAL's own community docs: the ganged second motor of an
auto-squared axis is wired to whichever axis letter is otherwise unused,
with $ settings (not decided in this ADR — tracked separately, see
Consequences) telling grblHAL to treat it as a mirrored partner rather than
an independent axis. The common convention (and what [0011](0011-x-axis-dual-motor.md)
already anticipated) is to use the **A** axis for this, keeping Z and B
free.

## Decision

Physical wiring assignment for this machine:

| T41U5XBB terminal group | Wired to | Notes |
|---|---|---|
| X stepper + X limit | X1 motor (one gantry rail side) | primary X reference |
| A stepper + A limit | X2 motor (other gantry rail side) | ganged/auto-square partner, per [0011](0011-x-axis-dual-motor.md) |
| Y stepper + Y limit | Y motor | single motor, [0021](0021-y-axis-motor-system.md) |
| Z stepper + Z limit | **unpopulated** | reserved for a future Z-axis/focus motor, per [0022](0022-controller-board-selection.md)'s 5-axis headroom note |
| B stepper + B limit | **unpopulated** | reserved for a future rotary attachment |
| Halt (control input) | E-stop switch, pole 1 | per [0024](0024-e-stop-wiring.md) |
| Door (control input) | jumper (no Safety Door sensor) | per [0024](0024-e-stop-wiring.md)'s follow-on note |
| Feed/Hold, Cycle/Start | **unpopulated** | no pendant/control panel decided yet |
| Probe | **unpopulated** | no touch probe on a laser |
| Spindle group: PWM | K40 TTL/PWM cable, yellow wire | confirmed 5V TTL match, [0024](0024-e-stop-wiring.md) |
| Spindle group: Ground | K40 TTL/PWM cable, black wire | |
| Spindle group: Direction, Enable | **unpopulated** | K40 doesn't use these |
| 0-10V output | **unpopulated** | K40 uses PWM/TTL, not analog |
| Relay groups (Flood/Mist/Spindle/Vac-Dust/Aux0-2) | **unpopulated for now** | candidate for air-assist pump on/off control (M7/M8) later — not decided in this ADR |
| Digital input (St0-3), I2C, Vac/DC trigger | **unpopulated** | no current use |

Per the manual's own recommendation, all screw terminals will still be
soldered on during assembly even where unpopulated for now — retrofitting
them later is difficult due to their interlocking design.

## Consequences

- Confirms the physical wiring plan needed before assembly — no more
  guessing which screw terminal group a given wire goes to.
- Z and B axes are deliberately left free, preserving the 5-axis headroom
  [0022](0022-controller-board-selection.md) called out for a future
  Z-focus motor or rotary attachment.
- Does **not** decide the grblHAL `$` settings needed to actually configure
  A as X2's ganged/auto-square partner (motor ganging bitmask,
  auto-square-enable bitmask, squaring-travel limit) — that's the
  already-tracked follow-on work from [0022](0022-controller-board-selection.md)
  ("auto-squaring configuration... still needs to be set up").
- The Spindle group's Direction and Enable outputs, and all Relay outputs,
  are free — worth revisiting when the air-assist pump ([0004](0004-air-assist-pump.md)/[0005](0005-air-assist-pump-update.md))
  gets wired, since it's currently just plugged into its own wall power
  with no on/off tied to the laser firing.
- Feed Hold / Cycle Start / Probe inputs are left unpopulated — if a
  physical control pendant or touch-probe is added later, wiring is
  straightforward (terminals are already present) but not designed here.
