include <include/servo.scad>

union() {
    
    difference() {
        union() {
            // servo arm
            minkowski() {
                cylinder(d = 25, h = 0.001, center=true, $fn=128);
                cube([70,5,5], center=true);
            }
            // non-servo arm
            minkowski() {
                cylinder(d = 20, h = 0.001, center=true, $fn=128);
                linear_extrude(height=5, center=true)
                polygon(points=[[37,-4.2], [15,0], [-5,-35]]);
            }
        
        }
    
        // servo cutout
        // 41 to allow low-profile servos to be inserted more easily
        // 4.7 for m3 heat-set insert
        translate([-26,0,0])
        rotate([0,0,180])
        savox_1251mg_cutout(box_l=41, screw_diameter=4.7);
        
        // rod hole
        translate([34,0,0])
        cylinder(d=5, h = 10, center = true, $fn=128);
        
        // rod hole
        translate([-5,-35,0])
        cylinder(d=5, h = 10, center = true, $fn=128);
    }


    // plug servo screw holes for 1mm from one end
    translate([10,0,-2])
    cube([6.5,20,1], center=true);
    
    // plug servo screw holes for 1mm from one end
    translate([-40,0,-2])
    cube([6.5,20,1], center=true);

    // spring mount
    translate([-41.5,-4,-8])
    cylinder(d=6,h=12,center=true,$fn=128);
    
    // ball at end of spring mount
    translate([-41.5,-4,-14])
    sphere(r=4, $fn=128);
}

translate([0,40,0])
union() {
    
    mirror([0,1,0])
    difference() {
        union() {
            // servo arm but this side has no mount
            minkowski() {
                cylinder(d = 25, h = 0.001, center=true, $fn=128);
                cube([70,5,5], center=true);
            }
            
            // non-servo arm       
            minkowski() {
                cylinder(d = 20, h = 0.001, center=true, $fn=128);
                linear_extrude(height=5, center=true)
                polygon(points=[[37,-4.2], [15,0], [-5,-35]]);
            //cube([70,0.001,5], center=true);
            }
        
        }
        // rod hole
        translate([34,0,0])
        cylinder(d=5, h = 10, center = true, $fn=128);
        
        // rod hole
        translate([-5,-35,0])
        cylinder(d=5, h = 10, center = true, $fn=128);
    }

    // spring mount
    translate([-41.5,4,-8])
    cylinder(d=6,h=12,center=true,$fn=128);
    
    // ball at end of spring mount
    translate([-41.5,4,-14])
    sphere(r=4, $fn=128);
}
