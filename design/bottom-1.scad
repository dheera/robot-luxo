difference() {
    cylinder(d=42,h=10, $fn=256);
    
    translate([-25/2,-42/2,2])
    cube([25,42,10]);
    
    cylinder(d=5.5, h = 50, $fn=32);
    
    translate([0,7,0])
    cylinder(d=3.3, h = 50, $fn=32);
    
    translate([0,-7,0])
    cylinder(d=3.3, h = 50, $fn=32);
    
    translate([7,0,0])
    cylinder(d=3.3, h = 50, $fn=32);
    
    translate([-7,0,0])
    cylinder(d=3.3, h = 50, $fn=32);
}
