// creating support tray extensions to fit filament for drying

inner_radius = 12.75*25.4;

inner_ring_thickness = 3/32*25.4;

outer_ring_thickness = 3/32*25.4;

ring_gap = 3/16*25.4;

total_diamter = inner_radius + 2*inner_ring_thickness + 2*outer_ring_thickness + + 2*ring_gap;

radius=total_diamter/2; 

difference()
{
    cylinder(h=2*25.4,r1=radius,r2=radius);
    translate([0,0,-1])cylinder(h=3*25.4,r1=radius-1,r2=radius-1);
}


difference(){
    cylinder(h=2*25.4,r1=radius+3,r2=radius+3);
    translate([0,0,-1])cylinder(h=3*25.4,r1=radius+1.5,r2=radius+1.5);
}

count_spines=12;
rad=13.5*25.4/2;

module spines(count_spines=count_spines,radius=rad){

color("blue")
for(i=[0:360/count_spines:360])
    {
        rotate([0,0,i])
        {
            translate([(radius),0,-1])cylinder(100,1.5,1.5);
            }
            }
            
        }
        
        spines();
