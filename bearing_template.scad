frame_width = 10;
frame_height =frame_width *.40;
ball_radius = frame_width/5;
ct_balls = 8;
//axle_radius= 4.5;
$fn=100;


// make bearing
translate([0,0,2])difference(){
union(){
    color("orange",alpha=.7)rotate_extrude()
    {
        translate([frame_width/2,0,0]){
            difference(){
                color("orange")square([frame_width,frame_height],center =true);
                scale([.9,1,1])circle(ball_radius+.2);
                }
                }
                }

    
//make balls
color("blue",alpha=0.4)for(i=[0:360/ct_balls:360])
    {
        rotate([0,0,i]){
        translate([frame_width/2,0,-.14])sphere(ball_radius-.15);
            }
    
}

}
//color("purple")translate([0,-frame_width,0])cube(2*frame_width,center=true);
//add hole 9mm
translate([0,0,-2])cylinder(h=frame_width+5,r=2);
}