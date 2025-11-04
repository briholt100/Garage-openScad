// Spark Plug wire loom clip

//basic size

w=15;
l=60;
t=5;

// add connector clip to valve cover

//main body
difference(){
color("cornflowerblue")
//minkowski()
    {
        cube([w,l,t-1]);
//        cylinder(r=4,h=1);
        
    }

// cut out holes
wireRadius = 4;

for (i = [6 : l/4 : 54]) {
    translate([.5*w,i,-1]){
        cylinder(h=t+2,r=wireRadius);
        cylinder(h=t+2,r1=wireRadius+1.5,r2=1);
        cylinder(h=t+2,r2=wireRadius+1.5,r1=1);
            }
                }
// remove one third of the side
    translate([.63*w,-1,-1]){
        color("purple")
        cube([w,l+2,t+2]);
        }
    }
    

    
