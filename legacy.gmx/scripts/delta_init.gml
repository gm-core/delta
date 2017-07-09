/// @desc Initializes the delta timing. Change the enum config to your needs. Run this before any DeltaObject is instantiated.

/*
 * Configuration:
 *   MaxLagCompensation - The largest factor to multiply speeds by based on lag
 */
enum GMCoreDeltaConfig {
    MaxLagCompensation = 3
}

global.__delta_expectedDeltaTime = room_speed / 1000000;
global.__delta_stepFactor = 1;
global.__delta_fps = room_speed;
