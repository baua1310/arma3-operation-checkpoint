_laptops = [laptop_1,laptop_2,laptop_3];

{
    _x addAction ["Open Gate", { [] spawn oc_fnc_gateToggle }, [], 1, false, false, "", '(!(gate getVariable "open") && ((gate distance TASK) < 50))', 5];
    _x addAction ["Close Gate", { [] spawn oc_fnc_gateToggle }, [], 1, false, false, "", '((gate getVariable "open") && ((gate distance TASK) < 50))', 5];
} forEach _laptops;
/*
player addAction["<t color='#ADFF2F'>Seize Weapons</t>",life_fnc_siezeObjects,cursorTarget,0,false,false,"",'(count(nearestObjects [player,["weaponholder"],3])>0)']
_x addAction ["Open Gate", oc_fnc_gateToggle, [], 1, false, false, "", '(gate getVariable "open" == false)', 5];
