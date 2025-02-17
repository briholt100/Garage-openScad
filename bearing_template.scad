frame_width = 10;
frame_height = 4;
ball_radius = 2;
ct_balls = 6;

difference(){
union(){
    rotate_extrude($fn=100)
    {
        translate([frame_width/2,0,0]){
            difference(){
                square([frame_width,frame_height],center =true);
                circle(ball_radius+.2,$fn=100);
                }
                }
                }

    

color("blue")for(i=[0:360/ct_balls:360])
    {
        rotate([0,0,i]){
        translate([frame_width/2,0,0])sphere(ball_radius,$fn=100);
            }
    
}

}
color("purple")translate([0,-10,0])cube(20,center=true);
}