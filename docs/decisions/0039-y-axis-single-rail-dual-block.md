# 0039. Y-axis: single rail, two carriage blocks (reverts 0038's dual-rail/2060 upgrade)

Date: 2026-07-22

Status: Accepted (supersedes [0038](0038-y-axis-dual-rail.md) in full — beam
reverts to 2040 per [0010](0010-extrusion-profile-2040.md); the Y-axis
cantilever-moment concern that motivated 0038 is instead resolved by
mounting two carriage blocks on one rail)

## Context

A real-price check on MGN12 rail/block hardware (LiMo Bearing's own
configurator, confirmed prices, not estimates) found 0038's dual-rail
approach costs more than it needs to, and that switching brands (HGR15/
HGH15, considered as an alternative) doesn't help either:

- **0038's dual-rail Y-axis** (2x 800mm MGN12 rail + 1 block each): **$42.14**
- **HGR15/HGH15 swap**: only sold as a fixed 2-rail + 4-slider bundle at
  this supplier — **$44.76** for 800mm, i.e. *more* expensive than 0038's
  MGN12 dual-rail approach, before even accounting for the extra spare
  rail that bundle forces you to buy. Ruled out on cost alone.
- **Single MGN12 rail + 2 blocks on that one rail**: 1x 800mm rail + 1
  slider ($21.07) + 1 extra slider ($5.71) = **$26.78**

Beyond the direct rail-cost saving, going single-rail also lets the beam
revert from 2060 back to plain 2040 ([0010](0010-extrusion-profile-2040.md)),
since the only reason 0038 upsized the beam was to fit two rails
side-by-side on a wider face — a single rail doesn't need that.

**Does this actually solve the original problem?** [0038](0038-y-axis-dual-rail.md)
added a second rail because the K40's cantilevered weight, offset from a
single rail block, creates a tipping moment that flexes the carriage —
a real concern for laser focus/pointing, not a load-rating question.
Mounting **two carriage blocks on one rail, spaced apart along the rail's
own travel direction**, resists that same tipping moment the same way a
second rail does — the two blocks form a moment arm between them, just
along the rail's length instead of across the beam's face. This is a
standard, well-established way to stiffen a single-rail carriage against
exactly this kind of load (most linear-rail tool carriages that need to
resist tipping use two blocks per rail rather than two rails), and it's
the direct engineering fix for the same problem 0038 was solving, not a
compromise substitute for it.

## Decision

- **Beam**: reverts to plain **2040** V-slot extrusion, 800mm — no longer
  needs the 2060 upsize. ([0010](0010-extrusion-profile-2040.md))
- **Y-axis rail**: back to a **single MGN12 rail**, 800mm, per
  [0008](0008-motion-system-mgn12-rails.md)'s original spec.
- **Y-carriage bracket** ([hardware/3d-printed/y-carriage-k40-bracket.scad](../../hardware/3d-printed/y-carriage-k40-bracket.scad)):
  now mounts **two MGN12H blocks on that single rail**, spaced ~60mm
  center-to-center along the rail's travel direction (the same axis the
  belt runs along) — a **VERIFY** working estimate; must clear MGN12H's
  45.4mm block length with a real gap, and should be confirmed/adjusted
  once blocks are physically in hand, same caveat as this bracket's other
  working-estimate dimensions ([0032](0032-y-axis-laser-carriage.md)).
  The bracket's block-mount zone becomes a spine spanning both block
  positions, with the standoff/K40-mount arm hanging from its center,
  rather than 0038's approach of widening the plate to hold two
  side-by-side blocks on two separate rails.
- **Gantry end cap** ([hardware/laser-cut/gantry-end-cap.svg](../../hardware/laser-cut/gantry-end-cap.svg),
  [0036](0036-gantry-end-cap-redesign.md)): reference geometry and
  L-bracket slots revert to their pre-0038 2040 (20x40mm) footprint and
  positions — this file only cares about the beam's cross-section, which
  is back to 2040.
- **Wheel reinforcement (2026-07-22 addition, finalized same day)**: the
  carriage also mounts **one** pre-made aluminum wheel-holder plate — the
  same "1-Pack Assembled 2040 V Gantry Plate Kit" sourced for the X-axis
  gantry legs ([0040](0040-x-axis-v-wheel-gantry.md)), 6 POM wheels
  pre-mounted — riding the beam alongside the MGN12 rail. Same hybrid
  principle discussed for this axis: the rail/blocks set the precise
  travel path, the wheels are pure anti-wiggle reinforcement against the
  K40's cantilever moment, not a load-bearing replacement for the rail.
  (Superseded the earlier custom PLA-CF plate + separately-sourced-wheels
  plan — see 0040's final sourcing decision.)

  **Mounting geometry (2026-07-22, clarified)**: the MGN12 rail mounts on
  the beam's wide (front) face, same as always. The aluminum wheel-holder
  plate is **not** an independently-riding second carriage — it's rigidly
  **bolted directly to the MGN12H rail block(s)**, so the rail block is
  still what's actually gripping the rail; the plate just rides along
  with it. The plate's 6 wheels contact the beam's **narrow face, above
  and below** (the beam's top and bottom edges, perpendicular to the
  rail-mounting face) — this is what gives the anti-tip capture: wheels
  pressing from above and below can't lift off the way a single-face
  contact could, the same principle discussed when this hybrid
  rail+wheel idea first came up.

  Still open: whether the K40 itself mounts via a separate acrylic
  bracket bolted to this wheel-plate, or directly to the wheel-plate's
  own hole grid with no separate bracket at all — both are being
  considered, neither is decided yet. Either way, this replaces the
  PLA-CF spine/standoff bracket's role of connecting to both rail blocks
  — the wheel-plate does that connection now instead.

Category: off-the-shelf extrusion + rail/block hardware
([0003](0003-parts-sourcing-constraint.md)).

## Consequences

- Cheaper: $26.78 vs. 0038's $42.14 for the Y-axis rail/block set, plus
  whatever the 2060→2040 beam reversion saves on top (not separately
  priced here, but 2060 stock costs more per meter than 2040,
  [0038](0038-y-axis-dual-rail.md)'s own note).
- BOM changes: beam reverts to a single 2040 line item (no separate 2060
  line); Y-axis rail count drops from 2 to 1; total MGN12H block count
  stays at 4 (2 X + 2 Y), just both Y blocks now ride one rail instead of
  one each on two rails. Plus 1 pre-made aluminum wheel-holder plate (6
  wheels bundled) added for the wheel-reinforcement addition above.
- The Y-carriage bracket needs real Y-axis extent (spanning both block
  positions) rather than being a single thin plate — slightly more
  material/print time, but avoids redesigning the beam or buying a second
  rail.
- [0021](0021-y-axis-motor-system.md)'s reasoning is unaffected either way:
  one motor, one belt, regardless of whether the axis has one rail with
  two blocks or two rails with one block each — both are passive support
  for a single rigid carriage, no synchronization needed.
- 0038's own dual-rail/2060 approach remains a valid alternative on paper
  (a second rail is a legitimate way to solve the same moment problem) —
  it's being superseded here purely because it's the more expensive of two
  approaches that solve the same problem equally well, not because it was
  wrong.
