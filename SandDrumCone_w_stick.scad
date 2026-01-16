//I need to determine the depth of the difference for the square bolt head


//cone attachment to drill as a sanding drum


//Bolt circle head 14.7 
//Square top 6.47 
//Square bottom 6.41 
//Bolt diameter 6.25

// cone

circle_radius = 14.7/2;
bolt_hole_length = 20;
cyl_base = 45;  //radius
cyl_top = (circle_radius+10);    //radius
echo("outer top radius",cyl_top);

bolt_head_span = 6.47;
cube_height = bolt_head_span ;
bolt_stem_radius =   6.25/2;
bolt_head_depth = 4; 



// formula to determine how deep bolt head should go

cyl_buffer_at_bottom = 4;

//  cube_height - cyl_buffer_at_bottom


translate([0,0,5])
    {
       // circle(r = circle_radius,center = true);
    }

difference()
    {
  cylinder(80,cyl_base,cyl_top,center = false);

            //subtracted cylinder as a hollow
    
        translate([0,0,2])
        {
           cylinder(85,circle_radius,circle_radius,center = false);
        }
        translate([0,0,0])
            {
            cylinder(h = bolt_hole_length,r1 = bolt_stem_radius,r2 = bolt_stem_radius,center = true);
        }
    }

//subtracted cylinder for bolt hole

//cube for holding bolt head

difference()
{
    translate([0,0,1/2*cube_height])
    {
   cube([cyl_base*2-10,20,cube_height],center = true); //difference_cube
        }
     translate([0,0,cube_height*.5])
        {
            translate([0,0,cube_height-bolt_head_depth])
        {    
            color("blue")
            cube([bolt_head_span ,bolt_head_span ,cube_height],center = true);
            }
        }
                    translate([0,0,0])
            {
           cylinder(h = bolt_hole_length,r1 = bolt_stem_radius,r2 = bolt_stem_radius,center = true);
        }
    
}