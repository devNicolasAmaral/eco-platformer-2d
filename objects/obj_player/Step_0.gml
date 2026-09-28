var horizontal_input = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var horizontal_movement = horizontal_input * move_speed;

visual_scale_x = lerp(visual_scale_x, 1, stretch_return_speed);
visual_scale_y = lerp(visual_scale_y, 1, stretch_return_speed);

if (ceiling_impact_timer > 0) {
    ceiling_impact_timer -= 1;
}


// Movimentação horizontal
if (horizontal_movement != 0
    && place_meeting(x + horizontal_movement, y, obj_solid)
) {
    while (!place_meeting(
        x + sign(horizontal_movement),
        y,
        obj_solid
    )) {
        x += sign(horizontal_movement);
    }

    horizontal_movement = 0;
}

x += horizontal_movement;


// Movimentação vertical e pulo
vertical_speed = min(vertical_speed + gravity_force, max_fall_speed);

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
        bbox_top - 1,
        obj_solid,
        false,
        true
    ) != noone;

    ceiling_impact_allowed = !ceiling_close;

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

if (vertical_speed != 0
    && place_meeting(x, y + vertical_speed, obj_solid)
) {
    if (vertical_speed < 0 && ceiling_impact_allowed) {
        ceiling_impact_timer = ceiling_impact_duration;
    }

    while (!place_meeting(
        x,
        y + sign(vertical_speed),
        obj_solid
    )) {
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


// Impacto com o chão
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

    if (vertical_speed < 0 || ceiling_impact_timer > 0) {
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

// Nós

var hair_offset_x = hair_offset_x_right;
var hair_animation_offset_x = 0;
var hair_animation_offset_y = 0;
var hair_frame = floor(image_index);

if (facing_direction == -1) {
    hair_offset_x = hair_offset_x_left;
}

if (sprite_index == spr_ester_idle) {
    hair_animation_offset_y = hair_idle_offset_y[hair_frame];
} else if (sprite_index == spr_ester_run) {
    hair_animation_offset_x = hair_run_offset_x[hair_frame];
    hair_animation_offset_y = hair_run_offset_y[hair_frame];
} else if (sprite_index == spr_ester_jump) {
    hair_animation_offset_x = hair_jump_offset_x[hair_frame];
}

var target_root_x = x + (hair_offset_x + facing_direction * hair_animation_offset_x) * visual_scale_x;
var target_root_y = y + (hair_offset_y + hair_animation_offset_y) * visual_scale_y;

hair_nodes[0].position_x = x + (hair_offset_x + facing_direction * hair_animation_offset_x) * visual_scale_x;
hair_nodes[0].position_y = y + (hair_offset_y + hair_animation_offset_y) * visual_scale_y;

for (var i = 1; i < hair_node_count; i++) {
    var previous_node = hair_nodes[i - 1];
    var current_node = hair_nodes[i];
    
    var target_x = previous_node.position_x;
    var target_y = previous_node.position_y + hair_node_distance * visual_scale_y;

    var distance_to_target = point_distance(
        current_node.position_x,
        current_node.position_y,
        target_x,
        target_y
    );

    if (distance_to_target > 0) {
        var direction_to_target = point_direction(
            current_node.position_x,
            current_node.position_y,
            target_x,
            target_y
        );

        var hair_speed_factor = 0.02; 
        
        var movement_step = min(
            hair_node_approach * hair_speed_factor,
            distance_to_target
        );

        current_node.velocity_x = lengthdir_x(
            hair_node_approach,
            direction_to_target
        );

        current_node.velocity_y = lengthdir_y(
            hair_node_approach,
            direction_to_target
        );

        current_node.position_x += lengthdir_x(
            movement_step,
            direction_to_target
        );

        current_node.position_y += lengthdir_y(
            movement_step,
            direction_to_target
        );
    }

    var current_distance = point_distance(
        previous_node.position_x,
        previous_node.position_y,
        current_node.position_x,
        current_node.position_y
    );

    if (current_distance > hair_node_max_distance) {
        var constraint_direction = point_direction(
            previous_node.position_x,
            previous_node.position_y,
            current_node.position_x,
            current_node.position_y
        );

        current_node.position_x = previous_node.position_x
            + lengthdir_x(
                hair_node_max_distance,
                constraint_direction
            );

        current_node.position_y = previous_node.position_y
            + lengthdir_y(
                hair_node_max_distance,
                constraint_direction
            );
    }
}