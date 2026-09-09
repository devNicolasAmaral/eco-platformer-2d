if (cycle_steps_remaining <= 0) {
	with (obj_player) {
		x = spawn_x;
		y = spawn_y;
		vertical_speed = 0;
	}

	cycle_steps_remaining = cycle_duration_steps;
}