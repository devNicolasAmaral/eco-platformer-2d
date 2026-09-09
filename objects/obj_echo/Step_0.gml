if (playback_index < array_length(recording)) {
    var frame_state = recording[playback_index];

    x = frame_state.x;
    y = frame_state.y;

    playback_index += 1;
}