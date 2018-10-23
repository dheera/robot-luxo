include<include/servo.scad>

fn = 128;

module bell() {
    multiplier = 1.56;
phase = 10;

points_outer = [
  for (a = [0:1:105])
  [23*cos(multiplier*a + phase), a]
];
  
points_inner = [
  for (a = [92:-1:0])
  [23*cos(multiplier*a + phase)-.02-0.3*a/92, a]
];
  
s = 23*cos(multiplier*105 + phase);
  
points_round = [
  for (a = [105:.1:107])
  [s - 3*pow((a-104.6)/2, 4), a]
];

points = concat(points_outer, 
  points_round,
  [[-40,108]],
  [[-42,108]],
  [[23*cos(multiplier*92 + phase)-.02-0.3,92]],
  points_inner);
  
union() {
  rotate_extrude($fn=fn*4)
  translate([46,0,0])
  minkowski() {
    polygon(points); 
    circle(r=1);
  }

  translate([0,0,-0.3])
  rotate_extrude($fn=fn*4)
    translate([65.67,0,0])
    circle(r=4);
}

}

difference() {
union() {
    difference() {
    bell();
    cylinder(h=200,d=24, $fn=fn/2);
    
    rotate([0,0,0])
    translate([0,0,84])
    cube([4,100,26], center=true);
    
    rotate([0,0,360/12])
    translate([0,0,84])
    cube([4,100,26], center=true);
    
    rotate([0,0,2*360/12])
    translate([0,0,84])
    cube([4,100,26], center=true);
    
    rotate([0,0,3*360/12])
    translate([0,-50,84])
    cube([4,100,26], center=true);
    
    rotate([0,0,4*360/12])
    translate([0,0,84])
    cube([4,100,26], center=true);
    
    rotate([0,0,5*360/12])
    translate([0,0,84])
    cube([4,100,26], center=true);
    
    translate([0,0,45])
    rotate([0,-60,0])
    cylinder(d=10,h=200, $fn=fn/2);
    
    translate([0,0,91])
    rotate([0,-90,0])
    cylinder(d=10,h=200, $fn=fn/2);
    }
   
    translate([0,0,45])
    rotate([0,-60,0])
    translate([6,0,41])
    cube([33,14,3], center=true);
    
    translate([0,0,45])
    rotate([0,-60,0])
    translate([0,0,41.65])
    difference() {
        cylinder(d=26,h=14, $fn=fn);
        translate([0,0,0])
        cylinder(d=22,h=15, $fn=fn/2);
    }
}

translate([0,0,45])
    rotate([0,-60,0])
    translate([0,0,38]) 
    rotate([180,0,180])
    savox_0262mg_cutout();
    }