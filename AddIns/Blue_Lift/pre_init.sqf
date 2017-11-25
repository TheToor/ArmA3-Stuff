if(!Blue_Library_Init_Complete || isNil "Blue_Library_Init_Complete") exitWith {
	hint "Blue_Lift: Blue_MainLibrary not loaded. Startup canceled";
	diag_log "Blue_Lift: Blue_MainLibrary not loaded. Startup canceled";
};

Blue_Lift_Init_Complete = false;
Blue_getHeliRopePos = {
	private["_return","_heli"];
	_heli = typeof(_this select 0);
	_return = [0,0,0];
	switch (_heli) do {
	    case "C_Heli_Light_01_civil_F": {
	    	_return = [0,1.5,0.1];
	    };
	    case "B_Heli_Light_01_F": {
	    	_return = [0,1.5,0.1];
	    };
	    case "B_Heli_Light_01_armed_F": {
	    	_return = [0,1.5,0.1];
	    };
	    case "O_Heli_Transport_04_F": {
	    	_return = [-0.1,0.4,-0.5];
	    };
	    case "O_Heli_Attack_02_black_F": {
	    	_return = [0.1,1,-2.3];
	    };
	    case "O_Heli_Attack_02_F": {
	    	_return = [0.1,1,-2.3];
	    };
	    case "O_Heli_Light_02_F": {
	    	_return = [0,1,-1.8];
	    };
	    case "O_Heli_Light_02_unarmed_F": {
	    	_return = [0,1,-1.8];
	    };
	    case "O_Heli_Light_02_v2_F": {
	    	_return = [0,1,-1.8];
	    };
	    case "B_Heli_Transport_01_F": {
	    	_return = [0.1,1,-1.7];
	    };
	    case "B_Heli_Transport_01_camo_F": {
	    	_return = [0.1,1,-1.7];
	    };
	    case "I_Heli_light_03_F": {
	    	_return = [0,2.7,-1];
	    };
	    case "I_Heli_light_03_unarmed_F": {
	    	_return = [0,2.7,-1];
	    };
		case "I_Heli_Transport_02_F": {
	    	_return = [0,2,-2.6];
	    };
	    case "B_Heli_Transport_03_F": {
	    	_return = [-0.06,1.1,-2.5];
	    };
	    case "B_Heli_Transport_03_unarmed_F": {
	    	_return = [-0.06,1.1,-2.5];
	    };
	    //HueyPack
	    case "UH1D_1": {
	    	_return = [-0.029,1.2,-1.9];
		};
		case "UH1Y_TOW": {
			_return = [0,2.3,-2];
		};
		case "UH1Y_FFV": {
			_return = [0,2.3,-2];
		};
		case "UH1Y_Venom_50Cal": {
			_return = [0,2.3,-2];
		};
		case "UH1Y_Venom": {
			_return = [0,2.3,-2];
		};
		case "UH1N_Bulletstorm": {
			_return = [0,2.3,-2];
		};
		case "UH1N_TOW": {
			_return = [0,2.3,-2];
		};
		case "UH1N_Slick": {
			_return = [0,2.3,-2];
		};
		case "UH1N_Gau_Gatling": {
			_return = [0,2.3,-2];
		};
		case "UH1N_Iroquois": {
			_return = [0,2.3,-2];
		};
		case "UH1N_Escort": {
			_return = [0,2.3,-2];
		};
		case "UH1N_Hydra": {
			_return = [0,2.3,-2];
		};
		case "UH1N_Black": {
			_return = [0,2.3,-2];
		};
		case "UH1N_Gunship": {
			_return = [0,2.3,-2];
		};
		case "Bell412": {
			_return = [0,2.3,-2];
		};
		case "UH1H_Transport": {
			_return = [-0.029,1.2,-1.9];
		};
		case "UH1N_Gunship": {
			_return = [-0.029,1.2,-1.9];
		};
		case "UH1H_Closed": {
			_return = [-0.029,1.2,-1.9];
		};
		case "uh1c_miniguns": {
			_return = [-0.029,1.2,-1.9];
		};
		case "uh1h_Shark": {
			_return = [-0.029,1.2,-1.9];
		};
		case "UH1C_XM21AS": {
			_return = [-0.029,1.2,-1.9];
		};
		case "UH1C_HH": {
			_return = [-0.029,1.2,-1.9];
		};
		case "UH1C_XM16AS": {
			_return = [-0.029,1.2,-1.9];
		};
		case "UH1C": {
			_return = [-0.029,1.2,-1.9];
		};
		case "UH1H_Gun": {
			_return = [-0.029,1.2,-1.9];
		};
		case "UH1H_FFV": {
			_return = [-0.029,1.2,-1.9];
		};
		case "UH1H_Gunship": {
			_return = [-0.029,1.2,-1.9];
		};
		case "UH1H_LMG": {
			_return = [-0.029,1.2,-1.9];
		};
		case "UH1H_Medevac": {
			_return = [-0.029,1.2,-1.9];
		};
		case "UH1H_rockets": {
			_return = [-0.029,1.2,-1.9];
		};
		//RHS
		case "RHS_CH_47F_10": {
			_return = [-0.01,-0.7,-3.1];
		};
		case "RHS_CH_47F": {
			_return = [-0.01,-0.7,-3.1];
		};
		case "RHS_CH_47F_light": {
			_return = [-0.01,-0.7,-3.1];
		};
		case "rhs_ka60_c": {
			_return = [0,1.3,-1.9];
		};
		case "rhs_ka60_grey": {
			_return = [0,1.3,-1.9];
		};
		case "RHS_Mi24Vt_vvs": {
			_return = [-0.05,2.3,-2.6];
		};
		case "RHS_Mi8amt_chdkz": {
			_return = [0,2.3,-2.45];
		};
		case "RHS_Mi8AMT_vdv": {
			_return = [0,2.3,-2.45];
		};
		case "RHS_Mi8AMTSh_vvsc": {
			_return = [0,2.3,-2.45];
		};
		case "RHS_Mi8AMT_vvsc": {
			_return = [0,2.3,-2.45];
		};
		case "RHS_Mi8AMT_vvs": {
			_return = [0,2.3,-2.45];
		};
		case "RHS_Mi8mt_vdv": {
			_return = [0,2.3,-2.45];
		};
		case "RHS_Mi8mt_vv": {
			_return = [0,2.3,-2.45];
		};
		case "RHS_Mi8mt_vvsc": {
			_return = [0,2.3,-2.45];
		};
		case "RHS_Mi8mt_vvs": {
			_return = [0,2.3,-2.45];
		};
		case "RHS_Mi8mt_Cargo_vdv": {
			_return = [0,2.3,-2.45];
		};
		case "RHS_Mi8mt_Cargo_vv": {
			_return = [0,2.3,-2.45];
		};
		case "RHS_UH60M": {
			_return = [-0.02,1.2,-2.17];
		};
		case "RHS_UH60M_MEV_d": {
			_return = [-0.02,1.2,-2.17];
		};
		case "RHS_UH60M_d": {
			_return = [-0.02,1.2,-2.17];
		};
		case "RHS_UH60M_MEV2": {
			_return = [-0.02,1.2,-2.17];
		};
		case "RHS_UH60M_MEV2_d": {
			_return = [-0.02,1.2,-2.17];
		};
		case "RHS_UH60M_MEV": {
			_return = [-0.02,1.2,-2.17];
		};
	};
	_return
};
Blue_checkLift =
{
	private ["_return","_velocity","_speed"];
	_return = false;
	_velocity = velocity vehicle player;
	_speed = (sqrt ((_velocity select 0)^2 + (_velocity select 1)^2))*3.6;
	if ((vehicle player isKindOf "Helicopter") && (count (nearestObjects [vehicle player, ["Car", "Tank", "Ship"], 10]) > 0) && (_speed < 10) && (driver vehicle player == player)) then {
		_return = true;
	};
	if !(isNil { vehicle player getVariable "Blue_HasAttached" }) then
	{
		if (vehicle player getVariable "Blue_HasAttached") then
		{
			_return = false;
		};
	};
	_return
};

Blue_checkDrop =
{
	private ["_ropehelper","_attached"];
	_return = false;
	_attached = vehicle player getVariable "Blue_HasAttached";
	if ((vehicle player isKindOf "Helicopter") && (driver vehicle player == player) && (_attached)) then
	{
		_return = true;
	};
	_return
};

Blue_canAttach = {
	private ["_return","_var"];
	_return = false;
	_var = player getVariable "Blue_Has_Rope_inHand";
	if(isNil "_var") then { _var = false; };
	if(_var) then {
		_return = true;
	} else {
		_return = false;
	};
	_return
};
Blue_canRemove = {
	private ["_return","_var"];
	_return = false;
	_var = cursorTarget getVariable "Blue_Has_Rope_Attached";
	if(isNil "_var" || !(_var)) then {
		_return = false;
	} else {
		_return = true;
	};
	_return
};

Blue_Lift_Init_Complete = true;