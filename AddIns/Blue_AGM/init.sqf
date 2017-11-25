if(!Blue_Libary_Init_Complete || isNil "Blue_Libary_Init_Complete") exitWith {
	hint "Blue_AGM: Blue_MainLibary not loaded. Startup canceled";
	diag_log "Blue_AGM: Blue_MainLibary not loaded. Startup canceled";
};

Blue_AGM_Init_Complete = false;

Blue_unconscious = {
	private ["_playa","_time"];
	_playa = _this select 0;
	_time = _this select 1;
	if(isNil "_time") then {
		[_playa, 99999] call AGM_Medical_fnc_knockOut;
	} else {
		[_playa, _time] call AGM_Medical_fnc_knockOut;
	};
	_playa setVariable ["IsPartOfMission",true,true];
};

Blue_setPain = {
	private ["_playa","_damage"];
	_playa = _this select 0;
	_damage = _this select 1;
	_playa setVariable ["AGM_Pain", _damage, true];
	_playa setVariable ["IsPartOfMission",true,true];
};

Blue_setHit = {
	private ["_playa","_part","_damage"];
	_playa = _this select 0;
	_part = _this select 1;
	_damage = _this select 2;
	if(isNil "_part" || isNil "_damage") exitWith { systemChat "Blue_fnc_setHit --> Error: no part or damage parameter!"; };
	switch (_part) do {
	    case "Head": {
	    	[_playa, HitHead, _damage] call AGM_Medical_fnc_setHitPointDamage;
	    };
	    case "Body": {
	    	[_playa, HitBody, _damage] call AGM_Medical_fnc_setHitPointDamage;
	    };
	    case "LeftArm": {
	    	[_playa, HitLeftArm, _damage] call AGM_Medical_fnc_setHitPointDamage;
	    };
	    case "RightArm": {
	    	[_playa, HitRightArm, _damage] call AGM_Medical_fnc_setHitPointDamage;
	    };
	    case "LeftLeg": {
	    	[_playa, HitLeftLeg, _damage] call AGM_Medical_fnc_setHitPointDamage;
	    };
	    case "RightLeg": {
	    	[_playa, HitRightLeg, _damage] call AGM_Medical_fnc_setHitPointDamage;
	    };
	};
	_playa setVariable ["IsPartOfMission",true,true];
};

Blue_AGM_Init_Complete = true;