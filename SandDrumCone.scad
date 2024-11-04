//cone attachment to drill as a sanding drum


// cone

cyl_base=20;  //radius
cyl_top=5;    //radius
circle_radius=4;
bolt_hole_length=20;

translate([0,0,5])
    {
       // circle(r=circle_radius,center=true);
    }

difference()
    {
        cylinder(40,cyl_base,cyl_top,center=false);

            //subtracted cylinder as a hollow
    
        translate([0,0,2])
        {
            cylinder(50,circle_radius,circle_radius,center=false);
        }
        translate([0,0,0])
            {
            cylinder(h=bolt_hole_length,r1=bolt_stem_radius,r2=bolt_stem_radius,center=true);
        }
    }

//subtracted cylinder for bolt hole

//cube for holding bolt head

bolt_head=5;
cube_height=5;
bolt_stem_radius=1;

difference()
{
    translate([0,0,1/2*cube_height]){
        cube([cyl_base*2-6,10,cube_height],center=true);
        }
        translate([0,0,5]){
            cube([bolt_head,bolt_head,cube_height],center=true);
            }
                    translate([0,0,0])
            {
            cylinder(h=bolt_hole_length,r1=bolt_stem_radius,r2=bolt_stem_radius,center=true);
        }
    
}