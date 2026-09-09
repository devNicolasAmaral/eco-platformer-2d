var seconds_remaining = ceil(cycle_steps_remaining / game_get_speed(gamespeed_fps));

draw_set_font(fnt_debug);
draw_set_color(c_white);
draw_text(5, 1, "Tempo: " + string(seconds_remaining));