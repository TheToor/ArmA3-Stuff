private ["_obj","_unit"];
_obj = _this select 0;
_unit = _this select 1;

[[_unit, "Crew"], "Blue_switchMove"] spawn BIS_fnc_MP;
_unit attachTo [_obj,[0,0,-0.1]];
_unit setDir ((getdir _obj)-90);

waituntil {!isnull (finddisplay 46)};
_EH = (findDisplay 46) displayAddEventHandler ["KeyDown","_this select 1 call Blue_Load_HandleKeyDown; false;"];

waitUntil { vehicle player!=player || attachedTo _unit != _obj };

(findDisplay 46) displayRemoveEventHandler ["KeyDown", _EH];
detach player;