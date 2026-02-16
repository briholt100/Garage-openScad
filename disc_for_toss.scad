// disc for disc thrower (rober design) 
//lava chicken

//parameter given in inches but convered to mm using 25.4 mm per inch

discDiameter = (1+(43.5/64))*25.4;  //diameter = 1 43.5/64 inches
height = (16.5/64)*25.4;

difference(){
color("red")
cylinder(h=height, r=discDiameter/2,$fn=50);
color("white")
translate([0,0,-.1])cylinder(h=height+.2, r=height/2,$fn=50);
    
}