# 0003. Parts sourcing constraint: off-the-shelf, PLA-CF printed, or laser cut

Date: 2026-07-13
Status: Accepted

## Context

This is a DIY build with a specific fabrication toolset available: a 3D
printer capable of PLA-CF, and the laser cutter itself (see [0002](0002-laser-module-selection.md)
for why we're upgrading it). We want every part in the design to be something
that can actually be acquired or made without needing tools/processes we
don't have (e.g. no machining, no injection molding, no parts requiring
sourcing from obscure/hard-to-find suppliers).

## Decision

Every part in this machine must fall into exactly one of these categories:

1. **Off-the-shelf** — a component that can be ordered easily from a normal
   supplier (McMaster-Carr, Amazon, AliExpress, OpenBuilds, etc.). Linear
   rails, bearings, belts, steppers, drivers, fasteners, the laser module
   itself, PSU, etc.
2. **3D printed in PLA-CF** — brackets, mounts, carriages, panels, or other
   structural/functional parts we design and print ourselves. Since PLA-CF is
   more rigid and less prone to warping/creep than plain PLA but is still
   somewhat brittle and has lower heat tolerance than nylon/PETG-CF, parts
   should avoid thin-walled high-stress features and stay clear of the laser
   module's heat zone.
3. **Cut on our existing laser cutter** — flat panels/plates (e.g. frame
   panels, gussets, gantry plates) cut from sheet stock (plywood, acrylic,
   MDF) up to whatever thickness our *current* machine can cut, since the new
   machine isn't built yet.

No part may require CNC machining, injection molding, casting, welding, or
sourcing from a supplier that isn't a standard easy-to-order channel.

## Consequences

- Every design decision from here forward should note which of these three
  categories each part falls into.
- Some tradeoffs are forced: e.g. we can't spec precision-machined aluminum
  brackets even if they'd be structurally nicer — we need an off-the-shelf
  equivalent, a PLA-CF printed part, or a laser-cut panel instead.
- The laser-cut category is thickness-limited by our *current* 10W Ortur
  module until the new machine exists — this may constrain frame panel
  thickness choices for laser-cut parts (e.g. limits to thin plywood/MDF/
  acrylic, not the 1/2" birch the new machine is meant to cut).
- PLA-CF's heat sensitivity means any bracket close to the laser module or
  in the exhaust path needs extra clearance or a heat shield, rather than
  relying on the material's own heat resistance.
