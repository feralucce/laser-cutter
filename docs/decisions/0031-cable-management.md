# 0031. Cable/tubing management: spiral wrap + tensioned support, no drag chain

Date: 2026-07-14
Status: Accepted (tensioning mechanism superseded 2026-07-22 — see update
below; spiral wrap and the no-drag-chain approach still stand)

## Context

Two moving joints need flexible cable/tubing runs that were previously
undesigned (flagged in the 2026-07-14 repo review): the **X-axis** run
(fixed frame → moving gantry beam, carrying the Y-motor's leads, the Y
limit switch's leads, and everything continuing on to the Y-carriage) and
the **Y-axis** run (a fixed point on the beam → the moving Y-carriage,
carrying the K40's power/PWM cable and the air-assist tubing).

Rather than a rigid drag chain (the usual CNC/3D-printer default — a
plastic link-chain track that encloses and guides the cable through a
fixed bend radius), the choice here is a lighter-weight approach modeled
on ceiling-pulley VR headset cable management systems: those keep a
headset cable off the floor and out of the user's way using a retractable/
elastic overhead line that takes up slack as the user moves, rather than a
rigid track.

## Decision

For both the X-axis and Y-axis cable runs:

- **Spiral wrap** (spiral cable wrap sleeving) bundles the relevant wires/
  tubing for each run into a single manageable, abrasion-protected bundle
  — same approach at both stages, just different bundle contents (X-level:
  Y-motor leads + Y-limit-switch leads + everything passing through to the
  Y-carriage; Y-level: K40 power/PWM cable + air-assist tubing).
- **Tensioned support**, VR-headset-style: rather than a rigid drag chain
  track, the bundle is held with light elastic/spring tension along its
  run (e.g., an elastic cord or light spring in parallel with the bundle,
  anchored at both ends) so slack is taken up automatically as the gantry/
  carriage moves, without the bundle dragging, sagging into moving parts,
  or resisting motion the way a poorly-tensioned drag chain can.

**Update (2026-07-22)**: the elastic-cord-along-the-frame tensioning
mechanism above is superseded — the user already owns a **ceiling-suspended
VR headset cable management system** (the actual real-world equivalent of
the analogy this ADR was originally modeled on) and will route the
spiral-wrapped bundle up to that instead of tensioning it along the frame.
This removes the need for frame/beam/carriage-mounted elastic cord and
anchor points entirely — slack management happens overhead, external to
the machine, via hardware already on hand. Spiral wrap still bundles the
wires/tubing at each moving joint the same as before; only the
slack-take-up mechanism changes. The Y-carriage still likely needs a
single simple clip/loop point where the bundle connects to the overhead
minder's line — much lighter-weight than the original tensioned-anchor
design, not separately tracked here.

Category: off-the-shelf consumables (spiral wrap) — no custom part needed
for the wrap itself; slack management is external (ceiling-mounted VR
cable minder, already owned).

## Consequences

- Removes the drag-chain design/routing problem entirely — no chain
  track, no chain link pitch/radius to size, no chain-mount brackets to
  design at either end.
- **(Superseded 2026-07-22)** ~~Anchor points for the tension line and
  bundle need to exist on: the fixed frame, the gantry beam, and the
  Y-carriage~~ — no longer needed now that slack is managed by the
  ceiling-mounted VR cable minder instead of a frame-tensioned line. Only
  a single simple clip/loop point on the moving carriage (where the
  bundle connects up to the overhead minder) remains, not a full anchor
  system at three points.
- Because there's no rigid track constraining bend radius, care is needed
  at assembly to keep the spiral-wrap bundle's actual bend radius
  comfortable at both ends of travel (especially the K40's power/PWM
  cable, which is less flexible than the air-assist tubing) — a
  commissioning-time check, not a design decision to pre-calculate here.
  Still applies with the ceiling-suspended approach.
- **(Superseded 2026-07-22)** ~~Tension needs to be light enough not to
  meaningfully load the stepper motors... worth verifying/tuning once
  physically assembled~~ — this tuning concern belongs to the VR cable
  minder hardware itself now (already-owned, presumably already tuned for
  its intended use), not something to design/verify here.
