# 0037. Stepper driver modules: STEPPERONLINE DM542T

Date: 2026-07-15
Status: Superseded by [0041](0041-ortur-electronics-reuse.md)

## Context

Found while building the wiring diagram ([docs/reference/wiring-diagram.svg](../reference/wiring-diagram.svg)):
no ADR had ever selected actual stepper driver modules. [0017](0017-stepper-motor-selection.md)
picked the motors themselves, and [0022](0022-controller-board-selection.md)'s
T41U5XBB manual confirms its stepper outputs are **5V logic step/dir/enable
signals only** ("capable of driving opto-isolated stepper driver inputs"),
routed via screw terminals or pin headers — not integrated driver ICs, and
not a pluggable-stepstick socket either. The board genuinely cannot drive
motor coils on its own; external driver modules were a missing piece of
the BOM.

**STEPPERONLINE DM542T** — same brand as the motors ([0017](0017-stepper-motor-selection.md)),
and unlike a lot of generic hardware in this build, this one has an actual
manufacturer datasheet with a real pinout (not a guessed/aggregated
estimate):

- **Control connector (P1)**: 3 opto-isolated inputs — PUL+/PUL-,
  DIR+/DIR-, ENA+/ENA-. Accepts single-ended or differential signals,
  which covers the T41U5XBB's single-ended 5V logic step/dir/enable
  outputs directly (signal to the `+` pin, common ground to the `-` pin).
- **Power/motor connector (P2)**: 20-50VDC power input (comfortably covers
  the 24V main rail, [0023](0023-power-supply-selection.md)), A+/A-/B+/B-
  motor phase outputs.
- **Current setting**: DIP-switch selectable, 1.0-4.2A range — covers the
  motor's 2A/phase rating ([0017](0017-stepper-motor-selection.md)) with
  margin, adjustable without needing UART/SPI configuration.
- Widely used, well-documented in the CNC/DIY community for exactly this
  external-breakout-plus-standalone-driver topology.

## Decision

**3x [STEPPERONLINE DM542T](https://www.amazon.com/STEPPERONLINE-1-0-4-2A-20-50VDC-Micro-step-Resolutions/dp/B06Y5VPSFN)**
(1.0-4.2A, 20-50VDC digital stepper driver) — one per motor (X1, X2/A, Y,
per [0011](0011-x-axis-dual-motor.md)/[0021](0021-y-axis-motor-system.md)).

Wiring: T41U5XBB's X/A/Y step/dir/enable outputs → each driver's PUL+/DIR+/ENA+
(with the corresponding `-` pins tied to the controller's signal ground).
Main rail fuse block's X1/X2/Y branches (3A each, 18AWG, [0025](0025-24v-rail-fusing.md)/[0030](0030-24v-wire-gauge.md))
→ each driver's P2 24V power input. Driver's A+/A-/B+/B- → motor phase
leads.

Category: off-the-shelf ([0003](0003-parts-sourcing-constraint.md)).

## Consequences

- Closes the gap found while building the wiring diagram — the machine
  can now actually be wired end-to-end from controller to motor, where
  before there was a real hole in the BOM.
- Current DIP switches need setting to match the motor's 2A/phase rating
  at commissioning — not a design decision, a physical switch-flip once
  the driver is in hand (consistent with how other commissioning-time
  settings are handled, e.g. [0027](0027-grblhal-auto-square-config.md)).
- These are physically larger than stepstick-style modules (DM542T is a
  standalone boxed driver, not a small plug-in board) — needs its own
  mounting space in the electronics enclosure, not accounted for
  elsewhere yet.
- [docs/reference/wiring-diagram.svg](../reference/wiring-diagram.svg)
  updated to replace the flagged gap with this actual product.
