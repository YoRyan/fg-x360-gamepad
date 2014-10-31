# Xbox 360 gamepad configuration for FlightGear

This is my custom joystick configuration for Xbox 360 controllers for
[FlightGear Flight Simulator](http://flightgear.org). Unlike the default config,
it supports Windows *and* Linux, and it contains some cool extra bindings that
make use of the thumbsticks and bumpers. For this extra functionality, a special
Nasal library is used.

## Install

1. Clone this repository.

### Windows

2. Copy `windows/x360.xml` to `$FG_ROOT\\Input\\Joysticks\\`. Delete (or
   change the file extension of) the default configuration at
   `$FG_ROOT\\Input\\Joysticks\\Microsoft\\xbox-360-controller.xml`.
3. Copy `windows/x360.nas` to `$FG_ROOT\\Nasal\\`.

### Linux

2. Note: This config is designed to work with the `xpad` driver. This should be
   loaded by default in modern kernels.
3. Copy `linux_xpad/x360.xml` to `$FG_ROOT/Input/Joysticks/`.
4. Copy `linux_xpad/x360.nas` to `$FG_ROOT/Nasal/`.

## Bindings

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/XboxControllerAllLabels.svg/640px-XboxControllerAllLabels.svg.png" alt="">

### Bumpers

- **Left bumper:** **Shifter button.** While this button is pressed, other
  buttons will execute their *shifted* actions (if there are any assigned). This
  is analogous to the Control or Shift keys on a keyboard.
- **Right bumper:** Raise or lower landing gear.
  - **Shift:** Toggle parking brake.

### Triggers

- **Left trigger:** Move rudder left, like a rudder pedal.
- **Right trigger:** Move rudder right, like a rudder pedal.

### Thumbsticks

- **Left thumbstick:** X axis controls ailerons, Y axis controls elevators.
  - **Shift:** Y axis increases and decreases FOV.
- **Right thumbstick:** Y axis controls throttle incrementally. Push up to
  increase, push down to decrease. Feels very natural.
  - **Shift:** Axes move your view, like a first-person shooter.
  - **Shift + Press:** View auto-centers and returns to the default FOV.

### D-pad

- **D-pad up:** Raise flaps.
- **D-pad down:** Lower flaps.
- **D-pad left:** Cycle view backwards.
- **D-pad right:** Cycle view forwards.

### Buttons

- **A:** Elevator trim up, fine.
  - **Shift:** Elevator trim up, coarse.
- **X:** Elevator trim down, fine.
  - **Shift:** Elevator trim down, coarse.
- **B:** Right wheel brakes.
- **Y:** Left wheel brakes.

(If you want to apply the brakes evenly, you need to press **B** and **Y** at
the same time.)

- **Back:** Open autopilot dialog.
  - **Shift:** Close autopilot dialog.
- **Start:** Open moving map.
  - **Shift:** Close moving map.
- **Xbox/Guide:** *(Linux only)* Cycle HUD.

(I do not know if it is possible to make a binding that opens or closes a
dialog. Help needed.)

(The Windows driver does not report the Xbox button to FlightGear.)

## License

Copyright (C) 2014 Ryan Young.
[Public domain.](https://creativecommons.org/publicdomain/zero/1.0/)
