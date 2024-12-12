

//band saw slider guide for holding cylinders


//how thick to make V guide? 4 mil?
v_thickness=4;
v_length=100;

v_holder = [[0,0],[0,v_length],[v_length,0]]; // triangle for holder
v_holder_path = [0,1,2]; // triangle paths

difference(){
    linear_extrude(height=100){
        polygon(points=v_holder,paths=[v_holder_path]);
        }
    translate([v_thickness,v_thickness,-1]){
        cube([v_length,v_length,v_length+2]);
    }
}
    

//holder= 
//holder_paths=

//slider_w = 16;
//slider_h = 8;
//slider_l = 100;
//alpha=.9;
//color("cornflowerblue",alpha)
//
//cube([slider_w ,slider_l ,slider_h],center=true);

