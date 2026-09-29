if (playback_index > 0) {
    var current_frame = playback_index - 1;
    var frame_state = recording[current_frame];
    var recorded_hair = frame_state.hair;
    var total_nodes = array_length(recorded_hair);

    var max_radius = 2;
    var min_radius = 1;

    draw_set_alpha(image_alpha);

    draw_set_color(obj_player.outline_color);
    
    var offsets_x = [0, 0, -1, 1];
    var offsets_y = [-1, 1, 0, 0];

    for (var o = 0; o < 4; o++) {
        var ox = offsets_x[o];
        var oy = offsets_y[o];

        for (var i = 0; i < total_nodes; i++) {
            var current_radius = lerp(max_radius, min_radius, i / (total_nodes - 1));
            draw_circle(recorded_hair[i].x + ox, recorded_hair[i].y + oy, current_radius, false);
        }
        
        draw_point(recorded_hair[0].x + ox, recorded_hair[0].y + oy);
    }

    draw_set_color(obj_player.hair_color);

    for (var i = 0; i < total_nodes; i++) {
        var current_radius = lerp(max_radius, min_radius, i / (total_nodes - 1));
        draw_circle(recorded_hair[i].x, recorded_hair[i].y, current_radius, false);
    }
    
    draw_point(recorded_hair[0].x, recorded_hair[0].y);

    draw_set_alpha(1.0);
    draw_set_color(c_white);
}

draw_self();