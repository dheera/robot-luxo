difference() {
    translate([0,-7,0])
    cube([98,14,14]);
    
    translate([8,0,0])
    cylinder(d=10.1,h=4.05, $fn=64);
    
    translate([8,0,10])
    cylinder(d=10.1,h=4.05, $fn=64);
    
    translate([8,0,0])
    cylinder(d=6.5,h=50, $fn=64);
    
    translate([90,0,0])
    cylinder(d=10.1,h=4.05, $fn=64);
    
    translate([90,0,10])
    cylinder(d=10.1,h=4.05, $fn=64);
    
    translate([90,0,0])
    cylinder(d=6.5,h=50, $fn=64);
    
}
