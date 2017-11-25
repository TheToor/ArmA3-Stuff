player removeAction Blue_Action_Attach;
player removeAction Blue_Action_Drop;
_obj = player getVariable "Blue_Attached_Object";
_var = _obj getVariable "Blue_Attachements";
_rope = _obj getVariable "Blue_Rope";
if(isNil "_var") then {
	deTach _obj;
	[_obj,[0,0,0],[0,0,0]] ropeAttachTo _rope;
};
[[_rope,4,0],"Blue_ropeUnwind",true,true] call BIS_fnc_MP;
["Blue_Object_Placement", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
(player getVariable "Blue_Attached_Object") setVariable ["Blue_isLifted",false,true];
player setVariable ["Blue_Attached_Object",nil];