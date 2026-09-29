if (playback_index < array_length(recording)) {
    var frame_state = recording[playback_index];

    x = frame_state.x;
    y = frame_state.y;

    sprite_index = frame_state.sprite;
    image_index = frame_state.frame;
    
    image_xscale = frame_state.dir * frame_state.scale_x;
    image_yscale = frame_state.scale_y;

    playback_index += 1;
}