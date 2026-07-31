// SUPERSEDED 2026-07-29: switched to laser-cut 5mm black acrylic instead
// of 3D-printed PLA-CF (see ADR 0047 and hardware/laser-cut/y-gantry-plate.svg,
// the actual current design file). Kept here for reference/coordinate
// history only, not built.
//
// Y-axis gantry plate: reuses wheel/wheel-bolt hardware from the purchased
// aluminum V-wheel plate kit (0040), captured-belt drive (0046 -> reverted,
// this file supersedes that reversion). Two variants: motor side and
// bearing side, both share the same wheel/2040/L-bracket layout, differing
// only in the center mount (NEMA17 vs 625ZZ bearing).
//
// Reference geometry extracted from Printables/yplateleft.stl and
// yplateright.stl (both 80x160x8mm):
//   - 2040 mount: 2x M5 clearance, (40,130) & (40,150), 20mm apart on
//     centerline, matches this project's standard T-slot spacing
//   - NEMA17 / bearing center: (40, 87.77) -- NEMA17 is 4x M3 clearance
//     on a 31x31mm square around a 22mm shaft-clearance bore; bearing is
//     a single 16.2mm bore for the 625ZZ (matches
//     shaft-far-end-bearing-mount.scad's own bore sizing)
//   - Top wheels (yellow, reference): (10,72.27) & (70,72.27), Ø5.2mm,
//     fixed (non-eccentric) mounting, flanking the shaft
//   - Bottom wheel (grey, reference): (40,12.27), Ø7.2mm -- wider to
//     clear the eccentric tension-adjustment nut, matches the purchased
//     aluminum plate's own Ø7.2mm wheel-hole spec
//
// THIS design: 2 top wheels (unchanged from reference) + 3 BOTTOM wheels
// (reference only has 1) -- plate extended/widened at the bottom to fit
// 3 wheels in a row, all using the wider eccentric-nut-clearance hole
// style since all 3 bear the load. Plus 4 new M5 holes for L-brackets
// (2 per long edge), per the "FOR 20 SERIES ALUMINUM PROFILE RAIL"
// corner bracket (26mm tall leg, 25mm long leg, M5, hole 6mm in from
// the bend) -- NOT YET VERIFIED against the physical bracket, working
// estimate for hole position only (M5 clearance, doesn't need to match
// the bracket's own dimensions beyond bolt size).
//
// Print settings: PLA-CF, 100% (solid) infill -- same rationale as the
// idler mount (0018) and bearing mount: constantly-loaded points.

// ---- Variant switch ----
variant = "motor"; // "motor" or "bearing"

// ---- Parameters ----
plate_w = 80;
plate_t = 8;
plate_top_margin = 20;   // above the 2040 holes
plate_bottom_margin = 20; // below the bottom wheel row

hole_2040_y1 = 130;
hole_2040_y2 = 150;
hole_2040_d = 5.2;
hole_2040_x = plate_w/2;

center_y = 87.77;          // NEMA17 / bearing center, unchanged from reference
nema_bolt_spacing = 31;    // standard NEMA17 31x31mm
nema_bolt_d = 3.5;
nema_bore_d = 22;
bearing_bore_d = 16.2;

top_wheel_y = 72.27;       // unchanged from reference
top_wheel_x_offset = 30;   // +-30 from centerline (10 and 70 on an 80-wide plate)
top_wheel_d = 5.2;

bottom_wheel_y = 25;       // working estimate -- room for a 3-wheel row + margin
bottom_wheel_spacing = 30; // 3 wheels across the 80mm width, evenly spaced
bottom_wheel_d = 7.2;      // matches the purchased plate's own wheel-hole spec, eccentric-nut clearance

lbracket_hole_d = 5.2;     // M5 clearance
lbracket_x_offset = 6;     // inset from each edge
lbracket_y_positions = [45, 105]; // 2 per side, spread along the plate's mid-height

plate_h = hole_2040_y2 + plate_top_margin;
plate_bottom_y = bottom_wheel_y - plate_bottom_margin; // bottom edge, margin below the wheel row

module hole(x, y, d) {
    translate([x, y, -1])
        cylinder(d = d, h = plate_t + 2, $fn = 32);
}

module plate_outline() {
    translate([0, plate_bottom_y, 0])
        cube([plate_w, plate_h - plate_bottom_y, plate_t]);
}

difference() {
    plate_outline();

    // 2040 mount
    hole(hole_2040_x, hole_2040_y1, hole_2040_d);
    hole(hole_2040_x, hole_2040_y2, hole_2040_d);

    // NEMA17 or bearing
    if (variant == "motor") {
        hole(plate_w/2, center_y, nema_bore_d);
        for (dx = [-nema_bolt_spacing/2, nema_bolt_spacing/2])
            for (dy = [-nema_bolt_spacing/2, nema_bolt_spacing/2])
                hole(plate_w/2 + dx, center_y + dy, nema_bolt_d);
    } else {
        hole(plate_w/2, center_y, bearing_bore_d);
    }

    // top wheels (2, flanking the shaft)
    hole(plate_w/2 - top_wheel_x_offset, top_wheel_y, top_wheel_d);
    hole(plate_w/2 + top_wheel_x_offset, top_wheel_y, top_wheel_d);

    // bottom wheels (3, in a row)
    for (dx = [-bottom_wheel_spacing, 0, bottom_wheel_spacing])
        hole(plate_w/2 + dx, bottom_wheel_y, bottom_wheel_d);

    // 4 L-bracket holes, 2 per long edge
    for (y = lbracket_y_positions) {
        hole(lbracket_x_offset, y, lbracket_hole_d);
        hole(plate_w - lbracket_x_offset, y, lbracket_hole_d);
    }
}
