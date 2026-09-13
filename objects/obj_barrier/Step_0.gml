var was_open = is_open;
is_open = false;

with (obj_pressure_plate) {
    if (channel_id == other.channel_id && is_pressed) {
        other.is_open = true;
    }
}

var just_closed = was_open && !is_open;

sprite_index = is_open ? -1 : spr_barrier_placeholder;

if (just_closed) {
    var trapped_player = instance_place(x, y, obj_player);

    if (trapped_player != noone) {
        var barrier_center_x = (bbox_left + bbox_right) / 2;
        var player_center_x = (
            trapped_player.bbox_left
            + trapped_player.bbox_right
        ) / 2;

        pushed_player = trapped_player;
        push_direction = player_center_x < barrier_center_x ? -1 : 1;

    }
}

if (instance_exists(pushed_player)){
    if (place_meeting(x, y, pushed_player)) {
        pushed_player.x += push_direction * push_speed;
    } else {
        pushed_player = noone;
        push_direction = 0;
    }
} else {
    pushed_player = noone;
    push_direction = 0;
}