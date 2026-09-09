var horizontal_input = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var horizontal_movement =  horizontal_input * move_speed;

// Movimentação horizontal

if (place_meeting(x + horizontal_movement, y, obj_solid)) {
	while( !place_meeting(x + sign(horizontal_movement), y, obj_solid)) {
		x += sign(horizontal_movement);
	}

	horizontal_movement = 0;
}

x += horizontal_movement;


// Movimentação vertical

vertical_speed = min(vertical_speed + gravity_force, max_fall_speed);

var is_grounded = place_meeting(x, y + 1, obj_solid);

if (keyboard_check_pressed(ord("W")) && is_grounded) {
	vertical_speed = jump_speed;
}


if (place_meeting(x, y + vertical_speed, obj_solid)) {
	while (!place_meeting(x, y + sign(vertical_speed), obj_solid)) {
		y += sign(vertical_speed);
	}

	vertical_speed = 0;
}

y += vertical_speed;
