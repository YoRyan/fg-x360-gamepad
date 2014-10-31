# Copyright (C) 2014 Ryan Young
# Public domain.

var THROTTLE_FACTOR = 2.2;
var THROTTLE_DEADBAND = 0.3;
var VIEW_FACTOR = 2;
var ZOOM_FACTOR = 5;

var metrics = {
        shiftN: props.globals.initNode("/input/x360/shifted", 0, "BOOL"),
        rudder_left_axis: 0,
        rudder_right_axis: 0,
        throttle_axis: 0,
        heading_axis: 0,
        pitch_axis: 0,
        zoom_axis: 0
};

var _updateThrottle = func () {
        if (math.abs(metrics.throttle_axis) > THROTTLE_DEADBAND) {
                var delta = -math.pow(metrics.throttle_axis, 3) *
                                getprop("/sim/time/delta-realtime-sec") * THROTTLE_FACTOR;
                var thr = {};
                foreach (var eng; controls.engines) {
                        if (eng.selected.getBoolValue()) {
                                thr = eng.controls.getNode("throttle", 1);
                                thr.setDoubleValue(thr.getValue() + delta);
                        }
                }
        }
};
addcommand("x360-throttle-axis", func (node) {
        metrics.throttle_axis = node.getNode("setting", 1).getValue();
});

var _updateView = func () {
        if (metrics.shiftN.getBoolValue()) {
                var headingN = props.globals.getNode("/sim/current-view/goal-heading-offset-deg", 1);
                headingN.setDoubleValue(headingN.getValue() - metrics.heading_axis *
                                VIEW_FACTOR);
                var pitchN = props.globals.getNode("/sim/current-view/goal-pitch-offset-deg", 1);
                pitchN.setDoubleValue(pitchN.getValue() - metrics.pitch_axis *
                                VIEW_FACTOR);
                var zoomN = props.globals.getNode("/sim/current-view/field-of-view", 1);
                zoomN.setDoubleValue(zoomN.getValue() + metrics.zoom_axis * ZOOM_FACTOR);
        } else {
                metrics.heading_axis = 0;
                metrics.pitch_axis = 0;
                metrics.zoom_axis = 0;
        }
};
addcommand("x360-view-heading-axis", func (node) {
        metrics.heading_axis = node.getNode("setting", 1).getValue();
});
addcommand("x360-view-pitch-axis", func (node) {
        metrics.pitch_axis = node.getNode("setting", 1).getValue();
});
addcommand("x360-view-zoom-axis", func (node) {
        metrics.zoom_axis = node.getNode("setting", 1).getValue();
});

var _updateRudder = func () {
        setprop("/controls/flight/rudder",
                        metrics.rudder_right_axis - metrics.rudder_left_axis);
};
addcommand("x360-rudder-right-axis", func (node) {
        metrics.rudder_right_axis = node.getNode("setting", 1).getValue();
});
addcommand("x360-rudder-left-axis", func (node) {
        metrics.rudder_left_axis = node.getNode("setting", 1).getValue();
});

var _update = func () {
        _updateThrottle();
        _updateView();
        _updateRudder();
        settimer(_update, 0);
};
settimer(_update, 0);

print("Xbox 360 controller library up and running");
