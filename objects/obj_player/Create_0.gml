spawn_x = x;
spawn_y = y;

move_speed = 2;
vertical_speed = 0;
gravity_force = .25;
max_fall_speed = 6;
jump_speed = -4.5;
mask_index = msk_ester;

facing_direction = 1;

visual_scale_x = 1;
visual_scale_y = 1;

ceiling_impact_allowed = false;
ceiling_impact_duration = 5;
ceiling_impact_timer= 0;

stretch_return_speed = 0.15;

dust_system = part_system_create_layer("Effects", false);

minimum_jump_clearance = 12;
