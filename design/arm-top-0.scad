// distance between two pivot points
center_distance = 87;
thickness = 8;



// servo end
difference() {
    union() {
        difference() {
            // outer
            cylinder(d = 25, h = 8, $fn = 128);
            // inner
            translate([0,0,1.5])
            cylinder(d = 20.5, h = 8, $fn = 128);
            // hole for tightening center servo screw
            cylinder(d = 5.5, h = thickness, $fn = 128);
        
            translate([-8,0,12])
            rotate([0,45,0])
            cube([30,30,30], center=true);
        }
        // outer
        cylinder(d = 25, h = 4.5, $fn = 128);
    }
    
    // inner
    translate([0,0,1.5])
    cylinder(d = 20.5, h = 8, $fn = 128);
    // hole for tightening center servo screw
    cylinder(d = 5.5, h = thickness, $fn = 128);
    
    // four holes for m3 screws
    translate([7, 0, 0])
    cylinder(d = 3.1, h = thickness, $fn = 32);
    
    translate([0, 7, 0])
    cylinder(d = 3.1, h = thickness, $fn = 32);
    
    translate([-7, 0, 0])
    cylinder(d = 3.1, h = thickness, $fn = 32);
    
    translate([0, -7, 0])
    cylinder(d = 3.1 , h = thickness, $fn = 32);
}

// bar in-between
translate([10.5, -4, 0])
cube([center_distance-16, 8, thickness]);

// end hole
translate([center_distance, 0, 0])
difference() {
    // outer
    cylinder(d = 14, h = thickness, $fn = 128);
    // inner
    cylinder(d = 10, h = thickness, $fn = 128);
}
