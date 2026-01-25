cup_dia = 40; 
tool_height = 25.4; 
cup_gap_w = 30;


$fn=10;

difference()

{union(){

    difference()
    {cylinder(tool_height,r = cup_dia/2);
        translate([0,0,-0.05]) cylinder(tool_height+.1,r = cup_dia/2-8);
        
        }
        
    //flange for bottom
        
    difference()
        {translate([0,0,0]) color("blue") cube([cup_gap_w-2,cup_gap_w-6,cup_gap_w-20],center=true);
            
        translate([0,0,0]) color("blue") cube([cup_gap_w-3,cup_gap_w-7,cup_gap_w],center=true);}
    }
        
        
    
   translate([-06,-22,-09])
    color("green") 
    cube([12,12,tool_height+10]);}
   