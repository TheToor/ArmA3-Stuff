private ["_velocity","_speed"];
_velocity = velocity vehicle player;
_speed = (sqrt ((_velocity select 0)^2 + (_velocity select 1)^2))*3.6;
if(_speed < 10) then {
	detach player;
	[[player, ""], "Blue_switchMove"] spawn BIS_fnc_MP;
	player switchMove "";
} else {
	hint "Das Fahrzeug darf nicht schneller als 10km/h fahren!";
};
