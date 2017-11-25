private ["_heli","_ropes","_attached","_ve"];
_heli = _this select 3;
_ropes = _heli getVariable "Last_Ropes";
if(isNil "_ropes") exitWith { };

_attached = _heli getVariable "Blue_HasAttached";
if(isNil "_attached") exitWith { };

_vehicle = _heli getVariable "Blue_AttachedObj";
if(isNil "_vehicle") exitWith {
	_heli setVariable ["Blue_AttachedObj",nil,true];
	_heli setVariable ["Blue_HasAttached",false,true];

	[[(_ropes select 0),4,0],"Blue_ropeUnwind",true,true] call BIS_fnc_MP;
	[[(_ropes select 1),4,0],"Blue_ropeUnwind",true,true] call BIS_fnc_MP;
	[[(_ropes select 2),4,0],"Blue_ropeUnwind",true,true] call BIS_fnc_MP;
	[[(_ropes select 3),4,0],"Blue_ropeUnwind",true,true] call BIS_fnc_MP;
};

_vehicle ropeDetach (_ropes select 0);
_vehicle ropeDetach (_ropes select 1);
_vehicle ropeDetach (_ropes select 2);
_vehicle ropeDetach (_ropes select 3);

deTach (_ropes select 4);
deTach (_ropes select 5);
deTach (_ropes select 6);
deTach (_ropes select 7);

[(_ropes select 4),[1,2,0],[0,0,0]] ropeAttachTo (_ropes select 0);
[(_ropes select 5),[-1,2,0],[0,0,0]] ropeAttachTo (_ropes select 1);
[(_ropes select 6),[1,-2,0],[0,0,0]] ropeAttachTo (_ropes select 2);
[(_ropes select 7),[-1,-2,0],[0,0,0]] ropeAttachTo (_ropes select 3);

[[(_ropes select 0),4,0],"Blue_ropeUnwind",true,true] call BIS_fnc_MP;
[[(_ropes select 1),4,0],"Blue_ropeUnwind",true,true] call BIS_fnc_MP;
[[(_ropes select 2),4,0],"Blue_ropeUnwind",true,true] call BIS_fnc_MP;
[[(_ropes select 3),4,0],"Blue_ropeUnwind",true,true] call BIS_fnc_MP;

cutText ["Detaching ...", "PLAIN"];

sleep 5;

cutText ["Vehicle detached!", "PLAIN"];

_heli setVariable ["Blue_HasAttached",false,true];