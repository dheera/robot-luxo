module savox_0262mg_cutout(
  screw_distance_l = 28.4,
  screw_diameter = 2,
  box_l = 23.8,
  box_w = 13,
  axle_offset = 6,
  screw_depth = 0,
  h = 10,) {
    translate([-axle_offset, 0, 0])
    union() {
    cube([box_l+1, box_w+1, h],
    center = true);

    translate([(box_l+1)*0.15,0,-3])
    intersection() {
        cube([(box_l+1)*0.7, box_w+1, h],
        center = true);
        translate([2,0,0])
        cylinder(h=h,r=10, center=true);
    }
        
    /*
    translate([(box_l+1)*0.15-8.9,0,-3.15])
    rotate([0,18,0])
    cube([(box_l+1)*0.5, box_w+1, h/2],
    center = true);*/
     
    translate([-screw_distance_l/2, 0, screw_depth])
    cylinder(r = screw_diameter/2 + 0.3, h = h, center = true, $fn=16);

    translate([screw_distance_l/2,-0, screw_depth])
    cylinder(r = screw_diameter/2 + 0.3, h = h, center = true, $fn=16);
    }
}


module savox_1251mg_cutout(
  screw_distance_w = 10,
  screw_distance_l = 49.5,
  screw_diameter = 3,
  box_l = 40,
  box_w = 20,
  axle_offset = 11,
  screw_height = 0,
  h = 10,) {

  translate([-axle_offset, 0, 0])
  union() {
    cube([box_l+1, box_w+1, h],
    center = true);

    translate([0,0,screw_height]) {
    translate([screw_distance_l/2, screw_distance_w/2, 0])
    cylinder(r = screw_diameter/2 + 0.3, h = h, center = true, $fn=16);

    translate([-screw_distance_l/2, screw_distance_w/2, 0])
    cylinder(r = screw_diameter/2 + 0.3, h = h, center = true, $fn=16);

    translate([screw_distance_l/2,-screw_distance_w/2, 0])
    cylinder(r = screw_diameter/2 + 0.3, h = h, center = true, $fn=16);

    translate([-screw_distance_l/2, -screw_distance_w/2, 0])
    cylinder(r = screw_diameter/2 + 0.3, h = h, center = true, $fn=16);
    }
  }
}
