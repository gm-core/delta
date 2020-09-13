# Delta

Lightweight delta timing solution for GameMaker: Studio and GameMaker: Studio 2

## Usage

To use Delta, download [the latest .yymps release](https://github.com/gm-core/delta/releases), and import the local package to your project. For detailed instructions, see [this guide](https://gmcore.io/installing.html#guide).

## Delta Timing

Delta timing is a method of manipulating game components based on real time rather than steps. In GameMaker, when a user is unable to run your game at the desired step speed, it will run visibly laggy. Delta timing helps to fix this, by scaling movement, alarms and everything else based on how long it actually has been since the last frame.

This resource provides tools to make delta timing nearly trivial in GameMaker.

## Scripts

Delta exposes a small number of scripts to help with timing:

### `delta_init()`

Initializes the delta timing. Call this as early as possible in your game, before anything requires delta timing. You can also find configuration values in the definition of this script.

### `delta_step()`

Call this script on the `begin step` event of a game controller - likely a persistent object that is in every room of the game. This updates the delta timing for use in other scripts.

### `d(number)`

The bread and butter of Delta. Returns the given number modified for the delta timing.

This works by multiplying the provided number by the current "step factor", a number representing how many "frames" have passed in actuality. For example, if your game is running at half the speed it should be, the factor would be `2`, since things need to move twice as fast to appear normal.

Usage examples:

```gml

// Keep speed smooth between frame slowdown
speed = d(movespeed);

// Keep the animation running smoothly
image_speed = d(1);

// Tick down a timer in real-time instead of frame count
someTimer -= d(1);
```

### `seconds(number)`

A utility function to return the given number in frames that would constitute that many seconds. Useful for setting timers in real seconds. This function uses your current game speed to determine the result.

### `delta_set_max_lag_compensation(maxLagMultiplier)`

Sets the maximum multiplier for Delta to compensate for lag with. Default is 3. Setting this to a higher number will handle larger lag spikes, but may cause erratic behavior.

## DeltaObject

Delta exposes an object parent which automates delta timing for most usages: movement, gravity, friction and alarms, even integrating natively with alarm events!

Import the `DeltaObject` to your game, then for any object which requires delta timing, set `DeltaObject` as the parent.

When using `DeltaObject`, you will need to use `event_inheried()` on the following events (if the child object has its own version of these):

* Create
* End Step

Once you have set your object to inherit from `DeltaObject`, you can use the following instance variables in place of their counterparts to get delta timing for free!

* `d_speed` instead of `speed`
* `d_hspeed` instead of `hspeed`
* `d_vspeed` instead of `vspeed`
* `d_alarm[0..11]` instead of `alarm[0..11]`
* `d_friction` instead of `friction`
* `d_gravity` instead of `gravity` (still uses `gravity_direction`)

These values will be converted into the correct values for delta timing, and managed internally to the object, then set as their GameMaker equivalents. When using these variables, *do not* use the GameMaker equivalents as well.

## GM Core

Delta is a part of the [GM Core](https://github.com/gm-core) project.

## License

Copyright (c) 2017 Michael Barrett

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
