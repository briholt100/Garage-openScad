$fn=100;
length=90;
od=20;
id=16;

module create_cyl(l=length,inside_dia=id,out_dia=od){
difference()
{
    union()
    {
        cylinder(l,r=od/2);
        
        }
    translate([0,0,-.5])cylinder(l+1 ,r=id/2);
}
}




difference()
{
union()
{
    create_cyl();
    translate([0,0,length/2])rotate([0,90,0])color("cornflowerblue")create_cyl(l=length/2);
    translate([0,0,length/2])rotate([0,90,90])color("lightgreen")create_cyl(l=length/2);
}
    color("blue")translate([0,0,-.5])cylinder(length+1 ,r=id/2);
}


//support_triangle

translate([0,10,length/2-9])
 rotate([0,90,0])color("red")linear_extrude(2)polygon(points =[[0,0],[10,0],[0,10]]);

translate([10,0,length/2-9])
 rotate([0,90,-90])color("green")linear_extrude(2)polygon(points =[[0,0],[10,0],[0,10]]);