//ring, tight one has diameter of 11
// interesting site: https://www.printables.com/model/253391-customizable-engraved-rings
inside_dia=5.75;
out_dia= 7;

ringer_finger_dia = 23;
ring_thickness=2;
ring_height=9;

module square_torus(rotate_angle=60,width=ring_thickness,height=ring_height,res=100,ring_dia=23){
    rotate_extrude(angle=rotate_angle,$fn=res) {
        translate([ring_dia/2,0,0]) square([width,height], $fn=res);
}
}


module cove_remove(radius=3,x_loc=2,y_loc=2,z_loc=0,angle=10)
    {
        rotate_extrude(angle=angle)
            {
                difference()
                {
                    translate([x_loc,y_loc,z_loc]) square(radius,center=false);
                    translate([x_loc,y_loc,z_loc]) color("green") circle(radius/1.5,$fn=20);
                }
            }
}

difference()
{
    color("cornflowerblue",alpha=.5) square_torus(rotate_angle=360);
        cove_remove(radius=3,x_loc=ringer_finger_dia/2,y_loc=7.2,z_loc=ring_height,angle=360);
    rotate([180,0,0])cove_remove(radius=3,x_loc=ringer_finger_dia/2,y_loc=-1.8,z_loc=ring_height,angle=360);
    }
