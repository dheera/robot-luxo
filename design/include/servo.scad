module savox_1251mg_cutout(
  screw_distance_w = 10,
  screw_distance_l = 49.5,
  screw_diameter = 3,
  box_l = 40,
  box_w = 20,
  axle_offset = 11,
  h = 10,) {

  translate([-axle_offset, 0, 0])
  union() {
    cube([box_l+1, box_w+1, h],
    center = true);

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
