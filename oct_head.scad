rotate_extrude($fn=100)
{
width= 30;
translate([0,width/2,0]){
difference(){

translate([0,0,00])circle(width/2);

translate([0,0,00])circle((width-2)/2);
        translate([-width/2,0,00]) square(width,center=true);
        translate([0,-15,00])square([10,5]);
   }

translate([13,-width/2+2,00])rotate([0,0,45])square([2,7],center=true);
}}