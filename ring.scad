//ring, tight one has diameter of 11
// interesting site: https://www.printables.com/model/253391-customizable-engraved-rings
inside_dia=5.75;
out_dia= 7;
difference()
{
    cylinder(h=3,r1=out_dia,r2=out_dia,center=true);
cylinder(h=7,r1=inside_dia,r2=inside_dia,center=true);

}