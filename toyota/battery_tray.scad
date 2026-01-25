bat_w = 10.25; //inches
bat_depth = 7.25; //inches
tray_height = 1.5; //inches
difference()
{color("blue") linear_extrude(height=tray_height) square([bat_w + .5,bat_depth +.5],center=false);
    //removing center
    translate([0.25,0.250,.25]) color("red") linear_extrude(height=tray_height) square([bat_w ,bat_depth ],center=false);}
