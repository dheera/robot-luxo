fn = 64;

module wheelcutout(r=17/2,d=2,h=4) {
    translate([r,0,0])
    cylinder(d=d,h=h, $fn=16);
    
    translate([-r,0,0])
    cylinder(d=d,h=h, $fn=16);
    
    translate([0,r,0])
    cylinder(d=d,h=h, $fn=16);
    
    translate([0,-r,0])
    cylinder(d=d,h=h, $fn=16);
}

difference() {
    cylinder(d=20,h=43,$fn=fn);
    cylinder(d=4.5,h=60, $fn=16);
    
    wheelcutout(r=17/2, d=2, h=4);
    wheelcutout(r=9/2, d=2, h=4);
    
    translate([-0.5,-10,20])
    cube([10,20,50]);
    
    translate([-2,-10,40])
    cube([10,20,50]);
    
    /*translate([-13,-10,15])
    cube([10,20,50]);*/
    
    translate([0,0,18])
    difference() {
        cylinder(d=21,h=38, $fn=fn);
        cylinder(d=15,h=38, $fn=fn);
    }
    
    translate([0,0,34.5])
    rotate([0,90,0])
    translate([0,0,-20])
    rotate([0,0,45]) {
        wheelcutout(r=7, d=3.3, h=40);
        translate([0,0,8])
        wheelcutout(r=7, d=5.5, h=8);
        cylinder(h=40,d=5.5, $fn=16);
    }
    
        translate([0,0,34.5])
        rotate([0,90,0])
        translate([0,0,-2])
            cylinder(h=10,d=21,$fn=32);
}
    
difference() {
    translate([0,0,18])
    cylinder(d1=20,d2=15, h=6, $fn=fn);
    cylinder(d=5,h=60, $fn=16);
}