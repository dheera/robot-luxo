difference() {
    union() {
    cylinder(h=65,d=20,$fn=128);
    cylinder(h=5,d1=24,d2=30,$fn=128);
        translate([0,0,5])
    cylinder(h=48,d1=30,d2=20,$fn=128);
        
    }
    
    
    cylinder(h=70,d=5.3,$fn=32);
    translate([0,32,35])
    rotate([0,90,0])
    cylinder(h=15,d=50,center=true,$fn=128);
    
    translate([0,0,64.5])
    cylinder(d=10,h=5,$fn=64);
    
}
