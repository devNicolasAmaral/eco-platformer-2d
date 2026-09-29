var seconds_remaining = ceil(cycle_steps_remaining / game_get_speed(gamespeed_fps));

draw_set_font(fnt_debug);
draw_set_color(c_white);
draw_set_alpha(0.5);
draw_text(22, 6, "Tempo: " + string(seconds_remaining));

draw_text(22, 15, "Frames: " + string(array_length(current_recording)));
draw_text(22, 24, "Ciclos: " + string(array_length(completed_recordings)));
draw_set_alpha(1);