// current throat is 3 inch
//slider channel is 11.5 inches
//echo(25.4*11.5);    //292 mm
//echo(25.4*3);       //76 mm

//band saw slider guide for holding cylinders

slider_w = 16;
slider_h = 8;
slider_l = 200;
alpha=.9;

throat_slider_distance=92;

//how thick to make V guide? 4 mil?
v_thickness=4;
v_length=40;

v_holder = [[0,0],[0,v_length],[v_length,0]]; // triangle for holder
v_holder_path = [0,1,2]; // triangle paths

translate([8,0,0])
{
rotate([0,-90,0]){
rotate([0,0,-45]){
difference(){
  linear_extrude(height=100){
        polygon(points=v_holder,paths=[v_holder_path]);
        }
    
    translate([v_thickness,v_thickness,-1]){
        cube([v_length,v_length,v_length+200]);
    }
}

    }
}
}

color("purple",alpha)
translate([0,0,-.5]){
    linear_extrude(4){
polygon(points=[[-throat_slider_distance,0],[0,.5*slider_l-20],[0,-.5*slider_l+20]]);
}
}

//rails on stablility trian

color("green")
mirror([0,10,0] ){
translate([-throat_slider_distance+5,0,2.4]){ 
rotate([90,0,49]){
cylinder(h= throat_slider_distance+30 ,r1=3, r2=3);
}
}
}
translate([-throat_slider_distance+5,0,2.4]){ 
rotate([90,0,49]){
cylinder(h= throat_slider_distance+30 ,r1=3, r2=3);
}
}

//
color("cornflowerblue",alpha)
//
translate([0,0,-0.5*slider_h]){
    cube([slider_w ,slider_l ,slider_h],center=true);}
//


// nees some suports for the V holder
    color("orange")
    mirror([0,20,0])
    {
    translate([-62,-20,0])
    {
    cube([70,3,20]);
    }
}
translate([-62,-20,0])
    {
    cube([70,3,20]);
    }