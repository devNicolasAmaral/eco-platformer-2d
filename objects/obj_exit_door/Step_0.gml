is_open = false;

with (obj_pressure_plate) {
    if (channel_id == other.channel_id && is_pressed) {
        other.is_open = true
    }
}

image_blend = is_open ? c_lime : c_red;

if (
    is_open
    && place_meeting(x, y, obj_player)
    && keyboard_check_pressed(ord("E"))
) {
    room_goto_next();
}