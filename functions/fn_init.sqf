gate setVariable ["open",false,true];
[] call oc_fnc_initLaptops;

if (!isServer) exitWith {};

vehiclesHandled = 0;
CIVHQ = createCenter civilian;
EASTHQ = createCenter east;
deadCiv = createGroup civilian;
deadEast = createGroup east;
[] spawn oc_fnc_gateLoop;
[] call oc_fnc_initGraves;
[] spawn oc_fnc_startVehicle;
