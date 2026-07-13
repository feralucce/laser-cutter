# 0020. Belt clamp selection and mounting

Date: 2026-07-13
Status: Accepted

## Context

[0015](0015-x-axis-motor-system.md) flagged the belt clamp (anchoring each
belt end to the carriage) as an open item. Each X-rail runs an open belt
loop — both ends terminate at clamps on the same carriage/end plate, rather
than a single continuous loop — so tension can be fine-adjusted
independently at each end by how far the belt is threaded through its
clamp before tightening.

## Decision

**[3DMAN GT2 Timing Belt Aluminum Gear Clamp Mount Block, 9x40mm, for 6mm
belt width (10-pack)](https://www.amazon.com/3Dman-Timing-Aluminum-Clamp-9X40mm/dp/B08XVVQW6G/)**

40 x 9 x 5mm aluminum block, single 4.5mm center mounting hole (M4 screw).
10-pack covers the 4 needed (2 per side x 2 sides) with spares.

**Mounting**: one clamp per belt end, both on the same gantry end plate
([0016](0016-gantry-end-plate-rework.md)) since both belt ends terminate at
the same carriage. Added to the **outer layer** of each end plate (fixed
and floating), in the left/right margins beside the existing carriage-mount
hole pattern, oriented with the clamp's 40mm length running parallel to the
plate's long axis (matching the belt's direction of travel along the
X-rail):

- Clamp hole 1: (6, 65) — left margin
- Clamp hole 2: (44, 65) — right margin

Both positions verified clear of the existing 4x M3 carriage-mount holes
(at x=15/35) and the plate edges/corner radius.

Category: off-the-shelf.

## Consequences

- Closes out the last open item from [0015](0015-x-axis-motor-system.md)'s
  belt/pulley hardware list.
- Exact clamp position is a reasonable placement based on published
  dimensions, not verified against a physical mockup — worth confirming
  the belt actually reaches both clamp points cleanly once the carriage,
  rail, motor, and idler are physically laid out; may need minor
  adjustment.
- Both end plate SVGs ([hardware/laser-cut/gantry-end-plate-floating.svg](../../hardware/laser-cut/gantry-end-plate-floating.svg),
  [hardware/laser-cut/gantry-end-plate-fixed.svg](../../hardware/laser-cut/gantry-end-plate-fixed.svg))
  updated with these 2 holes on the outer layer.
