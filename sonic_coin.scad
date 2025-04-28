// === Settings ===
coin_radius = 80;                // 60mm diameter (30mm radius)
coin_thickness = 5;              // 5mm thick coin
engrave_depth = 2;               // 2mm deep engraving
$fn = 200;                       // Smooth smooth smooth circle
svg_scale = 0.5;                 // Adjust this if needed to fit the coin

// === Coin with Engraving ===
difference() {
    // 1. Base Coin
    cylinder(r=coin_radius, h=coin_thickness, center=false);

    // 2. Engraved SVG
    translate([0, 0, coin_thickness - engrave_depth]) {
        linear_extrude(height=engrave_depth)
            import("sonic_coin.svg", center=true, scale=svg_scale);
    }
}

// === Optional: Rim on top ===
// Uncomment this block if you want a little rim for decoration
/*
translate([0, 0, coin_thickness])
    cylinder(r=coin_radius, h=0.5, $fn=$fn);
*/
