_gate = gate getVariable "open";
_open = gate animationPhase "Door_1_rot";

switch (_gate) do {
    case false: {
        waitUntil { _open != (gate animationPhase "Door_1_rot") };
        gate animate ["Door_1_rot",0];
    };
    case true: {
        waitUntil { _open != (gate animationPhase "Door_1_rot") };
        gate animate ["Door_1_rot",1];
    };
};

[] spawn oc_fnc_gateLoop;
