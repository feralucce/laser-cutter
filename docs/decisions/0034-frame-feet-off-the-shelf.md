# 0034. Frame feet: off-the-shelf adjustable leveling feet, no table screw-down

Date: 2026-07-14
Status: Accepted (supersedes the feet portion of [0012](0012-corner-joints-and-feet.md);
that ADR's corner-joint decision is unaffected and still stands)

## Context

[0012](0012-corner-joints-and-feet.md) called for a custom PLA-CF printed
foot bridging two interfaces: a T-nut mount to the 2040 extrusion, and a
screw-down attachment into the downdraft table's 2x4 top. That part was
never actually modeled — flagged as a gap in the 2026-07-14 full-repo
review, the same "decided but not modeled" gap the Y-carriage
([0032](0032-y-axis-laser-carriage.md)) and limit switch mount
([0033](0033-limit-switch-selection.md)) just closed elsewhere.

Revisited from scratch: off-the-shelf adjustable leveling feet for 20-series
(2020/2040) V-slot extrusion are a well-established, widely-available
product category — M5-threaded stud (either threading directly into the
extrusion's end bore or via an M5 T-nut in the slot), swivel pad base,
height-adjustable. This is a simpler, purely off-the-shelf option that
[0012](0012-corner-joints-and-feet.md) didn't fully consider before jumping
to a custom part.

The gap: essentially every generic leveling foot in this category is built
for resting on a floor via its own weight/friction through a swivel pad —
not for being bolted down into a supporting surface. Checked specifically
for a foot that does both (T-slot mount + screw-down base): found exactly
one candidate (TNUTZ LF-015-A) with a screw-down base, but it's sized for
8mm-slot/40-series extrusion, not our 6mm-slot 2020/2040 — wrong hardware
family, not usable here.

Given that, the choice is between (a) an off-the-shelf foot + a small
custom screw-down adapter, (b) the fully custom PLA-CF foot as originally
planned, or (c) dropping the screw-down requirement entirely and relying on
the machine's own weight (extrusion frame + motors/electronics — tens of
kg) plus the feet's swivel pads for stability on the table, rather than a
fastened connection. Chosen: **(c)** — the machine is stationary during
cuts (only the gantry/carriage move, not the frame itself), so there's no
inherent need for the frame to be bolted down the way a machine with a
spinning cutting tool or heavy vibration might need.

## Decision

Two-part off-the-shelf combo, confirmed compatible (thread sizes verified
against each other, not just assumed):

- **[heneng Caster Wheel Connector for 2020 Series Aluminum Extrusion](https://www.amazon.com/Connection-Connector-Aluminum-Extrusion-Thickness/dp/B0BW8SBLK8/)**
  — 6-pack, aluminum alloy 6063, 50x18x24mm, 7.8mm thick. Mounts to the
  extrusion's end bore via a screw through its 1/4" (6.35mm) through-hole;
  provides an **M8 tapped hole** for the foot stud.
- **[Helonge Swivel Feet Levelers, M8](https://www.amazon.com/Helonge-Levelers-Adjustable-Furniture-Workbench/dp/B08KXDFJ3M)**
  — 6-pack, M8-threaded, swivel pad base, height-adjustable.

Both are 6-packs, conveniently covering the 4 needed (one per frame
corner) with 2 spares each, no quantity mismatch. No table screw-down;
feet rest on the downdraft table's 2x4 top via weight + pad friction only.

Category: off-the-shelf ([0003](0003-parts-sourcing-constraint.md)) —
removes this part from the 3D-printed category entirely.

## Consequences

- Removes a custom-designed part from the build entirely — no modeling,
  printing, or fit-verification needed for feet, unlike the Y-carriage/
  limit-switch mount work.
- Height-adjustable feet are a genuine upgrade over the original plan —
  0012's custom foot had no leveling adjustment designed in; this gives
  that for free as a standard feature of the off-the-shelf part.
- Revisits an assumption from [0007](0007-frame-footprint-constraints.md)/
  [0012](0012-corner-joints-and-feet.md) that the frame needed to be
  fastened to the table — worth keeping in mind that if the machine proves
  to walk/shift during operation (unexpected given it's stationary, but not
  impossible with belt-driven acceleration forces), revisiting a
  screw-down solution remains an option, just not designed preemptively.
- Feet placement still needs to respect the ~38mm-wide 2x4 top surface
  constraint noted in [0007](0007-frame-footprint-constraints.md) — a
  swivel-pad foot needs to actually land on that surface, not overhang it.
- Two SKUs to order instead of one, but both confirmed to actually mate
  (M8 tapped hole ↔ M8 foot thread) rather than assumed compatible —
  avoids the risk of ordering a generic leveling foot whose thread doesn't
  match a separately-sourced connector.
