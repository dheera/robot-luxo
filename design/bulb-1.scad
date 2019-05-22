camera_screw_dim = 28;
insert_dim = 20;
difference() {
    sphere(d=47,$fn=256);
    //cylinder(d=47,h=4,$fn=256);
    difference() {
        union() {
    for(i=[0:15]) {
    rotate([0,0,i*180/16])
    if(i!=0 && i!=1 && i!=15 && i!=7 && i!=8 && i!=9) {
    translate([-1.25,-50,3])
    cube([2.5,100,7]);
    }
    }
}
cylinder(d=20,h=50);
}
    
    scale([1,1,-1])
    cylinder(d=100,h=100);
    
    translate([0,0,17.0])
    cylinder(d=100,h=100);
    
    translate([0,-20]) {
    cylinder(d=3.3,h=50,$fn=32);
    translate([0,0,3])
    cylinder(d=6,h=50,$fn=32);
    }
    translate([0,20]) {
    cylinder(d=3.3,h=50,$fn=32);
    translate([0,0,3])
    cylinder(d=6,h=50,$fn=32);
    }
    translate([20,0]) {
    cylinder(d=3.3,h=50,$fn=32);
    translate([0,0,3])
    cylinder(d=6,h=50,$fn=32);
    }
    translate([-20,0]) {
    cylinder(d=3.3,h=50,$fn=32);
    translate([0,0,3])
    cylinder(d=6,h=50,$fn=32);
    }
    
    cylinder(d=29,h=10,$fn=128);
    
    scale([1,-1,1])
    translate([-camera_screw_dim/2,0,0])
    translate([-2.5,-1,0])
    cube([6,11,35]);
    
    cylinder(d=7.8,h=50,$fn=32);
    
}
