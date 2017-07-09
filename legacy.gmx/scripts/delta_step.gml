/// @desc Update the delta timer. Run this in a Begin Step event on a controller object
/// You only need to call this once per step
global.__delta_stepFactor = min((global.__delta_expectedDeltaTime * delta_time), GMCoreDeltaConfig.MaxLagCompensation);
