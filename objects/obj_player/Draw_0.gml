// Outline

var max_radius = 2;
var min_radius = 1;
var total_nodes = array_length(hair_nodes);

var offsets_x = [0, 0, -1, 1];
var offsets_y = [-1, 1, 0, 0];

draw_set_color(outline_color);
draw_set_alpha(1);

for (var o = 0; o < 4; o++) {
    var ox = offsets_x[o];
    var oy = offsets_y[o];

    for (var i = 0; i < total_nodes; i++) {
        var current_radius = lerp(max_radius, min_radius, i / (total_nodes - 1));

        draw_circle(
            hair_nodes[i].position_x + ox,
            hair_nodes[i].position_y + oy,
            current_radius,
            false
        );
    }

var root_pixels = hair_root_pixels;

    for (var i = 0; i < array_length(root_pixels); i++) {
        draw_point(
            hair_nodes[0].position_x + root_pixels[i].x + ox,
            hair_nodes[0].position_y + root_pixels[i].y + oy
        );
    }
}


// Nós

draw_set_color(hair_color);

for (var i = 0; i < total_nodes; i++) {
    var current_radius = lerp(max_radius, min_radius, i / (total_nodes - 1));

    draw_circle(
        hair_nodes[i].position_x,
        hair_nodes[i].position_y,
        current_radius,
        false
    );
}

var root_pixels = hair_root_pixels;

for (var i = 0; i < array_length(root_pixels); i++) {
    draw_point(
        hair_nodes[0].position_x + root_pixels[i].x, 
        hair_nodes[0].position_y + root_pixels[i].y
    );
}


// Ester

draw_set_color(c_white);

draw_sprite_ext(
    sprite_index,
    image_index,
    x,
    y,
    facing_direction * visual_scale_x,
    visual_scale_y,
    image_angle,
    image_blend,
    image_alpha
);
