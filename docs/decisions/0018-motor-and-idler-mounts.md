# 0018. Motor mount and idler mount hardware

Date: 2026-07-13
Status: Superseded by [0048](0048-captured-belt-both-axes-no-idler.md) (idler pulley/mount no longer needed; motor mount still applies where reused motors attach)

## Context

[0015](0015-x-axis-motor-system.md) decided motor and idler mounts should
be off-the-shelf (not 3D printed), since both are constantly-tensioned
anchor points where PLA-CF creep/flex would be a risk. Needed: specific
purchasable parts for both.

For the idler specifically: it only ever contacts the belt's smooth back
side (the toothed side stays engaged with the motor's drive pulley around
the whole loop), so the idler itself doesn't need teeth — a smooth pulley
or even a plain bearing works correctly. No clean single "bracket + pulley"
kit product was found; the standard/simpler approach is a smooth idler
pulley spinning freely on a bolt threaded into a T-nut in the extrusion
slot — fully off-the-shelf hardware, tension adjustable by sliding the
T-nut position before tightening, no dedicated bracket part needed.

## Decision

- **Motor mount**: [Socobeta 5PCS NEMA17 Stepper Motor Mounting
  Plate/Bracket, for 2020/2040 extrusion](https://www.amazon.com/Socobeta-Stepper-Mounting-Bracket-Aluminum/dp/B0FPMDHTHD).
  5-pack covers the 3 motors needed (2x X-axis, 1x Y-axis,
  [0011](0011-x-axis-dual-motor.md)) with 2 spares.
- **Idler mount**: bolt-on-T-nut approach (M5 socket-head bolt + washers/
  spacers for height + T-nut), no separate bracket product.
- **Idler pulley**: [DiGiYes GT2 Timing Belt Idler Pulley, 20-toothless
  (smooth), 5mm bore, for 6mm belt width](https://www.amazon.com/gp/product/B0BSPC7D9S/).
  User-sourced. Matches requirement: smooth-riding (teeth not required, and
  this part is genuinely toothless rather than a repurposed drive pulley),
  5mm bore (matches M5 bolt and the [0017](0017-stepper-motor-selection.md)
  motor's shaft size for hardware consistency), sized for the 6mm GT2 belt
  ([0015](0015-x-axis-motor-system.md)).

**Update (2026-07-29)**: the bolt-on-T-nut hardware approach above assumed
buying the OpenBuilds-style bolt+spacer+locknut kit for the idler mount —
that kit is no longer available. Switching to a **3D-printed PLA-CF idler
mount** instead: [JeSc HyperCube XY Idler T16 v2.0](https://www.printables.com/model/56963-jesc-hypercube-xy-idler-t16-v20/files)
(originally a HyperCube CoreXY 3D printer part), downloaded to
[Printables/](../../Printables/) in this repo. User already has PLA-CF
filament on hand.

This reopens the concern this ADR's own Context section originally raised
against printing the idler mount — "constantly-tensioned anchor points
where PLA-CF creep/flex would be a risk" — but it's directly addressed:
**printing solid (100% infill)**, not the typical partial-infill
approach. Solid PLA-CF removes the creep/flex mechanism that concern was
about (infill-cavity walls slowly deforming under sustained load); a
solid print behaves much closer to a machined block than a typical
lightweight 3D print. Accepted as resolved, not just deferred.

User will also modify the model file directly if the pulley mount
geometry doesn't fit the DiGiYes idler once test-fit — treat the
Printables download as a starting point, not a fixed, unmodifiable file.

**Not yet verified**: whether the print's pulley bore/mount geometry
fits the already-purchased [DiGiYes GT2 20T idler pulley](https://www.amazon.com/gp/product/B0BSPC7D9S/)
as downloaded, before any modification. Tooth count isn't the concern —
idler pulleys are smooth/toothless by design (this build's own reasoning
above, and presumably true of the original HyperCube idler this print was
made for too), so the "T16" in the model's name is about GT2 belt-pitch
compatibility generally, not a mismatched mating tooth count. What
actually needs checking is the idler's physical bore diameter, outer
diameter, and width against what this bracket's mount was sized for —
same "verify against physical hardware" pattern used throughout this
build's other parts, with the fallback that it's a known-editable file
if it doesn't.

**Print settings**: PLA-CF, **100% (solid) infill** — deliberately
different from this build's other printed parts, which use 15% infill
([0040](0040-x-axis-v-wheel-gantry.md)); solid infill specifically to
resolve the creep/flex concern for this constantly-tensioned part.

Category: mostly off-the-shelf (idler pulley, motor mounts); idler mount
bracket now 3D-printed PLA-CF instead of off-the-shelf hardware.

## Consequences

- One consistent hardware size (5mm/M5) across idler bore, idler mounting
  bolt, and motor shaft — simplifies the parts list.
- Idler tensioning is manual (slide T-nut, tighten) rather than a
  dedicated adjustable-slot bracket mechanism — simple but requires loosening
  and re-tightening the bolt to adjust tension, rather than a quick-adjust
  slot.
- Idler pulley now sourced — motor-side pulley hardware list
  ([0017](0017-stepper-motor-selection.md), [0019](0019-drive-pulley-selection.md),
  this ADR) is complete.
