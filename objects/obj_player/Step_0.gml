var horizontal_input = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var horizontal_movement =  horizontal_input * move_speed;

visual_scale_x = lerp(visual_scale_x, 1, stretch_return_speed);
visual_scale_y = lerp(visual_scale_y, 1, stretch_return_speed);

// Movimentação horizontal

if (place_meeting(x + horizontal_movement, y, obj_solid)) {
	while( !place_meeting(x + sign(horizontal_movement), y, obj_solid)) {
		x += sign(horizontal_movement);
	}

	horizontal_movement = 0;
}

x += horizontal_movement;


// Movimentação vertical

vertical_speed = min(
	vertical_speed + gravity_force,
	max_fall_speed
);

var is_grounded = place_meeting(x, y + 1, obj_solid);
var was_grounded = is_grounded;

var jump_has_clearance = collision_rectangle(
	bbox_left,
	bbox_top - minimum_jump_clearance,
	bbox_right,
	bbox_top - 1,
	obj_solid,
	false,
	true
) == noone;


if (keyboard_check_pressed(ord("W"))
&& is_grounded
&& jump_has_clearance
) {
	vertical_speed = jump_speed;
	mask_index = msk_ester_jump;

	var ceiling_close = collision_rectangle(
		bbox_left,
		bbox_top - 18,
		bbox_right,
		bbox_top -1,
		obj_solid,
		false,
		true
	) != noone;

	if (ceiling_close) {
		visual_scale_x = 1;
		visual_scale_y = 1;
	} else {
		visual_scale_x = 0.6;
		visual_scale_y = 1.4;
	}

	part_particles_burst(dust_system, x, y, ps_dust);
}

var impact_speed = vertical_speed;

if (place_meeting(x, y + vertical_speed, obj_solid)) {
	while (!place_meeting(x, y + sign(vertical_speed), obj_solid)) {
		y += sign(vertical_speed);
	}

	vertical_speed = 0;
}

y += vertical_speed;

is_grounded = place_meeting(x, y + 1, obj_solid);

if (is_grounded) {
	mask_index = msk_ester;
} else {
	mask_index = msk_ester_jump;
}

if (!was_grounded && is_grounded) {
	var normalized_impact = clamp(
		impact_speed / max_fall_speed,
		0,
		1
	);

	var impact_ratio = power(normalized_impact, 3);

	visual_scale_x = lerp(1, 1.6, impact_ratio);
	visual_scale_y = lerp(1, 0.4, impact_ratio);

	if (impact_speed >= max_fall_speed * 0.5) {
		repeat (2) {
			part_particles_burst(dust_system, x, y, ps_dust);
		}
	}
}

// Controle de animação

if (!is_grounded) {
	sprite_index = spr_ester_jump;
	if (vertical_speed < 0) {
		image_index = 0;
	} else {
		image_index = 1;
	}
} else if (horizontal_input != 0) {
	sprite_index = spr_ester_run;
} else {
	sprite_index = spr_ester_idle;
}

if (horizontal_input != 0) {
	facing_direction = sign(horizontal_input);
}
