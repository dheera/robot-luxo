fn = 32;

difference() {
    cylinder(d=20,h=30, $fn=fn);
    cylinder(d=5,h=30, $fn=16);
    
    translate([17/2,0,0])
    cylinder(d=2,h=4, $fn=16);
    
    translate([-17/2,0,0])
    cylinder(d=2,h=4, $fn=16);
    
    translate([0,17/2,0])
    cylinder(d=2,h=4, $fn=16);
    
    translate([0,-17/2,0])
    cylinder(d=2,h=4, $fn=16);
    
    translate([17/2,0,0])
    cylinder(d=2,h=4, $fn=16);
    
    translate([-17/2,0,0])
    cylinder(d=2,h=4, $fn=16);
    
    translate([0,17/2,0])
    cylinder(d=2,h=4, $fn=16);
    
    translate([0,-17/2,0])
    cylinder(d=2,h=4, $fn=16);
}

translate([0,0,30]) 
cube([8,8,40]);
    