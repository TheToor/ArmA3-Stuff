if(!Blue_Libary_Init_Complete || isNil "Blue_Libary_Init_Complete") exitWith {
	hint "Blue_SAR: Blue_MainLibary not loaded. Startup canceled";
	diag_log "Blue_SAR: Blue_MainLibary not loaded. Startup canceled";
};
if(!Blue_AGM_Init_Complete || isNil "Blue_AGM_Init_Complete") exitWith {
	hint "Blue_SAR: Blue_AGM not loaded. Startup canceled";
	diag_log "Blue_SAR: Blue_AGM not loaded. Startup canceled";
};

private ["_heli","_rope","_ropehelper","_mast","_reifen","_invheli","_rope1","_rope2","_rope3","_rope4"];
_heli = _this select 0;
_var = _heli getVariable "HasRopes";

if(_var || !(isNil "_var")) exitWith { };

_heli setObjectTextureGlobal [0, "AddIns\Blue_SAR\Texture\SAR.jpg"];

/////////////////////////////////////////////////////////////
//Seilwinde

_mast = "Land_RedWhitePole_F" createVehicle [0,0,20];
_mast allowDamage false;
_mast attachTo [_heli,[1,1.5,-0.18]];
_mast setVectorDirAndUp [[0,1,0],[1,0,0]];

_reifen = "Land_KartTyre_01_F" createVehicle [0,0,20];
_reifen attachTo [_mast,[0,0,1]];
_reifen allowDamage false;

_invheli = "UH1D_1" createVehicle [0,0,20];
_invheli allowDamage false;
_invheli enableSimulation false;
_invheli hideObjectGlobal true;
[[_invheli,true],"Blue_HideObject",true,true] call BIS_fnc_MP;
_invheli attachTo [_mast,[0,0,1]];

_rope = ropeCreate [_invheli, [0,0,0], 0];

_ropehelper = "Land_Battery_F" createVehicle (_rope modelToWorld [0,0,0]);
_ropehelper allowDamage false;
[_ropehelper,[0,0,0],[0,0,0]] ropeAttachTo _rope;

_heli setVariable ["LightSwitch",false,true];
_heli setVariable ["HasRopes",true,true];
_heli setVariable ["Rope",_rope,true];
_heli setVariable ["RopeHelper",_ropehelper,true];
_heli setVariable ["RopeStatus",false,true];
_heli setVariable ["TrageStatus",false,true];

/////////////////////////////////////////////////////////////
//Actions
[[_heli,"Rope down","AddIns\Blue_SAR\Functions\fn_ropedown.sqf",_heli,6,false,true,"","player != vehicle player && !(vehicle player getVariable 'RopeStatus')"],"Blue_addAction",true,true] call BIS_fnc_MP;
[[_heli,"Rope up","AddIns\Blue_SAR\Functions\fn_ropeup.sqf",_heli,6,false,true,"","player != vehicle player && (vehicle player getVariable 'RopeStatus')"],"Blue_addAction",true,true] call BIS_fnc_MP;

[[_heli,"Trage befestigen","AddIns\Blue_SAR\Functions\fn_tragedown.sqf",_heli,6,false,true,"","player != vehicle player && !(vehicle player getVariable 'TrageStatus')"],"Blue_addAction",true,true] call BIS_fnc_MP;
[[_heli,"Trage abmachen","AddIns\Blue_SAR\Functions\fn_trageup.sqf",_heli,6,false,true,"","player != vehicle player && (vehicle player getVariable 'TrageStatus')"],"Blue_addAction",true,true] call BIS_fnc_MP;

[[_heli,"Down Lights on","AddIns\Blue_SAR\Functions\fn_lightsOn.sqf",_heli,6,false,true,"","player != vehicle player && !(vehicle player getVariable 'LightSwitch')"],"Blue_addAction",true,true] call BIS_fnc_MP;
[[_heli,"Down Lights off","AddIns\Blue_SAR\Functions\fn_lightsOff.sqf",_heli,6,false,true,"","player != vehicle player && (vehicle player getVariable 'LightSwitch')"],"Blue_addAction",true,true] call BIS_fnc_MP;
[[_heli,"Einklinken","AddIns\Blue_SAR\Functions\fn_toRope.sqf",_heli,6,false,true,"","player != vehicle player && player != driver vehicle player"],"Blue_addAction",true,true] call BIS_fnc_MP;

[[_ropehelper,"Einklinken","AddIns\Blue_SAR\Functions\fn_toRope.sqf",_heli,6,false,true,"","player distance cursorTarget < 5"],"Blue_addAction",true,true] call BIS_fnc_MP;

/////////////////////////////////////////////////////////////
// Rope Fixes and Dir Fixes
while { alive _heli } do {
	_var = _heli getVariable "Trage";
	if(!(isNil "_var")) then { //Correcting some Stuff
		(_heli getVariable "RopeHelper") setVectorDirAndUp [[0,0,0],[0,0,0]];
		_var setDir (getDir _heli);
	};
	if(_ropehelper distance ((ropeEndPosition _rope) select 1) > 1) then { //Teleport fix
		[_ropehelper,[0,0,0],[0,0,0]] ropeAttachTo _rope;
	};
};
/////////////////////////////////////////////////////////////
//Delete Stuff
waitUntil { !alive _heli };
deleteVehicle _mast;
deleteVehicle _reifen;
deleteVehicle _invheli;
ropeDestroy _rope;
deleteVehicle _ropehelper;
{
	deleteVehicle _x;
} forEach (_heli getVariable "Last_Ropes");
if(isNil "_heli getVariable 'Trage'") then {
	deleteVehicle (_heli getVariable "Trage");
};
if(isNil "_heli getVariable 'Lights'") then {
	{
		deleteVehicle _x;
	} forEach (_heli getVariable "Lights");
};