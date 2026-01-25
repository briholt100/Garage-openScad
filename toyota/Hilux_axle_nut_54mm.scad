//hilux front axle nut

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

//remove // for preview
//54mm_nut();