// Y-axis laser carriage: K40 mounting bracket
// See docs/decisions/0032-y-axis-laser-carriage.md, 0039-y-axis-single-rail-dual-block.md
//
// Material: PLA-CF, printed flat-back-down (block-mount face down on the
// print bed) so the bolt-hole axes print vertically (stronger, no
// overhang/bridging on the holes themselves).
//
// PARAMETERS MARKED "VERIFY" ARE WORKING ESTIMATES -- confirm against the
// actual MGN12H block, K40 sliding plate, and beam/rail stack-up before
// printing the final version. See ADR 0032's own caveats.
//
// Single MGN12 rail (ADR 0039, reverting 0038's dual-rail approach): the
// cantilever-moment concern is resolved by mounting TWO MGN12H blocks on
// this ONE rail, spaced apart along the rail's own travel direction
// (the same axis the belt runs along), instead of by adding a second
// parallel rail. The block-mount zone is a spine spanning both block
// positions; the standoff/K40-mount arm hangs from its center.

// ---- Plate ----
plate_width       = 50;    // matches gantry end plate width, 0013/0016
plate_thickness   = 6;     // base wall thickness (PLA-CF)

// ---- Block-mount zone (top) ----
block_zone_height  = 30;
block_hole_dia     = 3.5;  // M3 clearance
block_pattern      = 20;   // 20x20mm MGN12H pattern, 0013
block_travel_span  = 60;   // VERIFY: center-to-center spacing between the 2
                            // blocks along the rail's travel direction --
                            // must clear MGN12H's 45.4mm block length with a
                            // real gap (0039); wider spacing gives more
                            // moment resistance, kept modest here for
                            // carriage compactness

// ---- Belt clamp holes (top, either side of block-mount zone) ----
clamp_hole_dia    = 4.5;   // M4 clearance, 3DMAN clamp, 0020
clamp_margin_x    = 6;     // from plate edge, matches 0016's placement

// ---- Standoff / rib zone (middle) ----
standoff_height   = 70;    // VERIFY: clear beam's bottom edge + rail/block stack-up (est. 60-80mm)
rib_depth         = 14;    // how far the ribs project behind the plate
rib_count         = 3;
rib_thickness     = 4;

// ---- K40 mount zone (bottom) ----
k40_zone_height   = 40;
k40_slot_width    = 6;     // VERIFY against actual K40 sliding plate
k40_slot_height   = 25;    // VERIFY -- also serves as focus-height adjustment travel
k40_slot_spacing  = 30;    // VERIFY: placeholder hole spacing, center-to-center

// ---- Cable management (0031) ----
anchor_post_dia   = 8;
anchor_hole_dia   = 3;

total_height = block_zone_height + standoff_height + k40_zone_height;

// Total Y-extent of the spine covering both block-mount faces
spine_span   = block_travel_span + plate_thickness;
// Y-offset of the standoff/K40 column, centered under the spine
standoff_y0  = spine_span / 2 - plate_thickness / 2;

module spine() {
    // Solid block spanning both block positions -- the rigid link between
    // the 2 blocks on the single rail, replacing 0038's wider side-by-side
    // 2-rail plate.
    translate([0, 0, total_height - block_zone_height])
        cube([plate_width, spine_span, block_zone_height]);
}

module block_mount_holes() {
    // Front block: bore from the y=0 face inward
    for (dx = [-block_pattern/2, block_pattern/2])
        for (dz = [-block_pattern/2, block_pattern/2])
            translate([plate_width/2 + dx, -1, total_height - block_zone_height/2 + dz])
                rotate([-90, 0, 0])
                    cylinder(h = plate_thickness + 2, d = block_hole_dia, $fn = 24);
    // Rear block, block_travel_span away: bore from the spine's far face inward
    for (dx = [-block_pattern/2, block_pattern/2])
        for (dz = [-block_pattern/2, block_pattern/2])
            translate([plate_width/2 + dx, spine_span - plate_thickness - 1, total_height - block_zone_height/2 + dz])
                rotate([-90, 0, 0])
                    cylinder(h = plate_thickness + 2, d = block_hole_dia, $fn = 24);
}

module belt_clamp_holes() {
    z = total_height - 8;
    for (x = [clamp_margin_x, plate_width - clamp_margin_x])
        translate([x, standoff_y0 - 1, z])
            rotate([-90, 0, 0])
                cylinder(h = plate_thickness + 2, d = clamp_hole_dia, $fn = 20);
}

module k40_slots() {
    z = k40_zone_height/2;
    for (x = [plate_width/2 - k40_slot_spacing/2, plate_width/2 + k40_slot_spacing/2])
        translate([x, standoff_y0 - 1, z])
            rotate([-90, 0, 0])
                linear_extrude(height = plate_thickness + 2)
                    hull() {
                        translate([0,  (k40_slot_height - k40_slot_width)/2]) circle(d = k40_slot_width, $fn = 24);
                        translate([0, -(k40_slot_height - k40_slot_width)/2]) circle(d = k40_slot_width, $fn = 24);
                    }
}

module cable_zip_tie_slot() {
    // pass-through slot for spiral-wrapped bundle, mid standoff zone
    z = block_zone_height + standoff_height/2;
    translate([plate_width/2 - 4, standoff_y0 - 1, z - 12.5])
        cube([8, plate_thickness + 2, 3]);
}

anchor_x = plate_width - clamp_margin_x;
anchor_z = total_height - 4;

module cable_anchor_post() {
    // small post near the top corner for the tension line, 0031 -- overlaps
    // 2mm into the plate so it's a proper manifold union, not just touching
    translate([anchor_x, standoff_y0 + plate_thickness - 2, anchor_z])
        rotate([90, 0, 0])
            cylinder(h = anchor_post_dia + 2, d = anchor_post_dia, $fn = 24);
}

module cable_anchor_hole() {
    translate([anchor_x, standoff_y0 + plate_thickness - 3, anchor_z])
        rotate([90, 0, 0])
            cylinder(h = anchor_post_dia + 4, d = anchor_hole_dia, $fn = 20);
}

module ribs() {
    // triangular gussets behind the standoff zone for stiffness under the
    // cantilevered K40 load (~900g module + bracket)
    z0 = block_zone_height;
    z1 = block_zone_height + standoff_height;
    spacing = plate_width / (rib_count + 1);
    for (i = [1 : rib_count])
        translate([i * spacing - rib_thickness/2, standoff_y0 + plate_thickness - 1, z0])
            cube([rib_thickness, rib_depth + 1, z1 - z0]);
}

module plate() {
    difference() {
        union() {
            spine();
            translate([0, standoff_y0, 0])
                cube([plate_width, plate_thickness, total_height - block_zone_height]);
            ribs();
            cable_anchor_post();
        }
        block_mount_holes();
        belt_clamp_holes();
        k40_slots();
        cable_zip_tie_slot();
        cable_anchor_hole();
    }
}

plate();
