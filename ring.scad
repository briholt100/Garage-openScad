//ring, tight one has diameter of 11
// interesting site: https://www.printables.com/model/253391-customizable-engraved-rings
inside_dia=5.75;
out_dia= 7;


module torus(d=10, thickness=4,res=20){
    rotate_extrude($fn=res) {
        translate([d, 0]) circle(thickness, $fn=res);
}}
translate([30,30,30]) torus(thickness=7, d=20);

module module_ring(){
difference()
{
    cylinder(h=3,r1=out_dia,r2=out_dia,center=true);
cylinder(h=7,r1=inside_dia,r2=inside_dia,center=true);

}
}

difference()
{
    minkowski()
{
    cylinder(3,5,5);

    

translate([5,0,1.5])
{
    sphere(3);    
}
    
    
}

 translate([5,0,-2])   cylinder(10,3,3);
}