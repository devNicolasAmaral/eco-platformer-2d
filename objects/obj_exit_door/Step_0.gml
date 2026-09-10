is_open = obj_pressure_plate.is_pressed;

image_blend = is_open ? c_lime : c_red;

if (
    is_open
    && place_meeting(x, y, obj_player)
    && keyboard_check_pressed(ord("E"))
) {
    room_goto_next();
}