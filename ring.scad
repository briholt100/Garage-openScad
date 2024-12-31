//ring, tight one has diameter of 11
// interesting site: https://www.printables.com/model/253391-customizable-engraved-rings
inside_dia=5.75;
out_dia= 7;


module torus(d=20, thickness=4,res=20){
    rotate_extrude($fn=res) {
        translate([d, 0]) circle(thickness, $fn=res);
}
}


difference()
{
torus(thickness=1, d=inside_dia);
cylinder(h=3,r1=inside_dia,r2=inside_dia,center=true);
}

