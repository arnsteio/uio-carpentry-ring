// arnsteio, 2018

/* [Global] */ 
// Size of your finger 
fingerDiameter = 22; //Try 22 if you're unsure
// Size of the ring band you wish 
ringBandWidth = 3;
 

/* [Hidden] */
logoVerticalHeight=22;
$fn=150;

// resize([width,0,0] 
module ring_face(width)
	{
	difference()
        {
        scale([1,1,0.2]) surface(file = "CarpentryAtUio.png", center = false, invert = true);
        translate([0, 0, -39])cube([400, 400, 20]);
        }
    }


module ring_band(diameter, bandwidth)
	{
	rotate_extrude() translate([diameter/2, 0, 0]) scale([0.33,1,1]) circle(r = bandwidth);
	}


module build()
	{
	difference()
        {
            ring_band(fingerDiameter, ringBandWidth);
            translate([0,-10-fingerDiameter/2+ringBandWidth/2, 0]) cube([20, 20, 20], center=true);
        }
        translate([-fingerDiameter/2, -fingerDiameter/2-ringBandWidth+ringBandWidth/4, -logoVerticalHeight/2]) rotate([90,0,0]) resize([fingerDiameter,0,0], auto=true) ring_face(fingerDiameter);
	}

// test
// ring_face(fingerDiameter);
rotate([90,0,0]) build();
