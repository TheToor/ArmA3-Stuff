private ["_heli","_lightswitch","_lights","_light","_light2"];
_heli = _this select 3;
_lightswitch = _heli getVariable "LightSwitch";
if(!(_lightswitch)) then {
	_heli setVariable ["LightSwitch",false,true];
} else {
	_lights = _heli getVariable "Lights";
	{
		deleteVehicle _x;
	} forEach _lights;
	_heli setVariable ["LightSwitch",false,true];
};