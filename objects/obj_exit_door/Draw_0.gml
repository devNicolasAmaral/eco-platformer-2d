draw_self();

if(is_open && place_meeting(x, y, obj_player)) {
    draw_set_font(fnt_debug);
    draw_set_halign(fa_center);
    draw_set_color(c_white);

    draw_text(x + sprite_width / 2, y - 12, "E");

    draw_set_halign(fa_left);
}