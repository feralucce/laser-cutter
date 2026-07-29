# 0022. Controller board: grblHAL Teensy 4.1 T41U5XBB

Date: 2026-07-13
Status: Superseded by [0041](0041-ortur-electronics-reuse.md)

## Context

Needed: a controller supporting dual independently-driven X motors with
auto-squaring ([0011](0011-x-axis-dual-motor.md)), a single Y motor, laser
PWM output for the K40 ([0002](0002-laser-module-selection.md)), and
reliable LightBurn/LaserGRBL compatibility.

Three options were compared:

- **MKS DLC32 + FluidNC**: cheap (~$40-60), laser-purpose-built PWM output,
  dual-X via a documented but non-native Z-driver-slot remap. Real risk
  found in research: FluidNC replaced GRBL's classic `$$` settings system
  with its own YAML config, causing reported LightBurn 1.1+ connection
  failures and incomplete M4 (dynamic laser power) support in LaserGRBL.
- **BlackBox X32**: $239.99, turnkey (no soldering), native grblHAL, 4
  genuinely independent drivers (no remap needed), explicit LightBurn
  support. Removes all the risk points found above, at a real cost premium.
- **grblHAL Teensy 4.1 breakout board (T41U5XBB)**: native grblHAL (same
  protocol-fidelity benefit as BlackBox X32), explicitly lists "Moving
  gantry, Auto-squaring" as a supported configuration in its own
  documentation — directly matches our use case. 5-axis capacity. Requires
  soldering (connectors + Ethernet components) and a separately-purchased
  Teensy 4.1. Total cost ~$88.94 (board $47.99 + pre-configured Teensy 4.1
  $40.95) — well under the BlackBox X32, in exchange for assembly labor.

Given confirmed comfort with soldering, the Teensy 4.1 route gets the same
native-grblHAL compatibility and explicitly-supported auto-squaring
capability as the BlackBox X32, at roughly a third of the cost.

## Decision

**grblHAL Teensy 4.1 T41U5XBB breakout board** —
https://brookwood-design-77.myshopify.com/products/t41u5xbb-board-kit
— paired with a pre-configured Teensy 4.1 —
https://protosupplies.com/product/teensy41-cnc/

Total: $47.99 + $40.95 = ~$88.94.

Category: off-the-shelf (purchased kit requiring customer soldering
assembly, not custom-designed/machined).

## Consequences

- Soldering required: connectors and Ethernet components must be soldered
  by hand — real assembly time/skill requirement, accepted given confirmed
  comfort with soldering.
- 5-axis capacity leaves headroom for a future Z-axis or rotary attachment
  without a board change.
- Native grblHAL avoids the FluidNC compatibility risks found in research
  (LightBurn 1.1+ connection issues, incomplete M4 dynamic laser power
  support) — should give more reliable LightBurn/LaserGRBL operation.
- Exact laser PWM voltage/spec not confirmed from the product page (laser
  use is listed as a supported application, but detailed spec wasn't
  shown) — worth confirming once the board is in hand, before wiring the
  K40's TTL/PWM input.
- Auto-squaring configuration for the dual-X motors ([0011](0011-x-axis-dual-motor.md))
  still needs to be set up in grblHAL's settings once the board is
  assembled and wired — not yet done, tracked as follow-on work.
