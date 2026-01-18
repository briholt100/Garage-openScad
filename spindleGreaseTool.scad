include <BOSL2/std.scad>
include <BOSL2/metric_screws.scad>
include <BOSL2/screws.scad>

$fn = 140;

hole_dia=35;
pitch=1.5;
stringMetric = "M";
bolt_name = str(stringMetric,hole_dia,"x",pitch);
hole_radius=hole_dia/2;
nut_width = 54;
nut_length= 62.5;

dif_box_x=nut_width*2+1;
dif_box_y=nut_length*2+1;
dif_box_z=24;

//translate([0,0,-5])color("cornflowerblue")circle(2.125*25.4);


//metric_bolt(size=22, pitch=1.5, l=40);

//metric_nut("M22", pitch=1.5);

difference(){

translate([0,0,-8])
    color("cornflowerblue")nut(bolt_name,thickness="thin",
    anchor=CENTER,
    blunt_start2=false);

  translate([0,0,-dif_box_z/2])
  color("green")  mirror([0,0,01])
                                    cube([dif_box_x,
                                        dif_box_y,
                                         dif_box_z],
                                                center=true);
}
  