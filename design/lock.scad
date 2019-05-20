// 20 36 18 28

l1=20;
l2=36;
w=14;
h=26;


difference() {
    /*
    translate([(l2-l1)/2,0,0])
    union() {
        translate([0,0,h/2])
        minkowski() {
            cube([l1+l2+5,w+5,h],center=true);
            cylinder(d=5,h=0.001,$fn=16);
        }
    }*/
    
    cylinder(h=h,d=(l1+l2)*2/3,$fn=128);
    
    translate([(l2-l1)/2,0,0])
    translate([0,0,8.1])
    translate([0,0,(h-8)/2])
    cube([(l1+l2),w,h-8],center=true);
    
    wheelcutout(r=7);
    
    translate([0,0,4])
    wheelcutout(r=7, d=5.5, h=30);
    
    cylinder(d=6,h=50,$fn=32);
}

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