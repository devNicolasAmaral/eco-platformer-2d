base_width = 320;
base_height = 180;

display_set_gui_size(base_width, base_height);

window_scale = 3;

window_set_size(
    base_width * window_scale,
    base_height * window_scale
);

window_center();

gpu_set_texfilter(false);
