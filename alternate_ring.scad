//clasp

outer_ring_thick= 2;
inner_ring_thick = 1.5;
ring_gap = 3/16*25.4;
ring_height= 25;
inner_radius = 6*25.4;

module outer_ring()
{
    polygon(points=[
    [0,0],
    [outer_ring_thick/2,0],
    [outer_ring_thick/2,1.5],
    [outer_ring_thick,1.5],
    [outer_ring_thick,ring_height],
    [outer_ring_thick/2,ring_height],
    [outer_ring_thick/2,ring_height-outer_ring_thick/2],
    [0,ring_height-outer_ring_thick/2],
    [0,0]
    ]);
}


module inner_ring()
{
    polygon(points=[
    [inner_ring_thick/2,0],
    [inner_ring_thick,0],
    [inner_ring_thick,ring_height-inner_ring_thick],
    [0,ring_height-inner_ring_thick],
    [0,5]
    ]);
}






module create_ring(inner_radius=inner_radius,ring_gap=ring_gap)
{
rotate_extrude()
union()
    {
        translate([inner_radius,0,0])inner_ring();
        translate([inner_radius+ring_gap,0,0])outer_ring();
    }
}


//create_ring($fn=100);