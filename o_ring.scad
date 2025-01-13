//For this to work, 2 times translate Xi - 2(r) should give inside diatmer of torus
//2(Xi) + 2(r) should give outside diatmer of torus

// id 3.2, od 5.5

cir_rad=.5;
trans_xi=2.2;
trans_yi=2.2;

translate([0,0,-5.5*cir_rad]) 
rotate_extrude()
//translate([2,0,0]) circle(r=1,$fn=100);  //2 mm inside diamter torus

//translate([4,0,-.5]) circle(r=1,$fn=100);  // 8-2 = 6 mm inside diamter torus, 10 mm od

//translate([4,0,-.5]) circle(r=2,$fn=100);  // 8-4 = 4 mm inside diamter torus, 12mm od

translate([trans_xi,trans_yi,-cir_rad/2]) circle(r=cir_rad,$fn=100);  // 8-4 = 4 mm inside diamter torus, 12mm od

echo("outside diameter for X , radius; ");
echo(2*trans_xi + 2*cir_rad);


echo("inside diameter for X , radius; ");
echo(2*trans_xi - 2*cir_rad);
