//a^2 + b^2 = c^2

//inputs

    //cross section of oring

        cross_section_radius = 2;

    //Inside diamter

        id = 7;   //7m inside diamter (x/2 = radius)

    //Outside diamter

        //od = 7;   //may be derivative based on id

x_i = 5;
y_i = 5;

distance_to_center = sqrt(x_i ^2+y_i ^2);

    
translate([x_i ,y_i ,0])
    circle(cross_section_radius, $fn=100);
    
translate([x_i,y_i,0])cylinder(h=3,r1=.1,r2=.1);
    
    
    dist_to_outside = distance_to_center + cross_section_radius;
    dist_to_inside= distance_to_center - cross_section_radius;
    
    xi_hat_plus=sqrt((dist_to_inside^2/2));
    
    xi_hat_minus=sqrt((dist_to_inside^2/2));
            
translate([xi_hat_plus,xi_hat_plus,0])cylinder(h=3,r1=.1,r2=.1);
translate([xi_hat_minus,xi_hat_minus,0])cylinder(h=3,r1=.1,r2=.1);