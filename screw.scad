use <\\wsl.localhost\Ubuntu\home\ty\projects\Garage-openScad\threads-library-by-cuiso-v1.scad>
///media/brian/dater_bridge2/Projects/Ender3D/threads-library-by-cuiso-v1.scad


//cylinder(d=10, h=24,$fn=300);

translate([0,20,0]){
union()
{
    thread_for_screw(diameter=6, length=24);

cylinder(d=12, h=4,$fn=6);
}
}

difference(){

cylinder(d=12,h=4,$fn=6);
   translate([0,0,-.5]) thread_for_nut(diameter=6,length=5);
}