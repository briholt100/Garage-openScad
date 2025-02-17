frame_width=10;
ct_balls = 4;
difference(){
union(){
    rotate_extrude($fn=100)
    {
        translate([frame_width/2,0,0]){
            difference(){
                square([frame_width,6],center =true);
                circle(3.5,$fn=100);
                }
                }
                }

    

color("blue")for(i=[0:360/ct_balls:360])
    {
        rotate([0,0,i]){
        translate([frame_width/2,0,0])sphere(3.3,$fn=100);
            }
    
}

}
//translate([0,-10,0])cube(20,center=true);
}