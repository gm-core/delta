draw_text(0, 0, "Steps per second: " + string(game_get_speed(gamespeed_fps)));
draw_text(0, 20, "Actual FPS: " + string(fps_real));
draw_text(0, 40, "Ball speed (Actual): " + string(obj_ball.speed));
draw_text(0, 60, "Ball speed (Delta Managed): " + string(obj_ball.d_speed));
draw_text(0, 80, "Max lag compensation set to " + string(global.__delta_maxLagCompensation) + "x");
draw_text(0, 100, "Ball takes 1 second to loop");
draw_text(0, 120, "Use arrows to change gamespeed");
draw_text(0, 140, "The ball will adjust its speed");
draw_text(0, 160, "to keep its pace");
