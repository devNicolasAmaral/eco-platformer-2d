cycle_duration_seconds = 10;
cycle_duration_steps = cycle_duration_seconds * game_get_speed(gamespeed_fps);
cycle_steps_remaining = cycle_duration_steps;

current_recording = [];
completed_recordings = [];
max_echoes = 1;
echo_instances = [];