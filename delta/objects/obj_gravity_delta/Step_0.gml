if (!place_meeting(x, y + 1, obj_ground)) {
    d_gravity = .1;
} else {
    d_gravity = 0;
}

if (keyboard_check_pressed(ord("Z"))) {
    direction = 90;
    d_speed = 10;
}