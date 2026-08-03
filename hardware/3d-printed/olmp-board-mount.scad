// OLMP-V1.2C board mount, 3D-printed (interim, until laser cutter is
// rebuilt - see docs/decisions/0049-olmp-board-mount-3d-printed.md).
// Board: 20x20mm, 2x M3 bolts 15.5mm apart (the board's own bolts pass
// through the wall below). Slides along the V-slot extrusion via a
// T-nut through the base slot to position the 1200mm-axis limit switch.
//
// Units: mm.

$fn = 64;

// --- board mounting (from Reference/olmp-board-mount-build reference.svg) ---
hole_spacing   = 15.5;   // M3 hole center-to-center, vertical
hole_dia       = 3.4;    // M3 clearance, printed

// --- T-slot slide slot (from same SVG, TOP view) ---
slot_width     = 5.5;    // T-nut/M5 bolt slot width
slot_straight  = 21.3;   // straight portion between the rounded ends

// --- structure ---
wall_w   = 24;   // wall width (X), centered on the slot
wall_h   = 35;   // wall height (Z), holds the board
wall_t   = 4;    // wall thickness (Y) - upsized from the sketch's 2.4mm
                 // acrylic-scale thickness; PLA needs more meat here
                 // since this wall takes the switch-actuation impact.

base_d   = 34;   // base depth (X), along the slide direction
base_w   = wall_w;
base_t   = 5;

gusset_t = 4;    // corner gusset thickness (Y), for rigidity

slot_total_len = slot_straight + slot_width;

module slide_slot() {
    hull() {
        translate([-slot_straight/2, 0, 0]) cylinder(h = base_t + 1, d = slot_width, center = true);
        translate([ slot_straight/2, 0, 0]) cylinder(h = base_t + 1, d = slot_width, center = true);
    }
}

module base() {
    difference() {
        translate([-base_d/2, 0, 0])
            cube([base_d, base_w, base_t]);
        translate([0, base_w/2, base_t/2])
            slide_slot();
    }
}

module wall() {
    difference() {
        translate([-wall_w/2, 0, base_t])
            cube([wall_w, wall_t, wall_h]);
        // M3 through-holes, centered on wall width, vertically paired
        for (z = [base_t + wall_h/2 - hole_spacing/2, base_t + wall_h/2 + hole_spacing/2])
            translate([0, wall_t/2, z])
                rotate([-90, 0, 0])
                    cylinder(h = wall_t + 2, d = hole_dia, center = true);
    }
}

module gusset() {
    // triangular brace behind the wall (Y<0, the inner/-Y side, away
    // from the board's mounting face at Y=wall_t) bracing it to the
    // base top. Centered on X, apex up against the wall.
    // kept low enough to clear the lower M3 hole (base_t + wall_h/2 -
    // hole_spacing/2) from behind, so it doesn't plug the hole.
    gusset_h = (wall_h/2 - hole_spacing/2) - 2;
    gusset_d = base_d * 0.6;
    z0 = base_t;
    polyhedron(
        points = [
            [-gusset_d/2, -gusset_t, z0], [gusset_d/2, -gusset_t, z0], [0, -gusset_t, z0 + gusset_h],
            [-gusset_d/2, 0,         z0], [gusset_d/2, 0,         z0], [0, 0,         z0 + gusset_h],
        ],
        faces = [
            [0,1,2],       // front triangle
            [5,4,3],       // back triangle
            [0,3,4,1],     // bottom
            [1,4,5,2],     // right side
            [2,5,3,0],     // left side
        ]
    );
}

module olmp_board_mount() {
    base();
    wall();
    gusset();
}

olmp_board_mount();
