// distance between two pivot points
center_distance = 87;
thickness = 10;

// end hole
translate([0, 0, 0])
difference() {
    cylinder(d = 20, h = thickness, $fn = 128);
    cylinder(d = 16, h = thickness, $fn = 128);
}

// bar in-between
translate([8, -8/2, 0])
cube([center_distance/2-11, 8, thickness]);

// middle hole
translate([center_distance/2, 0, 0])
difference() {
    cylinder(d = 12, h = thickness, $fn = 128);
    cylinder(d = 6, h = thickness, $fn = 128);
}


translate([0,0,8])
union() {
// spring mount
translate([center_distance/2,0,0])
cylinder(d=6,h=30,$fn=128);
    
// ball at end of spring mount
translate([center_distance/2,0,30])
sphere(r=4, $fn=128);
}

// bar in-between
translate([center_distance/2+3, -8/2, 0])
cube([center_distance/2-11, 8, thickness]);

// end hole
translate([center_distance, 0, 0])
difference() {
    cylinder(d = 20, h = thickness, $fn = 128);
    cylinder(d = 16, h = thickness, $fn = 128);
}