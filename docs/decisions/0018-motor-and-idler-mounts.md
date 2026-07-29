# 0018. Motor mount and idler mount hardware

Date: 2026-07-13
Status: Accepted

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

Worth flagging plainly: this reopens the exact concern this ADR's own
Context section raised against printing the idler mount in the first
place — "constantly-tensioned anchor points where PLA-CF creep/flex would
be a risk." That reasoning hasn't changed; the OpenBuilds kit just
stopped being purchasable. Not a reason to block the switch, but worth
watching for belt tension drift over time in a way the all-metal
bolt-on-T-nut approach wouldn't have had.

**Not yet verified**: whether this print's pulley bore/mount geometry
actually fits the already-purchased [DiGiYes GT2 20T idler pulley](https://www.amazon.com/gp/product/B0BSPC7D9S/)
— the model's name references "T16" (a 16-tooth pulley reference from its
original HyperCube application), which may assume different dimensions
than our 20-tooth idler. Check fit before printing the final version,
same "verify against physical hardware" pattern used throughout this
build's other parts.

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
