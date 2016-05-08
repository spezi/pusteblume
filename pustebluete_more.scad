$fn=64;

//Anzahl der Stäbe alt: 1 5 7 11 7 5 = 36
//Anzahl der Stäbe: 1 6 8 12 8 6 = 41 = 1,23A

module cylinder_main () {
        cylinder(h=400, r=6, center=true);
    }


module second_oben() {
    for ( i = [0 : 5] ){
        rotate( i * 60, [0, 0, 1])
        translate([0, 140, 200])
        rotate([150, 0, 0]) {
            cylinder_main();
        }
    }
}

module first_oben() {
    for ( i = [0 : 7] ){
        rotate( i * 45, [0, 0, 1])
        translate([0, 200, 120])
        rotate([130, 0, 0]) {
            cylinder_main();
        }
    }
}

module mitte () {
    for ( i = [0 : 11] ){
        rotate( i * 30, [0, 0, 1])
        translate([0, 240, 0])
        rotate([90, 0, 0]) {
            cylinder_main();
        }
    }
}


module staebe() {
    translate([0, 0, 250])
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
                sphere(100,center = true);
                 staebe();
        }
}

module splitcube_bottom() {
translate([0, 0, -550])
  cube(1000,true);
}

module splitcube_top() {
translate([0, 0, 450])
      cube([2000,1000,1000],true);
}

module oben() {
    difference() { 
        ganzekugel();
        splitcube_bottom(); sphere(60,center = true);
    }
}

module unten() {
    difference() { 
        translate([600, 0, 0])
            ganzekugel(); 
        
        splitcube_top();  
        
        //translate([600, 0, 0])
            //sphere(130,center = true);
        
        translate([600, 0, 0])
            cylinder(h=400, r=30, center=true);
        
        }
           
    }

module druck() {
translate([0, 0, 50])
oben();

mirror([0,0,1]) 
    translate([0, 0, 50])
    unten();
//

}

module demo() {
    staebe();
        difference() { 
            sphere(100,center = true);
            translate([0, 0, -70])    
                cylinder(h=100, r=30, center=true);
        }
    }

//druck();
demo();



