private ["_heli","_lightswitch","_light","_light2"];
_heli = _this select 3;
_lightswitch = _heli getVariable "LightSwitch";
if(!(_lightswitch)) then {
	_light = "Land_Camping_Light_F" createVehicle [0,0,20];
	_light allowDamage false;
	_light attachTo [_heli,[0,2,-1.75]];
	[_light ,0, 180] call bis_fnc_setpitchbank;

	_light2 = "Land_Camping_Light_F" createVehicle [0,0,20];
	_light2 allowDamage false;
	_light2 attachTo [_heli,[0,0.6,-1.75]];
	[_light2 ,0, 180] call bis_fnc_setpitchbank;

	_heli setVariable ["Lights",[_light,_light2],true];
	_heli setVariable ["LightSwitch",true,true];
} else {
	_heli setVariable ["LightSwitch",true,true];
};