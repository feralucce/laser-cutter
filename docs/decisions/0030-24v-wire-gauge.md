# 0030. Wire gauge per 24V fuse branch

Date: 2026-07-14
Status: Accepted

## Context

[0025](0025-24v-rail-fusing.md) set fuse ratings for both 24V rails but
left wire gauge open — a fuse only protects wire that's actually rated to
carry its current; undersized wire can overheat before a fuse ever blows.

Using the standard chassis-wiring AWG ampacity table (short, ventilated
runs — the relevant column for wiring inside a machine frame, not bundled
power-transmission cable) as a baseline:

| AWG | Chassis ampacity |
|---|---|
| 24 | 3.5A |
| 22 | 7A |
| 20 | 11A |
| 18 | 16A |
| 16 | 22A |
| 14 | 32A |

Picking the bare-minimum gauge that clears each fuse rating (e.g. 24 AWG
for a 3A branch) would technically pass an ampacity check, but two things
push toward one size heavier than the minimum:

- **Screw-terminal robustness**: both the T41U5XBB's control/stepper
  terminals ([0026](0026-t41u5xbb-pin-mapping.md)) and the blade fuse
  blocks ([0025](0025-24v-rail-fusing.md)) are screw-clamp connections —
  thin wire (24-22 AWG) makes a weaker mechanical connection that's more
  prone to working loose under the vibration this machine generates during
  cutting moves.
- **The K40 branch flexes with the gantry**: unlike the X/Y stepper and
  idler wiring, which is fixed motor/frame-mounted and never moves
  ([0015](0015-x-axis-motor-system.md)), the K40 rides the X-carriage —
  its power leads need to survive continuous drag-chain flexing, which
  favors a slightly heavier, genuinely stranded (not solid-core) wire over
  the bare ampacity minimum.

## Decision

**Simplified to a single gauge for the whole machine (2026-07-22)**: originally
specified per-branch (16/18/20 AWG below), but standardizing on **16 AWG for
every branch** to make this a single purchase instead of three separate
spools — 16 AWG already clears the highest branch fuse (10A) with margin, so
running it on the lower-current 3A/2A branches too is just extra headroom,
not undersized wire anywhere.

| Branch | Fuse ([0025](0025-24v-rail-fusing.md)) | Wire gauge |
|---|---|---|
| Main rail: PSU output → fuse block | 10A main | **16 AWG** |
| X1 / X2 / Y stepper branches (each) | 3A | **16 AWG** (was 18 AWG) |
| Controller board branch | 2A | **16 AWG** (was 20 AWG) |
| K40 rail: adapter → E-stop relay → module | 10A | **16 AWG**, drag-chain-rated stranded |

Category: off-the-shelf wire/consumables, no BOM-defining product link
needed (standard hookup wire).

## Consequences

- Every branch's wire ampacity now clears its fuse rating with comfortable
  margin (roughly 1.5-2x headroom at chassis-wiring ratings on the 10A
  branches; substantially more on the 3A/2A branches now that they're also
  16 AWG), rather than sitting at the bare minimum.
- One spool size to buy instead of three — simpler purchasing, at the cost
  of slightly bulkier/stiffer wire than strictly necessary on the low-current
  stepper/controller branches. Not a functional downside, just a minor
  routing/bulk tradeoff accepted for purchasing simplicity.
- The K40 branch specifically should be sourced as flexible stranded wire
  rated for continuous flexing (e.g. drag-chain/robotic cable, not generic
  stranded hookup wire) given it moves with the gantry — this is a sourcing
  note, not a new part to design.
- Completes the electrical wiring plan started in [0023](0023-power-supply-selection.md)
  (PSU sizing) through [0025](0025-24v-rail-fusing.md) (fusing) — gauge was
  the last unresolved piece of that chain.
- Voltage drop wasn't separately calculated — at these currents and the
  short in-frame run lengths expected, the chassis-wiring ampacity margin
  already covers it, but worth a sanity check once actual cable run lengths
  are known at assembly.
