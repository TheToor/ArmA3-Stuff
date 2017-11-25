private["_vehicle","_load","_loadArray","_loadCount","_pos","_lastPos","_loadArray","_loadArrayCount","_startpos","_obj","_loadval","_canLoad","_action","_mass","_newArray"];

#define Blue_Boxes_Main_Correction					0.5
#define Blue_Boxes_Cargo_Correction					0.6
#define Blue_Boxes_Cargo_to_Vehicle_Correction		-0.6
#define Blue_Boxes_Vehicle_Correction 				1.2
#define Blue_Boxes_Vehicle_to_Cargo_Correction 		0.6

_vehicle = _this select 0;
_load = _this select 1;
_loadArray=[];
_loadArray = _vehicle getVariable "Blue_LoadArray";

if(isNil "_loadArray") then {
	_loadArray=[];
	_loadArrayCount=0;
} else {
	_loadArrayCount = count _loadArray;
};

_obj = nil;
_startpos = _vehicle getVariable "Blue_Position";
_lastPos = _startpos;
{
	_lastPos = _x getVariable "Blue_attachedPos";
	_obj = _x;
} forEach _loadArray;

if(isNil "_lastPos") then { _lastPos = [0,0,-0.4]; };
_pos = [_load,_lastPos] call Blue_getLoadPos;
if(Blue_Debug_Load || Blue_Debug) then {
	systemChat format["Debug | Blue_addLoad: LastPos: %1, NewPos: %2",_lastPos,_pos];
};

if(!(isNil "_obj")) then {
	if(typeof(_obj) in Blue_Boxes_Mid && typeof(_load) in Blue_Boxes_Small) then {
		_pos = [_pos select 0,(_pos select 1)-Blue_Boxes_Main_Correction,_pos select 2];
	};
	if(typeof(_obj) in Blue_Boxes_Cargo && (typeof(_load) in Blue_Boxes_Small || typeof(_load) in Blue_Boxes_Mid || typeof(_load) in Blue_Boxes_Large)) then {
		_pos = [_pos select 0,(_pos select 1)-Blue_Boxes_Main_Correction,((_vehicle getVariable "Blue_Position")select 2)];
	};
	if(typeof(_obj) in Blue_Boxes_Vehicle && typeof(_load) in Blue_Boxes_Cargo || typeof(_load) == typeof(_obj) && typeof(_load) in Blue_Boxes_Vehicle) then {
		_pos = [_pos select 0,(_pos select 1)-Blue_Boxes_Main_Correction,_pos select 2];
	};
};
if(_loadArrayCount==0) then {
	_pos = [_pos select 0,((_vehicle getVariable "Blue_Position")select 1),_pos select 2];
};
if(typeof(_load) in Blue_Boxes_Cargo) then {
	if(!isNil "_obj") then {
		if(typeof (_obj) in Blue_Boxes_Cargo) then { } else {
			if(typeof(_obj) in Blue_Boxes_Vehicle) then {
				_pos = [_pos select 0,_pos select 1,(_pos select 2)+Blue_Boxes_Cargo_to_Vehicle_Correction];
			} else {
				_pos = [_pos select 0,_pos select 1,(_pos select 2)+Blue_Boxes_Cargo_Correction];
			};
		};
	} else {
		_pos = [_pos select 0,_pos select 1,(_pos select 2)+Blue_Boxes_Cargo_Correction];
	};
};
if(typeof(_load) in Blue_Boxes_Vehicle) then {
	if(!isNil "_obj") then {
		if(typeof (_obj) in Blue_Boxes_Vehicle) then { } else {
			if(typeof(_obj) in Blue_Boxes_Cargo) then {
				_pos = [_pos select 0,_pos select 1,(_pos select 2)+Blue_Boxes_Vehicle_to_Cargo_Correction];
			} else {
				_pos = [_pos select 0,_pos select 1,(_pos select 2)+Blue_Boxes_Vehicle_Correction];
			};
		};
	} else {
		_pos = [_pos select 0,_pos select 1,(_pos select 2)+Blue_Boxes_Vehicle_Correction];
		systemChat "Corrected";
	};
};
_loadval = [_load] call Blue_getLoadInfo;
_canLoad = [_vehicle,_loadval] call Blue_canLoad;
if(!(_canLoad)) exitWith { hint "Dieses Fahrzeug hat keinen Platz mehr." };

_addload = _vehicle getVariable "Blue_Load";
_addload = _addload + _loadval;
_vehicle setVariable ["Blue_Load",_addload];

_load disableCollisionWith _vehicle;
[["Disable",_load,_vehicle],"Blue_Collision",true,true] call BIS_fnc_MP;

//_load attachTo [_vehicle,_pos];
_load attachTo [_vehicle,[(_vehicle WorldToModel (getPos _load))select 0,(_vehicle WorldToModel (getPos _load))select 1,_pos select 2]]; //Correct Height
[_vehicle,_load,[_pos select 0,(_vehicle WorldToModel (getPos _load)select 1),_pos select 2],_pos] call Blue_MoveObject;
if(typeof(_load) in Blue_Boxes_Small || typeof(_load) in Blue_Boxes_Mid || typeof(_load) in Blue_Boxes_Large) then {
	_load setDir 90;
};
if(typeof(_vehicle) in Blue_Vehicle_Quad) then {
	_action = _load addAction ["Sit down","call Blue_SitDown"];
	_load setVariable ["Blue_ATV_Box_Action",_action,true];
};
_load setVariable ["Blue_attachedPos",_pos,true];
_mass = (getMass _load) + (getMass _vehicle);
_vehicle setMass _mass;
_newArray = _loadArray + [_load];
_vehicle setVariable ["Blue_LoadArray",_newArray,true];
_vehicle setVariable ["Blue_LastLoaded",_load,true];
if(Blue_Debug_Load || Blue_Debug) then {
	systemChat format["Debug | Blue_addLoad: Loaded %1 on %2 with loadmass %3 and newmass %4",_load,_vehicle,getMass _load,_mass];
};