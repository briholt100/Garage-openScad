//inner ring needs to taper



// creating support tray extensions to fit filament for drying

inner_diam= 12.75*25.4;

inner_ring_thickness = 3/32*25.4;
inner_ring_height = 2;

outer_ring_thickness = 3/32*25.4;
outer_ring_height = 3;

ring_gap = 3/16*25.4;

total_diamter = inner_diam+ 2*inner_ring_thickness + 2*outer_ring_thickness + + 2*ring_gap;

radius=total_diamter/2; 

//spines module
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







count_spines=12;
        rad=13.5*25.4/2;
spines();
        
        //need to make an L shape rotate extrude that sits on top of out ring, with same translate parameters, plus outer ring height.




difference()
 {       
//inner ring creation

union() {
difference()
{
    cylinder(h=inner_ring_height*25.4 ,r1=inner_diam/2 + inner_ring_thickness,r2=inner_diam/2 + inner_ring_thickness,$fn=100);
    translate([0,0,-1])cylinder(h=outer_ring_height*25.4 ,r1=inner_diam/2,r2=inner_diam/2,$fn=100);
}


//outer ring creation

difference()
{
    cylinder(h=(inner_ring_height+.125)*25.4,r1=inner_diam/2 + inner_ring_thickness + outer_ring_thickness + ring_gap,r2=inner_diam/2 + inner_ring_thickness + outer_ring_thickness + ring_gap,$fn=100);
    translate([0,0,-1])cylinder(h=outer_ring_height*25.4,r1=inner_diam/2 + inner_ring_thickness +  ring_gap,r2=inner_diam/2 + inner_ring_thickness +  ring_gap,$fn=100);
}



    }
        
// taper inner ring
        
 color("cornflowerblue")translate([0,0,15]) cylinder(100,inner_diam/2+5,inner_diam/2-7,center=true,$fn=100);
}
