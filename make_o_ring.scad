
//How to make an O-ring

// first, how thick do you want the ring? in other words what is the radius of the cross section?

cross_section_o_ring_diameter =  2; //the radius will be half of this


//Next, what's more important, the inside diameter or the outside diameter?

// if it's the inside diameter, what should  it be?


inside_diameter = 4;

//if inside diameter then using this formula will determine where to place the center of the cross-section


c = inside_diameter +  (cross_section_o_ring_diameter  / 2);
echo(c);



function find_xi(inside_diameter,cross_section_o_ring_diameter) = sqrt(((inside_diameter+(cross_section_o_ring_diameter/2))^2)/2);  //parameters are to find the hypotenuse of 45° triangle to inside diameter

xi = find_xi(inside_diameter,cross_section_o_ring_diameter);
echo(xi);


function find_inside_diameter(inside_diameter) = sqrt((inside_diameter^2)/2);
xi_inside = find_inside_diameter(inside_diameter);

//
////If outside diameter what should it be? 
//
//outside_diameter = 14;
//
//
//
////create circle that represents cross section of oring
translate([xi,xi,0])circle(r=cross_section_o_ring_diameter/2,$fn=100); 
//
//// check that inside diameter is captured
//

translate([xi_inside ,xi_inside ,0]) cylinder(h=3,r1=.1,r2=.1);
translate([xi,xi,0]) cylinder(h=3,r1=.1,r2=.1);


// if above creates a circle with pins in center and inside diameter, then rotate extrude is next

translate([0 ,0 ,-cross_section_o_ring_diameter])
rotate_extrude()translate([xi_inside ,xi_inside ,0]) circle(r=cross_section_o_ring_diameter,$fn=100);








