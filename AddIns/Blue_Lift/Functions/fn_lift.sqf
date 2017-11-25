private ["_heli","_vehicle","_ropes","_vehicleCar","_vehicleTank","_vehicleBoat"];
_heli = _this select 3;

_ropes = _heli getVariable "Last_Ropes";

if(isNil "_ropes") exitWith { };

_vehicleCar = nearestObject [_heli, "Car"];
_vehicleTank = nearestObject [_heli, "Tank"];
_vehicleBoat = nearestObject [_heli, "Ship"];

_vehicle = "PlatzHalter";
if ((_heli distance _vehicleCar) > (_heli distance _vehicleTank)) then {
  _vehicle = _vehicleTank;
} else {
  _vehicle = _vehicleCar;
};
if ((_heli distance _vehicle) > (_heli distance _vehicleBoat)) then {
  _vehicle = _vehicleBoat;
};

[[(_ropes select 0),4,20],"Blue_ropeUnwind",true,true] call BIS_fnc_MP;
[[(_ropes select 1),4,20],"Blue_ropeUnwind",true,true] call BIS_fnc_MP;
[[(_ropes select 2),4,20],"Blue_ropeUnwind",true,true] call BIS_fnc_MP;
[[(_ropes select 3),4,20],"Blue_ropeUnwind",true,true] call BIS_fnc_MP;

(_ropes select 4) ropeDetach (_ropes select 0);
(_ropes select 5) ropeDetach (_ropes select 1);
(_ropes select 6) ropeDetach (_ropes select 2);
(_ropes select 7) ropeDetach (_ropes select 3);

cutText ["Attaching ...", "PLAIN"];

sleep 5;

cutText ["Vehicle attached!", "PLAIN"];

[_vehicle,[1,2,0],[0,0,0]] ropeAttachTo (_ropes select 0);
[_vehicle,[-1,2,0],[0,0,0]] ropeAttachTo (_ropes select 1);
[_vehicle,[1,-2,0],[0,0,0]] ropeAttachTo (_ropes select 2);
[_vehicle,[-1,-2,0],[0,0,0]] ropeAttachTo (_ropes select 3);

_heli setVariable ["Blue_AttachedObj",_vehicle,true];
_heli setVariable ["Blue_HasAttached",true,true];