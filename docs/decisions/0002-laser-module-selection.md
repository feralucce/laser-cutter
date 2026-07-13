# 0002. Laser module: LaserTree K40 (40W+ optical)

Date: 2026-07-13
Status: Accepted

## Context

Starting point is an Ortur LM2 S2 with a 10W optical module. Goal is to reliably
cut 1/2" (12.7mm) Baltic birch plywood (laser-grade, void-free). The Ortur's
stock module and frame are not enough, and Ortur only officially supports up
to 10W on that platform anyway — so this is not an upgrade of the Ortur, it's
a new custom machine designed around a more powerful module.

We're buying the new laser module from LaserTree. Their relevant lineup
(optical output, not diode input power):

| Module | Optical power | Weight | Size (LxWxH) | Power draw | Price |
|---|---|---|---|---|---|
| K30 | 30W (measured ~34.2W) | 710g | 66x64x134mm | 24V/5A (120W) | $449 |
| K40 | 40W+ (measured ~44W) | 900g | 66x66x134mm | 24V/6A (144W) | $549 |
| K60 (switchable 20/40/60W) | up to 60W+ (measured ~70W) | 1263g | 76x83x178mm | 24V/10A (240W) | $829 |

Research (LaserTree's own cutting data plus independent tests) on cutting
12mm/15mm plywood:
- K30 is rated for 15mm plywood in one pass per LaserTree's own chart, but a
  separate MDF test needed ~4 passes at 12mm — borderline for dense hardwood
  ply, likely multiple passes with more heat/char risk.
- K40 is rated for 9mm MDF-15mm plywood, with one-pass claims up to 30mm pine.
  An independent test cut 12mm hardwood plywood cleanly in one pass at
  ~240mm/min. A K60 running at its 40W setting (same optical power as a K40)
  one-pass cut 15mm plywood at 160mm/min.
- K60 gives large headroom (up to 60W) but at ~1.8x the K30 price, 1.4x the
  K40 weight, and a noticeably larger footprint (76x83x178mm vs 66x66x134mm)
  — that ripples into needing a heavier gantry, stronger steppers, bigger
  rails, and a bigger frame than 12.7mm plywood actually requires.

## Decision

Use the **LaserTree K40** (40W+ optical, ~44W measured) as the laser module
for this build.

It clears the bar for cutting 1/2" Baltic birch (one slow pass, or two passes
at a more practical/cleaner speed) with real margin over the K30, while
staying light and compact enough (900g, 66x66x134mm) to build a reasonably
sized DIY gantry around, unlike the K60.

## Consequences

This module drives several downstream requirements for the machine design:

- **Power supply**: needs at least 24V/6A (144W). Confirmed via the K40's
  kit contents photo that this is **included** — ships with a 24V/8A power
  adapter and matching driver-adapter input cable, no separate sourcing
  needed. Motors/controller electronics are powered by a separate PSU, see
  [0023](0023-power-supply-selection.md).
- **Air assist**: the K40 has a built-in air assist nozzle, but needs an
  **external air pump/compressor** — not included, must be sourced separately
  (falls under the "off the shelf" component category).
- **Mounting**: module uses a "2EDG-3.81" electrical interface and ships with
  a sliding plate with M5/M3 mounting holes. The X-carriage/gantry mount needs
  to be designed (3D printed or laser cut) to accept this plate.
- **Carriage weight budget**: at 900g, the X-axis carriage, belt, and motor
  need to be sized to move this mass accurately at cutting speeds — this
  weight becomes a constraint on the motion system design (next decision).
- **Cooling/ventilation**: cutting at these power levels for 1/2" ply produces
  meaningful smoke/fumes — enclosure and exhaust design should account for
  this from the start, not be retrofitted.
