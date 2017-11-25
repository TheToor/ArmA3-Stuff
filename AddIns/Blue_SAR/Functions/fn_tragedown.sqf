private["_heli","_ropehelper","_trage"];
_heli = _this select 3;
_ropehelper = _heli getVariable "RopeHelper";

_trage = "Land_Ground_sheet_yellow_F" createVehicle [0,0,20];
_trage allowDamage false;
_trage attachTo [_ropehelper,[0,0,0]];
_trage setDir (getDir _heli);
_trage disableCollisionWith _heli;

_heli setVariable ["Trage",_trage,true];
_heli setVariable ["TrageStatus",true,true];

[[_trage,"Patient Einladen","AddIns\Blue_SAR\Functions\fn_putin.sqf",_heli,6,false,true,"","player == vehicle player"],"Blue_addAction",true,true] call BIS_fnc_MP;