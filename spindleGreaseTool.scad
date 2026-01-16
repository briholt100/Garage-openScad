include <BOSL2/std.scad>
include <BOSL2/metric_screws.scad>
include <BOSL2/screws.scad>

$fn = 140;

color("cornflowerblue")circle(2.125*25.4);


//metric_bolt(size=22, pitch=1.5, l=40);

//metric_nut("M22", pitch=1.5);

difference(){
nut("M60",thickness="thin",pitch=1.5);

cube([120,120,30],center=true);}