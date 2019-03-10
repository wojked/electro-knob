fudge = 0.1;

HEIGHT = 31.20;
OUTSIDE_HEIGHT = 6.20;
OUTSIDE_RADIUS = 9.72/2;
SCALE = 3.58;

knob(OUTSIDE_HEIGHT, true);

//translate([10,0, 0])
//insert(OUTSIDE_HEIGHT);

module knob(height, with_outside)
{
    union(){
        difference(){
            cylinder(height, OUTSIDE_RADIUS, OUTSIDE_RADIUS, true);
            insert(height*2);
        }
        if (with_outside){
            translate([0,0,OUTSIDE_HEIGHT])
            handle(height);
        }
    }
    
    
}

module handle(height) {
    cylinder_radius = 28/2;
    cylinder_height = 6;
    cube_depth = 18;
    cube_height = 10;
    cube_widht=37;
    union(){
        cylinder(cylinder_height, cylinder_radius, cylinder_radius, true);    
        translate([0,cube_widht/2 - cylinder_radius, cylinder_height/2 + cube_depth/2])
        holder(cube_height,cube_widht,cube_depth);
    }
}

module holder(cube_height,cube_widht,cube_depth) {
    difference(){
        cube([cube_height,cube_widht,cube_depth],true);        
        translate([0,-23,0])
        rotate([70,0,0])
        cube([cube_height,cube_widht*2,cube_depth], true);        
    }
//    rotate([60,0,0])
//    cube([cube_height,cube_widht,cube_depth], true);
}

module insert(height){
    scale([SCALE, SCALE, 1])
    translate([0,0,-height/2])
    poly_path3805(height);
}

module poly_path3805(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[2.574961,-2.775765],[-2.574963,-2.775765],[-2.574963,0.720515],[-0.556749,2.775765],[2.574963,2.775765]]);
  }
}