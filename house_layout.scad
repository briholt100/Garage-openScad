
module house_profile(l=45,w=25,wall_height=8,apex_width=25/2,apex_height=15){
rotate([90,0,0])
linear_extrude(l)
polygon(points=[[0,0],[w,0],[w,wall_height],[apex_width,apex_height],[0,wall_height]]);
}

house_profile();

color("blue")translate([-15,-55/2,0])rotate([0,0,90])house_profile(l=22,w=13,apex_width=13/2,apex_height=12);