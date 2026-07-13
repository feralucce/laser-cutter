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

Category: all off-the-shelf components.

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
