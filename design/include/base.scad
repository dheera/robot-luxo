include <include/servo.scad>

module standoff(h=3, id=3) {
    difference() {
        cylinder(d=id+2, h=h, $fn=32);
        cylinder(d=id, h=h+0.2, $fn=32);
    }
}

module border(w=50,h=50) {
    difference() {
        cube([w,h,1], center=true);
        cube([w-0.5,h-0.5,1.5], center=true);
    }
}

module raspberrypi(standoff_height=2) {
    border(w=85,h=56);
    
    translate([-85/2 + 3.5,49/2,0])
    standoff(h=standoff_height);
    
    translate([-85/2 + 3.5,-49/2,0])
    standoff(h=standoff_height);
    
    translate([-85/2 + 3.5 + 58,49/2,0])
    standoff(h=standoff_height);
    
    translate([-85/2 + 3.5 + 58,-49/2,0])
    standoff(h=standoff_height);
}

module servo() {
    difference() {
        cube([50,50,10]);
        savox_1251mg_cutout();
    }
}

cylinder(d=180,h=1.5, $fn=128);

translate([0,0,1.5]) {
    
    translate([0,45,0])
    rotate([0,0,180])
    raspberrypi();
    
    servo();
    
}