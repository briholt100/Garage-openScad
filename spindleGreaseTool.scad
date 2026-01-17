include <BOSL2/std.scad>
include <BOSL2/metric_screws.scad>
include <BOSL2/screws.scad>

$fn = 140;

hole_dia=60;
pitch=1.5;
hole_radius=hole_dia/2;
nut_width = 45;

stringMetric = "M";
bolt_name = str(stringMetric,hole_dia,"x",pitch);

//translate([0,0,-5])color("cornflowerblue")circle(2.125*25.4);


//metric_bolt(size=22, pitch=1.5, l=40);

//metric_nut("M22", pitch=1.5);

difference(){
color("cornflowerblue")nut(bolt_name,thickness="thin",anchor=CENTER,
    blunt_start2=false);

translate([-55,-55,0])color("green")mirror([0,0,01])cube([110,110,20],center=false);
    }
  