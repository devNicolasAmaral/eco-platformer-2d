array_push(current_recording, {
    x: obj_player.x,
    y: obj_player.y
});

if (cycle_steps_remaining <= 0) {
    if (array_length(echo_instances) < max_echoes) {
        array_push(completed_recordings, current_recording);

        var new_echo = instance_create_layer(
            obj_player.spawn_x,
            obj_player.spawn_y,
            "Instances",
            obj_echo
        );

        new_echo.recording = current_recording;
        array_push(echo_instances, new_echo);

        with (obj_echo) {
            playback_index = 0;
        }
    } else {
        with (obj_echo) {
            instance_destroy();
        }

        completed_recordings = [];
        echo_instances = [];
    }

    current_recording = [];

    with (obj_player) {
        x = spawn_x;
        y = spawn_y;
        vertical_speed = 0;

        visual_scale_x = 1;
        visual_scale_y = 1;
        facing_index = 0;
    }

    cycle_steps_remaining = cycle_duration_steps;
}
