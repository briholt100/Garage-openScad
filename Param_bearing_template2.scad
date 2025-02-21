    
ir = 36/2;
or = 51/2;
race_radius = (or-ir)/2;
depth= 8;
$fn=100;

//pick center of race

module ref_dot(r=2){circle(r);}
module find_center(r=1,raise=1,sx=1,sy=1,sz=1){
translate([ir+race_radius,depth/2,raise])color("blue")scale([sx,sy,sz])ref_dot(r);
}    



module make_race (x =or-ir,y=depth){    
    rotate_extrude()
    difference()
    {
    translate([ir,0,0])square([x,y]);    
    //hollow out race
    color("purple")find_center(r=race_radius,raise=0,sx=.8,sy=1.1,sz=1);
}
}


module make_bearings(r=(race_radius-.85),raise=race_radius){
    translate([(ir+race_radius)-.4,depth/2,raise])color("orange") sphere(r);
    
}
ct_balls = 23;
difference(){

union(){color("purple",alpha=.8)make_race();
for(i=[0:360/ct_balls:360])
    {
    rotate([0,0,i])make_bearings();
    }
}

    

//find_center();
    
//translate([0,-ir/2-5,-1])cube([or*2,or,or],center=true);

}