 if (surface_exists(application_surface)) {
    if (
        surface_get_width(application_surface) != base_width
        || surface_get_height(application_surface) != base_height
    ) {
        surface_resize(application_surface, base_width, base_height);
    }
 }