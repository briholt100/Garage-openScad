//inner ring needs to taper



// creating support tray extensions to fit filament for drying

inner_diam= 12.75*25.4;

inner_ring_thickness = 3/32*25.4;
inner_ring_height = 2.75;

outer_ring_thickness = 3/32*25.4;
outer_ring_height = 5.75;

ring_gap = 3/16*25.4;

total_diamter = inner_diam+ 2*inner_ring_thickness + 2*outer_ring_thickness + + 2*ring_gap;

radius=total_diamter/2; 


//inner ring


module inner_ring(inner_ring_height=inner_ring_height,inner_diam=inner_diam,inner_ring_thickness=inner_ring_thickness,outer_ring_height=outer_ring_height){
 difference()
    {
    union(){ difference()
{
    cylinder(h=inner_ring_height*25.4 ,r1=inner_diam/2 + inner_ring_thickness,r2=inner_diam/2 + inner_ring_thickness,$fn=100);
    translate([0,0,-1])cylinder(h=outer_ring_height*25.4 ,r1=inner_diam/2,r2=inner_diam/2,$fn=100);
}
}
color("cornflowerblue")translate([0,0,15]) cylinder(100,inner_diam/2+5,inner_diam/2-7,center=true,$fn=100);  //tapers the inner ring
}

}



//outer ring

    module outer_ring(
    inner_ring_height=inner_ring_height,
    inner_diam=inner_diam,
    inner_ring_thickness =inner_ring_thickness,
    outer_ring_thickness =outer_ring_thickness,
    ring_gap=ring_gap,
    outer_ring_height=outer_ring_height){
    difference(){
    cylinder(h=(inner_ring_height+.125)*25.4,r1=inner_diam/2 + inner_ring_thickness + outer_ring_thickness + ring_gap,r2=inner_diam/2 + inner_ring_thickness + outer_ring_thickness + ring_gap,$fn=100);
    translate([0,0,-1])cylinder(h=outer_ring_height*25.4,r1=inner_diam/2 + inner_ring_thickness +  ring_gap,r2=inner_diam/2 + inner_ring_thickness +  ring_gap,$fn=100);
}
}




//spines module


count_spines=12;
        rad=13.5*25.4/2;

module spines(count_spines=count_spines,radius=rad){

color("blue")
for(i=[0:360/count_spines:360])
    {
        rotate([0,0,i])
        {
            translate([(inner_diam/2 + inner_ring_thickness+ring_gap/2),0,-1])cylinder(100,1.5,1.5,$fn=100);
            translate([(inner_diam/2 + inner_ring_thickness-1),-.5,-1])cube([6,1,100]);
            }
            }
            
        }








//remove 2/3rds
        
module cheese_brick(a=240, c="lightgreen")
        {
            translate([0,0,-1])color(c)rotate_extrude(angle = a) square(radius+2);
        }

//add clasps
        
        



    
//need to make an L shape rotate extrude that sits on top of out ring, with same translate parameters, plus outer ring height.


color("cornflowerblue")translate([0,0,(inner_ring_height+.125)*25.4])rotate_extrude()translate([
        inner_diam/2 + inner_ring_thickness + outer_ring_thickness + ring_gap,0,0])polygon(points=[[0,0],
        [3/32*25.4,0],
        [3/32*25.4,3/32*25.4],
        [(3/32-3/64)*25.4,3/32*25.4],
        [(3/32-3/64)*25.4,(3/32-3/64)*25.4],
        [0,(3/32-3/64)*25.4]]);

        
difference(){

union()
    {
difference()
 {       

////inner ring creation

union() {
inner_ring();
spines(count_spines=13);
//outer ring creation
outer_ring();
    }
        
        
}
}
rotate([0,0,5])cheese_brick();
}
//
//
//
//
//}
