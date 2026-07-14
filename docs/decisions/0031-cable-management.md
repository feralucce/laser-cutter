# 0031. Cable/tubing management: spiral wrap + tensioned support, no drag chain

Date: 2026-07-14
Status: Accepted

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

Category: off-the-shelf consumables (spiral wrap, elastic cord/spring,
cable anchors) — no custom part needed for the wrap/tension mechanism
itself.

## Consequences

- Removes the drag-chain design/routing problem entirely — no chain
  track, no chain link pitch/radius to size, no chain-mount brackets to
  design at either end.
- Anchor points for the tension line and bundle need to exist on: the
  fixed frame (X-level start), the gantry beam (X-level end / Y-level
  start), and the Y-carriage (Y-level end) — the Y-carriage's anchor point
  is being included directly in its own design ([0032](0032-y-axis-laser-carriage.md)).
  The fixed-frame and beam-end anchor points aren't designed yet — small
  follow-on, likely a simple printed or off-the-shelf cable-tie anchor,
  not tracked further here.
- Because there's no rigid track constraining bend radius, care is needed
  at assembly to keep the spiral-wrap bundle's actual bend radius
  comfortable at both ends of travel (especially the K40's power/PWM
  cable, which is less flexible than the air-assist tubing) — a
  commissioning-time check, not a design decision to pre-calculate here.
- Tension needs to be light enough not to meaningfully load the stepper
  motors (X and Y both) as they move the gantry/carriage against it, but
  firm enough to keep the bundle from sagging into the belt or rail —
  worth verifying/tuning once physically assembled, similar in spirit to
  belt tensioning ([0018](0018-motor-and-idler-mounts.md)).
