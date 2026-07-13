# 0009. Frame dimensions finalized: 800mm x 1200mm

Date: 2026-07-13
Status: Accepted

## Context

[0007](0007-frame-footprint-constraints.md) established that one axis is
hard-fixed by the downdraft table's structure (~800mm) and the other is
flexible with a 4-foot (1219mm) ceiling, estimating current frame footprint
at ~900-950mm on the fixed axis pending measurement.

Now that the motion system is settled on MGN12 rail
([0008](0008-motion-system-mgn12-rails.md)), which is readily available in
clean stock/custom lengths, there's no need to chase the exact legacy
Ortur+extension-kit footprint — we can size the new frame and rails to
convenient round numbers instead, as long as the 800mm fixed-axis constraint
and 1219mm flexible-axis ceiling are respected.

## Decision

Frame and gantry rail lengths are set directly to **800mm x 1200mm**:

- 800mm axis: matches the downdraft table's fixed structural constraint.
- 1200mm axis: under the 1219mm (4ft) ceiling, and a clean round number for
  ordering rail/extrusion stock.

## Consequences

- Rail/extrusion ordering can target these numbers directly rather than an
  estimated legacy footprint — simpler BOM, no need to measure the old
  machine to derive frame size.
- Actual usable cutting work area will be somewhat smaller than 800x1200mm
  once rail carriage travel limits and gantry end-mount overhang are
  accounted for — exact usable area to be determined once carriage/end-mount
  geometry is designed.
- This finalizes and supersedes the footprint estimate in
  [0007](0007-frame-footprint-constraints.md).

## Note: mapping to axis naming

Per [0014](0014-axis-naming-convention.md): the **800mm figure is the
Y-axis guide rails' own length** (each of the two fixed rails the whole
gantry travels along), and the **1200mm figure is the spacing between
those two rails**, which the gantry beam spans — this is the X-axis
(carriage travel distance along the beam).
