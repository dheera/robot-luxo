import("include/lamp_bell.stl");

//points = [ for (a = [0 : 2 : 270]) 20 * [ sin(a), cos(a) ] ];
// use concat() to add one point in the center

points_outer = [
  for (a = [0:1:110])
  [10*cos(2*a), a]
];
  
points_inner = [
  for (a = [110:-1:0])
  [10*cos(2*a)-1, a]
];

//polygon(concat(points, [[0, 0]]));

//echo(points);
//minkowski() {
points = concat(points_outer, points_inner);
  
polygon(points);

rotate_extrude()
translate([15,0,0])
polygon(points); 
 
//  circle(r=5);
//}