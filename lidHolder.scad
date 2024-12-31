

// make an upside down rack to hold a pot lid for under a cabinet.  Not on the side, but under. 

first_square=25;
end_square=50;
bar_length=197;
//support_tri();
module support_cone(h=first_square){
    difference(){    
        translate([0,0,0]) cylinder(h=h,r1=7.5,r2=0);
        translate([-first_square/2,0,-1]) cube(h+2);
        }
    }

module make_bar(bar_length=bar_length, first_square=25,end_square=50){
    color("green")
        

hull()
{

translate([0,0,first_square]) 
    rotate([0,90,0]) cube([first_square,first_square,2],center=false);
    

translate([bar_length,0,end_square]) 
    rotate([0,90,0]) cube([end_square,end_square,2],center=false);
   }
}

//make supports

module support_tri(){
translate([7,10,0]) rotate([0,-90,0])linear_extrude(height=3) polygon(points=[[0,-2],[0,-10],[-first_square,-10]]);}
    


//make L brackets

module L_braket(){
    difference()
{
    translate([0,0,20])make_bar(bar_length=5, first_square=10,end_square=10);
translate([-1,-2,18])make_bar(bar_length=8, first_square=10,end_square=10);
    translate([3.5,4,24])  cylinder(h=8,r1=2.5,r2=1.5);
}
}

//make holes

module make_hole(){
  cylinder(h=8,r1=2.5,r2=1.5);
}



// L_braket(); 
//translate([3.5,5,24])  cylinder(h=8,r1=2.5,r2=1.5);


//make object

translate([0,-120,0]) 
    mirror([0,1,0]){
color("purple"){ 
   translate([8,0,0]) rotate([180,0,0]) support_cone();
   translate([192/2,0,0]) rotate([180,0,0]) support_cone(h=end_square-15);
    translate([185,0,0])rotate([180,0,0]) support_cone(h=end_square-1);}

color("orange") 

{
  translate([bar_length-5,-end_square-8,-30]) rotate([0,0,0]) L_braket();
    }
color ("grey")
difference()
 {
    translate([0,0,-2]) cube([bar_length+2,8,2]);
   
color("cornflowerblue") translate([20,4,-2.5]) make_hole();
 color("cornflowerblue") translate([108,4,-2.5]) make_hole();
 
 color("cornflowerblue") translate([195,4,-2.5]) make_hole();      
} 
difference()
{
    rotate([180,0,0]) make_bar(first_square=first_square,end_square=end_square);
    translate([-12,-2,5]) rotate([180,0,0]) make_bar(bar_length=bar_length+10);   
}

}

color("red"){ 
   translate([8,0,0]) rotate([180,0,0]) support_cone();
   translate([192/2,0,0]) rotate([180,0,0]) support_cone(h=end_square-15);
    translate([185,0,0])rotate([180,0,0]) support_cone(h=end_square-1);}

color("orange") 

{
    translate([bar_length-5,-end_square-8,-30]) rotate([0,0,0]) L_braket();
    }


color("grey")
difference()
{
    translate([0,0,-2]) cube([bar_length+2,8,2]);
 color("cornflowerblue") translate([20,4,-2.5]) make_hole();
 color("cornflowerblue") translate([108,4,-2.5]) make_hole();
 
 color("cornflowerblue") translate([195,4,-2.5]) make_hole();      
}


difference()
{
    rotate([180,0,0]) make_bar(first_square=first_square,end_square=end_square);
    translate([-12,-2,5]) rotate([180,0,0]) make_bar(bar_length=bar_length+10);

    
}


