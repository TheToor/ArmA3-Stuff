Blue SAR System by (C) BlueFire

/////////////////////////////////////////////////////////////////////

Needed for Blue_SAR:
	
	Blue_MainLibrary
	Blue_AGM

/////////////////////////////////////////////////////////////////////

Installation:
	
	add to init.sqf:

	0 = execVM "AddIns\Blue_SAR\pre_init.sqf";



	add to initServer.sqf:

	waitUntil { Blue_SAR_Init_Complete };
	[VEHICLENAME] execVM "AddIns\Blue_SAR\init.sqf";

	//Blue SAR General Loop
	[] spawn {
		while { true } do
		{
			{
				_var = _x getVariable "IsPartOfMission";
				_hasAction = _x getVariable "HasAction";
				if(isNil "_var") then { _var = false; };
				if(_var && isNil "_hasAction") then {
					[[_x,"Select as patient","player setVariable[""SelectedPatient"",cursorTarget,true]","",6,false,true,"",""],"Blue_addAction",true,true] call BIS_fnc_MP;
					_x setVariable ["HasAction",true,true];
				};
			} forEach allUnits;
			sleep 10;
		};
	};