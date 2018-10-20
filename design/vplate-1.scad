include <include/servo.scad>

union() {
    
    difference() {
        union() {
            // servo arm
            minkowski() {
                cylinder(d = 25, h = 0.001, center=true, $fn=128);
                cube([48,5,5], center=true);
            }
            
            // non-servo arm
            minkowski() {
                cylinder(d = 20, h = 0.001, center=true, $fn=128);
                linear_extrude(height=5, center=true)
                polygon(points=[[26.5,-3.3], [15,0], [5,-35]]);
            }
        
        }
    
        // servo cutout
        // 41 to allow low-profile servos to be inserted more easily
        // 4.7 for m3 heat-set insert
        translate([17,0,0])
        savox_1251mg_cutout(box_l=41, screw_diameter=4.7);
        
        // rod hole
        translate([-28,0,0])
        cylinder(d=5, h = 10, center = true, $fn=128);
        
        // rod hole
        translate([5,-35,0])
        cylinder(d=5, h = 10, center = true, $fn=128);
    }


    // plug servo screw holes for 1mm from one end
    translate([30.5,0,-2])
    cube([6.5,20,1], center=true);
    
    // plug servo screw holes for 1mm from one end
    translate([-19,0,-2])
    cube([6.5,20,1], center=true);
}

translate([0,40,0])
mirror([0,1,0])
union() {
    
    difference() {
        union() {
            // servo arm
            minkowski() {
                cylinder(d = 25, h = 0.001, center=true, $fn=128);
                cube([48,5,5], center=true);
            }
            
            // non-servo arm
            minkowski() {
                cylinder(d = 20, h = 0.001, center=true, $fn=128);
                linear_extrude(height=5, center=true)
                polygon(points=[[26.5,-3.3], [15,0], [5,-35]]);
            }
        
        }
        
        // rod hole
        translate([17,0,0])
        cylinder(d=5, h = 10, center = true, $fn=128);
        
        // rod hole
        translate([-28,0,0])
        cylinder(d=5, h = 10, center = true, $fn=128);
        
        // rod hole
        translate([5,-35,0])
        cylinder(d=5, h = 10, center = true, $fn=128);
    }
}