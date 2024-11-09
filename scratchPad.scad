// cone with radius 45 base
// height 80

height=80;
radius=45;
buffer=5;
hypotenuse= sqrt(height^2 + radius^2);
echo("the hypotenuse is :", hypotenuse);
//sohcahtoa

//cosine is adjacent over hyppotenuse

echo("adj_Frac = ",radius/hypotenuse);

echo("adj_angle = ",acos(radius/hypotenuse));

color("cornflowerblue")
polygon(points=[[buffer,0],[buffer+radius,0],[buffer,height]],  paths=[[0,1,2]]);

rotate([-90,0,0])
translate([buffer+radius,0,0])
{

    {
            cylinder(h=hypotenuse,r1=1,r2=1);   
        }
        
    
    }    