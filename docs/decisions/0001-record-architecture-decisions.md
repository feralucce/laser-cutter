# 0001. Record decisions as ADRs

Date: 2026-07-13
Status: Accepted

## Context

This is a from-scratch DIY laser cutter/engraver build. We'll be making many
consequential choices (frame, laser source, motion system, electronics,
firmware/software, enclosure, safety systems) over time, and want a durable
record of why each choice was made, not just what was chosen.

## Decision

Record each significant design decision as a numbered markdown file in
`docs/decisions/`, following `template.md`. Use sequential numbering
(0001, 0002, ...). Mark a record "Superseded by NNNN" rather than editing
history when a decision changes.

## Consequences

Slight overhead per decision, but gives us a searchable history and lets
future us (or collaborators) understand the reasoning instead of just the
current state of the build.
