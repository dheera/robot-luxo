// distance between two pivot points
center_distance = 87;
thickness = 8;

// end hole
translate([0, 0, 0])
difference() {
    cylinder(d = 14, h = thickness, $fn = 128);
    cylinder(d = 10.1, h = thickness, $fn = 128);
}

// bar in-between
translate([5.5, -8/2, 0])
cube([center_distance/2-9.5, 8, thickness]);

// middle hole
translate([center_distance/2, 0, 0])
difference() {
    cylinder(d = 12, h = thickness, $fn = 128);
    cylinder(d = 6.1, h = thickness, $fn = 128);
}

// bar in-between
translate([center_distance/2+4, -8/2, 0])
cube([center_distance/2-9.5, 8, thickness]);

// end hole
translate([center_distance, 0, 0])
difference() {
    cylinder(d = 14, h = thickness, $fn = 128);
    cylinder(d = 10.1, h = thickness, $fn = 128);
}