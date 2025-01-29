// creating support tray extensions to fit filament for drying

inner_diam= 12.75*25.4;

inner_ring_thickness = 3/32*25.4;

outer_ring_thickness = 3/32*25.4;

ring_gap = 3/16*25.4;

total_diamter = inner_diam+ 2*inner_ring_thickness + 2*outer_ring_thickness + + 2*ring_gap;

radius=total_diamter/2; 


//inner ring creation

difference()
{
    cylinder(h=2*25.4,r1=inner_diam/2 + inner_ring_thickness,r2=inner_diam/2 + inner_ring_thickness);
    translate([0,0,-1])cylinder(h=3*25.4,r1=inner_diam/2,r2=inner_diam/2);
}


//outer ring creation

difference()
{
    cylinder(h=2*25.4,r1=inner_diam/2 + inner_ring_thickness + outer_ring_thickness + ring_gap,r2=inner_diam/2 + inner_ring_thickness + outer_ring_thickness + ring_gap);
    translate([0,0,-1])cylinder(h=3*25.4,r1=inner_diam/2 + inner_ring_thickness +  ring_gap,r2=inner_diam/2 + inner_ring_thickness +  ring_gap);
}

count_spines=12;
rad=13.5*25.4/2;

module spines(count_spines=count_spines,radius=rad){

color("blue")
for(i=[0:360/count_spines:360])
    {
        rotate([0,0,i])
        {
            translate([(inner_diam/2 + inner_ring_thickness),0,-1])cylinder(100,1.5,1.5);
            }
            }
            
        }
        
        spines();
