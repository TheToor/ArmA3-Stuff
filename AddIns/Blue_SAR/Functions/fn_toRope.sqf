private ["_rope","_ropehelper","_heli"];
_heli = _this select 3;
_ropehelper = _heli getVariable "RopeHelper";
if(player distance _ropehelper > 4) exitWith { hint "Du bist nicht genug nahe am Ende des Seiles!"; };

moveOut player;

waitUntil { vehicle player == player };

player attachTo [_ropehelper,[0,0,-0.4]];
[player, "AGM_FastRoping", 2] call AGM_Core_fnc_doAnimation;

player setVariable ["Blue_cur_Heli",_heli];

waituntil {!isnull (finddisplay 46)};
_EH = (findDisplay 46) displayAddEventHandler ["KeyDown","_this select 1 call Blue_fnc_HandleKeyDown; false;"];

waituntil { vehicle player != player || attachedTo player != _ropehelper };

(findDisplay 46) displayRemoveEventHandler ["KeyDown", _EH];
detach player; // Fix issue with Scroll menu