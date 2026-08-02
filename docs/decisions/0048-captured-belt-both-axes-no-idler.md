# 0048. Captured belt drive on both axes; idler pulleys eliminated

Date: 2026-07-31
Status: Accepted (extends [0047](0047-captured-belt-custom-plates.md) to X; supersedes [0018](0018-motor-and-idler-mounts.md)'s idler pulley/mount, [0019](0019-drive-pulley-selection.md) where it specified an idler-loop system)

## Context

[0047](0047-captured-belt-custom-plates.md) adopted captured-belt drive
for the Y-axis (short, 800mm, dual-rail/shaft-driven) gantry plates.
The X-axis (long, 1200mm, single-motor carriage) had been left on the
original open-loop belt design (drive pulley + idler pulley + belt
clamps at each end).

User has now extended captured-belt routing to X as well. A captured
belt path doesn't need a separate idler pulley — the belt threads
directly under the traveling wheels rather than needing a dedicated
return pulley at the far end of an open loop. This removes the idler
pulley (and its mount) from the design entirely, on both axes.

## Decision

- Captured belt drive on **both axes** (X and Y), not just Y.
- **DiGiYes idler pulley**: no longer needed anywhere in the design.
- **Idler mount bracket** (JeSc HyperCube XY Idler T16 v2.0, the
  project's last remaining 3D-printed part): no longer needed, removed
  from `hardware/3d-printed/`.
- **The GT2 fixing clamp becomes the only 3D-printed part in this
  build**: [hardware/3d-printed/gt2-fixing-clamp.stl](../../hardware/3d-printed/gt2-fixing-clamp.stl)
  (source: user-downloaded model, "gt2-belt-clamp-techguy"). Anchors the
  captured belt's ends. Qty: **8** (per-axis-end anchor points across
  both axes). Print PLA-CF, solid (100% infill) — same creep-resistance
  rationale already established for this project's other tensioned
  printed parts.
- `hardware/3d-printed/` cleaned out — all previously-superseded
  drafts (limit-switch-mount, shaft-far-end-bearing-mount,
  y-carriage-k40-bracket, y-gantry-plate) removed outright rather than
  kept for reference, since none of them represent live geometry
  anymore and this project's git history already preserves them if
  ever needed.

## Consequences

- BEMONOC drive pulley and 3DMAN belt clamp purchases (0019/0020) are
  no longer part of this design on either axis — captured belt uses the
  drive pulley mounted between the wheels directly, and the GT2 fixing
  clamp anchors the belt ends instead of the 3DMAN clamps.
- BOM updated: DiGiYes idler pulley removed from Motion system; 3D-printed
  parts section now lists only the GT2 fixing clamp, qty 8.
- Belt clamp/idler pulley hardware already purchased for the original
  open-loop design is simply not part of this design going forward —
  not something to manage or return, the user's own call.
