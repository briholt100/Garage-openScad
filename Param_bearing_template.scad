//bearing for fillament spool

outside_diameter = 51; //in mm
inside_diameter = 36; //in mm
ball_diameter = 11;
bearing_height= 12;

bearing_thickness = outside_diameter-inside_diameter ;  //this is from outside diameter to inside diameter, must be larger than spheres
ball_count = 12;
$fn = 100;

module make_bearing_race(){
rotate_extrude()
    {

    difference()
        {
      translate([(bearing_thickness/2) ,0,0])square([bearing_thickness,bearing_height]);

    //making the race
        translate([bearing_height,bearing_height/2,0])color("cornflowerblue") scale([.9,1.05,1])circle(d=ball_diameter);
          }
//          translate([bearing_height,bearing_height/2,0])color("cornflowerblue") circle(d=ball_diameter-1.7);

}


// bearings 

for(i=[0:360/ball_count:360])
    {
        rotate([0,0,i]){
    translate([bearing_height-1.9,bearing_height/2,bearing_height/2])color("orange",alpha=.5)sphere(d=ball_diameter-1.7);
        }
    }

}

difference()
{
//translate([0,0,-bearing_height])
    make_bearing_race();
    
//    translate([-(outside_diameter),-(outside_diameter),-1])cube([(outside_diameter*2),(outside_diameter),outside_diameter]); \\creats z slice
//    translate([0,0,36])cube(60,center=true); //creates y slice
}

