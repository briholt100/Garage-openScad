
include <BOSL2/std.scad>
include <BOSL2/threading.scad>
use <toyota/front_axle_part_modules.scad>


// M60 nut parameters
thread_diameter = 35;     // M35
thread_pitch = 1.5;       // 1.5mm pitch
nut_thickness = 5.5;       // 6mm thick
hex_size = 54;            // Across-flats dimension
chamfer_size = 1.5;       // Chamfer size in mm

// birfield parameters

birf_diam = 1.11*25.4; //1.11 inches
birf_depth = 1.162*25.4; //1.162 inches
birf_depth_to_snap = 0.924*25.4; //0.924 inches
count=28;  //spline count
pathRadius = birf_diam/2;  // Radius of the axle
spline_radius = 1.4;
center_bolt_depth = 20;
center_bolt_inner_radius = 7/2;
center_bolt_camfer_depth = 1;
center_bolt_camfer_top_r = 9;
center_bolt_camfer_bot_r = 7/2;


54mm_nut();



//make tool housing

module make_tool_house(){
    //make negative fill
translate([0,0,birf_depth+1.5])  //birf_depth
    {
    union()
        {
    translate([0,0,-center_bolt_depth])color("orange")
        cylinder(center_bolt_depth,r=center_bolt_inner_radius,$fn=50);
color("orange")cylinder(4,r2=center_bolt_camfer_top_r,r1=center_bolt_camfer_bot_r,$fn=50);
        }
    }
    difference()
        {
            union()
                {

                color("lightgreen")
                translate([0,0,nut_thickness])
                rotate_extrude() 
                translate([(thread_diameter/2)+1,0,0])
                {  
                    difference() //cuts out corner of extrude
                    {
                    circle(3);
                    translate([-3,-3,0])
                        color("red")
                        square(3);
                    }
                }

                translate([0,0,nut_thickness-0])
                color("lightgreen")
                minkowski()
                {
                    translate([0,0,1.5])
                        sphere(2,$fn=50);
                    cylinder(h=birf_depth+4,r=(thread_diameter/2)+1);
                }
            }
            
        translate([0,0,nut_thickness-5])
            color("lightgreen")
            cylinder(h=birf_depth+5,r=(thread_diameter/2-3.5));

        }
}

difference()
    {  //to see window in clearing

        make_tool_house();

        translate([5,0,0])
            cube(50);

    }


make_birf_axle();