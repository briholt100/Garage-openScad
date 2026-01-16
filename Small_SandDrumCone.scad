//translate([0,0,85]) circle(8);

/*
A conical drum to glue sand paper to in order to bore out the inside diameter of washers
*/


//module, a function that creates bolt hole object for difference
        
        module bolt_hole_module(height=10,bolt_hole_r=6.25/2,center=true){
            cylinder(h=height,r1=bolt_hole_r,r2=bolt_hole_r,center=center);
        }
        


//make cone

    height=85;
    cyl_base_radius=15; //diameter is 30 (16mm is needed)
    cyl_top_radius=6;   //bolt head is 10 mm diameter, 12 mm gives 2 mm buffer
    echo("Tangent angle is: ", atan(height/cyl_base_radius));

difference()
        {
         color("lightgreen")
            cylinder(height,cyl_base_radius,cyl_top_radius);
            
            translate([0,0,2]) bolt_hole_module();         
            
            //differnece cylinder
    translate([0,0,cube_height-1])
    {
  bolt_hole_module(height,bolt_hole_r=5,center=false);
    }
}

//add square insert

    bolt_head_span = 6.47;
    cube_height = bolt_head_span ;
    bolt_stem_radius =   6.25/2;
    bolt_head_depth = 4; 
            
            
 difference()
 {
 translate([0,0,1/2*cube_height])
    {
   color("orange") cube([cyl_base_radius*2-10,20,cube_height],center = true); //difference_cube
        }
 
 translate([0,0,cube_height*.5])
        {
            translate([0,0,cube_height-bolt_head_depth])
        {    
            color("blue")
            cube([bolt_head_span ,bolt_head_span ,cube_height],center = true);
            }
        }
        
    translate([0,0,2]) bolt_hole_module();
        
    }



    
    
    
    
    
    
    