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

module arduinopromicro(standoff_height=4) {
    border(w=36, h=18);
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
            union() {
                translate([-11-58/2,-25/2,0])
                cube([58,25,17.5]);
    
                intersection() {
                    difference() {
                        cylinder(d=46,h=28, $fn=128);
                        translate([0,0,24])
                        cylinder(d=43,h=28, $fn=32);
                        cylinder(d=27,h=28);
                        translate([-4,0,0])
                        cube([42,21,80], center=true);
                    }
                }
            }
            
            // servo cutout
            translate([0,0,50/2])
            savox_1251mg_cutout(h=50, screw_diameter=4.7, screw_height=14);
        
            // wiring cutout
            union() {
                translate([22,0,0])
                cube([100,4,100], center=true);
        
                translate([0,0,5])
                rotate([0,90,0])
                cylinder(h=100,d=8, $fn=32);
        
                translate([8,0,0])
                cylinder(h=20, d=8, $fn=32);
            }
        }
        /*difference() {
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
        }*/
    }
}

module lidmount() {
    difference() {
        cylinder(d=8,h=8,$fn=32);
        cylinder(d=3.5,h=8,$fn=32);
    }
}

module lidmountcutout() {
    translate([0,0,0])
    cylinder(d=6,h=5, $fn=32, center=true);
}

module rubberfootcutout() {
    translate([0,0,0])
    cylinder(d=10,h=0.5, $fn=32, center=true);
}

module ventcutout(l=30,w=10) {
    for (a = [0:4:l]) {
    translate([0,a,0])
    cube([w,2,10], center=true);
    }
}

difference() {
  union() {
    cylinder(d=185,h=1.5, $fn=256);
    translate([0,0,1.5])
    difference() {
        cylinder(d=185,h=3, $fn=256);
        cylinder(d=179,h=10, $fn=256, center=true);
    }
    translate([78,23,1.5])
    lidmount();
    translate([78,-23,1.5])
    lidmount();
    translate([-78,23,1.5])
    lidmount();
    translate([-78,-23,1.5])
    lidmount();
    translate([0,84,1.5])
    lidmount();
    translate([0,-84,1.5])
    lidmount();
  }
  
        translate([78,23,0])
        lidmountcutout();
        translate([78,-23,0])
        lidmountcutout();
        translate([-78,23,0])
        lidmountcutout();
        translate([-78,-23,0])
        lidmountcutout();
        translate([0,84,0])
        lidmountcutout();
        translate([0,-84,0])
        lidmountcutout();
  
        translate([53,16,0])
        ventcutout(l=37,w=18);
        translate([-53,16,0])
        ventcutout(l=37,w=18);
  }
  

translate([0,0,1.5]) {
    
    translate([0,51.5,0])
    rotate([0,0,180])
    raspberrypi();
    
    translate([34,0,0])
    rotate([0,0,90])
    imu();
    
    translate([34,-33,0])
    rotate([0,0,90])
    arduinopromicro();
    
    translate([58,-17.5,0])
    rotate([0,0,90])
    servodriver();
    
    translate([-8,-37,0])
    dcdc();
    
    translate([-8,-65,0])
    dcdc();
    
    servo();
    
}


