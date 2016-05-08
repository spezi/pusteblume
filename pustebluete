$fn=64;

//Anzahl der Stäbe: 1 5 7 11 7 5 = 36

module cylinder_main () {
        cylinder(h=600, r=12, center=true);
    }


module second_oben() {
    for ( i = [0 : 4] ){
        rotate( i * 72, [0, 0, 1])
        translate([0, 280, 300])
        rotate([140, 0, 0]) {
            cylinder_main();
        }
    }
}

module first_oben() {
    for ( i = [0 : 6] ){
        rotate( i * 51, [0, 0, 1])
        translate([0, 380, 120])
        rotate([110, 0, 0]) {
            cylinder_main();
        }
    }
}

module mitte () {
    for ( i = [0 : 10] ){
        rotate( i * 32, [0, 0, 1])
        translate([0, 400, 0])
        rotate([90, 0, 0]) {
            cylinder_main();
        }
    }
}


module staebe() {
    translate([0, 0, 400])
        cylinder_main();
    second_oben();
    first_oben();

    
    
    mitte();
    mirror([0,0,1]) 
        first_oben();

    mirror([0,0,1]) 
        second_oben();
}


module ganzekugel() {
        difference() {   
                sphere(200,center = true);
                 staebe();
        }
}

module splitcube_bottom() {
translate([0, 0, -600])
  cube(1000,true);
}

module splitcube_top() {
translate([0, 0, 400])
      cube([2000,1000,1000],true);
}

module oben() {
    difference() { 
        ganzekugel();
        splitcube_bottom(); sphere(130,center = true);
    }
}

module unten() {
    difference() { 
        translate([600, 0, 0])
            ganzekugel(); 
        
        splitcube_top();  
        
        translate([600, 0, 0])
            sphere(130,center = true);
        
        translate([600, 0, 0])
            cylinder(h=400, r=60, center=true);
        
        }
           
    }

module druck() {
translate([0, 0, 100])
oben();

mirror([0,0,1]) 
    translate([0, 0, 100])
    unten();
//

}

module demo() {
    staebe();
        difference() { 
            sphere(200,center = true);
            translate([0, 0, -150])    
                cylinder(h=100, r=60, center=true);
        }
    }

//druck();
demo();


