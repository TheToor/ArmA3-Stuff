
_Blue_Libary_used = true;
_Blue_Lift_used = true;
_Blue_SAR_used = true;

sleep 10; // Let Server init all Scripts
//////////////////////////////////////////////////

diag_log "Blue Debug: Started --> Options";
diag_log format["Blue Libary: %1",_Blue_Libary_used];
diag_log format["Blue Lift: %1",_Blue_Lift_used];
diag_log format["Blue SAR: %1",_Blue_SAR_used];

if(_Blue_Libary_used) then {
	if(isNil "Blue_Libary_Init_Complete") exitWith {
		diag_log "Blue Debug: Error detected: Blue Libary isnt Loaded!";
	};
	if(!(Blue_Libary_Init_Complete)) exitWith {
		diag_log "Blue Debug: Error detected: Blue Libary doesnt seem to load correctly. Redownload or check for errors by yourself.";
	};
	if(Blue_Libary_Init_Complete) exitWith {
		diag_log "Blue Debug: Blue Libary loaded successfully!";
	};
};

if(_Blue_Lift_used) then {
	if(isNil "Blue_Lift_Init_Complete") exitWith {
		diag_log "Blue Debug: Error detected: Blue Lift isnt Loaded!";
	};
	if(!(Blue_Lift_Init_Complete)) exitWith {
		diag_log "Blue Debug: Error detected: Blue Lift doesnt seem to load correctly. Redownload or check for errors by yourself.";
	};
	if(Blue_Lift_Init_Complete) exitWith {
		diag_log "Blue Debug: Blue Lift loaded successfully!";
	};
};

if(_Blue_SAR_used) then {
	if(isNil "Blue_SAR_Init_Complete") exitWith {
		diag_log "Blue Debug: Error detected: Blue SAR isnt Loaded!";
	};
	if(!(Blue_SAR_Init_Complete)) exitWith {
		diag_log "Blue Debug: Error detected: Blue SAR doesnt seem to load correctly. Redownload or check for errors by yourself.";
	};
	if(Blue_SAR_Init_Complete) exitWith {
		diag_log "Blue Debug: Blue SAR loaded successfully!";
	};
};

diag_log "Blue Debug: Runned successfully. Check possible errors on top.";