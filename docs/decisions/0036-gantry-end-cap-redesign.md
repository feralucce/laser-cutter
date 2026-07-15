# 0036. Gantry end cap redesign: flat straddle plate, both ends identical

Date: 2026-07-14
Status: Accepted (supersedes [0016](0016-gantry-end-plate-rework.md) entirely)

## Context

[0016](0016-gantry-end-plate-rework.md)'s laminated fixed/floating
asymmetric pair existed to solve one problem: absorbing the 800mm beam's
length tolerance without needing an exact pre-cut length, since one end
had to be a precise reference and the other had to float.

[0035](0035-frame-corner-topology-rework.md) moves that tolerance-absorbing
job to the main frame's own corner joint (1200mm pieces sliding against
the 800mm end pieces before squaring). That removes the entire reason for
an asymmetric pair — **both gantry end caps can now be identical, flat,
and fully solid**, which is also the more rigid ("solid AF") joint that
motivated revisiting this in the first place.

The new topology ([0035](0035-frame-corner-topology-rework.md)) also
changes what this plate needs to physically span: the X-carriage (MGN12H
block) now rides on the **outside face** of the 1200mm frame piece, while
the beam sits at the gantry's own position along that rail. The end cap
plate needs to reach from the beam's end, across/past the 1200mm frame
piece, down to that carriage block — confirmed against a reference diagram
([docs/reference/frame-topology-sketch.svg](../reference/frame-topology-sketch.svg))
showing the relative positions of the 1200mm frame (red),
800mm end pieces (blue), the 800mm gantry beam (magenta), and the gantry
end caps (gold) straddling across the 1200mm rail to reach the carriage.

## Decision

One plate **design**, but each beam-end joint uses a **front + back pair**
(sandwiching the beam) — 2 ends x 2 plates (front, back) = 4 plate
assemblies total, all built from the same design (front and back are the
same shape; "both ends identical" means left-end pair = right-end pair).

- Each plate: **2 laminated layers, 3mm black acrylic** (6mm total) —
  thinner per-layer than [0029](0029-laser-cut-material-selection.md)'s
  general 5mm rule, a deliberate exception given these are now doubled up
  (front+back per end, 4 plates instead of 1) and don't need the
  T-slot-channel-replicating lamination trick [0016](0016-gantry-end-plate-rework.md)
  used ([0029](0029-laser-cut-material-selection.md) remains the default
  elsewhere, with this as a noted exception).
- **Beam attachment zone** (top of each plate): 3 connection points per
  plate (6 total per end, split across the front/back pair) —
  - 1 tapped screw into the beam extrusion's end bore (2040 has two
    internal channels; front plate uses one, back plate uses the other)
  - 2 L-bracket legs into that plate's own facing wide face's 2 T-slots
    (front plate → front wide face; back plate → back wide face) — outer
    layer solid, inner layer has cutouts for the L-brackets, same
    lamination principle as [0016](0016-gantry-end-plate-rework.md), just
    applied to both plates now instead of one.
- **Straddle zone** (middle of each plate): extends down/across, clearing
  the 1200mm frame piece's position, to reach the carriage block. Working
  estimate for this span — needs confirming once the beam/rail/carriage
  stack-up is physically known, same caveat pattern used for the Y-axis
  carriage bracket ([0032](0032-y-axis-laser-carriage.md)).
- **Carriage attachment zone** (bottom of each plate): MGN12H's standard
  20x20mm M3 bolt pattern, same as used throughout this build
  ([0013](0013-gantry-end-plate-design.md)) — both plates in the pair bolt
  through to the same block, sandwiching it.

Category: laser cut, 3mm black acrylic ([0003](0003-parts-sourcing-constraint.md)).

Design file: [hardware/laser-cut/gantry-end-cap.svg](../../hardware/laser-cut/gantry-end-cap.svg)
(one design, cut 8x total — 2 layers x 2 plates x 2 ends).

## Consequences

- Both gantry end caps are now identical — one design instead of two,
  simpler to cut/laminate/stock spares for.
- Bracket count for the gantry: **8 L-bracket legs total** (4 per end x 2
  ends) — both wide faces of the beam are now used at both ends, not just
  one face at one end as [0016](0016-gantry-end-plate-rework.md) originally
  had. This matters for [0028](0028-corner-bracket-hardware-selection.md)'s
  purchase quantity — revisit that count.
- Plus 4 tapped screws total (2 per end) — not L-brackets, ordinary M5
  bolts into the extrusion's own tapped end bore, no separate hardware
  purchase needed beyond generic screws.
- The old `gantry-end-plate-fixed.svg` and `gantry-end-plate-floating.svg`
  files are removed from the repo (superseded, preserved in git history) —
  a single new design file, `gantry-end-cap.svg`, replaces both.
- The straddle-zone span is a working estimate, not yet verified against
  physical assembly — same treatment as other "verify once hardware is in
  hand" items throughout this build.
- 2026-07-14 correction: the first version of `gantry-end-cap.svg` had the
  L-bracket slots at the wrong scale/orientation (10mm wide x 22mm tall,
  side by side) and one slot positioned entirely past the extrusion's real
  40mm-tall footprint (y=56-78 against an actual 8-48 span). Fixed by
  adding a dashed reference rectangle showing the true 20x40mm extrusion
  cross-section, and repositioning both slots (now 22mm wide x 10mm tall,
  rotated to match the wide-face-vertical orientation) fully within that
  reference. Slot dimensions remain a working estimate — redraw once the
  actual corner bracket's leg dimensions are confirmed
  ([0028](0028-corner-bracket-hardware-selection.md)), but they should now
  at least be plausibly located on the real material rather than floating
  in empty space.
