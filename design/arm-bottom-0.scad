difference() {
    linear_extrude(height=14)
    polygon([
  [0,0],
  [80,0],
  [92,6],
  [112,6],
  [112,16],
  [88,16],
  [76,10],
  [0,10],
  [0,0]
    ]);
    
    translate([14,10.05,7])
    rotate([90,0,0])
    cylinder(d=20.6,h=1.55, $fn=64);
    
    translate([14,0,7])
    rotate([90,0,0])
    cylinder(d=5.5,h=50, center=true, $fn=32);
    
    translate([7,0,7])
    rotate([90,0,0])
    cylinder(d=3.3,h=50, center=true, $fn=32);
    translate([7,6,7])
    rotate([90,0,0])
    cylinder(d=5.5,h=6, $fn=32);
    
    translate([21,0,7])
    rotate([90,0,0])
    cylinder(d=3.3,h=50, center=true, $fn=32);
    translate([21,6,7])
    rotate([90,0,0])
    cylinder(d=5.5,h=6, $fn=32);
    
    translate([72,0,7])
    rotate([90,0,0])
    cylinder(d=5.5,h=50, center=true, $fn=32);
    
    translate([104,14,7])
    rotate([90,0,0])
    cylinder(d=10,h=50, center=true, $fn=64);
}


translate([0,60,0])
mirror([0,1,0])
difference() {
    linear_extrude(height=14)
    polygon([
  [0,0],
  [80,0],
  [92,6],
  [112,6],
  [112,16],
  [88,16],
  [76,10],
  [0,10],
  [0,0]
    ]);
    
    translate([14,0,7])
    rotate([90,0,0])
    cylinder(d=5.2,h=50, center=true, $fn=32);
    
    translate([72,0,7])
    rotate([90,0,0])
    cylinder(d=5.2,h=50, center=true, $fn=32);
    
    translate([104,14,7])
    rotate([90,0,0])
    cylinder(d=10,h=50, center=true, $fn=64);
    
}