w=7;
l=20;
h=3;


flat_factor=.4;

$fn=30;

minkowski()
{
translate([0,0,1.5])sphere(.5);
translate([0.5,0.5,-1.])cube([w,l,h]);
}






hull()
{
translate([15,w/2,w/2])
scale([1,1,flat_factor]) sphere(r=h);
translate([15,l-w/2,w/2])
scale([1,1,flat_factor]) sphere(r=h);
}



thread_diameter = 35;     // M35
nut_thickness = 5.5;       // 6mm thick

//            color("lightgreen")
           translate([0,0,nut_thickness])
           rotate_extrude(angle=180){ 
           translate([(thread_diameter/2)+1,0,0])
           union(){ difference(){
                circle(3,$fn=50);
                translate([-3,-3,-1])cube([3,3,2]);
                }
            }
            }