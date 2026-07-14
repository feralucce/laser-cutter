# 0029. Laser-cut part material: 5mm black acrylic, uniform across all custom parts

Date: 2026-07-14
Status: Accepted

## Context

[0013](0013-gantry-end-plate-design.md) and [0016](0016-gantry-end-plate-rework.md)
both left the gantry end plate material as an open "plywood vs. acrylic,
thickness TBD" question, working from a placeholder assumption of 6mm per
laminated layer.

That question is now answerable in practical terms: cross-referencing
Ortur's own published cutting settings for the spare LU2-10A 10W module
(the one this machine will actually be cut with, at least until the K40
arrives, [0002](0002-laser-module-selection.md)) against independent
community consensus (manufacturer "cuts up to 30mm acrylic" claims are
unverified marketing hype nobody has reproduced) —

| Black acrylic thickness | Speed | Power | Passes |
|---|---|---|---|
| 3mm | 100 mm/min | 100% | 3 |
| 5mm | 100 mm/min | 100% | 3 |
| 8mm | 70 mm/min | 100% | 6 |

5mm is the practical sweet spot: same pass count and speed as 3mm, clean
established settings, comfortably within what the 10W module can do
without pushing into slow/many-pass territory. It's slightly thinner than
the 6mm working assumption baked into 0016's slot/laminate design, but
close enough that the existing geometry (in-plane slot widths, hole
positions) isn't invalidated — only the per-layer thickness figure changes.

## Decision

**All custom-designed laser-cut parts use 5mm black acrylic**, uniformly —
not plywood, and not mixed thicknesses per part. Parts that are
3D-printed (PLA-CF) remain 3D-printed; this decision only covers the
laser-cut category ([0003](0003-parts-sourcing-constraint.md)).

This updates [0016](0016-gantry-end-plate-rework.md)'s "6mm ply/acrylic"
working assumption to the now-confirmed 5mm black acrylic.

Category: material selection, applies retroactively to all existing and
future laser-cut part designs.

## Consequences

- Removes the open "plywood vs. acrylic, thickness" question from
  [0013](0013-gantry-end-plate-design.md)/[0016](0016-gantry-end-plate-rework.md) —
  every laser-cut part in this build now has a settled material/thickness
  to design against.
- The gantry end plates' laminated total thickness becomes 10mm (2x5mm)
  instead of the previously-assumed 12mm (2x6mm) — a minor change; doesn't
  affect any in-plane hole/slot position, only how far the corner
  bracket's leg (still unverified, [0028](0028-corner-bracket-hardware-selection.md))
  seats into the combined layer stack.
- Acrylic is more brittle than plywood — mounting points and screw holes in
  every laser-cut part should keep reasonable edge margins (consistent with
  the 15mm margins already used in [0013](0013-gantry-end-plate-design.md))
  to avoid cracking under clamping/vibration loads.
- Black acrylic is the deliberate choice for laser compatibility with the
  interim 10W module — cutting clear/light acrylic on that module would
  perform far worse (445nm diode light passes through transparent material
  with minimal absorption) even though it wouldn't matter once the K40
  (CO2-equivalent power, cuts either color similarly) is in use.
- The two existing gantry end plate SVGs
  ([hardware/laser-cut/gantry-end-plate-fixed.svg](../../hardware/laser-cut/gantry-end-plate-fixed.svg),
  [hardware/laser-cut/gantry-end-plate-floating.svg](../../hardware/laser-cut/gantry-end-plate-floating.svg))
  have had their material comment updated from the old 6mm assumption to
  the confirmed 5mm black acrylic.
