# 0033. Limit switch selection and mounting

Date: 2026-07-14
Status: Accepted

## Context

[0026](0026-t41u5xbb-pin-mapping.md) wired the T41U5XBB's X, A, and Y limit
inputs (opto-isolated, 5V) but never picked a physical switch or mounting
method — flagged in the 2026-07-14 full-repo review. Three switches are
needed: **X** (X1's own min-travel switch), **A** (X2's ganged/auto-square
reference switch, [0027](0027-grblhal-auto-square-config.md)), and **Y**
(single switch on the beam).

**Switch type**: mechanical roller-lever microswitch — the standard,
well-proven choice for this application (vs. optical/hall-effect sensors,
which add cost/complexity this build doesn't need). The common KW12-3-style
SPDT microswitch (1NO + 1NC + common, 3-pin) is the de facto standard part
for this across the CNC/3D-printer hobby space.

**NC vs. NO wiring**: same reasoning already applied to the E-stop/control
inputs ([0024](0024-e-stop-wiring.md)) — NC is more EMI-resistant and a
broken wire reads as a fault (triggers homing to stop/alarm) rather than
silently failing to detect a real crash. Using the switch's NC contact for
all three, consistent electrical philosophy across the whole machine
rather than mixing NO and NC by input type.

**Exact switch dimensions**: same situation as the corner bracket
([0028](0028-corner-bracket-hardware-selection.md)) and the K40's mounting
plate ([0032](0032-y-axis-laser-carriage.md)) — checked multiple listings
and the Mouser-hosted datasheet PDF (fetch failed; connection reset) for
this common part family. Aggregated, reasonably-consistent figures across
sources: body ~20 x 10 x 6.5mm, two M2 mounting holes ~9-9.5mm apart,
roller lever ~18mm long. Designing the mount with slotted (not fixed)
holes to absorb that uncertainty, same approach as the other two.

## Decision

**Switch**: BOJACK (or equivalent KW12-3-style) SPDT micro limit switch,
1NO+1NC+common, 3-pin, roller lever arm — 10-pack (covers the 3 needed
with 7 spares, consistent with this build's usual spares-included
purchasing pattern). Wired using each switch's **NC** contact.

**Mounting (2026-07-22, material changed to black acrylic)**: originally
a PLA-CF printed L-bracket; switched to laser-cut black acrylic to match
the rest of the acrylic stock already being ordered
([0029](0029-laser-cut-material-selection.md)). This is a real geometry
change, not just a material swap: the current design is a single-piece
3D-printed L-bracket (two perpendicular legs), which doesn't translate
directly to a flat laser-cut part. Needs redesigning as either (a) two
flat acrylic pieces joined at 90° via slot-and-tab joinery (glued or
press-fit, same general idea as furniture-style laser-cut joints), or
(b) a flattened single-piece mounting scheme that doesn't need a bent
corner at all. **Not yet designed** — deferred the same way the switch's
own hole spacing already was, since both are waiting on the actual
switch being in hand to confirm dimensions before cutting. Original
PLA-CF geometry below describes the mounting concept (T-slot leg + switch
leg) that still needs re-expressing in acrylic-compatible form:

- **Mounting leg**: flat against the 2020/2040 extrusion face, with a
  vertical slot (not a fixed hole) for an M5 bolt + T-nut — lets the
  switch's position slide along the rail before tightening, so the exact
  trigger point can be fine-tuned at assembly rather than needing to be
  calculated in advance (same adjustment principle already used for idler
  belt tensioning, [0018](0018-motor-and-idler-mounts.md)).
- **Switch leg**: perpendicular to the mounting leg, with 2 slotted M2
  holes (working estimate 9.5mm spacing, generously slotted) for the
  switch body, oriented so the roller lever projects into the oncoming
  carriage/block's travel path.

Mounting locations: X and A switches at the corresponding (same-side) end
of each X guide rail on the fixed frame; Y switch at one end of the beam.

Category: off-the-shelf (switches) + laser-cut black acrylic (mount
bracket, [0003](0003-parts-sourcing-constraint.md), [0029](0029-laser-cut-material-selection.md)).

Superseded parametric model (PLA-CF, no longer built): [hardware/3d-printed/limit-switch-mount.scad](../../hardware/3d-printed/limit-switch-mount.scad),
kept for reference. No acrylic design file exists yet — pending switch
dimensions.

## Consequences

- Closes another gap from the full-repo review — there's now a specific
  switch product and a designed, modeled mounting bracket, where before
  neither existed.
- grblHAL's `$5` (limit pin invert mask) needs to be set for NC wiring at
  commissioning — same deferred-to-commissioning treatment as the other
  runtime settings already flagged in [0027](0027-grblhal-auto-square-config.md)
  (`$8`, `$170`, `$347-349`). Don't set it blind; confirm once switches are
  wired and can be tested.
- The switch mounting-hole spacing is a working estimate — if the actual
  purchased switch's holes don't match, the slots are generous enough to
  likely still work, but worth a quick check before cutting all 3.
- The acrylic redesign (flat 2-piece joined bracket, or a flattened
  single-piece scheme) is real, not-yet-started work — the existing
  PLA-CF model's dimensions/slot logic are a starting reference, not a
  direct port.
- Exact trigger position along each rail isn't fixed by this design (only
  the mechanism to adjust it) — that's a physical, at-the-bench adjustment
  during homing setup, not something to pre-calculate.
