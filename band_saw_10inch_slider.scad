//band saw slider guide for holding cylinders

slider_w = 16;
slider_h = 8;
slider_l = 100;
alpha=.9;
//color("cornflowerblue",alpha)
//
//cube([slider_w ,slider_l ,slider_h],center=true);
//
////,paths=[0,0],[20,0],[0,20]
//linear_extrude(height=100,center=false,convexity=10,twist=00,slices=0,scale=1)
//polygon(points=[[0,0],[0,20],[20,0]]);



 facade=[[0,0], [0,10], [5,15], [10,10], [10,0]];
 window=[[1,6],[1,9],[4,9],[4,6]];
 house=concat(facade,window);
 echo(house);
polygon([[0,0], [0,10], [5,15], [10,10], [10,0]]);