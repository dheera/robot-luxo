
difference() {
    translate([0,0,6/2-0.5])
    rotate([0,90,0])
    cylinder(d=6, h=55, $fn=32, center=true);

    translate([0,0,-5/2])
    cube([100,100,5], center=true);
}

translate([0,20,0])
difference() {
    translate([0,0,5.5/2-0.5])
    rotate([0,90,0])
    cylinder(d=5.5, h=55, $fn=32, center=true);

    translate([0,0,-5/2])
    cube([100,100,5], center=true);
}

translate([0,40,0])
difference() {
    translate([0,0,5/2-0.5])
    rotate([0,90,0])
    cylinder(d=5, h=55, $fn=32, center=true);

    translate([0,0,-5/2])
    cube([100,100,5], center=true);
}