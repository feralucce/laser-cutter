// SUPERSEDED 2026-07-29: reverted to captured-belt drive (see ADR 0047).
// The 625ZZ bearing now mounts directly into the laser-cut acrylic
// "bearing side" gantry plate (hardware/laser-cut/y-gantry-plate.svg),
// no separate printed standoff bracket needed. Kept here for reference
// only, not built.
//
// Far-end shaft support bracket: holds a 625ZZ bearing (5mm bore x 16mm OD
// x 5mm width) at the opposite end of the Y-axis shaft from the motor/idler
// mount (Printables/Nema 17 Motor mount Dual side.stl,
// Printables/jesc_hypercube_xy_idler_t16_v20-2.stl). See ADR 0046.
//
// Print settings: PLA-CF, 100% (solid) infill -- same rationale as the
// idler mount (0018): constantly-loaded shaft-support point, avoid
// infill-cavity creep/flex.
//
// NOT YET VERIFIED -- flagged parameters below, per this project's usual
// "verify against physical hardware" pattern:
//   - shaft_height: measured from the motor mount STL's own bounding box
//     (Z range -4 to 19.5mm) as a working estimate only. Must match the
//     motor mount's actual shaft/pulley centerline height once both are
//     physically in hand -- the 4 slotted tracks give horizontal (along-
//     beam) adjustment, not vertical, so this height needs to be close
//     to correct before printing, not just adjustable at assembly.
//   - bearing_bore_d: nominal 16.0mm for a 625ZZ press fit. PLA-CF prints
//     often come out slightly undersized -- test-fit and adjust before
//     committing to the final print.

// ---- Parameters ----
shaft_height = 17;         // TODO verify against motor mount's actual shaft height
plate_w = 40;               // base plate width (matches 2040's 40mm face)
plate_t = 6;                 // base plate thickness
bearing_bore_d = 16.0;       // 625ZZ OD press fit -- verify/adjust after test print
bearing_depth = 5.4;         // 625ZZ width (5mm) + 0.4mm clearance
tower_h = shaft_height + bearing_bore_d/2 + 4;  // tower must clear the full bearing pocket, not just its centerline
tower_w = 24;                // tower width (front-on)
tower_t = 10;                 // tower thickness (front-to-back) -- bearing_depth + retaining wall
shaft_clear_d = 5.5;         // shaft clearance through the bracket (bearing carries the shaft, not the bracket)
retaining_lip = 1.5;         // lip at the back of the bearing pocket, shaft passes through this

slot_w = 5.5;                 // M5 bolt clearance width
slot_len = 14;                // slot length -- along-beam adjustment travel
tslot_spacing = 20;           // 2040's two T-slots, 20mm apart (matches this project's other brackets)
slot_row_spacing = 30;        // vertical distance between the top and bottom slot rows
edge_margin = 12;             // margin from slot center to plate top/bottom edge

plate_h = slot_row_spacing + 2*edge_margin; // base plate height, room for both slot rows + margin

module slot(len, w) {
    hull() {
        translate([-len/2 + w/2, 0]) circle(d = w, $fn = 32);
        translate([len/2 - w/2, 0]) circle(d = w, $fn = 32);
    }
}

module base_plate() {
    difference() {
        cube([plate_w, plate_h, plate_t]);
        // 4 slotted tracks: 2 columns (matching the 2 T-slots, 20mm apart),
        // 2 slots per column (top and bottom), horizontal slots for
        // along-beam position adjustment
        for (col = [-1, 1])
            for (row_y = [edge_margin, edge_margin + slot_row_spacing])
                translate([plate_w/2 + col*tslot_spacing/2, row_y, -1])
                    linear_extrude(plate_t + 2)
                        slot(slot_len, slot_w);
    }
}

module tower() {
    translate([plate_w/2 - tower_w/2, plate_h/2 - tower_t/2, plate_t])
        cube([tower_w, tower_t, tower_h]);
}

module bearing_pocket() {
    translate([plate_w/2, plate_h/2, plate_t + shaft_height]) {
        rotate([90, 0, 0]) {
            // bearing pocket, blind (retaining lip at the back)
            translate([0, 0, -tower_t/2])
                cylinder(d = bearing_bore_d, h = bearing_depth, $fn = 64);
            // shaft clearance through-hole, full depth
            translate([0, 0, -tower_t/2 - 1])
                cylinder(d = shaft_clear_d, h = tower_t + 2, $fn = 32);
        }
    }
}

difference() {
    union() {
        base_plate();
        tower();
    }
    bearing_pocket();
}
