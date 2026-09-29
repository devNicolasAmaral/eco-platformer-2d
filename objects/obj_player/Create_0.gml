spawn_x = x;
spawn_y = y;

move_speed = 2;
vertical_speed = 0;
gravity_force = 0.25;
max_fall_speed = 6;
jump_speed = -4.5;

mask_index = msk_ester;
facing_direction = 1;

visual_scale_x = 1;
visual_scale_y = 1;
stretch_return_speed = 0.15;

ceiling_impact_allowed = false;
ceiling_impact_duration = 6;
ceiling_impact_timer = 0;

minimum_jump_clearance = 12;

dust_system = part_system_create_layer("Effects", false);

// Configurações do cabelo

outline_color = make_colour_hsv(229, 135, 74);
hair_color = make_color_hsv(164, 46, 163);

hair_node_count = 5;
hair_node_distance = 2;
hair_node_max_distance = 2;
hair_node_approach = 7;

hair_offset_x_right = -6;
hair_offset_x_left = 4;
hair_offset_y = -27;

hair_run_offset_x = [2, 2, 2, 2, 2, 2];
hair_jump_offset_x = [0, -1];

hair_idle_offset_y = [0, 1, 0, 1];
hair_run_offset_y = [3, 2, 2, 3, 2, 2];

// --- Inicialização dos Nós do Cabelo ---
hair_nodes = [];

for (var i = 0; i < hair_node_count; i++) {
    array_push(hair_nodes, {
        position_x: x,
        position_y: y + hair_offset_y + i * hair_node_distance,
        velocity_x: 0,
        velocity_y: 0
    });
}

hair_root_pixels = [
    { x: 0, y: 0 }
];