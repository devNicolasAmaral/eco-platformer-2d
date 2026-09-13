var seconds_remaining = ceil(cycle_steps_remaining / game_get_speed(gamespeed_fps));

draw_set_font(fnt_debug);
draw_set_color(c_white);
draw_text(5, 1, "Tempo: " + string(seconds_remaining));

draw_text(5, 10, "Frames: " + string(array_length(current_recording)));
draw_text(5, 19, "Ciclos: " + string(array_length(completed_recordings)));
