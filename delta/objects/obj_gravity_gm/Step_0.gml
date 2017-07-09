if (!place_meeting(x, y + 1, obj_ground)) {
    gravity = .1;
} else {
    gravity = 0;
}

if (keyboard_check_pressed(ord("Z"))) {
    vspeed = -10;
}