_vehicles = ["C_Offroad_01_F","C_SUV_01_F","C_Quadbike_01_F","C_Van_01_transport_F","C_Van_01_box_F","C_Truck_02_transport_F","C_Truck_02_covered_F","C_Hatchback_01_sport_F","C_Hatchback_01_F","C_Van_01_fuel_F"];
_types = ["C_man_w_worker_F","C_man_shorts_2_F","C_man_polo_4_F","C_Man_casual_5_F","C_Man_casual_4_F","C_Man_casual_3_F","C_Nikos","C_Nikos_aged","C_Orestes","C_man_polo_5_F_euro","O_G_Survivor_F","O_G_Soldier_lite_F","O_G_Soldier_M_F","O_G_medic_F","O_G_Soldier_AR_F","O_G_Soldier_A_F"];
_spawns = ["unitSpawn","unitSpawn_1"];
_spawn = _spawns call bis_fnc_selectRandom;
_vehicle = _vehicles call bis_fnc_selectRandom;
_veh = _vehicle createVehicle getMarkerPos _spawn;
_veh setDir 225;

civGroup = createGroup civilian;
eastGroup = createGroup east;

TASK = _veh;

_totalSeats = [_vehicle, true] call BIS_fnc_crewCount;
_count = [1,_totalSeats] call BIS_fnc_randomInt;
_random = [1,1000] call BIS_fnc_randomInt;
if (_random < 100) then {
    BADSPAWN = true;
} else {
    BADSPAWN = false;
};
_group = [];

for "_i" from 1 to _count do {
    _type = _types call bis_fnc_selectRandom;
    _unit = civGroup createUnit [ _type, position _veh, [], 0, "FORM"];
    removeAllWeapons _unit;
    if (BADSPAWN) then {
        _unit setVariable ["badDude",true,true];
    } else {
        _unit setVariable ["badDude",false,true];
    };
    _unit moveInAny _veh;
    _group pushBack _unit;
};

if (BADSPAWN) then {
    _veh setVariable ["BADDUDES",true,true];
    _veh setVariable ["cleared", false, true];
    _veh setVariable ["bomb", false, true];
    _group join eastGroup;
} else {
    _veh setVariable ["BADDUDES",false,true];
    _veh setVariable ["cleared", false, true];
    _veh setVariable ["bomb", false, true];
    _group join civGroup;
};


_wp = civGroup addWaypoint [getMarkerPos "gateStop", 0];
_wp setWaypointType "MOVE";
_wpe = eastGroup addWaypoint [getMarkerPos "gateStop", 0];
_wpe setWaypointType "MOVE";

waitUntil { (((_veh distance getMarkerPos "unitExit" < 20) || _veh getVariable "cleared") && !(_veh getVariable "bomb")) };
hint "SUCCESS!";
deleteVehicle _veh;

{ if (alive _x && !badspawn) then {deleteVehicle _x} } forEach _group;

if (BADSPAWN) then {
    _group join deadEast;
} else {
    _group join deadCiv;
};

deleteGroup civGroup;
deleteGroup eastGroup;
vehiclesHandled = vehiclesHandled + 1;
[] call oc_fnc_startVehicle;
