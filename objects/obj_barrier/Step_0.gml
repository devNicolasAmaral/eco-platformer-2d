is_open = false;

with (obj_pressure_plate) {
    if (channel_id == other.channel_id && is_pressed) {
        other.is_open = true;
    }
}

sprite_index = is_open ? -1 : spr_barrier_placeholder