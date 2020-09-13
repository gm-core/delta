// Break down speed into a vector
var spd_hvec = lengthdir_x(d_speed, direction);
var spd_vvec = lengthdir_y(d_speed, direction);

// If hspeed or vspeed changed, update accordingly
if (d_hspeed != __d_hspeed_last || d_vspeed != __d_vspeed_last) {
    spd_hvec = d_hspeed;
    spd_vvec = d_vspeed;
}

// Apply gravity
if (d_gravity != 0) {
    var grav_hvec = lengthdir_x(d(d_gravity), gravity_direction);
    var grav_vvec = lengthdir_y(d(d_gravity), gravity_direction);
    spd_hvec += grav_hvec;
    spd_vvec += grav_vvec;
}

// Recombine speed and direction
direction = point_direction(0, 0, spd_hvec, spd_vvec);
d_speed = point_distance(0, 0, spd_hvec, spd_vvec);
d_hspeed = spd_hvec;
d_vspeed = spd_vvec;
__d_hspeed_last = spd_hvec;
__d_vspeed_last = spd_vvec;

// Apply friction
if (d_friction != 0) {
    if (d_speed > 0) {
        d_speed = max(0, d_speed - d(d_friction));
    } else if (d_speed < 0) {
        d_speed = min(d_speed + d(d_friction), 0);
    }
}

// Apply properties
var __d_stepFactor = d(1);
speed = __d_stepFactor * d_speed;
image_speed = __d_stepFactor * d_image_speed;

// Tick alarms
for (var i = 0; i < 12; i++) {
    if (d_alarm[i] > 0) {
        d_alarm[i] -= __d_stepFactor;
        if (d_alarm[i] <= 0) {
            d_alarm[i] = 0;
            event_perform(ev_alarm, i);
        }
    }
}