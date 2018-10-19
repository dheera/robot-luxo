// distance between two pivot points
center_distance = 87;
thickness = 10;

// servo end
difference() {
    // outer
    cylinder(d = 25, h = thickness, $fn = 128);
    // inner
    cylinder(d = 20.5, h = 1.5, $fn = 128);
    // hole for tightening center servo screw
    cylinder(d = 5.5, h = thickness, $fn = 128);
    
    // four holes for m3 screws
    translate([7, 0, 0])
    cylinder(d = 3.3, h = thickness, $fn = 32);
    translate([7, 0, 5])
    cylinder(d = 5.5, h = 3, $fn = 32);
    
    translate([0, 7, 0])
    cylinder(d = 3.3, h = thickness, $fn = 32);
    translate([0, 7, 5])
    cylinder(d = 5.5, h = 3, $fn = 32);
    
    translate([-7, 0, 0])
    cylinder(d = 3.3, h = thickness, $fn = 32);
    translate([-7, 0, 5])
    cylinder(d = 5.5, h = 3, $fn = 32);
    
    translate([0, -7, 0])
    cylinder(d = 3.3, h = thickness, $fn = 32);
    translate([0, -7, 5])
    cylinder(d = 5.5, h = 3, $fn = 32);
}

// bar in-between
translate([10.5, -4, 0])
cube([center_distance-19, 8, thickness]);

// end hole
translate([center_distance, 0, 0])
difference() {
    // outer
    cylinder(d = 20, h = thickness, $fn = 128);
    // inner
    cylinder(d = 16, h = thickness, $fn = 128);
}
