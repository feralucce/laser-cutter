# 0024. E-stop wiring: AC-side panic-paddle switch (was: DC dual-channel relay design)

Date: 2026-07-14
Status: **Superseded 2026-07-29** — the DC-side mushroom switch + relay
design below is cut entirely, replaced with an AC-side panic-paddle
safety switch ahead of the whole machine. Kept below for history/rationale.

## Update (2026-07-29): AC-side panic-paddle switch, no DC relay

User's call: skip the DC-side E-stop switch/relay pair entirely. Power
for the whole machine — the Mean Well 24V rail (steppers/controller) and
the K40's own 24V/8A adapter — both run off one already-owned power
strip. Added to that: a **110-120V AC panic-paddle safety switch**
(marketed for table saws/milling machines — large red stop-sign paddle,
on/off, mains-rated) wired ahead of the strip, so hitting the paddle cuts
mains power to the entire setup at once.

This actually restores most of what the original design provided,
just via a different mechanism:
- **Panic-reflex speed**: a large paddle switch is exactly the
  "hit-it-without-looking" ergonomics a mushroom button gives — this
  wasn't a downgrade after all, just moved from the DC side to the AC
  side.
- **Hardware-guaranteed cutoff**: an AC-side mains switch ahead of *both*
  the steppers/controller PSU and the K40's adapter is arguably a more
  complete guarantee than the original design, which only hard-cut the
  K40's rail — this cuts everything, including the controller itself,
  independent of firmware state.

**What's still genuinely different from the original dual-channel
design**: no separate *software* Halt signal to the controller — the
original design gave grblHAL a fast, controlled stop (steppers decelerate
via firmware) as one channel, with the hardware relay as a second,
independent guarantee. This paddle switch is now the only channel: it's
an abrupt full power cut, not a graceful stop, and there's no longer a
distinct low-level Halt input wired at all ([0026](0026-t41u5xbb-pin-mapping.md)).
For a hobby laser (vs. a machine where uncontrolled motor stop is itself
a hazard), this is a reasonable tradeoff — noted once, not a blocker.

**What this removes from the BOM**: the 22mm mushroom E-stop switch and
the 24VDC SPDT relay are no longer needed (switch already in hand —
consider it a surplus/return candidate). The K40 rail's fuse between the
adapter and the module ([0025](0025-24v-rail-fusing.md)) still applies
for overcurrent protection — it's just no longer gated by a relay,
straight adapter-to-module with a fuse in line.

**What's added to the BOM**: the AC panic-paddle switch itself, wired
ahead of the already-owned power strip.

---

**Original decision below, superseded but kept for context:**

## Context

The T41U5XBB's manual (v2.07) documents a dedicated **Halt/Stop** control
input — one of four opto-isolated control inputs (Feed Hold, Cycle Start,
Halt/Stop, Safety Door), 5V logic, wired via screw terminal. This is
grblHAL's E-stop equivalent: triggering it immediately stops motion and
puts the system in an Alarm state. The manual explicitly recommends *"you
do not disable the Halt function and that you install a dedicated Halt
button in a prominent location on your CNC machine."*

However, the Halt input alone is a **software-mediated** stop — grblHAL
sees the input change and reacts by halting steppers and de-asserting the
spindle/laser PWM output. That's near-instant, but it depends on the
firmware/controller being responsive. A real E-stop's value is in *not*
depending on that: it should still work if the board has locked up or a
firmware bug leaves the laser firing.

This matters concretely here because the K40 laser module has **its own
dedicated 24V/8A power adapter**, entirely independent from the Mean Well
LRS-350-24 rail that powers the steppers and controller
([0023](0023-power-supply-selection.md)). A single E-stop button needs to
reach both power domains: signal the controller to halt motion, and
physically remove power from the K40 so the diode cannot fire regardless
of what the firmware is doing.

Confirmed while researching this: the K40's 3-pin TTL/PWM control cable
(2EDG-3.81 connector: red VCC, black GND, yellow PWM/TTL) expects a
standard 5V TTL logic signal — LaserTree's own documentation lists
compatibility with Ortur/Neje/Sculpfun/etc. control boards, all of which
output 5V TTL. The T41U5XBB's spindle-group PWM/Direction/Enable output is
explicitly "a 5V group" per its manual. This resolves the open question
from [0022](0022-controller-board-selection.md) about the K40's exact PWM
voltage spec — it's a standard match, no level-shifting needed.

## Decision

**Dual-channel E-stop**, using a double-pole (2NC), latching 22mm mushroom
button (push-to-stop, twist-to-release — e.g. uxcell/mxuteuk-style
generic CNC E-stop switch, ~$10), mounted in a prominent, easy-to-reach
spot on the frame.

- **Pole 1** wired NC in series with the T41U5XBB's **Halt/Stop** screw
  terminal — standard grblHAL control-input wiring (switch between the
  Halt signal pin and its ground reference). This is the fast,
  firmware-level stop: motion halts, grblHAL enters Alarm state, spindle/
  laser PWM output is de-asserted in software.
- **Pole 2** wired NC in series with the coil of a 24VDC automotive-style
  SPDT relay (rated ≥15A, well above the K40's 8A draw), which is inserted
  in-line on the K40's 24V/8A adapter output — between the adapter and the
  module's main power input (not the TTL/PWM control cable). Pressing
  E-stop de-energizes the relay coil, opening the contacts and removing
  **all power** from the K40 module. This is the hardware-guaranteed half:
  the laser diode cannot fire without power, independent of firmware
  state.

Using NC (normally-closed) contacts on both poles, per grblHAL's own
recommendation — a broken wire or bad connection then reads as a fault
(system halts) rather than silently failing open.

Category: off-the-shelf (E-stop switch, relay).

## Consequences

- Two independent stop paths for the two things that actually need
  stopping: motion (software Halt, near-instant but firmware-dependent)
  and laser fire (hardware relay cutoff, guaranteed regardless of
  firmware/controller state).
- Steppers losing power abruptly on E-stop is an accepted tradeoff — unlike
  an active laser diode, de-energized steppers mid-motion aren't a
  personal-safety hazard for this machine.
- New hardware needed: 1x 2NC mushroom E-stop switch, 1x 24VDC SPDT relay
  (with flyback protection/socket), wire gauge matched to the K40's 8A draw
  on the switched leg.
- The relay's switched leg should get its own fuse as part of the
  still-open per-branch fusing design ([0023](0023-power-supply-selection.md))
  — sized for the K40's 8A draw plus headroom (~10A).
- grblHAL's `$14` (control pin invert mask) should be left at default for
  NC wiring (inversion is only needed for NO switches) — worth confirming
  at commissioning once the board is wired and flashed.
- Does **not** yet cover a Safety Door input (separate open item, not
  requested here) — the enclosure/downdraft-table setup
  ([0006](0006-bed-and-enclosure-scope.md)) doesn't currently have a door
  sensor, so `$14`'s Safety Door bit will need inverting (or a jumper
  installed) so grblHAL doesn't sit in a permanent door-open alarm state.
