if(!Blue_Library_Init_Complete || isNil "Blue_Library_Init_Complete") exitWith {
	hint "Blue_SAR: Blue_MainLibrary not loaded. Startup canceled";
	diag_log "Blue_SAR: Blue_MainLibrary not loaded. Startup canceled";
};
if(!Blue_AGM_Init_Complete || isNil "Blue_AGM_Init_Complete") exitWith {
	hint "Blue_SAR: Blue_AGM not loaded. Startup canceled";
	diag_log "Blue_SAR: Blue_AGM not loaded. Startup canceled";
};

Blue_SAR_Init_Complete = false;

Blue_HideObject = {
	private ["_object","_hide"];
	_object = _this select 0;
	_hide = _this select 1;
	_object hideObject _hide;
	_object hideObjectGlobal _hide;
};

Blue_fnc_HandleKeyDown = {
	private ["_heli","_ropehelper","_rope","_length","_newlenght"];
	_heli = player getVariable "Blue_cur_Heli";
	if(isNil "_heli") exitWith { };
	_rope = _heli getVariable "Rope";
	_ropehelper = _heli getVariable "RopeHelper";
	switch (_this) do {
		case 17: {
			_length = ropeLength _rope;
			_newlenght = 0;
			if(_length < 1) then { _newlenght = 0; } else {
				_newlenght = _length - 1;
			};
			[[_rope,1,_newlenght],"Blue_ropeUnwind",true,true] call BIS_fnc_MP;
		};
		case 31: {
			_length = ropeLength _rope;
			_newlenght = 0;
			if(_length > 19) then { _newlenght = 20; } else {
				_newlenght = _length + 1;
			};
			[[_rope,1,_newlenght],"Blue_ropeUnwind",true,true] call BIS_fnc_MP;
		};
		case 32: {
			player setDir ((getDir player)+10);
		};
		case 30: {
			player setDir ((getDir player)-10);
		};
		case 15: {
			detach player;
			sleep 0.5;
			[player, "", 2] call AGM_Core_fnc_doAnimation;
		};
		case 19: {
			if((player distance _heli) < 4) then {
				player moveInCargo _heli;
			} else {
				hint "Du bist nicht genug nahe am Helikopter!";
			};
		};
	};
};

Blue_SAR_Init_Complete = true;