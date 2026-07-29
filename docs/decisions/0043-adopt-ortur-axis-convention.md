# 0043. Axis naming: adopt Ortur's own X/Y convention

Date: 2026-07-29
Status: Accepted (supersedes [0014](0014-axis-naming-convention.md))

## Context

[0014](0014-axis-naming-convention.md) deliberately chose the *opposite*
of Ortur's own axis naming: X = the long 1200mm axis (whole gantry
travel), Y = the short 800mm axis (beam-mounted carriage). That made
sense when this was a from-scratch custom build with its own
controller/firmware being configured from zero.

It no longer makes sense now that the controller, drivers, motors,
wiring, and firmware are all being reused directly from the Ortur
([0041](0041-ortur-electronics-reuse.md)) — the Ortur's own firmware,
motherboard silkscreen labels, wiring harness connectors, and any
support material (manuals, replacement-part listings, forum threads) all
use Ortur's convention. Keeping a project-invented reversed convention on
top of physically reused Ortur hardware/firmware is a real
mislabeling risk, not just a documentation inconsistency — e.g. wiring
the reused "Y motor" to what this project's old ADRs called "X" would be
backwards from how the harness is actually terminated.

**Confirmed Ortur convention, corrected**: initial research (Ortur's
stock Y-axis extension kit, which stretches the *stock* 390x410mm working
area to 390x800mm) led to an incorrect assumption that Y is always the
longer axis. That's only true for the *stock* kit's own numbers — it
doesn't hold for this specific machine. Per the user directly (owns and
has physically extended this exact machine): **the gantry rides on the
800mm axis**, not the 1200mm one. This machine's 1200mm dimension comes
from a further **custom** beam elongation beyond what Ortur's stock kit
offers (the stock kit only reaches 800mm on the rail axis; reaching
1200mm on the *other* axis is a separate, non-stock modification the
user already did). So on this specific machine: **Y = the short 800mm
axis** (gantry/rail travel, stock-kit-extended), **X = the long 1200mm
axis** (custom-elongated beam, carriage travel).

## Decision

Adopt Ortur's own convention, matching this specific machine's actual
extended geometry:

- **Y-axis = the short axis (800mm).** Two guide rails, one NEMA17 motor
  with an extended shaft (coupler + standoff) driving both sides from a
  single continuous shaft ([0041](0041-ortur-electronics-reuse.md)),
  whole gantry (beam + carriage) travels along these — this is the axis
  reached via Ortur's stock Y-extension kit.
- **X-axis = the long axis (1200mm).** Single MGN12 rail on the gantry
  beam itself (custom-elongated beyond stock), single NEMA17 motor,
  laser carriage (holding the K40) travels the full 1200mm along this
  beam.

**Critical translation note**: every ADR in this repo written before
this one — [0008](0008-motion-system-mgn12-rails.md),
[0011](0011-x-axis-dual-motor.md), [0014](0014-axis-naming-convention.md),
[0015](0015-x-axis-motor-system.md), [0016](0016-gantry-end-plate-rework.md),
[0019](0019-drive-pulley-selection.md), [0020](0020-belt-clamp-selection.md),
[0021](0021-y-axis-motor-system.md), [0026](0026-t41u5xbb-pin-mapping.md),
[0027](0027-grblhal-auto-square-config.md), [0032](0032-y-axis-laser-carriage.md),
[0035](0035-frame-corner-topology-rework.md), [0036](0036-gantry-end-cap-redesign.md),
[0038](0038-y-axis-dual-rail.md), [0039](0039-y-axis-single-rail-dual-block.md),
[0040](0040-x-axis-v-wheel-gantry.md), [0041](0041-ortur-electronics-reuse.md),
[0042](0042-captured-belt-drive.md) — uses the **old, now-reversed**
convention throughout their text (X = long/whole-gantry-travel axis, Y =
short/carriage axis). None of those files are being rewritten to swap
their letters; when reading any of them for physical/mechanical facts,
**swap X and Y mentally**. Only the physical facts (which member is
shaft-driven, which is 1200mm, which one carries the K40) are still
authoritative in those files — their letter labels are not, as of this
ADR.

Going forward, all new ADRs, hardware files, and BOM entries use Ortur's
convention (Y = short/dual-motor/rail axis, X = long/single-motor/
carriage axis) directly, no swap needed.

## Consequences

- Removes the mismatch risk between this project's documentation and the
  physically reused Ortur controller/firmware/wiring — the single
  biggest reason for this change.
- Real ongoing risk: 18 prior ADRs now require a mental swap to read
  correctly. [0014](0014-axis-naming-convention.md)'s own history shows
  this exact kind of X/Y mixup has bitten this project twice before —
  treat every future reference to "X" or "Y" from an ADR dated before
  2026-07-29 with active suspicion until cross-checked against this
  table.
- Wiring: when the reused Ortur harness is physically connected, its
  connectors/labels are the ground truth — match this project's new
  convention (Y = short axis) to whatever the harness's own connector
  labeling says, not to any pre-existing project document.
- **Real mechanical reversal from [0014](0014-axis-naming-convention.md)'s
  original reasoning**: 0014 deliberately kept the moving beam short
  (800mm) and put the guide rails on the long (1200mm) axis specifically
  to minimize the beam's moving mass/inertia. This machine's actual,
  already-proven geometry is the opposite — the beam is the long member
  (1200mm), carrying the carriage/K40 across the full span, while the
  rails (dual-motor axis) are only 800mm. Not a problem to fix — the
  Ortur has already been cutting at this exact geometry — just a real
  difference from the original design rationale, worth remembering if
  any old ADR's stiffness/deflection reasoning is ever revisited.
- No BOM changes — this is a naming/documentation change only, no parts
  added or removed.
