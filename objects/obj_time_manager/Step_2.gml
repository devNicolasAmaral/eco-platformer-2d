array_push(current_recording, {
    x: obj_player.x,
    y: obj_player.y
});

if (cycle_steps_remaining <= 0) {
    array_push(completed_recordings, current_recording);

    var new_echo = instance_create_layer(
        obj_player.spawn_x,
        obj_player.spawn_y,
        "Instances",
        obj_echo
    );

    new_echo.recording = current_recording;
    current_recording = [];

    with (obj_echo) {
        playback_index = 0;
    }

    with (obj_player) {
        x = spawn_x;
        y = spawn_y;
        vertical_speed = 0;
    }

    cycle_steps_remaining = cycle_duration_steps;
}