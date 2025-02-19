//bearing for fillament spool

outside_diameter = 51; //in mm
inside_diameter = 36; //in mm
ball_diameter = 15;
bearing_depth = ball_diameter*1.2;
bearing_thickness = ball_diameter+2 ;  //this is from outside diameter to inside diameter, must be larger than spheres
ball_count = 10;
$fn = 100;

module make_bearing_race(){
rotate_extrude(){

    difference(){
        translate([inside_diameter/2 ,0,0])square([bearing_thickness,bearing_depth]);

    //making the race
        translate([(inside_diameter/2)+bearing_thickness/2,bearing_depth/2,0])color("cornflowerblue") scale([1.075,1.25,1])circle(d=ball_diameter);
        }
}
// bearings 

for(i=[0:360/ball_count:360])
    {
        rotate([0,0,i]){
    translate([((inside_diameter/2)+bearing_thickness/2)-1.5,bearing_depth/2,(ball_diameter/2) +.5 ])color("orange",alpha=.5)sphere((ball_diameter/2)-.25);
        }
    }
}


//difference()
{
make_bearing_race();
//    translate([-(outside_diameter),-(outside_diameter),-1])cube([(outside_diameter*2),(outside_diameter),outside_diameter]);
}

