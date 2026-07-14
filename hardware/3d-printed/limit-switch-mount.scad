// Limit switch mount bracket (X, A, Y -- printed 3x, same design)
// See docs/decisions/0033-limit-switch-selection.md
//
// L-bracket: mounting leg slides in the extrusion's T-slot (M5 bolt +
// T-nut) for position adjustment along the rail; switch leg holds a
// KW12-3-style SPDT roller-lever microswitch via slotted M2 holes.
//
// PARAMETERS MARKED "VERIFY" ARE WORKING ESTIMATES -- confirm against the
// actual switch purchased before printing all 3.

// ---- Mounting leg (against extrusion) ----
mount_leg_width   = 20;
mount_leg_height  = 25;
bolt_slot_width   = 6;     // clears an M5 bolt head/washer, slides for adjustment
bolt_slot_length  = 15;

// ---- Switch leg (perpendicular, holds the microswitch) ----
switch_leg_depth  = 20;    // VERIFY: matches switch body length (~20mm)
switch_hole_dia   = 2.5;   // M2 clearance, slotted
switch_hole_slot  = 4;     // extra slot length for adjustment
switch_hole_spacing = 9.5; // VERIFY: working estimate, see ADR 0033

thickness = 4;

module bolt_slot() {
    translate([mount_leg_width/2, -1, mount_leg_height/2])
        rotate([-90, 0, 0])
            linear_extrude(height = thickness + 2)
                hull() {
                    translate([0,  (bolt_slot_length - bolt_slot_width)/2]) circle(d = bolt_slot_width, $fn = 24);
                    translate([0, -(bolt_slot_length - bolt_slot_width)/2]) circle(d = bolt_slot_width, $fn = 24);
                }
}

module switch_holes() {
    // holes go through the switch leg's top face (Z axis), on the
    // horizontal outward-projecting leg
    for (dx = [-switch_hole_spacing/2, switch_hole_spacing/2])
        translate([mount_leg_width/2 + dx, switch_leg_depth/2, -1])
            linear_extrude(height = thickness + 2)
                hull() {
                    translate([ switch_hole_slot/2, 0]) circle(d = switch_hole_dia, $fn = 20);
                    translate([-switch_hole_slot/2, 0]) circle(d = switch_hole_dia, $fn = 20);
                }
}

module bracket() {
    difference() {
        union() {
            // mounting leg: vertical, flat against the extrusion
            cube([mount_leg_width, thickness, mount_leg_height]);
            // switch leg: horizontal, projects outward from the top of the mounting leg
            translate([0, 0, mount_leg_height - thickness])
                cube([mount_leg_width, switch_leg_depth, thickness]);
        }
        bolt_slot();
        switch_holes();
    }
}

bracket();
