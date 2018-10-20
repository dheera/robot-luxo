include <include/tornillo.scad>

d_solid = 5;
thread_length = 3.5;
solid_length = 34;
edge_length = 5;
pitch = 0.8; // for M5 [0]
pitch_diameter = 4.480; // for M5 [0]

// [0] https://www.trfastenings.com/products/knowledgebase/thread-geometry/metric-coarse-standard

module threaded_part() {
    difference() {
    translate([0,0,-thread_length/2])
    trapezoidThreadNegativeSpace(
	length=thread_length,				// axial length of the threaded rod
	pitch=pitch,				// axial distance from crest to crest
	pitchRadius=pitch_diameter/2,			// radial distance from center to mid-profile
	threadHeightToPitch=0.4,	// ratio between the height of the profile and the pitch
						// std value for Acme or metric lead screw is 0.5
	profileRatio=0.4,			// ratio between the lengths of the raised part of the profile and the pitch
						// std value for Acme or metric lead screw is 0.5
	threadAngle=30,			// angle between the two faces of the thread
						// std value for Acme is 29 or for metric lead screw is 30
	RH=true,				// true/false the thread winds clockwise looking along shaft, i.e.follows the Right Hand Rule
	countersunk=0.,			// depth of 45 degree chamfered entries, normalized to pitch
	clearance=0.1,			// radial clearance, normalized to thread height
	backlash=0.1,			// axial clearance, normalized to pitch
	stepsPerTurn=100			// number of slices to create per turn
    );

    translate([0,0,thread_length/2 + 0.5])
    cylinder(d=50,h=1, center = true);
        
    translate([0,0,-thread_length/2 - 0.5])
    cylinder(d=50,h=1, center = true);
    }
}

difference() {
    
translate([0,0,2])
rotate([0,90,0])
union() {
    
    translate([0,0,solid_length/2 + thread_length/2])
    threaded_part();
    
    //translate([0,0,-solid_length/2+edge_length+0.5])
    //cylinder(d=d_solid+2, h=1, $fn=128, center = true);
        
    cylinder(d=d_solid, h=solid_length, $fn=128, center = true);
    
    //translate([0,0,solid_length/2-edge_length-0.5])
    //cylinder(d=d_solid+2, h=1, $fn=128, center = true);
    
    translate([0,0,-solid_length/2 - thread_length/2])
    threaded_part();
}

translate([-50,-25,-6])
cube([100,50,6]);
}