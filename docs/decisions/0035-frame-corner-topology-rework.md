# 0035. Frame corner topology rework: 800mm end pieces outside the 1200mm rails

Date: 2026-07-14
Status: Accepted (supersedes the corner-joint arrangement implied by
[0009](0009-frame-dimensions-final.md)/[0012](0012-corner-joints-and-feet.md);
partially relaxes [0007](0007-frame-footprint-constraints.md)'s hard ceiling
— see below)

## Context

The original frame was a plain rectangle: two 1200mm pieces and two 800mm
pieces meeting flush at each corner, outer footprint 800x1200mm. Revisiting
this while working out the gantry end-cap redesign
([0036](0036-gantry-end-cap-redesign.md)) surfaced a better arrangement:

- The **1200mm pieces stay full length**, unmodified — no trimming.
- The **800mm end pieces mount outside the 1200mm pieces' ends** (flush
  against their end faces), rather than the two meeting mid-corner.
- The **X guide rails mount to the outside face** of the 1200mm pieces
  (previously implied inside-facing), so the X-carriage blocks ride on the
  outside of the frame.

Because 2040 extrusion's T-slots allow sliding adjustment, the 1200mm
pieces can be positioned/squared against the 800mm end pieces at assembly
time without needing an exact pre-cut length or a separate
tolerance-absorbing mechanism — squaring happens at this joint instead of
at the gantry beam's own end caps. That directly simplifies
[0036](0036-gantry-end-cap-redesign.md): both gantry end caps can now be
identical and fully solid, since length tolerance is no longer their job.

**Footprint consequence**: since the 800mm end pieces (20mm thick) now sit
*outside* the 1200mm pieces' ends rather than flush with them, the overall
outer footprint on this axis grows from 1200mm to **1200 + (20 x 2) =
1240mm**. This exceeds [0007](0007-frame-footprint-constraints.md)'s stated
hard ceiling of 1219mm (4ft) by 21mm.

**Resolving the ceiling conflict**: accepted as fine, not worth trimming
for — there's real tolerance in how the frame sits on the downdraft table,
and the leveling feet ([0034](0034-frame-feet-off-the-shelf.md)) can be
positioned anywhere along the extrusion's T-slot, so a 21mm difference from
the original estimate doesn't threaten the table-mounting fit the way
[0007](0007-frame-footprint-constraints.md) originally worried about.

## Decision

- Outer frame footprint: **800mm x 1240mm** (was 800x1200mm).
- 1200mm pieces: full length, unmodified, positioned inside/between the two
  800mm end pieces.
- 800mm end pieces: mount flush against the outside end faces of the
  1200mm pieces (same corner-bracket hardware as [0028](0028-corner-bracket-hardware-selection.md),
  now used at this relative position rather than a flush mid-corner joint).
- X guide rails mount to the **outside face** of the 1200mm pieces; the
  X-carriage (MGN12H block) rides there, outside the frame's footprint.
- [0007](0007-frame-footprint-constraints.md)'s 1219mm hard ceiling is
  relaxed to accommodate 1240mm — the downdraft table's own tolerance and
  the leveling feet's slot-adjustable positioning ([0034](0034-frame-feet-off-the-shelf.md))
  absorb the 21mm difference.

## Consequences

- Simplifies [0036](0036-gantry-end-cap-redesign.md) significantly: gantry
  length tolerance is absorbed here, at a joint assembled once and never
  revisited, rather than at the gantry beam's own end caps (which can now
  be solid and identical on both sides).
- The 800mm axis (hard-fixed to the downdraft table's structure per
  [0007](0007-frame-footprint-constraints.md)) is unaffected — only the
  1200mm-axis figure changes.
- Corner bracket hardware/quantity is unaffected in kind (same [0028](0028-corner-bracket-hardware-selection.md)
  brackets), just used at a different relative position in the joint.
- Frame BOM/cut list needs updating: the 800mm end pieces' exact length
  and the overall 1240mm figure should be reflected in any future cut-list
  or BOM document.
