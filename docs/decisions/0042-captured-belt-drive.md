# 0042. Belt routing: captured belt drive (Ortur style), not clamped-both-ends

Date: 2026-07-29
Status: Superseded by [0046](0046-shaft-driven-open-belt.md) (supersedes [0020](0020-belt-clamp-selection.md); modifies
[0018](0018-motor-and-idler-mounts.md), [0019](0019-drive-pulley-selection.md),
[0040](0040-x-axis-v-wheel-gantry.md))

## Context

[0020](0020-belt-clamp-selection.md) designed an open belt loop with both
ends clamped directly to the carriage/end plate (3DMAN aluminum clamp
blocks, bolted on either side of the carriage-mount hole pattern) — the
standard MGN-rail-carriage belt anchoring style this project had been
assuming.

The Ortur LM2 S2, which this build is now reusing the controller/drivers/
motors/wiring/switches from ([0041](0041-ortur-electronics-reuse.md)),
uses a different belt path: a **captured belt drive**. The belt is fed
under the gantry's and carriage's V-wheels (the wheel presses the belt
against the rail/plate as it travels, capturing it in place along the
run) and over the timing gear (the motor's drive pulley) at the fixed
end. This is a continuous routed path along the wheel track, not a
short open loop clamped at both ends to a stationary carriage plate.

This build is already using V-wheel gantry plates on X
([0040](0040-x-axis-v-wheel-gantry.md)) and wheels as Y-carriage
reinforcement ([0039](0039-y-axis-single-rail-dual-block.md)) — the
wheel hardware needed for a captured-belt path is already the planned
mechanism, just not yet the belt routing built around it.

## Decision

Adopt the Ortur's captured belt drive routing for both axes: belt runs
under each gantry-plate/carriage wheel along the rail, over the drive
pulley (timing gear) at the motor end. No dedicated belt-clamp hardware
bolted to the carriage/end plate.

**Superseded**: [0020](0020-belt-clamp-selection.md) (3DMAN clamp
blocks) — no longer needed in this design.

**Open, not yet resolved by this ADR**:
- The new custom gantry plates ([0040](0040-x-axis-v-wheel-gantry.md))
  and laser carriage ([0032](0032-y-axis-laser-carriage.md)) — both
  already open design tasks — now need to incorporate a belt-capture
  channel/track under each wheel, matching the Ortur's geometry, not
  just a bolt pattern. This is a real addition to the scope of those
  two open tasks, not a separate task.
- Whether the already-purchased BEMONOC drive pulley and DiGiYes idler
  pulley ([0018](0018-motor-and-idler-mounts.md),
  [0019](0019-drive-pulley-selection.md)) are dimensionally compatible
  with captured-belt routing (belt needs to sit flush under the wheels
  and mesh cleanly at the pulley without slack or excess pinch) — not
  yet checked. If not compatible, the Ortur's own drive/idler pulleys
  (already proven with this exact routing) are the fallback, consistent
  with [0041](0041-ortur-electronics-reuse.md)'s reuse approach.
- Belt end termination: even a captured-belt path still needs the belt's
  two ends fixed somewhere (typically at the carriage) — mechanism not
  yet designed, just no longer the 3DMAN clamp-block approach.

## Consequences

- Removes the previously-purchased 3DMAN GT2 belt clamps from this
  design's scope (still bought, just not part of this design —
  [0041](0041-ortur-electronics-reuse.md)'s reuse pivot already
  established this "bought but not needed" pattern for other parts).
- Ties belt routing directly to the gantry-plate/carriage design work
  that was already open — raises the bar on that design task (needs a
  wheel-track belt channel, not just bolt holes) but doesn't add a new
  task to the list.
- Pulley compatibility with this routing is a new, real open
  verification item alongside the existing "verify against physical
  hardware" items already tracked for this build.
