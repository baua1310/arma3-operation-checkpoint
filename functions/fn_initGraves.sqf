nearGraves = nearestObjects [gravex, [], 100];
GRAVES = [];
{
    if (typeOf _x == "Land_Grave_dirt_F") then {
        _x hideObjectGlobal true;
        GRAVES pushback _x;
    };
} forEach nearGraves;
missionNamespace setVariable ["graves",GRAVES,true];
