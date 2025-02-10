//inner ring needs to taper



// creating support tray extensions to fit filament for drying

inner_diam= 12.75*25.4;

inner_ring_thickness = 3/32*25.4;
inner_ring_height = 1+(50/24.4);

outer_ring_thickness = 3/32*25.4;
outer_ring_height = 5.75;

ring_gap = 3/16*25.4;

total_diamter = inner_diam+ 2*inner_ring_thickness + 2*outer_ring_thickness + + 2*ring_gap;

radius=total_diamter/2; 


//inner ring


module inner_ring(inner_ring_height=inner_ring_height,inner_diam=inner_diam,inner_ring_thickness=inner_ring_thickness,outer_ring_height=outer_ring_height,inner_adj=3)
{
    translate([0,0,-inner_adj])
 difference()
    {
    union(){ difference()
{
    cylinder(h=inner_ring_height*25.4+inner_adj+1.5 ,r1=inner_diam/2 + inner_ring_thickness+1,r2=inner_diam/2 + inner_ring_thickness+1,$fn=100);
    translate([0,0,-1])cylinder(h=outer_ring_height*25.4 ,r1=inner_diam/2,r2=inner_diam/2,$fn=100);
}
}
color("cornflowerblue")translate([0,0,7]) cylinder(125,inner_diam/2+10,inner_diam/2-7,center=true,$fn=100);  //tapers the inner ring on bottom
   
 translate([0,0,(inner_ring_height*25.4+4)])rotate_extrude($fn=100)
translate([inner_diam/2+3,0,0]) circle(1,$fn=100);//tapers on top
  

}

}



//outer ring

    module outer_ring(
    inner_ring_height=inner_ring_height,inner_diam=inner_diam,inner_ring_thickness =inner_ring_thickness,outer_ring_thickness =outer_ring_thickness,ring_gap=ring_gap,outer_ring_height=inner_ring_height)
{    difference(){
    translate([0,0,2])cylinder(h=(inner_ring_height)*25.4-2,r1=inner_diam/2 + inner_ring_thickness + outer_ring_thickness + ring_gap,r2=inner_diam/2 + inner_ring_thickness + outer_ring_thickness + ring_gap,$fn=100);
    translate([0,0,-1])cylinder(h=(inner_ring_height+1)*25.4,r1=inner_diam/2 + inner_ring_thickness +  ring_gap,r2=inner_diam/2 + inner_ring_thickness +  ring_gap,$fn=100);
    
}
}




//spines module

count_spines=14;
        rad=13.5*25.4/2;

module spines(count_spines=count_spines,radius=rad){

color("blue")
for(i=[0:360/count_spines:360])
    {
        rotate([0,0,i])
        {
            translate([(inner_diam/2 + inner_ring_thickness+ring_gap/2),0,0])cylinder(inner_ring_height*25.4-2,1.5,1.5,$fn=100);
            translate([(inner_diam/2 + inner_ring_thickness-1),-.5,0])cube([6,1,inner_ring_height*25.4-2]);
            }
            }
            
        }


//remove 2/3rds
        
module cheese_brick(a=300, c="lightgreen")
        {
            translate([0,0,-3])color(c)rotate_extrude(angle = a) square(radius+4);
        }

        


module outer_lip()
        {color("cornflowerblue")translate([0,0,(inner_ring_height)*25.4])rotate_extrude($fn=100)translate([
        inner_diam/2 + inner_ring_thickness + ring_gap,0,0])polygon(points=[[0,0],
        [(3/32 )*25.4,0],
        [3/32*25.4,1/8*25.4],
        [(3/32-2/64)*25.4,1/8*25.4],
        [(3/32-2/64)*25.4,(3/32-2/64)*25.4],
        [0,(3/32-2/64)*25.4]]);}

        
//!outer_lip();

//need to make a reversed  L lip.


module inv_outer_lip()
        {color("cornflowerblue")translate([0,0,0])rotate_extrude($fn=100)translate([
        inner_diam/2 + inner_ring_thickness + ring_gap,0,0])
translate([(3/32 )*25.4,0,0])mirror([180,0,0])polygon(points=[[0,0],
        [(3/32 )*25.4,0],
        [3/32*25.4,-1/8*25.4], 
        [(3/32-2/64)*25.4,-1/8*25.4],
        [(3/32-2/64)*25.4,-(3/32-2/64)*25.4],
        [0,-(3/32-2/64)*25.4]]);

            }

 


//put it together

difference(){

union()
    {
        difference()
        {       

////inner ring creation

union() {
inner_ring();
spines(count_spines);
//outer ring creation
outer_ring();
    outer_lip();
    color("orange")translate([0,0,3])inv_outer_lip();
    }
        
        
}
}
rotate([0,0,5])translate([0,0,-1.2])cheese_brick();
}




//clasp a sort of wedge?

module clasp(){
difference()
    {    
linear_extrude(inner_ring_height*25.4-8)

    union()
{
    polygon(points=[
        [0,0],
        [ring_gap,0],
        [ring_gap*2/3,10],
        [ring_gap*1/3,10]
    ]);
    translate([ring_gap/2,10,0])circle(r=ring_gap*1/6,$fn=100);

}

scale([.7,.8,1]) 
color("green")translate([1,1,-.5]){
    linear_extrude(inner_ring_height*25.4-3)
union()
{
    polygon(points=[
        [0,0],
        [ring_gap,0],
        [ring_gap*2/3,10],
        [ring_gap*1/3,10]
    ]);
    translate([ring_gap/2,10,0])circle(r=ring_gap*1/6,$fn=100);

}
}
}
}
translate([inner_diam/2 + inner_ring_thickness+.4,10,05])rotate([0,0,9.5])color("orange")clasp();



//hooks

module hook(){
difference()
    {
rotate([0,90,0])
    rotate_extrude($fn=100)


    difference()
{
    square(5);
translate([4.5,5/2,0])   
    circle(1,$fn=100);
    
}

color("yellow")translate([-1,1,-5.5])cube(11);
rotate([0,90,0])cylinder(12,3,3,$fn=100);
}
}

translate([inner_diam/2+8.5,0,inner_ring_height*25.4/2 ])rotate([0,0,0])color("purple")hook();

rotate([0,0,-50])translate([inner_diam/2+8.5,0,inner_ring_height*25.4/2 ])rotate([180,0,0])color("lightblue")hook();