//hilux front axle nut

// modules include: 54mm_nut(),  make_spindle_section(), make_birf_axle()

include <BOSL2/std.scad>
include <BOSL2/threading.scad>

// M60 nut parameters
thread_diameter = 35;     // M35
thread_pitch = 1.5;       // 1.5mm pitch
nut_thickness = 5.5;       // 6mm thick
hex_size = 54;            // Across-flats dimension
chamfer_size = 1.5;       // Chamfer size in mm



module 54mm_nut(thread_diameter =35,
                    thread_pitch = 1.5,
                    nut_thickness = 5.5,
                    hex_size = 54,
                    chamfer_size = 1.5
                        ) {
// Create the nut with chamfered edges

difference() {
    // Hexagonal outer shape with chamfers on top and bottom edges
    cyl(
        h=nut_thickness, 
        d=hex_size/cos(30), 
        chamfer=chamfer_size,
        $fn=6,
        anchor=BOTTOM
    );
    
    // Threaded hole with chamfered entry/exit
    union() {
        // Main threaded hole
        translate([0,0,-1])threaded_rod(
            d=thread_diameter, 
            l=nut_thickness+3,
            pitch=thread_pitch,
            internal=true,
            anchor=BOTTOM
        );
        
        // Top chamfer on thread hole
        translate([0, 0, nut_thickness])
            cylinder(h=chamfer_size, r1=thread_diameter/2, r2=thread_diameter/2 + chamfer_size, $fn=60);
        
        // Bottom chamfer on thread hole
        translate([0, 0, 0])
            cylinder(h=chamfer_size, r1=thread_diameter/2 + chamfer_size, r2=thread_diameter/2, $fn=60);
    }
}
}




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
center_bolt_camfer_top_r = 5;
center_bolt_camfer_bot_r = 7/2;

module make_spindle_section(){
// create red spindle section
difference (){
color("red")threaded_rod(
            d=thread_diameter, 
            l=nut_thickness+5,
            pitch=thread_pitch,
            internal=true,
            anchor=BOTTOM
        );


translate([0,0,-1])color("green")cylinder(h=nut_thickness+7,r=(thread_diameter/2)-4);
}
}





//make splined axle
module make_birf_axle(){
difference(){

color("cornflowerblue")translate([0,0,0])cylinder(h=nut_thickness+5+birf_depth_to_snap, r=(thread_diameter/2)-4,$fn=100);

color("cornflowerblue")translate([0,0,-1])cylinder(h=nut_thickness+25+birf_depth_to_snap, r=center_bolt_inner_radius+.5,$fn=100);

translate([0,0,nut_thickness+5.25+birf_depth_to_snap])color("green")translate([0,0,-1])cylinder(h=center_bolt_camfer_depth, r2=center_bolt_camfer_top_r,r1=center_bolt_camfer_bot_r,$fn=100);

for(i = [0 :count]){
    rotate([0, 0, i * 360 / count])
    translate([pathRadius, 0, nut_thickness+6])
    color("blue")cylinder(h=birf_depth_to_snap,r=spline_radius, $fn=50);}
}
}

//remove // for preview
translate([50,0,0]) 54mm_nut();
translate([-35,0,0])  make_birf_axle();
make_spindle_section();
