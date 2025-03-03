$fn=100;
length=94;
od=20;
id=16.25;

module create_cyl(l=length,inside_dia=id,out_dia=od){
difference()
{
    union()
    {
        cylinder(l,r=out_dia/2);
        
        }
    translate([0,0,-.5])cylinder(l+1 ,r=inside_dia/2);
}
}



//rotate([0,90,0])  // makes it tall, maybe better for cura?
difference()
{
union(){
translate([0,0,od/2])rotate([0,-90,0])
{
difference()
{
union()
{
    create_cyl();//main pipe
    
            translate([0,0,length/2])rotate([0,90,0])color("cornflowerblue")create_cyl(l=length/2-5); //blue pipe
    
    
    translate([0,0,length/2])rotate([0,90,90])color("lightgreen")create_cyl(l=length/2-5);//green pipe
}
    color("blue")translate([0,0,-.5])cylinder(length+1 ,r=id/2);
}


//support_triangle

translate([0,10,length/2-9])
 rotate([0,90,0])color("red")linear_extrude(2)polygon(points =[[0,0],[10,0],[0,10]]);

translate([10,0,length/2-9])
 rotate([0,90,-90])color("green")linear_extrude(2)polygon(points =[[0,0],[10,0],[0,10]]);

}


// basic T
//
//translate([-50,0,0])color("orange")create_cyl(l=94);
//translate([-50,0,length/2])rotate([-90,00,00])color("purple")create_cyl(l=length/2-5);//purple pipe
//
//translate([-50,10,length/2-9])
// rotate([-90,90,-90])color("lightblue")linear_extrude(2)polygon(points =[[0,0],[10,0],[0,10]]);
//
//
}
        translate([-length/2,0,12])color("orange")
                cylinder(h=length/2,r=id/2); //cutuotpipe

       rotate([-90,0,0]) translate([-length/2,-10,0])color("orange")
                cylinder(h=length/2,r=id/2); //cutuotpipe

}
