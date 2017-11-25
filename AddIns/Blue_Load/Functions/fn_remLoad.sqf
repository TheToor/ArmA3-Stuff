private ["_vehicle","_load","_oldarray","_old_count","_newload","_action","_array","_add","_new_count","_mass"];
_vehicle = _this select 0;
_load = _vehicle getVariable "Blue_LastLoaded";
_oldarray = _vehicle getVariable "Blue_LoadArray";
if(attachedTo _load != _vehicle) exitWith {
	//Load got directly loaded onto othe Vehicle
	{
		_load = _x;
		if(attachedTo _load != _vehicle) then {
			_mass = (getMass _vehicle) - (getMass _load);
			_vehicle setMass _mass;
			_newload = [_load] call Blue_getLoadInfo;
			_newload = (_vehicle getVariable "Blue_Load") - _newload;
			_vehicle setVariable ["Blue_Load",_newload,true];
			_vehicle setVariable ["Blue_LoadArray",_oldarray - [_load],true];
			_array = _vehicle getVariable "Blue_LoadArray";
			if(count _array!=((count _oldarray)-1)) then {
				_old_count = count _oldarray;
				_new_count = count _array;
				_add = (_old_count - _new_count)-1;
				for "_n" from 1 to _add do {
					_array = _vehicle getVariable "Blue_LoadArray";
					_vehicle setVariable ["Blue_LoadArray",_array + [_x],true];
				};
			};
			_array = _vehicle getVariable "Blue_LoadArray";
			if(count _array == 0) then {
				_vehicle setVariable ["Blue_LoadArray",nil,true];
			};
			_newold = (_vehicle getVariable "Blue_LoadArray") select (count(_vehicle getVariable "Blue_LoadArray")-1);
			_vehicle setVariable ["Blue_LastLoaded",_newold,true];
			if(Blue_Debug_UnLoad || Blue_Debug) then {
				systemChat format ["Debug | Blue_RemoveLoad: %1 delete from load becouse its no longer part of load",_load];
			};
			hintSilent "Load has been transported to other vehicle.";
		};
	} forEach (_vehicle getVariable "Blue_LoadArray");
};
Blue_Move_Done = false;
[_vehicle,_load,(_vehicle WorldToModel (getPos _load)),[((_vehicle WorldToModel (getPos _load))select 0),(((_vehicle WorldToModel (getPos player))select 1)-1),((_vehicle WorldToModel (getPos _load))select 2)]] call Blue_MoveObject;
waitUntil { Blue_Move_Done };
detach _load;
_load setDamage ((Damage _load)+0.000001);//Stuck in-air prevention
_load setDamage ((Damage _load)-0.000001);//Stuck in-air prevention
Blue_Move_Done = false;

_load enableCollisionWith _vehicle;
[["Enable",_load,_vehicle],"Blue_Collision",true,true] call BIS_fnc_MP;

_action = _load	getVariable "Blue_ATV_Box_Action";
if(!isNil "_action") then {
	_load removeAction _action;
	_load setVariable ["Blue_ATV_Box_Action",nil,true];
};
_mass = (getMass _vehicle) - (getMass _load);
_vehicle setMass _mass;

_newload = [_load] call Blue_getLoadInfo;
_newload = (_vehicle getVariable "Blue_Load") - _newload;
_vehicle setVariable ["Blue_Load",_newload,true];
_vehicle setVariable ["Blue_LoadArray",_oldarray - [_load],true];
_array = _vehicle getVariable "Blue_LoadArray";

if(count _array!=((count _oldarray)-1)) then {
	_old_count = count _oldarray;
	_new_count = count _array;
	_add = (_old_count - _new_count)-1;
	for "_n" from 1 to _add do {
		_array = _vehicle getVariable "Blue_LoadArray";
		_vehicle setVariable ["Blue_LoadArray",_array + [_x],true];
	};
};
_array = _vehicle getVariable "Blue_LoadArray";
if(count _array == 0) then {
	_vehicle setVariable ["Blue_LoadArray",nil,true];
};
_newold = (_vehicle getVariable "Blue_LoadArray") select (count(_vehicle getVariable "Blue_LoadArray")-1);
if(isNil _newOld) then {
	_vehicle setVariable ["Blue_LastLoaded",nil,true];
} else {
	_vehicle setVariable ["Blue_LastLoaded",_newold,true];
};

if(Blue_Debug_UnLoad || Blue_Debug) then {
	systemChat format ["Debug | Blue_RemoveLoad: Unloaded %1 from %2 with mass %3 and newmass %4",_load,_vehicle,getMass _load,_mass];
};