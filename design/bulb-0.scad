camera_screw_dim = 28;
insert_dim = 20;
difference() {
    union() {
    cylinder(d=47,h=6,$fn=256);
    translate([0,0,6])
    sphere(d=47,h=10,$fn=256);
    }
    scale([1,1,-1])
    cylinder(d=100,h=100);
    
    translate([0,0,13])
    cylinder(d=100,h=100);
    
    translate([0,0,11])
    cylinder(d=37.5,h=10,$fn=256);
    
    translate([-camera_screw_dim/2,-camera_screw_dim/2])
    cylinder(d=2.2,h=5,$fn=32);
    translate([-camera_screw_dim/2,camera_screw_dim/2])
    cylinder(d=2.2,h=5,$fn=32);
    translate([camera_screw_dim/2,-camera_screw_dim/2])
    cylinder(d=2.2,h=5,$fn=32);
    translate([camera_screw_dim/2,camera_screw_dim/2])
    cylinder(d=2.2,h=5,$fn=32);
    
    translate([-33/2,-33/2,4])
    cube([33,33,10]);
    
    translate([-camera_screw_dim/2,0,0])
    translate([-2.5,-1,0])
    cube([6,11,15]);
    
    translate([0,-20])
    cylinder(d=4.7,h=4,$fn=32);
    translate([0,20])
    cylinder(d=4.7,h=4,$fn=32);
    translate([20,0])
    cylinder(d=4.7,h=4,$fn=32);
    translate([-20,0])
    cylinder(d=4.7,h=4,$fn=32);
    
    cylinder(d=29,h=20,$fn=128);
    
    
    /*
    translate([-7.5,-50,4])
    cube([15,100,4]);
    
    translate([-50,-7.5,4])
    cube([100,15,4]);*/
}

difference() {
union() {
    translate([-camera_screw_dim/2,-camera_screw_dim/2])
    cylinder(d=5,h=6,$fn=32);
    translate([-camera_screw_dim/2,camera_screw_dim/2])
    cylinder(d=5,h=6,$fn=32);
    translate([camera_screw_dim/2,-camera_screw_dim/2])
    cylinder(d=5,h=6,$fn=32);
    translate([camera_screw_dim/2,camera_screw_dim/2])
    cylinder(d=5,h=6,$fn=32);
}

translate([-camera_screw_dim/2,-camera_screw_dim/2])
    cylinder(d=2.2,h=6,$fn=32);
    translate([-camera_screw_dim/2,camera_screw_dim/2])
    cylinder(d=2.2,h=6,$fn=32);
    translate([camera_screw_dim/2,-camera_screw_dim/2])
    cylinder(d=2.2,h=6,$fn=32);
    translate([camera_screw_dim/2,camera_screw_dim/2])
    cylinder(d=2.2,h=6,$fn=32);

}