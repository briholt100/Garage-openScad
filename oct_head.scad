rotate_extrude($fn=100){
width= 30;
translate([0,width/2,0])difference(){
translate([0,0,00])circle(width/2);
translate([0,0,00])circle((width-2)/2);
    translate([-width/2,0,00])square(width,center=true);
}

translate([13,3,00])rotate([0,0,45])square([2,7],center=true);
}