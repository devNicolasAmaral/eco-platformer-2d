var horizontal_input = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var horizontal_movement =  horizontal_input * move_speed;

if (place_meeting(x + horizontal_movement, y, obj_solid)) {
	while( !place_meeting(x + sign(horizontal_movement), y, obj_solid)) {
		x += sign(horizontal_movement);
	}

	horizontal_movement = 0;
}

x += horizontal_movement;
