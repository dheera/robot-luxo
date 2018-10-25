include <include/servo.scad>

module plate() {
translate([0,4,0])
rotate([90,0,0])
linear_extrude(height=8)
union() {
polygon(
  [
    [0,0],
    [40,0],
    
    [70.5,51.42],
    
    
    [27,70.3],
    
    [13,25],
    [0,25],
    [0,0]
  ]);
  
translate([61,55])
circle(d=20, $fn=128);

translate([40, 65])
circle(d=28, $fn=128);
}

}

translate([0,-17,0])
difference() {
    plate();
    
    translate([38,1+1,59])
    rotate([90,0,0])
    cylinder(d=17,h=50, center=true, $fn=64);
    
    
    translate([38,1+1,59])
    rotate([90,-73,0])
    savox_1251mg_cutout(box_l=41, screw_diameter=4.7);  
    
    translate([38,1+2.1,59])
    rotate([90,-73,0])
    translate([-11,0,0])
    cube([56,2,2], center=true);
    
    translate([15,0,12.5])
    rotate([90,0,0])
    cylinder(d=5,h=50, center=true, $fn=64);
    
    translate([61,0,55])
    rotate([90,0,0])
    cylinder(d=5,h=50, center=true, $fn=64);
    
}


translate([0,17,0])
difference() {
    plate();
    
    translate([38,1+1,59])
    rotate([90,0,0])
    cylinder(d=10,h=50, center=true, $fn=64);
    
    translate([15,0,12.5])
    rotate([90,0,0])
    cylinder(d=5,h=50, center=true, $fn=64);
    
    translate([61,0,55])
    rotate([90,0,0])
    cylinder(d=5,h=50, center=true, $fn=64);
}


difference() {
    translate([-8,-42/2,0])
    cube([8,42,25]);
    
    translate([-8,0,25/2 + 7])
    rotate([0,90,0])
    cylinder(d=3.3, h = 50, $fn=32);
    
    translate([-3,0,25/2 + 7])
    rotate([0,90,0])
    cylinder(d=5.5, h = 50, $fn=32);
    
    translate([-8,0,25/2 - 7])
    rotate([0,90,0])
    cylinder(d=3.3, h = 50, $fn=32);
    
    translate([-3,0,25/2 - 7])
    rotate([0,90,0])
    cylinder(d=5.5, h = 50, $fn=32);
    
    translate([-8,7,25/2])
    rotate([0,90,0])
    cylinder(d=3.3, h = 50, $fn=32);
    
    translate([-3,7,25/2])
    rotate([0,90,0])
    cylinder(d=5.5, h = 50, $fn=32);
    
    translate([-8,-7,25/2])
    rotate([0,90,0])
    cylinder(d=3.3, h = 50, $fn=32);
    
    translate([-3,-7,25/2])
    rotate([0,90,0])
    cylinder(d=5.5, h = 50, $fn=32);
    
    translate([-8,0,25/2])
    rotate([0,90,0])
    cylinder(d=5.5, h = 50, $fn=32);
}
