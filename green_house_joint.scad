$fn=100;
length=90;
od=20;
id=16;

difference()
{
    cylinder(length,r=od);
    translate([0,0,-.5])  cylinder(89,r=id);
}


