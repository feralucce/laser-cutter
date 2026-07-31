# 0046. Belt drive: shaft-driven open belt loops (both sides), not captured-under-wheel

Date: 2026-07-29
Status: Superseded by [0047](0047-captured-belt-custom-plates.md) (supersedes [0042](0042-captured-belt-drive.md); reinstates [0020](0020-belt-clamp-selection.md))

## Context

[0042](0042-captured-belt-drive.md) adopted the Ortur's captured-belt
mechanism (belt fed under the gantry wheels, over a pulley positioned
between the top two wheels) after the user described it verbally.
Reference photos of the actual Ortur mechanism confirmed the belt-under-
wheel description is accurate for the Ortur's own build, but matching it
exactly requires positioning a motor-mount/shaft assembly relative to
the specific wheel layout of **our purchased aluminum V-wheel plate**
(0040) — a different product than the Ortur's own 3mm acrylic plate,
with its own (not fully confirmed) 6-wheel layout.

Simpler alternative: keep the single-motor-plus-extended-shaft mechanism
(0041 — still one motor, one continuous shaft spanning the Y axis,
inherently squared since both drive points are the same physical shaft),
but put a **drive pulley at each end of the shaft** feeding a
conventional **open belt loop per side**, clamped to each gantry-leg's
carriage at one end and running to a fixed idler pulley at the other —
rather than threading the belt under each wheel. This is mechanically
equivalent for squaring purposes (still one rigid shaft, still
inherently synchronized, still nothing to keep in sync electronically)
without needing to match the captured-belt geometry to this specific
plate's wheel positions.

This also reinstates hardware already purchased for the original
custom-build plan and not wasted by any pivot so far: Socobeta motor
mounts, BEMONOC drive pulleys, DiGiYes idler pulleys, 3DMAN belt clamps
— all sized and quantified for exactly this kind of open-loop belt
system.

## Decision

- **Shaft mechanism unchanged from [0041](0041-ortur-electronics-reuse.md)**:
  one NEMA17 motor, shaft extended via coupler + standoff, spanning the
  full Y-axis (800mm) width.
- **Drive pulleys**: one GT2 20T pulley at each end of the shaft (motor
  end and far end) — BEMONOC pulleys already purchased.
- **Belts**: one open-loop GT2 belt per side (2 total for Y), each
  clamped to its own gantry-leg's carriage plate at the driven end, and
  running to a fixed idler pulley (DiGiYes, already purchased) at the
  frame-mounted far end of that side's rail.
- **Belt clamps**: 3DMAN clamps (already purchased) anchor each belt to
  its gantry-leg carriage — reinstates [0020](0020-belt-clamp-selection.md).

**Superseded**: [0042](0042-captured-belt-drive.md) — no captured/under-
wheel belt routing in this design.

**New open design task**: a motor-mount plate (holds the NEMA17 next to
one gantry-leg's carriage) and a shaft-support/standoff mount (supports
the shaft's far end at the other gantry-leg's carriage) — both need to
be designed from scratch, since this is a new frame, not the Ortur's own.
Reference photos of the Ortur's own motor-mount and shaft-standoff
mounts (from this conversation) are a useful visual starting point for
the general approach (bracket holding motor next to the wheel plate,
coupler-into-standoff on the far side), not a dimensioned template.

## Consequences

- No geometry dependency on the purchased aluminum plate's exact wheel
  layout for the belt mechanism — removes an open question that was
  blocking progress.
- Reinstates already-purchased hardware (Socobeta, BEMONOC, DiGiYes,
  3DMAN) that [0042](0042-captured-belt-drive.md) had made unnecessary —
  nothing wasted, no new purchases needed for the belt/pulley/clamp
  hardware itself.
- Real new design task: motor-mount plate + shaft-support/standoff mount,
  both attaching to the purchased aluminum gantry plates. Joins the
  existing open list (gantry end cap redesign, limit switch mount, idler
  mount print/fit check) as a 4th real design task.
- BOM's belt-routing note reverts to reflect open-loop clamps.
