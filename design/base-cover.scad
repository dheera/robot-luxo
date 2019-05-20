T=1.5;
H=32+1.5;
D=185;
fn=512;

difference() {
union() {
    
difference() {

    qcylinder(d=D+2*T+1,h=H+35,$fn=fn);
        
    
    translate([0,0,H])
    cylinder(d=D+10,h=35,$fn=fn);
    
    
    difference() {
    
        
    translate([0,0,T])
    qcylinder(d=D+1,h=H+35,$fn=fn/2);
        
        
translate([-D/2,-5/2,0])
translate([0,0,T])
cube([D,5,T]);
        
        
translate([-D/2,-5/2+23,0])
translate([0,0,T])
cube([D,5,T]);
        
        
translate([-D/2,-5/2-23,0])
translate([0,0,T])
cube([D,5,T]);

        translate([0,0,T])
        cylinder(h=T,d=53);
        
        
        translate([-45,0,T])
        cylinder(h=T,d=30);
    }
    
    cylinder(d=46+1,h=100,$fn=fn/2);

    translate([-45,0,0])
    cylinder(d=25+1,h=100,$fn=fn/2);
    
    for(i=[-9:6:9]) {
    translate([65,i,0])
    cylinder(d=3,h=100,$fn=fn/2);
    }
    
    scale([-1,1,1])
    translate([0,-5,H-10])
    cube([200,10,10]);
}



    translate([81,23,1.5])
    lidmount();
    translate([81,-23,1.5])
    lidmount();
    translate([-81,23,1.5])
rotate([0,0,180])
    lidmount();
    translate([-81,-23,1.5])
rotate([0,0,180])
    lidmount();
    translate([0,85,1.5])
rotate([0,0,90])
    lidmount2();
    translate([0,-85,1.5])
rotate([0,0,-90])
    lidmount2();
}

scale([1,-1,1])
translate([-100,0,0])
cube([200,200,200]);

}

module lidmount2() {
    difference() {
        cylinder(d1=9,d2=9,h=20.5,$fn=32);
        translate([0,0,20.5-4.5])
        cylinder(d=4.8,h=20.5,$fn=32);
    }
    translate([9/2-1.5,-3/2,6])
    cube([6,3,20.5-6]);
}


module lidmount() {
    difference() {
        cylinder(d1=9,d2=9,h=20.5,$fn=32);
        translate([0,0,20.5-4.5])
        cylinder(d=4.8,h=20.5,$fn=32);
    }
    translate([9/2-1,-3/2,6])
    cube([6,3,20.5-6]);
}


module qcylinder(d=0,h=0,v=20,$fn=16) {
    translate([0,0,v/2])
    minkowski() {
        cylinder(d=d-v, h=h-v, $fn=$fn);
        sphere(d=v,$fn=32);
    }
}
