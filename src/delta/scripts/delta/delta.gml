/// @desc Initializes the delta timing. Change the enum config to your needs. Run this before any DeltaObject is instantiated.
function delta_init() {
	global.__delta_expectedDeltaTime = game_get_speed(gamespeed_fps) / 1000000;
	global.__delta_stepFactor = 1;
	global.__delta_fps = game_get_speed(gamespeed_fps);
	global.__delta_maxLagCompensation = 3;
}


/// @desc Sets the maximum lag compensation multiplier
/// @param {Real} maxLagCompensation  The maximum amount to multiple values by to compensate for lag. Higher values may cause problems during lag spikes.
function delta_set_max_lag_compensation(maxLagCompensation) {
	global.__delta_maxLagCompensation = maxLagCompensation
}


/// @desc Force the delta value. Useful for pausing or hitstuns
/// @param forcedDelta
function delta_override(argument0) {
	gml_pragma("forceinline");
	global.__delta_stepFactor = argument0;
}


/// @desc Update the delta timer. Run this in a Begin Step event on a controller object
/// You only need to call this once per step
function delta_step() {
	global.__delta_stepFactor = min((global.__delta_expectedDeltaTime * delta_time), global.__delta_maxLagCompensation);
}


/// @desc Returns the given value multiplied by the step delta
/// Use this to modify any game time related value, like speed, timers, or animation speeds
function d(argument0) {
	return argument0 * global.__delta_stepFactor;
}


/// @desc Returns the given number of seconds in expected steps
/// @param seconds
function seconds(argument0) {
	return global.__delta_fps * argument0;
}
