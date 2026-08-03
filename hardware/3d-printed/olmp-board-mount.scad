// OLMP-V1.2C board mount, 3D-printed (interim, until laser cutter is
// rebuilt - see docs/decisions/0049-olmp-board-mount-3d-printed.md).
//
// Direct translation of Reference/olmp-board-mount-build reference.svg
// (FRONT/TOP/SIDE layers). Genuine L-bracket: thin vertical wall +
// thin horizontal foot (both 2.5mm, per the SIDE layer), not a solid
// wedge - the SIDE layer is two ~2.4mm-thick rectangles meeting at a
// corner, i.e. an actual L cross-section.
//
// Axes: X = width (u, FRONT/TOP left-right), Y = depth (d, TOP/SIDE
// front-back), Z = height (w, FRONT/SIDE up-down).
//
// Units: mm.

$fn = 64;

// --- exact FRONT profile outline (wall's own front-facing silhouette),
// traced from the SVG path/bezier curves, as (u, -w) pairs ready for
// linear_extrude + rotate([-90,0,0]) (see wall() below). Updated per
// the user's edit: front narrowed to 29.55mm (was 40.08mm), left edge
// held in place so it still aligns with the foot's left edge - the
// wall no longer spans the foot's full width, intentionally. ---
front_profile = [
    [26.506,-35.0], [29.7,-35.019], [31.095,-35.024], [31.234,-35.02],
    [30.661,-35.012], [29.919,-35.004], [29.551,-0.0], [0.08,-0.0],
    [0.074,-0.119], [0.061,-0.459], [0.044,-0.993], [0.025,-1.697],
    [0.01,-2.543], [0.0,-3.506], [0.0,-4.56], [0.36,-8.401],
    [1.259,-11.394], [2.646,-14.562], [4.459,-17.807], [6.631,-21.034],
    [9.099,-24.145], [11.798,-27.045], [14.664,-29.638], [17.632,-31.826],
    [20.638,-33.513], [23.617,-34.603], [26.506,-35.0],
];
foot_width = 40.08; // unchanged - the TOP layer wasn't touched

// --- M3 board holes, exact FRONT-layer circle positions (u, w) ---
hole_u = 26.314;             // moved left with the narrowed front
hole_w = [11.816, 27.316];   // unchanged - 15.5mm apart, as drawn
hole_dia = 3.2;              // as drawn (2x1.6mm radius)

// --- SIDE-layer L cross-section thicknesses ---
wall_t = 2.5;   // vertical wall thickness (D), rect8 (2.424mm drawn)
foot_t = 2.5;   // horizontal foot thickness (W), rect9 (2.432mm drawn)
foot_d = 28.373; // foot depth/length (D), rect9's drawn length

// --- TOP-layer M5 slide slot, long axis along U (parallel to the
// front wall) ---
slot_u        = 21.016;  // slot center, distance from the shared left edge
slot_d        = foot_d / 2;  // centered front-to-back in the foot (was
                              // 10.857, off-center per the TOP layer) so
                              // there's equal clearance for the bolt head
                              // on both sides
slot_len      = 26.625;  // full stadium length (u axis)
slot_width    = 5.34;    // as drawn (~5.5mm stated)
slot_straight = slot_len - slot_width;

module wall() {
    difference() {
        rotate([-90, 0, 0])
            linear_extrude(height = wall_t)
                polygon(points = front_profile);

        for (w = hole_w)
            translate([hole_u, -1, w])
                rotate([-90, 0, 0])
                    cylinder(h = wall_t + 2, d = hole_dia);
    }
}

module foot() {
    difference() {
        translate([0, 0, -foot_t])
            cube([foot_width, foot_d, foot_t + 0.01]); // +0.01 overlap into the wall for a clean union

        translate([slot_u, slot_d, -foot_t - 1])
            hull() {
                translate([-slot_straight/2, 0, 0]) cylinder(h = foot_t + 2, d = slot_width);
                translate([ slot_straight/2, 0, 0]) cylinder(h = foot_t + 2, d = slot_width);
            }
    }
}

module olmp_board_mount() {
    union() {
        wall();
        foot();
    }
}

olmp_board_mount();
