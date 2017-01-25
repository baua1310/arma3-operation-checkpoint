deleteVehicle cursorTarget;
_graves = (missionNamespace getVariable "graves");

_grave = _graves call bis_fnc_selectRandom;

missionNamespace setVariable ["graves",_graves - [_grave],true];

_grave hideObjectGlobal false;
