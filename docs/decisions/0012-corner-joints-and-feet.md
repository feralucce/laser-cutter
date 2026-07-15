# 0012. Corner joints: end-cap connectors; feet: 3D printed PLA-CF

Date: 2026-07-13
Status: Accepted (feet portion superseded by [0034](0034-frame-feet-off-the-shelf.md)
— corner joints below still stand)

## Context

With 2040 extrusion selected ([0010](0010-extrusion-profile-2040.md)), the
frame needs corner joints and a way to mount to the downdraft table's 2x4
top ([0007](0007-frame-footprint-constraints.md)).

For corners, T-slot extrusion supports both external bolt-on L-brackets and
internal/end-fastener style connectors that cap the outside end of the
extrusion (tapping into its center bore) for a flush joint — both are
standard off-the-shelf hardware, not custom parts.

For feet, two mounting interfaces are needed at once: attaching to the frame
extrusion (via T-nut) and fastening down into the downdraft table's 2x4 top.
A flat laser-cut foot plate could work but is more awkward for combining
both interfaces cleanly (e.g. angled or offset screw holes into the table
face vs. the T-nut bolt line). A 3D printed part can be shaped to do both in
one piece more easily.

## Decision

- **Corner joints**: use end-cap/flush internal-fastener style corner
  connectors (cap the outside ends of the extrusion). Category: off-the-shelf.
- **Feet**: 3D printed in PLA-CF, designed to (a) bolt to a T-nut on the
  extrusion and (b) screw down into the downdraft table's 2x4 top. Category:
  3D printed PLA-CF ([0003](0003-parts-sourcing-constraint.md)).

## Consequences

- Corners get a clean, flush look/joint using standard hardware — no custom
  gusset design needed for the main frame rectangle joints.
- Feet become a custom-designed part (not off-the-shelf), since they need to
  bridge the extrusion's T-nut mounting and the table's screw-down mounting
  in one piece — this is now a part to model and print, not just order.
- Feet placement must respect the ~38mm-wide 2x4 top surface constraint
  noted in [0007](0007-frame-footprint-constraints.md).
- If frame rigidity at the corners proves insufficient once assembled and
  loaded, laser-cut gusset reinforcement remains an easy fallback (material
  on hand, no new parts to source) — not needed as a first pass given the
  end-cap connectors plus 2040's own stiffness.
