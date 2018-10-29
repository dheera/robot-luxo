include <include/servo.scad>

module standoff(h=4, id=2.5) {
    difference() {
        cylinder(d=id+2.5, h=h, $fn=32);
        cylinder(d=id, h=h+0.2, $fn=32);
    }
}

module border(w=50,h=50) {
    difference() {
        cube([w,h,0.5], center=true);
        cube([w-1,h-1,1], center=true);
    }
}

module dcdc() {
    border(w=52,h=27);
    translate([-20,0,0])
    cylinder(d=3.5,d2=4.5,h=4,$fn=16);
    translate([20,0,0])
    cylinder(d1=3.5,d2=3.5,h=4,$fn=16);
}

module raspberrypi(standoff_height=4.5) {
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

module power() {
    difference() {
        translate([0,-30/2,0])
        cube([15,30,4]);
        
        translate([8,-9,0])
        cylinder(d=4.7,h=5, $fn=16);
        translate([8,9,0])
        cylinder(d=4.7,h=5, $fn=16);
    }
}

module trinketm0(standoff_height=4) {
    w=0.6*25.4;
    h=1.05*25.4;
    border(w=w+4, h=h+4);
    translate([-w/2+0.075*25.4, -h/2+0.15*25.4, 0])
    standoff(h=standoff_height);
    translate([-w/2+(0.075+0.45)*25.4, -h/2+0.15*25.4, 0])
    standoff(h=standoff_height);
    translate([-w/2+0.075*25.4, -h/2+0.79*25.4, 0])
    standoff(h=standoff_height);
    translate([-w/2+(0.075+0.45)*25.4, -h/2+0.79*25.4, 0])
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
            union() {
                translate([-11-58/2,-25/2,0])
                cube([58,25,17.5]);
    
                intersection() {
                    difference() {
                        cylinder(d=46,h=32, $fn=256);
                        translate([0,0,28])
                        cylinder(d=43,h=29, $fn=64);
                        translate([0,0,17.501])
                        cylinder(d=27,h=29, $fn=64);
                        translate([-3.5,0,0])
                        cube([42,21,80], center=true);
                    }
                }
            }
            
            // servo cutout
            translate([0,0,50/2])
            savox_1251mg_cutout(h=50, screw_diameter=4.7, screw_height=14, box_l=41);
        
            // wiring cutout
            union() {
                translate([22,0,0])
                cube([100,3.5,28], center=true);
               
                translate([0,0,7])
                rotate([0,90,0])
                cylinder(h=100,d=10, $fn=32);
        
                translate([8,0,0])
                cylinder(h=20, d=8, $fn=32);
            }
        }
    }
}

module lidmount() {
    difference() {
        cylinder(d=9,h=10,$fn=32);
        cylinder(d=3.5,h=10,$fn=32);
    }
}

module lidmountcutout() {
    translate([0,0,0])
    cylinder(d=6,h=9, $fn=32, center=true);
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
    cylinder(d=185,h=1.5, $fn=512);
    translate([0,0,1.5])
    difference() {
        cylinder(d=185,h=4, $fn=512);
        cylinder(d=180,h=10, $fn=256, center=true);
    }
    translate([81,23,1.5])
    lidmount();
    translate([81,-23,1.5])
    lidmount();
    translate([-81,23,1.5])
    lidmount();
    translate([-81,-23,1.5])
    lidmount();
    translate([0,85,1.5])
    lidmount();
    translate([0,-85,1.5])
    lidmount();
  }
  
        translate([81,23,0])
        lidmountcutout();
        translate([81,-23,0])
        lidmountcutout();
        translate([-81,23,0])
        lidmountcutout();
        translate([-81,-23,0])
        lidmountcutout();
        translate([0,85,0])
        lidmountcutout();
        translate([0,-85,0])
        lidmountcutout();

        mirror([0,1,0])
        translate([58,20,0])
        ventcutout(l=17,w=18);
  
        mirror([0,1,0])
        translate([-58,20,0])
        ventcutout(l=17,w=18);
  
        translate([58,20,0])
        ventcutout(l=35,w=18);
  
        translate([-58,20,0])
        ventcutout(l=35,w=18);
  }
  

translate([0,0,1.5]) {
    
    // ribs
    intersection() {
        cylinder(d=185,h=2, $fn=512);
        union() {
            translate([0,16,0])
            cube([200,4,10], center=true);
            translate([0,-16,0])
            cube([200,4,10], center=true);
            translate([46,0,0])
            cube([4,200,10], center=true);
            translate([-46,0,0])
            cube([4,200,10], center=true);
        }
    }
    
    translate([0,51.5,0])
    rotate([0,0,180])
    raspberrypi();
    
    translate([33.5,0,0])
    rotate([0,0,90])
    imu();
    
    translate([34,-33,0])
    rotate([0,0,180])
    trinketm0();
    
    translate([60,-15.5,0])
    rotate([0,0,90])
    servodriver();
    
    translate([-8,-37,0])
    dcdc();
    
    translate([-8,-65,0])
    dcdc();
    
    translate([-91,0,0])
    power();
    
    servo();
    
}


