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

module dcdc() {
    border(w=52,h=27);
}

module raspberrypi(standoff_height=4) {
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

module imu(standoff_height=4) {
    w = 1.05*25.4;
    h = 0.8*25.4;
    border(w=w, h=h);
    
    translate([-w/2 + 0.1*25.4, -h/2 + 0.1*25.4, 0])
    standoff(h=standoff_height);
    
    translate([-w/2 + 0.95*25.4, -h/2 + 0.1*25.4, 0])
    standoff(h=standoff_height);
    
    translate([-w/2 + 0.1*25.4, -h/2 + 0.7*25.4, 0])
    standoff(h=standoff_height);
    
    translate([-w/2 + 0.95*25.4, -h/2 + 0.7*25.4, 0])
    standoff(h=standoff_height);
}

module servodriver(standoff_height=4) {

    border(w=2.45*25.4, h=(0.88+0.13)*25.4);
    
    w0 = -2.45*25.4/2;
    h0 = -(0.88+0.13)*25.4/2;
    
    translate([w0+0.13*25.4, h0+0.13*25.4, 0])
    standoff(h=standoff_height);
    
    translate([w0+0.13*25.4, h0+0.88*25.4, 0])
    standoff(h=standoff_height);

    translate([w0+2.33*25.4, h0+0.13*25.4, 0])
    standoff(h=standoff_height);
    
    translate([w0+2.33*25.4, h0+0.88*25.4, 0])
    standoff(h=standoff_height);



}

module servo() {
    
    union() {
    difference() {
        translate([-11,0,9])
        cube([58,25,21], center=true);
        savox_1251mg_cutout(h=50, screw_diameter=4.7);
        
        translate([22,0,5])
        cube([100,4,50], center=true);
        
        translate([0,0,10])
        rotate([0,90,0])
        cylinder(h=100,d=8, $fn=32);
        
        translate([8,0,0])
        cylinder(h=20, d=8, $fn=32);
    }
    difference() {
        translate([-11,0,9])
        cube([58,25,12], center=true);
        translate([-11,0,9])
        cube([42,25,12], center=true);
        
        translate([22,0,5])
        cube([100,4,50], center=true);
        
        translate([0,0,10])
        rotate([0,90,0])
        cylinder(h=100,d=8, $fn=32);
        
        translate([8,0,0])
        cylinder(h=20, d=8, $fn=32);
    }
}
}

union() {
    cylinder(d=180,h=1.5, $fn=128);
    translate([85,0,0])
    cylinder(d=4,h=4,$fn=32);
}

translate([0,0,1.5]) {
    
    translate([0,42 ,0])
    rotate([0,0,180])
    raspberrypi();
    
    translate([31,0,0])
    rotate([0,0,90])
    imu();
    
    translate([55,-17.5,0])
    rotate([0,0,90])
    servodriver();
    
    translate([0,-28,0])
    dcdc();
    
    translate([0,-59,0])
    dcdc();
    
    servo();
    
}