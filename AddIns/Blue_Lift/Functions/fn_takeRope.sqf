private ["_obj"];
_obj = _this select 0;
Blue_Object = _this select 0;
_rope = _obj getVariable "Blue_Rope";
[[_rope,4,20],"Blue_ropeUnwind",true,true] call BIS_fnc_MP;
_var = ((_obj getVariable "Blue_Attachements")select 0);
if(isNil "_var") then {
	Blue_Action_Drop = player addAction ["Drop","AddIns\Blue_Lift\Functions\fn_detach.sqf"];
	Blue_Action_Attach = player addAction ["Attach","AddIns\Blue_Lift\Functions\fn_attach.sqf"];
	player setVariable ["Blue_Attached_Object",_obj];
	["Blue_Object_Placement","OnEachFrame", {
	    _pos = (ASLtoATL eyePos player) vectorAdd (positionCameraToWorld [0,0,1] vectorDiff positionCameraToWorld [0,0,0]);
	    Blue_Object setPosATL _pos;
	}] call BIS_fnc_addStackedEventHandler;
	_obj setVariable ["Blue_isLifted",true,true];
} else {
	deTach _obj;
	{
		_x ropeDetach _rope;
	} forEach (ropeAttachedObjects (_rope getVariable "Blue_SAR_Heli"));
	[_obj,[0,0,0],[0,0,0]] ropeAttachTo _rope;
	Blue_Action_Drop = player addAction ["Drop","AddIns\Blue_Lift\Functions\fn_detach.sqf"];
	Blue_Action_Attach = player addAction ["Attach","AddIns\Blue_Lift\Functions\fn_attach.sqf"];
	player setVariable ["Blue_Attached_Object",_obj];
	["Blue_Object_Placement","OnEachFrame", {
	    _pos = (ASLtoATL eyePos player) vectorAdd (positionCameraToWorld [0,0,1] vectorDiff positionCameraToWorld [0,0,0]);
	    Blue_Object setPosATL _pos;
	}] call BIS_fnc_addStackedEventHandler;
	_obj setVariable ["Blue_isLifted",true,true];
};