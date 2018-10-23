module m5spacer(h=6) {
    difference() {
        cylinder(d=8, h=h, $fn=128);
        cylinder(d=5.8, h=h, $fn=128);
    }
}

translate([0,0,0])
m5spacer(h=6);

translate([0,12,0])
m5spacer(h=6);

translate([-12,0,0])
m5spacer(h=26);

translate([12,0,0])
m5spacer(h=8);

translate([12,12,0])
m5spacer(h=8);

translate([12,24,0])
m5spacer(h=8);

translate([12,36,0])
m5spacer(h=8);

translate([24,0,0])
m5spacer(h=5);

translate([24,12,0])
m5spacer(h=5);