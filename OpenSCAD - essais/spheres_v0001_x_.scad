/*
*/

rs1=10;
ep=0.8;

tmp_fn=50;
pcoup=0.75;//[0:0.05:1]
/*
A revoir le rayon du disque a une hauteur h (rdh) d'une sphére 

cos( asin(h/r))*r

*/
e=ep;
sens = -1;//[-1,1]
h=(sens*rs1)*pcoup;
r=(rs1*cos(asin(h/rs1)));

debug_2d=false;

//
dc=rs1*2;
tr_x=5;
tr_y=5;

//
rpc_fact=1.0;//[0.01:0.01:5]
nb=4;
module test002SphereCoup(){
translate([
rs1
//
*2+5
,0,0])
color("white",0.5)
difference(){
intersection(){
sphere(r=rs1, $fn = tmp_fn);
translate([tr_x,tr_y,0])
cube([dc,dc,dc*pcoup],center = true);

}
intersection(){
    sphere(r=rs1in, $fn = tmp_fn);

    translate([tr_x,tr_y,ep])
    cube([dc-(ep*2),dc-(ep*2),(dc*pcoup)-ep*2],center = true);
    };
/**/
};
};//test002SphereCoup();
//
rs1in=rs1-ep;
module test01(){
    
    #color("yellow",0.0)
translate([0,0,(h)
+((sens*e)/2)
/*-((
//-1*
sens*e)/2)
*/
])
linear_extrude(height = e,center=true, convexity = 10, twist = 0)
circle(r=r, $fn = tmp_fn);


color("blue",0.0)
union(){
difference(){
sphere(r=rs1, $fn = tmp_fn);
union(){
    // Pour vider 
    sphere(r=rs1in, $fn = tmp_fn);
    
    /*
    // Pour ouvrire ... a revoir car bort particulier des speres ...
    translate([0,0,rs1])
    sphere(r=rs1in, $fn = tmp_fn);
    */
      // Pour couper la base si en sens -1 sinon c'est le haut
    translate([0,0,(h+(h/2))
])
  
cylinder(h=rs1,r=r,center=true,$fn= tmp_fn);
    //le haut
    translate([0,0,-1*(h+(h/2))
])
  
cylinder(h=rs1,r=r,center=true,$fn= tmp_fn);
};


};

/*
// une tentatve pour arondire la coupure ... a revoir ... ne colle que si via diff avec sphere plus haut 
translate([0, 0, (sens*h)+(ep/2)])
rotate_extrude(convexity = 10, $fn = tmp_fn)
translate([r-(ep), 0, 0])
circle(d = ep, $fn = tmp_fn);
*/
/*
// autre tentative pour arondire tj pas cela ... ??? 

translate([0, 0, (sens*h)
+(ep/1.5)
])
rotate_extrude(convexity = 10, $fn = tmp_fn)
translate([r
-(ep/1.5)
, 0, 0])
circle(d = ep, $fn = tmp_fn);
*/

};//union end
}// fin module
/*
nb=4;
for(angle = [0:360/nb:360] ){
translate([cos(angle)*rs1,sin(angle)*rs1,0])
circle(r=rs1, $fn = tmp_fn);
}
*/


module testSpere2D_part(){
    color("green",0.5)
    difference(){
    //    
    circle(r=rs1, $fn = tmp_fn);
    
    translate([ep,0,0])
    circle(r=rs1, $fn = tmp_fn);

// TODO un masque pour assurer le rotate_extrude (cf : ensemble de points de x de même signe.
        

    // coup "dessu (aprés rotate_extrude )"
//
        translate([0,(rs1*2)-(rs1*(1-pcoup)),0])    square(rs1*2,true);


    // coup "dessous (aprés rotate_extrude )"
    translate([0,-((rs1*2)-(rs1*(1-pcoup))),0]) square(rs1*2,true);
};//edf difference
}
testSpere2D_part();


module testSpere2D(){
    
    projection(cut=false)
linear_extrude(1) 
    union(){
    testSpere2D_part();

//socle
    intersection(){
    //    
    
circle(r=rs1, $fn = tmp_fn);
   
    // coup dessou
translate([-rs1,
        -((rs1)-(rs1*(1-pcoup)))+(ep/2)
        ,0])    
square([rs1*2,ep],true);

};//edf difference

}
}
// debug 
// #testSpere2D();
if ( debug_2d ){
    rotate([90,0,0])
    testSpere2D();
}
//
module rotTestSpere2D(){
rotate_extrude(angle = 360,convexity = 10, $fn = tmp_fn){
    testSpere2D();
}
}
//

if ( !debug_2d ){
translate([rs1,0,0])rotTestSpere2D();
}
//rpc_fact=1.0;//[0.01:0.5:5]
//nb=4;
module multiRot(){
rpc=((rs1-(ep/2))*cos(asin((rs1*pcoup)/rs1)))*rpc_fact;

difference(){
for(angle = [0:360/nb:360] ){
translate([cos(angle)*(rpc),sin(angle)*(rpc),0])
rotTestSpere2D();
};
//
//translate([0,0,rs1/2])sphere(r=rs1/2);
//
translate([0,0,0])
cylinder(h=rs1*pcoup,r1=0,r2=rs1-(ep*(nb+1)),center=false);
}
}//multiRot();