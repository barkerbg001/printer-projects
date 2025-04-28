// Pyramid with Beveled Brick Layers

// Settings
base_size = 40;       // Base size (bottom)
brick_height = 3;     // Fixed height per brick
num_bricks = 10;      // Number of brick layers
bevel_size = 0.5;     // How much each layer shrinks (creates bevel effect)

height = num_bricks * brick_height; // Total height

// A single brick layer
module brick_layer(size, z) {
    translate([0, 0, z])
        linear_extrude(height=brick_height, scale=(size - bevel_size) / size)
            square([size, size], center=true);
}

// The whole pyramid
module pyramid_with_bevels() {
    for (i = [0:num_bricks-1]) {
        s = base_size - (i * (base_size / num_bricks)); // Shrink at each layer
        brick_layer(s, i * brick_height);
    }
}

pyramid_with_bevels();
