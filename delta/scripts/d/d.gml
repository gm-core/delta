/// @desc Returns the given value multiplied by the step delta
/// Use this to modify any game time related value, like speed, timers, or animation speeds
gml_pragma("forceinline");
return argument0 * global.__delta_stepFactor;