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

rotation_angle=acos(radius/hypotenuse);



difference()
{    
scale([1,1,20]) 
color("cornflowerblue",.5)
polygon(points=[[buffer,0],[buffer+radius,0],[buffer,height]],  paths=[[0,1,2]]);

  
      translate([buffer+radius-2,-1,0])
        
        {
            rotate([-90,0,90-rotation_angle])

            {
                 color("green") cylinder(h=hypotenuse+3,r1=3,r2=3);   
                }
                
            
            }    
       
        }