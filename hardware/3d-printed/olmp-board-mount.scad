// OLMP-V1.2C board mount, 3D-printed (interim, until laser cutter is
// rebuilt - see docs/decisions/0049-olmp-board-mount-3d-printed.md).
//
// Direct translation of Reference/olmp-board-mount-build reference.svg
// (FRONT/TOP/SIDE layers) - no reinterpretation. Solid PLA-CF print,
// no added reinforcement.
//
// Axes: X = width (u, FRONT/TOP left-right), Y = depth (d, TOP/SIDE
// front-back), Z = height (w, FRONT/SIDE up-down).
//
// The FRONT profile (a single closed outline: flat bottom edge, short
// left edge, one long curved edge sweeping up to the narrow top-right
// strip that carries the board holes) is extruded straight through Y
// by the TOP view's depth. The M3 holes (FRONT, circles = holes normal
// to the FRONT plane) run the full Y depth. The M5 slide slot (TOP,
// normal to the TOP plane) cuts straight through Z at the base.
//
// Units: mm.

$fn = 64;

// --- exact FRONT profile outline, traced from the SVG path/bezier
// curves, as (u, -w) pairs ready for linear_extrude + rotate([-90,0,0])
// (see method note below) ---
front_profile = [
    [26.506,-35.0], [30.48,-35.019], [33.825,-35.024], [36.499,-35.02],
    [38.46,-35.012], [39.668,-35.004], [40.08,-0.0], [0.08,-0.0],
    [0.074,-0.119], [0.061,-0.459], [0.044,-0.993], [0.025,-1.697],
    [0.01,-2.543], [0.0,-3.506], [0.0,-4.56], [0.36,-8.401],
    [1.259,-11.394], [2.646,-14.562], [4.459,-17.807], [6.631,-21.034],
    [9.099,-24.145], [11.798,-27.045], [14.664,-29.638], [17.632,-31.826],
    [20.638,-33.513], [23.617,-34.603], [26.506,-35.0],
];

// --- M3 board holes, exact FRONT-layer circle positions (u, w) ---
hole_u = 36.843;
hole_w = [11.816, 27.316];   // 15.5mm apart, as drawn
hole_dia = 3.2;              // as drawn (2x1.6mm radius)

// --- TOP-view depth extrusion + M5 slide slot, exact TOP-layer geometry ---
depth_total  = 25.849;  // TOP rect height (d axis)
slot_u       = 21.016;  // slot center, distance from the shared left edge
slot_d       = 10.857;  // slot center, distance from TOP's near edge
slot_len     = 26.625;  // full stadium length (u axis)
slot_width   = 5.34;    // as drawn (~5.5mm stated)
slot_straight = slot_len - slot_width; // straight run between the rounded ends

module olmp_board_mount() {
    difference() {
        rotate([-90, 0, 0])
            linear_extrude(height = depth_total)
                polygon(points = front_profile);

        // M3 holes, through the full depth (Y)
        for (w = hole_w)
            translate([hole_u, -1, w])
                rotate([-90, 0, 0])
                    cylinder(h = depth_total + 2, d = hole_dia);

        // M5 slide slot, straight through (Z) so the bolt is reachable
        // from the top - a blind pocket would trap it with no way to
        // tighten from above.
        translate([slot_u, slot_d, -1])
            hull() {
                translate([-slot_straight/2, 0, 0]) cylinder(h = 40, d = slot_width);
                translate([ slot_straight/2, 0, 0]) cylinder(h = 40, d = slot_width);
            }
    }
}

olmp_board_mount();
