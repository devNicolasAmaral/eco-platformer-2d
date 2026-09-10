is_pressed = place_meeting(x, y, obj_player)
    || place_meeting(x, y, obj_echo);

image_alpha = is_pressed ? 0.5 : 1;