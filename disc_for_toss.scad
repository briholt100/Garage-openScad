// disc for disc thrower (rober design) 
//lava chicken

//parameter given in inches but convered to mm using 25.4 mm per inch

discDiameter = (1+(43.5/64))*25.4;  //diameter = 1 43.5/64 inches
height = (16.5/64)*25.4;

inner_discDiam = discDiameter-.5;
inner_discHeight = height-.5;
inner_in_cicle_radius = (height/2)+.25;


module make_basic_disc(
    h=height,
    radius=discDiameter/2,
    inner_circle_radius = height/2)
    {

    difference(){

        cylinder(h, r=radius,$fn=50);

        translate([0,0,-.1])
        cylinder(h=h+.2, r=inner_circle_radius,$fn=50);    
    }
    
}

difference(){
color("red")make_basic_disc();
    
translate([0,0,-1])make_basic_disc(h=inner_discHeight,
    radius=inner_discDiam/2,
    inner_circle_radius=inner_in_cicle_radius);
}


translate([050,0,0]){
rotate_extrude(angle=360,convexity=10 ){
translate([(discDiameter/2)-2,0,0])
difference(){
    translate([0,0,0])
    square(height+1);
    translate([0,height/2,0])
    circle(r=height/2);
}
}
}







module make_dad_disc_ver(){
color("cornflowerblue")rotate_extrude(angle=360,convexity=10)
{
    translate([.5*height,0,0])square([.5,height]);
    translate([.5*height,height-.5,0])square([(discDiameter/2)-2.6,.5]);
    difference()
    {
    translate([discDiameter/2 ,height/2,0])
        color("red") circle(r=height/2,$fn=50);
          translate([(discDiameter/2)-1,(height/2)-.5,0])circle(height/2,$fn=50);
    }
}
}

translate([0,0,40])make_dad_disc_ver();

