if(!Blue_Library_Init_Complete || isNil "Blue_Library_Init_Complete") exitWith {
	hint "Blue_Lift: Blue_MainLibrary not loaded. Startup canceled";
	diag_log "Blue_Lift: Blue_MainLibrary not loaded. Startup canceled";
};

private ["_heli","_ropePos","_rope1","_rope2","_rope3","_rope4","_last_helper_1","_last_helper_2","_last_helper_3","_last_helper_4"];
_heli = _this select 0;
_ropePos = [_heli] call Blue_getHeliRopePos;
if(_ropePos isEqualTo [0,0,0]) exitWith { hint "This vehicle can't be used with Blue_Lift!"; };
_rope1 = ropeCreate [_heli, _ropePos, 0];
_rope2 = ropeCreate [_heli, _ropePos, 0];
_rope3 = ropeCreate [_heli, _ropePos, 0];
_rope4 = ropeCreate [_heli, _ropePos, 0];

_last_helper_1 = "Land_Battery_F" createVehicle (_rope1 modelToWorld [0,0,0]);
_last_helper_1 allowDamage false;
[_last_helper_1,[0,0,0],[0,0,0]] ropeAttachTo _rope1;

_last_helper_2 = "Land_Battery_F" createVehicle (_rope2 modelToWorld [0,0,0]);
_last_helper_2 allowDamage false;
[_last_helper_2,[0,0,0],[0,0,0]] ropeAttachTo _rope2;

_last_helper_3 = "Land_Battery_F" createVehicle (_rope3 modelToWorld [0,0,0]);
_last_helper_3 allowDamage false;
[_last_helper_3,[0,0,0],[0,0,0]] ropeAttachTo _rope3;

_last_helper_4 = "Land_Battery_F" createVehicle (_rope4 modelToWorld [0,0,0]);
_last_helper_4 allowDamage false;
[_last_helper_4,[0,0,0],[0,0,0]] ropeAttachTo _rope4;

_rope1 setVariable ["Blue_Rope_Helper",_last_helper_1,true];
_rope2 setVariable ["Blue_Rope_Helper",_last_helper_2,true];
_rope3 setVariable ["Blue_Rope_Helper",_last_helper_3,true];
_rope4 setVariable ["Blue_Rope_Helper",_last_helper_4,true];

_rope1 setVariable ["Blue_SAR_Heli",_heli,true];
_rope2 setVariable ["Blue_SAR_Heli",_heli,true];
_rope3 setVariable ["Blue_SAR_Heli",_heli,true];
_rope4 setVariable ["Blue_SAR_Heli",_heli,true];

_last_helper_1 setVariable ["Blue_Rope",_rope1,true];
_last_helper_2 setVariable ["Blue_Rope",_rope2,true];
_last_helper_3 setVariable ["Blue_Rope",_rope3,true];
_last_helper_4 setVariable ["Blue_Rope",_rope4,true];

_last_helper_1 setVariable ["Blue_SAR_Heli",_heli,true];
_last_helper_2 setVariable ["Blue_SAR_Heli",_heli,true];
_last_helper_3 setVariable ["Blue_SAR_Heli",_heli,true];
_last_helper_4 setVariable ["Blue_SAR_Heli",_heli,true];

[[_last_helper_1,"Seil nehmen","AddIns\Blue_Lift\Functions\fn_takeRope.sqf",_rope1,6,false,true,"","player == vehicle player && player distance cursorTarget < 5"],"Blue_addAction",true,true] call BIS_fnc_MP;
[[_last_helper_2,"Seil nehmen","AddIns\Blue_Lift\Functions\fn_takeRope.sqf",_rope2,6,false,true,"","player == vehicle player && player distance cursorTarget < 5"],"Blue_addAction",true,true] call BIS_fnc_MP;
[[_last_helper_3,"Seil nehmen","AddIns\Blue_Lift\Functions\fn_takeRope.sqf",_rope3,6,false,true,"","player == vehicle player && player distance cursorTarget < 5"],"Blue_addAction",true,true] call BIS_fnc_MP;
[[_last_helper_4,"Seil nehmen","AddIns\Blue_Lift\Functions\fn_takeRope.sqf",_rope4,6,false,true,"","player == vehicle player && player distance cursorTarget < 5"],"Blue_addAction",true,true] call BIS_fnc_MP;

_heli setVariable ["Last_Ropes",[_rope1,_rope2,_rope3,_rope4,_last_helper_1,_last_helper_2,_last_helper_3,_last_helper_4]];

[[_heli,"Lift","AddIns\Blue_Lift\Functions\fn_lift.sqf",_heli,6,false,true,"","call Blue_checkLift"],"Blue_addAction",true,true] call BIS_fnc_MP;
[[_heli,"Drop","AddIns\Blue_Lift\Functions\fn_drop.sqf",_heli,6,false,true,"","call Blue_checkDrop"],"Blue_addAction",true,true] call BIS_fnc_MP;

while { alive _heli } do {
	if(_last_helper_1 distance ((ropeEndPosition _rope1) select 1) > 1) then { //Teleport fix
		[_last_helper_1,[0,0,0],[0,0,0]] ropeAttachTo _rope1;
	};
	if(_last_helper_2 distance ((ropeEndPosition _rope2) select 1) > 1) then { //Teleport fix
		[_last_helper_2,[0,0,0],[0,0,0]] ropeAttachTo _rope2;
	};
	if(_last_helper_3 distance ((ropeEndPosition _rope3) select 1) > 1) then { //Teleport fix
		[_last_helper_3,[0,0,0],[0,0,0]] ropeAttachTo _rope3;
	};
	if(_last_helper_4 distance ((ropeEndPosition _rope4) select 1) > 1) then { //Teleport fix
		[_last_helper_4,[0,0,0],[0,0,0]] ropeAttachTo _rope4;
	};
};