difference() {
    translate([0,-7,0])
    cube([105,14,14]);
    
    translate([8,0,0])
    cylinder(d=10,h=4.05, $fn=64);
    
    translate([8,0,10])
    cylinder(d=10,h=4.05, $fn=64);
    
    translate([8,0,0])
    cylinder(d=6.5,h=50, $fn=64);
    
    translate([97,0,0])
    cylinder(d=10,h=4.05, $fn=64);
    
    translate([97,0,10])
    cylinder(d=10,h=4.05, $fn=64);
    
    translate([97,0,0])
    cylinder(d=6.5,h=50, $fn=64);
    
}
