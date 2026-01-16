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

