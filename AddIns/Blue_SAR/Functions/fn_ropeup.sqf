private ["_rope","_heli"];
_heli = _this select 0;
_rope = _heli getVariable "Rope";
//ropeUnwind [_rope, 1, 0];
[[_rope,1,0],"Blue_ropeUnwind",true,true] call BIS_fnc_MP;
_heli setVariable ["RopeStatus",false,true];