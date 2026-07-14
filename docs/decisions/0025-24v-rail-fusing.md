# 0025. 24V rail fusing: blade fuse distribution blocks, per-branch

Date: 2026-07-14
Status: Accepted

## Context

Two independent 24V DC rails exist on this machine ([0023](0023-power-supply-selection.md),
[0024](0024-e-stop-wiring.md)):

- **Main rail** (Mean Well LRS-350-24, 350W/14.6A max): powers the 3
  NEMA17 steppers ([0017](0017-stepper-motor-selection.md)) and the
  T41U5XBB controller board ([0022](0022-controller-board-selection.md)).
  Calculated worst-case load ~154W (~6.4A), well under the supply's rating.
- **K40 rail** (the module's own dedicated 24V/8A adapter, unrelated to
  the main rail): powers the laser diode driver, gated through the E-stop
  relay ([0024](0024-e-stop-wiring.md)).

Neither rail has had its branch wiring protected yet — flagged as
follow-on work in both 0023 and 0024. General DC-CNC wiring practice:
fuse the main supply output at ~125-150% of calculated load, then fuse
each downstream branch individually so a fault in one stepper/driver or
in the laser wiring doesn't take down the whole rail or require guessing
which branch failed. Switch-mode supplies (like the LRS-350-24) are also
sensitive to being loaded past their rating by simultaneous peaky stepper
current draws, so keeping each branch's fault current contained matters
for supply stability, not just wiring safety.

## Decision

Automotive-style ATC/ATO blade fuse distribution blocks (cheap,
off-the-shelf, tool-free fuse replacement) on both rails:

**Main rail** (after the LRS-350-24, before branching):
- Main fuse: **10A** fast-blow (~150% of the ~6.4A calculated load)
- Branch: X1 stepper driver — **3A**
- Branch: X2 stepper driver — **3A**
- Branch: Y stepper driver — **3A**
- Branch: controller board (T41U5XBB + limit switches/logic) — **2A**

**K40 rail** (between the adapter and the E-stop relay from [0024](0024-e-stop-wiring.md)):
- Branch: K40 module main power — **10A** (~125% of the module's 8A rated
  draw)

Category: off-the-shelf.

## Consequences

- A fault isolated to one stepper branch, the controller branch, or the
  K40 branch blows only that branch's fuse — the rest of the machine stays
  live and the failed branch is immediately identifiable by which fuse
  tripped, rather than the whole rail dropping.
- The 10A main-rail fuse sits well under the LRS-350-24's 14.6A max output,
  so normal operation (including simultaneous multi-axis moves) shouldn't
  nuisance-trip it.
- Wire gauge for each branch needs to be sized to its fuse rating (not yet
  specified here) — worth confirming against whatever gauge wire is
  actually sourced, so the fuse is protecting wire that can actually carry
  its rated current without overheating first.
- Two separate fuse blocks are needed (one per rail) since the rails don't
  share a common ground/return — consistent with [0023](0023-power-supply-selection.md)'s
  decision to keep the K40's power independent rather than folding it into
  the main rail.
