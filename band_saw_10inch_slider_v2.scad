
//band saw slider guide for holding cylinders
 

// current throat is 3 inch
//slider channel is 11.5 inches
//echo(25.4*11.5);    //292 mm
//echo(25.4*3);       //76 mm

// make a ruler to check



slider_w = 16;
slider_h = 7;  //need to check depth of saw
slider_l = 200;
alpha=.8;

throat_slider_distance=115;

//how thick to make V guide? 4 mil?
v_thickness=4;
v_length=40;

v_holder = [[0,0],[0,v_length],[v_length,0]]; // triangle for holder
v_holder_path = [0,1,2]; // triangle paths

module band_saw_guide()
{
translate([8,0,0])
{
rotate([0,-90,0]){
rotate([0,0,-45]){
difference(){
  linear_extrude(height=123){
        polygon(points=v_holder,paths=[v_holder_path]);
        }
    
    translate([v_thickness,v_thickness,-1]){
        cube([v_length,v_length,v_length+200]);
    }
}

    }
}
}



module tri_base(x1=-throat_slider_distance,y1=0,x2=9,y2=.5*slider_l-20,x3=9,y3=-.5*slider_l+20)
{
 linear_extrude(6)
    {
        polygon(points=[[x1,y1],[x2,y2],[x3,y3]]);
        }
}




difference(){
translate([0,0,-.5])
    { color("purple",alpha)
        tri_base();
        }

translate([4,0,1])
    {color("orange",alpha)
        tri_base();
        }
    }

//slider guide
    
color("cornflowerblue",alpha)

translate([0,0,-0.5*slider_h]){
    cube([slider_w ,slider_l ,slider_h],center=true);}

translate ([-8,50,-5])
    {
        linear_extrude(1){circle(1);}
    }

mirror([0,50,0])
    {
        translate ([-8,50,-5])
            {
                linear_extrude(1){circle(1);}
                }
            }



// needs some suports for the V holder
    color("orange")
    mirror([0,20,0])
    {
    translate([-67,-20,0])
    {
    cube([80,3,20]);
    }
}
translate([-67,-20,0])
    {
    cube([80,3,20]);
    }
}


//band_saw_guide();


difference()
{
    band_saw_guide();

    translate([16,0,10])
        {
        cube([slider_w ,slider_l ,slider_h+50],center=true);
        }
}