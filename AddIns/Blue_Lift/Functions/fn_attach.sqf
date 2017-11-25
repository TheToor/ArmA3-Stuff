private ["_obj","_pos","_vehicle"];
_obj = player getVariable "Blue_Attached_Object";
_rope = _obj getVariable "Blue_Rope";

_vehicleCar = nearestObject [player, "Car"];
_vehicleTank = nearestObject [player, "Tank"];
_vehicleBoat = nearestObject [player, "Ship"];

_vehicle = "PlatzHalter";
if ((player distance _vehicleCar) > (player distance _vehicleTank)) then {
  _vehicle = _vehicleTank;
} else {
  _vehicle = _vehicleCar;
};
if ((player distance _vehicle) > (player distance _vehicleBoat)) then {
  _vehicle = _vehicleBoat;
};
if(_vehicle distance player > 10) exitWith { hint "Du bist nicht in der nähe eines Fahrzeuges!"; };

["Blue_Object_Placement", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
_obj setVariable ["Blue_isLifted",false,true];
player setVariable ["Blue_Attached_Object",nil];
player removeAction Blue_Action_Attach;
player removeAction Blue_Action_Drop;
_pos = _vehicle worldToModel (getPos _obj);

{
	_x ropeDetach _rope;
} forEach (ropeAttachedObjects (_rope getVariable "Blue_SAR_Heli"));

_obj ropeDetach _rope;
_obj attachTo [_vehicle,_pos];
[_vehicle,_pos,[0,0,0]] ropeAttachTo _rope;
player setVariable ["Blue_Attached_Vehicle",_vehicle];

_obj setVariable ["Blue_Attachements",[true,_rope,_vehicle],true];