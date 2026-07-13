# 0016. Gantry end plate rework: L-bracket joint, laminated dual-layer, asymmetric fixed/floating pair

Date: 2026-07-13
Status: Accepted

## Context

[0013](0013-gantry-end-plate-design.md)'s original single-layer plate
(screws through T-nuts directly) was deleted for rework. Two problems with
it: it didn't address the gantry beam's length-tolerance problem (exact beam
length wasn't calculable without final rail offset — flagged as an open
issue), and it didn't use the "inside hidden corner bracket" L-connector
hardware already sourced for frame corners
([0012](0012-corner-joints-and-feet.md)).

New approach:

- **Asymmetric pair**: only one of the two end plates needs to absorb beam
  length tolerance. The other stays a fixed/precise reference. This means
  the beam only needs to be cut *long enough*, not to an exact calculated
  length — the floating plate's pocket absorbs the slack, while the fixed
  plate defines where zero position actually is.
- **L-bracket joint**: instead of bolting straight through T-nuts, use the
  same inside-hidden-corner-bracket hardware as the frame corners. One leg
  of each bracket inserts into the beam's real T-slot as normal; the other
  leg needs somewhere to engage on the plate side.
- **Laminated dual-layer construction**: rather than trying to replicate a
  T-slot's channel-plus-wall cross-section by machining a single thick
  sheet (not practical on a laser cutter, which only cuts straight through),
  two thin layers are glued together — an **inner layer** with a slot cut
  all the way through (sized to the bracket leg, replicating the real
  T-slot channel) and a solid **outer layer** directly behind it, acting as
  the wall the set screw bites against. This also adds overall stiffness
  and reduces the risk of the plate cracking/flexing if a bracket is
  over-tightened.

Bracket hardware dimensions vary across listings (~19-20mm leg length, M5
set screw, sized for a 6mm-wide/5.5mm-deep slot channel) — working numbers
used below, **not yet verified against the specific bracket purchased**.

## Decision

Two end plates, each built from two laminated layers (working material
assumption: 6mm ply/acrylic per layer):

- **Floating plate** (absorbs beam length tolerance): inner layer has a
  wide flared opening (41mm wide x 18mm deep) at the top edge so the beam's
  40mm-wide face can slide in, narrowing into two 10mm-wide x 40mm-deep
  slots (20mm apart, matching the 2040's two wide-face T-slots) where the
  bracket legs are captured. A solid island remains between the two slots,
  connected to the rest of the plate via material below the slots — keeps
  the inner layer as one piece, cuttable without disconnected islands.
- **Fixed plate** (precise reference, beam is cut to butt flush against it):
  inner layer has the same two 10mm x 22mm slots directly at the top edge,
  no wide flared opening (beam doesn't need a receiving pocket here).
- **Outer layer**: identical for both plates — solid rectangle, no
  cutouts, just the shared carriage mount holes. Only one outer-layer
  design needed, cut twice.
- Both plates: 50mm x 95mm overall, 4x M3 clearance holes (20x20mm pattern)
  for the MGN12H carriage block, same as [0013](0013-gantry-end-plate-design.md)'s
  original design.
- **Set screw access holes**: a 5mm dia hole through both layers, centered
  on each slot's depth (floating plate: y=29; fixed plate: y=11, in each
  plate's local coordinates), so an Allen key can reach and tighten each
  bracket's set screw after the beam is seated — without these the brackets
  would be captured but unfastenable once assembled. The shared outer layer
  is cut with both hole-position sets (since it's reused for either plate),
  so each physical outer-layer piece has two unused access holes depending
  on which plate it's paired with — a minor, harmless simplification in
  exchange for keeping a single shared outer-layer design.

Design files:
[hardware/laser-cut/gantry-end-plate-floating.svg](../../hardware/laser-cut/gantry-end-plate-floating.svg),
[hardware/laser-cut/gantry-end-plate-fixed.svg](../../hardware/laser-cut/gantry-end-plate-fixed.svg).
Category: laser cut ([0003](0003-parts-sourcing-constraint.md)).

## Consequences

- Only 3 unique laser-cut shapes needed (floating-inner, fixed-inner,
  shared outer cut twice) rather than 4.
- Resolves [0013](0013-gantry-end-plate-design.md)'s open issue: the beam
  no longer needs a precisely calculated length — it just needs to be long
  enough to reach the floating plate's pocket, with the fixed plate
  defining the reference position.
- Layer lamination (glue) becomes an assembly step — alignment between
  layers during glue-up matters for the slots to stay usable; no alignment
  pins/dowels designed in yet, worth considering if glue-up proves fiddly.
- Slot/opening dimensions are working estimates and **must be checked
  against the actual bracket hardware purchased** before cutting — bracket
  leg length and set screw position vary by seller. The access hole
  position (slot midpoint) is a placeholder for the same reason — should be
  adjusted to the real set screw location once the bracket is in hand.
- Corner radii were omitted from the inner-layer polygons (complex
  multi-point shapes) for simplicity — can be added in vector software
  before cutting if desired, not required for function.
