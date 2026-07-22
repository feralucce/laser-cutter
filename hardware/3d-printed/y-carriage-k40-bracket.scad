// Y-axis laser carriage: K40 mounting bracket
// See docs/decisions/0032-y-axis-laser-carriage.md
//
// Material: PLA-CF, printed flat-back-down (block-mount face down on the
// print bed) so the bolt-hole axes print vertically (stronger, no
// overhang/bridging on the holes themselves).
//
// PARAMETERS MARKED "VERIFY" ARE WORKING ESTIMATES -- confirm against the
// actual MGN12H block, K40 sliding plate, and beam/rail stack-up before
// printing the final version. See ADR 0032's own caveats.
//
// Widened for the dual-rail Y-axis (ADR 0038): two MGN12H blocks, 40mm
// apart, riding the beam's two outer T-slots (now 2060, not 2040) --
// resolves the single-rail cantilever-moment concern under the K40's load.

// ---- Plate ----
plate_width       = 80;    // widened for 2 block patterns, 0038
plate_thickness   = 6;     // base wall thickness (PLA-CF)

// ---- Block-mount zone (top) ----
block_zone_height = 30;
block_hole_dia    = 3.5;   // M3 clearance
block_pattern     = 20;    // 20x20mm MGN12H pattern, 0013
block_spacing     = 40;    // center-to-center between the 2 blocks, 0038

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

module block_mount_holes() {
    for (cx = [plate_width/2 - block_spacing/2, plate_width/2 + block_spacing/2])
        for (dx = [-block_pattern/2, block_pattern/2])
            for (dz = [-block_pattern/2, block_pattern/2])
                translate([cx + dx, -1, total_height - block_zone_height/2 + dz])
                    rotate([-90, 0, 0])
                        cylinder(h = plate_thickness + 2, d = block_hole_dia, $fn = 24);
}

module belt_clamp_holes() {
    z = total_height - 8;
    for (x = [clamp_margin_x, plate_width - clamp_margin_x])
        translate([x, -1, z])
            rotate([-90, 0, 0])
                cylinder(h = plate_thickness + 2, d = clamp_hole_dia, $fn = 20);
}

module k40_slots() {
    z = k40_zone_height/2;
    for (x = [plate_width/2 - k40_slot_spacing/2, plate_width/2 + k40_slot_spacing/2])
        translate([x, -1, z])
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
    translate([plate_width/2 - 4, -1, z - 12.5])
        cube([8, plate_thickness + 2, 3]);
}

anchor_x = plate_width - clamp_margin_x;
anchor_z = total_height - 4;

module cable_anchor_post() {
    // small post near the top corner for the tension line, 0031 -- overlaps
    // 2mm into the plate so it's a proper manifold union, not just touching
    translate([anchor_x, plate_thickness - 2, anchor_z])
        rotate([90, 0, 0])
            cylinder(h = anchor_post_dia + 2, d = anchor_post_dia, $fn = 24);
}

module cable_anchor_hole() {
    translate([anchor_x, plate_thickness - 3, anchor_z])
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
        translate([i * spacing - rib_thickness/2, plate_thickness - 1, z0])
            cube([rib_thickness, rib_depth + 1, z1 - z0]);
}

module plate() {
    difference() {
        union() {
            cube([plate_width, plate_thickness, total_height]);
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
