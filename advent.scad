// A3 is 297 mm x 420 mm
$fn=50;

//24h print time for trays
//21.5h print time for mounts
// not much time saving over supported structures

/* internal tray sections
intersection() {
    calendar();
    translate([20,20,3]) cube([162,200,30]);
}

intersection() {
    calendar();
    translate([20+162,20,3]) cube([162,200,30]);
}

intersection() {
    calendar();
    translate([20,20+200,3]) cube([162,190,30]);
}

intersection() {
    calendar();
    translate([20+162,20+200,3]) cube([162,190,30]);
}
*/


/* //edge mount pieces
rotate([0,-90,0]) intersection() {
    calendar_mount();
    cube([300/2,427/2, 50]);
}

translate([60,0,-300/2])
rotate([0,-90,0]) intersection() {
    calendar_mount();
    translate([300/2,0,0]) cube([300/2,427/2, 50]);
}

translate([120,-427/2,0])
rotate([0,-90,0])
intersection() {
    calendar_mount();
    translate([0,427/2,0]) cube([300/2,427/2, 50]);
}
*/
translate([180,-427/2,-300/2])
rotate([0,-90,0])
intersection() {
    calendar_mount();
    translate([300/2,427/2,0]) cube([300/2,427/2, 50]);
}


// abs grid offset from a3 is:
// 25-3,24-3.5 = [22,20.5]

module calendar() {
    difference() {
        cube([297+3,421+6, 30]);
        // slot for paper
        translate([3,3,26]) cube([300, 421, 2]);
        // front
        translate([10,10,26]) cube([297+10, 421+6-20, 10]);
        
        // compartments
        translate([25,24,0]) advent_grid() {
            translate([0,0,5]) compartment();
        }
    }
}

module calendar_mount() {
    difference() {
        calendar();
        translate([20,20,3]) cube([162*2,200+190,30]);
    }
}

module advent_grid() {
    for(y = [0 : 1 : 4]) {
        for(x = [0 : 1 : 4]) {
            translate([x*55, y*80]) children();
        }
    }
}

module compartment(x=40,y=60,h=60,cr=5) {
    translate([cr,cr,cr])
    minkowski() {
        cube([x-cr*2,y-cr*2,h-cr*2]);
        sphere(r=cr);
    }
}
