switch (gate getVariable "open") do {
    case true: {
        gate setVariable ["open",false,true];
        sleep 0.2;
        gate animate ["Door_1_rot",0];
        sleep 0.2;
        gate animate ["Door_1_rot",0];
    };
    case false: {
        gate setVariable ["open",true,true];
        sleep 0.2;
        gate animate ["Door_1_rot",1];
        sleep 0.2;
        gate animate ["Door_1_rot",1];
        gate disableCollisionWith TASK;
        sleep 2;
        _wp = civGroup addWaypoint [getMarkerPos "unitExit", 0];
        _wp setWaypointType "MOVE";
        _wpe = eastGroup addWaypoint [getMarkerPos "unitExit", 0];
        _wpe setWaypointType "MOVE";

        waitUntil { TASK distance gate > 50 };
        [] call oc_fnc_gateToggle;
    };
};
