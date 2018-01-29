// arnsteio, 2018

/* [Global] */ 
// Size of your finger 
fingerDiameter = 22; 
// Size of the ring band you wish 
ringBandWidth = 2;
 

/* [Hidden] */
logoVerticalHeight=20;

// resize([width,0,0] 
module ring_face(width)
	{
	difference()
        {
        scale([1,1,0.2]) surface(file = "CarpentryAtUio.png", center = false, invert = true);
        translate([0, 0, -39])cube([400, 400, 20]); // flytte enda lenger ned? -34?
        }
    }


module ring_band(diameter, bandwidth)
	{
	rotate_extrude() translate([diameter/2, 0, 0]) scale([0.5,1,1]) circle(r = bandwidth, $fn = 100);
	}


module build()
	{
	ring_band(fingerDiameter, ringBandWidth);
	translate([-fingerDiameter/2, -fingerDiameter/2-ringBandWidth+ringBandWidth/4-1.5,-logoVerticalHeight/2]) rotate([90,0,0]) resize([fingerDiameter,0,0], auto=true) ring_face(fingerDiameter);
	}

// test
// ring_face(fingerDiameter);
rotate([90,0,0]) build();
