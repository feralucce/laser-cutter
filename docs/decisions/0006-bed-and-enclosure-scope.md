# 0006. Bed and enclosure: use existing downdraft table, not custom-built

Date: 2026-07-13
Status: Accepted

## Context

Initial component breakdown assumed the build would need its own cutting bed
(honeycomb/slats) and its own enclosure with exhaust ducting. In fact, a
custom downdraft table already exists and covers both:

- It serves as the cutting bed/work surface.
- It has flexible curtains that act as a chimney, handling smoke
  extraction/enclosure duty — no separate enclosure or exhaust fan/ducting
  needs to be designed.

## Decision

The gantry frame is designed to sit on/over the existing downdraft table.
Bed surface and enclosure/exhaust are **out of scope** for this build — they
are already solved by existing shop infrastructure.

## Consequences

- Removes "bed / work surface" and "enclosure / safety (panels + exhaust)"
  from the component list entirely — no honeycomb bed, no side/top panels,
  no inline exhaust fan to design or buy.
- The frame's footprint and leg/mounting design must be compatible with the
  downdraft table's dimensions and surface — this becomes a hard constraint
  on frame design (still need the table's dimensions to size the gantry).
- Fire safety basics (extinguisher on hand) still apply but aren't a design
  item — no design changes needed here.
- The flexible curtain "chimney" means the frame design should leave it
  clear/unobstructed rather than needing to be sealed into a fixed enclosure.
