

//band saw slider guide for holding cylinders

slider_w = 16;
slider_h = 8;
slider_l = 200;
alpha=.9;


//how thick to make V guide? 4 mil?
v_thickness=4;
v_length=100;

v_holder = [[0,0],[0,v_length],[v_length,0]]; // triangle for holder
v_holder_path = [0,1,2]; // triangle paths



//
//difference(){
//    linear_extrude(height=100){
//        polygon(points=v_holder,paths=[v_holder_path]);
//        }
//    translate([v_thickness,v_thickness,-1]){
//        cube([v_length,v_length,v_length+2]);
//    }
//}
//    

throat_slider_distance=200;
color("purple",alpha)
translate([0,0,-.5]){
polygon(points=[[-throat_slider_distance,0],[0,.5*slider_l],[0,-.5*slider_l]]);
}

//
color("cornflowerblue",alpha)
//
translate([0,0,-0.5*slider_h]){
    cube([slider_w ,slider_l ,slider_h],center=true);}
//
