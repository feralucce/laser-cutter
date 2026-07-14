# 0028. Corner bracket hardware: product selection (dimension verification still pending)

Date: 2026-07-14
Status: Accepted

## Context

[0012](0012-corner-joints-and-feet.md) and [0016](0016-gantry-end-plate-rework.md)
both describe using "inside hidden corner bracket" style hardware (an
L-shaped cast bracket, one leg per T-slot face, tightened with a set
screw) for the frame corners and the gantry end plates — but neither ADR
ever linked a specific product. 0016 used working numbers (~19-20mm leg
length, M5 set screw, sized for a 6mm-wide/5.5mm-deep slot channel) and
flagged them as unverified.

Checked every retailer carrying this part style (Amazon, MakerTechStore,
OpenBuilds official store, Bulkman3D, RatRig, Maker Store) looking for a
dimensioned drawing. **None publish the leg length or set-screw position**
— this is a generic cast-zinc-alloy part cloned across many sellers, and
the only consistently published numbers are the overall footprint
(~25x10mm) and that the 20-series version takes M5 set screws. The 6mm
slot-channel width in 0016's working numbers is actually just the 20-series
T-slot extrusion's own standard channel width ([0010](0010-extrusion-profile-2040.md)),
not something specific to this bracket — that part of the working number
is solid. The leg length and set-screw offset genuinely cannot be
confirmed from any spec sheet; they can only be measured once a physical
unit is in hand.

## Decision

Purchase **[Inside Hidden Corner Bracket, 90°, M5 set screws, for 20mm x
20mm / 2020 / 20-series T-slot extrusion](https://www.amazon.com/Pack-Inside-Hidden-Corner-Bracket/dp/B06XZ3Z82M)**
(20-pack — covers 4 needed for the gantry end plates
[0016](0016-gantry-end-plate-rework.md) plus the main frame rectangle
corners [0012](0012-corner-joints-and-feet.md), with spares).

Category: off-the-shelf.

## Consequences

- Closes the "which product" gap — there's now a specific SKU to order,
  where before there was only a hardware category description.
- Does **not** close the dimension-verification gap flagged in
  [0016](0016-gantry-end-plate-rework.md) — leg length and set-screw
  position remain working estimates until this specific part is physically
  in hand and measured with calipers. Cut the end plates only after that
  verification, or expect to re-cut if the slot/access-hole dimensions are
  off.
- The 6mm slot-channel width in the existing end-plate SVGs
  ([hardware/laser-cut/gantry-end-plate-fixed.svg](../../hardware/laser-cut/gantry-end-plate-fixed.svg),
  [hardware/laser-cut/gantry-end-plate-floating.svg](../../hardware/laser-cut/gantry-end-plate-floating.svg))
  is confirmed correct regardless (fixed by the extrusion standard, not the
  bracket) — only the slot depth and access-hole position depend on the
  actual bracket and remain unverified.
