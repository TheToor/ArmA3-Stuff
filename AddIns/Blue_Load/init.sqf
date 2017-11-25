/*if(!Blue_Library_Init_Complete || isNil "Blue_Library_Init_Complete") exitWith {
	hint "Blue_Load: Blue_MainLibrary not loaded. Startup canceled";
	diag_log "Blue_Load: Blue_MainLibrary not loaded. Startup canceled";
};*/
Blue_Load_Init_Complete = false; //Dont change
////////////////////////////////////////////////////////////////////////////////////////////
//Changes in this file can break loading.
//Do not edit if you don't know what you are doing.
////////////////////////////////////////////////////////////////////////////////////////////
//Debug
Blue_Debug = false; 			//Debug all | if true ignores all other debug values below
Blue_Debug_Main = false;		//Debug all in this file
Blue_Debug_Load = false; 	//Debug loading
Blue_Debug_UnLoad = false; 	//Debug unloading
////////////////////////////////////////////////////////////////////////////////////////////
//Defines
//Dont change these values if you don't know what you are doing!
//Can (and probably will) break loading!
#define	Blue_HemmtPos [0.04,0,-0.4]
#define Blue_HemmtMaxLoad 4.5
#define Blue_QuadPos [-0.05,-1.35,-0.7]
#define Blue_QuadMaxLoad 0.5
#define Blue_OffroadPos	[-0.1,-1.1,-0.4]
#define Blue_OffroadMaxLoad 1.5
#define Blue_VanPos	[-0.05,-0.8,-0.4]
#define Blue_VanMaxLoad 2.5
#define Blue_KamazPos [0.03,0.5,-0.6]
#define Blue_KamazMaxLoad 4
#define Blue_TempestPos [0.07,-0.5,-0.2]
#define Blue_TempestMaxLoad 4.5
//Helis
#define Blue_HuronPos [-0.04,3,-1.7]
#define Blue_HuronMaxLoad 4.5
#define Blue_MohawkPos [0.03,4,-2.1]
#define Blue_MohawkMaxLoad 6
////////////////////////////////////////////////////////////////////////////////////////////
//And here is where you should stop editing.
//Like for real okay?
////////////////////////////////////////////////////////////////////////////////////////////
Blue_AddLoad = compile preprocessFileLineNumbers "AddIns\Blue_Load\Functions\fn_addLoad.sqf";
Blue_RemoveLoad = compile preprocessFileLineNumbers "AddIns\Blue_Load\Functions\fn_remLoad.sqf";
Blue_SitDown = compile preprocessFileLineNumbers "AddIns\Blue_Load\Functions\fn_sitdown.sqf";
Blue_StandUp = compile preprocessFileLineNumbers "AddIns\Blue_Load\Functions\fn_standup.sqf";
////////////////////////////////////////////////////////////////////////////////////////////
Blue_Boxes_Small = [
	"Box_NATO_Grenades_F",
	"Box_NATO_AmmoOrd_F",
	"Box_NATO_Ammo_F",
	"Box_NATO_Support_F",
	"Box_NATO_Support_F",
	"Box_East_Ammo_F",
	"Box_IND_AmmoOrd_F",
	"Box_IND_Ammo_F"
];
Blue_Boxes_Mid = [
	"Box_NATO_Wps_F",
	"Box_East_Wps_F",
	"Box_IND_Wps_F"
];
Blue_Boxes_Large  = [
	"Box_NATO_WpsSpecial_F",
	"Box_NATO_WpsLaunch_F",
	"Box_East_WpsLaunch_F",
	"Box_East_WpsSpecial_F",
	"Box_IND_WpsSpecial_F",
	"Box_IND_WpsLaunch_F"
];
Blue_Boxes_Cargo = [
	"Box_NATO_AmmoVeh_F",
	"B_CargoNet_01_ammo_F",
	"Box_East_AmmoVeh_F",
	"O_CargoNet_01_ammo_F",
	"Box_IND_AmmoVeh_F",
	"I_CargoNet_01_ammo_F"
];
Blue_Boxes_Vehicle = [
	"B_Quadbike_01_F",
	"O_Quadbike_01_F"
];
Blue_Supported_Load = Blue_Boxes_Small + Blue_Boxes_Mid + Blue_Boxes_Large + Blue_Boxes_Cargo + Blue_Boxes_Vehicle;
////////////////////////////////////////////////////////////////////////////////////////////
Blue_Vehicle_Hemmt = [
	"B_Truck_01_covered_F",
	"B_Truck_01_transport_F",
	"B_Truck_01_box_F"
];
Blue_Vehicle_Kamaz = [
	"I_Truck_02_transport_F",
	"O_Truck_02_transport_F",
	"I_Truck_02_covered_F",
	"O_Truck_02_covered_F"
];
Blue_Vehicle_Tempest = [
	"O_Truck_03_transport_F",
	"O_Truck_03_covered_F"
];
Blue_Vehicle_Offroad = [
	"C_Offroad_01_F",
	"B_G_Offroad_01_F",
	"B_mas_mar_Offroad_01_F"
];
Blue_Vehicle_Van = [
	"B_G_Van_01_transport_F",
	"C_Van_01_transport_F"
];
Blue_Vehicle_Quad = [
	"B_Quadbike_01_F",
	"O_Quadbike_01_F"
];
//Helis
Blue_Heli_Huron = [
	"B_Heli_Transport_03_F",
	"B_Heli_Transport_03_unarmed_F"
];
Blue_Heli_Mohawk = [
	"I_Heli_Transport_02_F"
];
Blue_Supported_Vehicles = Blue_Vehicle_Hemmt + Blue_Vehicle_Kamaz + Blue_Vehicle_Tempest + Blue_Vehicle_Offroad + Blue_Vehicle_Van + Blue_Vehicle_Quad;
Blue_Supported_Helis = Blue_Heli_Huron + Blue_Heli_Mohawk;
////////////////////////////////////////////////////////////////////////////////////////
//Startup
/////////DELETE TEST ONLY
Blue_addAction = {
	//Want better Names? Do it yourself.
	private ["_a","_b","_c","_d","_e","_f","_g","_h","_i"];
	_a = _this select 0;
	_b = _this select 1;
	_c = _this select 2;
	_d = _this select 3;
	_e = _this select 4;
	_f = _this select 5;
	_g = _this select 6;
	_h = _this select 7;
	_i = _this select 8;
	_a addAction [_b,_c,_d,_e,_f,_g,_h,_i];
};
Blue_SwitchMove = {
    private["_object","_anim"];
    _object = _this select 0;
    _anim = _this select 1;
    _object switchMove _anim;
};
Blue_Collision = {
	private["_do"];
	_do = _this select 0;
	if(_do isEqualTo "Enable") then {
		(_this select 1) enableCollisionWith (_this select 2);
	};
	if(_do isEqualTo "Disable") then {
		(_this select 1) disableCollisionWith (_this select 2);
	};
};
////////////////////////////////////////////////////////////////////////////////////////
if(!Blue_Load_Init_Complete && isserver) then {
	[] spawn {
		while { isserver } do {
			{
				_hasVars = _x getVariable "Blue_Load_Init";
				if(isNil "_hasVars") then {
					_type = typeof(_x);
					switch (true) do {
					    case (_type in Blue_Vehicle_Hemmt): {
					    	_x setVariable ["Blue_Position",Blue_HemmtPos,true];
					    	_x setVariable ["Blue_Load",0,true];
					    	_x setVariable ["Blue_MaxLoad",Blue_HemmtMaxLoad,true];
					    	_x setVariable ["Blue_OriginalMass",(getMass _x),true];
					    	_x setVariable ["Blue_Load_Init",true,true];
					    	[[_x,"Load","call Blue_Load","Load",6,false,true,"","call Blue_ActionLoad"],"Blue_addAction",true,true] call BIS_fnc_MP;
					    	[[_x,"Unload","call Blue_Load","UnLoad",6,false,true,"","call Blue_ActionUnLoad"],"Blue_addAction",true,true] call BIS_fnc_MP;
					    };
					    case (_type in Blue_Vehicle_Quad): {
					    	_x setVariable ["Blue_Position",Blue_QuadPos,true];
					    	_x setVariable ["Blue_Load",0,true];
					    	_x setVariable ["Blue_MaxLoad",Blue_QuadMaxLoad,true];
					    	_x setVariable ["Blue_OriginalMass",(getMass _x),true];
					    	_x setVariable ["Blue_Load_Init",true,true];
					    	[[_x,"Load","call Blue_Load","Load",6,false,true,"","call Blue_ActionLoad"],"Blue_addAction",true,true] call BIS_fnc_MP;
					    	[[_x,"Unload","call Blue_Load","UnLoad",6,false,true,"","call Blue_ActionUnLoad"],"Blue_addAction",true,true] call BIS_fnc_MP;
						};
						case (_type in Blue_Vehicle_Offroad): {
							_x setVariable ["Blue_Position",Blue_OffroadPos,true];
							_x setVariable ["Blue_Load",0,true];
							_x setVariable ["Blue_MaxLoad",Blue_OffroadMaxLoad,true];
							_x setVariable ["Blue_OriginalMass",(getMass _x),true];
							_x setVariable ["Blue_Load_Init",true,true];
							[[_x,"Load","call Blue_Load","Load",6,false,true,"","call Blue_ActionLoad"],"Blue_addAction",true,true] call BIS_fnc_MP;
					    	[[_x,"Unload","call Blue_Load","UnLoad",6,false,true,"","call Blue_ActionUnLoad"],"Blue_addAction",true,true] call BIS_fnc_MP;
						};
						case (_type in Blue_Vehicle_Van): {
							_x setVariable ["Blue_Position",Blue_VanPos,true];
							_x setVariable ["Blue_Load",0,true];
							_x setVariable ["Blue_MaxLoad",Blue_VanMaxLoad,true];
							_x setVariable ["Blue_OriginalMass",(getMass _x),true];
							_x setVariable ["Blue_Load_Init",true,true];
							[[_x,"Load","call Blue_Load","Load",6,false,true,"","call Blue_ActionLoad"],"Blue_addAction",true,true] call BIS_fnc_MP;
					    	[[_x,"Unload","call Blue_Load","UnLoad",6,false,true,"","call Blue_ActionUnLoad"],"Blue_addAction",true,true] call BIS_fnc_MP;
						};
						case (_type in Blue_Vehicle_Kamaz): {
							_x setVariable ["Blue_Position",Blue_KamazPos,true];
							_x setVariable ["Blue_Load",0,true];
							_x setVariable ["Blue_MaxLoad",Blue_KamazMaxLoad,true];
							_x setVariable ["Blue_OriginalMass",(getMass _x),true];
							_x setVariable ["Blue_Load_Init",true,true];
							[[_x,"Load","call Blue_Load","Load",6,false,true,"","call Blue_ActionLoad"],"Blue_addAction",true,true] call BIS_fnc_MP;
					    	[[_x,"Unload","call Blue_Load","UnLoad",6,false,true,"","call Blue_ActionUnLoad"],"Blue_addAction",true,true] call BIS_fnc_MP;
						};
						case (_type in Blue_Vehicle_Tempest): {
							_x setVariable ["Blue_Position",Blue_TempestPos,true];
							_x setVariable ["Blue_Load",0,true];
							_x setVariable ["Blue_MaxLoad",Blue_TempestMaxLoad,true];
							_x setVariable ["Blue_OriginalMass",(getMass _x),true];
							_x setVariable ["Blue_Load_Init",true,true];
							[[_x,"Load","call Blue_Load","Load",6,false,true,"","call Blue_ActionLoad"],"Blue_addAction",true,true] call BIS_fnc_MP;
					    	[[_x,"Unload","call Blue_Load","UnLoad",6,false,true,"","call Blue_ActionUnLoad"],"Blue_addAction",true,true] call BIS_fnc_MP;
						};
						case (_type in Blue_Heli_Mohawk): {
							_x setVariable ["Blue_Position",Blue_MohawkPos,true];
							_x setVariable ["Blue_Load",0,true];
							_x setVariable ["Blue_MaxLoad",Blue_MohawkMaxLoad,true];
							_x setVariable ["Blue_OriginalMass",(getMass _x),true];
							_x setVariable ["Blue_Load_Init",true,true];
							[[_x,"Load","call Blue_Load","Load",6,false,true,"","call Blue_ActionLoad"],"Blue_addAction",true,true] call BIS_fnc_MP;
					    	[[_x,"Unload","call Blue_Load","UnLoad",6,false,true,"","call Blue_ActionUnLoad"],"Blue_addAction",true,true] call BIS_fnc_MP;
						};
						case (_type in Blue_Heli_Huron): {
							_x setVariable ["Blue_Position",Blue_HuronPos,true];
							_x setVariable ["Blue_Load",0,true];
							_x setVariable ["Blue_MaxLoad",Blue_HuronMaxLoad,true];
							_x setVariable ["Blue_OriginalMass",(getMass _x),true];
							_x setVariable ["Blue_Load_Init",true,true];
							[[_x,"Load","call Blue_Load","Load",6,false,true,"","call Blue_ActionLoad"],"Blue_addAction",true,true] call BIS_fnc_MP;
					    	[[_x,"Unload","call Blue_Load","UnLoad",6,false,true,"","call Blue_ActionUnLoad"],"Blue_addAction",true,true] call BIS_fnc_MP;
						};
					};
				};
			} forEach vehicles;
			sleep 5;
		};
	};
};
////////////////////////////////////////////////////////////////////////////////////////
//Basic calls
Blue_canLoad = {
	private["_return","_vehicle","_toaddLoad","_load","_maxLoad"];
	_return = true;
	_vehicle = _this select 0;
	if(!alive _vehicle) exitWith {
		_return = false;
		_return
	};
	_toaddLoad = _this select 1;
	_load = _vehicle getVariable "Blue_Load";
	_load = _load + _toaddLoad;
	_maxLoad = _vehicle getVariable "Blue_MaxLoad";
	if(Blue_Debug_Main || Blue_Debug) then {
		systemChat format["Debug | Blue_canLoad: Vehicle %1 | Load to add: %4 | Current load: %2 | Maxload: %3 --> %4",_vehicle,_load,_maxLoad,_toaddLoad,_return];
	};
	if(_load > _maxLoad) then {
		_return = false
	};
	_return
};
Blue_ActionLoad = {
	private["_return","_ammobox","_array"];
	_return = false;
	_ammobox = (nearestObjects [player, Blue_Supported_Load, 5]) select 0;
	if(isNil "_ammobox") exitWith {
		_return
	};
	if(!isNil "_ammobox") then {
		_array = cursorTarget getVariable "Blue_LoadArray";
		if(isNil "_array") then {
			_return = true;
		} else {
			if(_ammobox in _array) then {
			} else {
				_return = true;
			};
		};
	};
	if(!alive cursorTarget) then { _return = false; };
	_return
};
Blue_ActionUnLoad = {
	private["_vehicle","_return"];
	_vehicle = cursorTarget;
	_array = _vehicle getVariable "Blue_LoadArray";
	_return = false;
	if(!isNil "_array") then {
		_return = true;
	};
	_return
};
Blue_Load = {
	private["_doLoad","_vehicle","_load"];
	_doLoad = _this select 3;
	if(_doLoad isEqualTo "Load") then {
		_vehicle = _this select 0;
		_playa = _this select 1;
		_load = (nearestObjects [_playa, Blue_Supported_Load, 5]) select 0;
		if(isNil "_load") exitWith { }; //CheckFailed?
		if(Blue_Debug_Main || Blue_Debug) then {
			systemChat format ["Debug | Blue_Load: Vehicle %1 called Load with %2",_vehicle,_load];
		};
		[_vehicle,_load] call Blue_AddLoad;
	};
	if(_doLoad isEqualTo "UnLoad") then {
		_vehicle = _this select 0;
		[_vehicle] call Blue_RemoveLoad;
	};
};
Blue_getLoadValue = {
	private["_load","_numb"];
	_load = typeOf(_this select 0);
	_numb = 0;
	switch (true) do {
	    case (_load in Blue_Boxes_Small): {
	    	_numb = -0.5;
	    };
	    case (_load in Blue_Boxes_Mid): {
	    	_numb = -1.1;
		};
		case (_load in Blue_Boxes_Large): {
			_numb = -1.6;
		};
		case (_load in Blue_Boxes_Cargo): {
			_numb = -1.5;
		};
		case (_load in Blue_Boxes_Vehicle): {
			_numb = -1.7;
		};
	};
	if(_numb==0) then {
		_numb = 200000; //Abort Loading couse unknown Load. How the fuck should that happen but just in case...
	};
	if(Blue_Debug_Main || Blue_Debug) then {
		systemChat format["Debug | Blue_getLoadValue: Load %1 --> %2",_load,_numb];
	};
	_numb
};
Blue_getLoadInfo = {
	private["_load","_numb"];
	_load = typeOf(_this select 0);
	_numb = 0;
	switch (true) do {
	    case (_load in Blue_Boxes_Small): {
	    	_numb = 0.5;
	    };
	    case (_load in Blue_Boxes_Mid): {
	    	_numb = 1.0;
		};
		case (_load in Blue_Boxes_Large): {
			_numb = 1.5;
		};
		case (_load in Blue_Boxes_Cargo): {
			_numb = 1.5;
		};
		case (_load in Blue_Boxes_Vehicle): {
			_numb = 2;
		};
	};
	if(_numb==0) then {
		_numb = 200000; //Abort Loading couse unknown Load. How the fuck should that happen but just in case...
	};
	if(Blue_Debug_Main || Blue_Debug) then {
		systemChat format["Debug | Blue_getLoadInfo: Load %1 --> %2",_load,_numb];
	};
	_numb
};
Blue_getLoadPos = {
	private["_load","_loadPos","_returnPos"];
	_load = _this select 0;
	_loadPos = _this select 1;
	_load = [_load] call Blue_getLoadValue;
	_newPos = ((_loadPos select 1)+_load);
	_returnPos = [_loadPos select 0,_newPos,_loadPos select 2];
	if(Blue_Debug_Main || Blue_Debug) then {
		systemChat format["Debug | Blue_getLoadPos: Load %1 | Loadpos: %2 | NewPos: %3 --> %4",_load,_loadPos,_newPos,_returnPos];
	};
	_returnPos
};
Blue_MoveObject = {
	private ["_obj","_from","_to","_i","_steps"];
	_vehicle = _this select 0;
	_obj = _this select 1;
	_from = _this select 2;
	_to = _this select 3;
	_from_x = _from select 0;
	_from_y = _from select 1;
	_from_z = _from select 2;
	_to_x = _to select 0;
	_to_y = _to select 1;
	_to_z = _to select 2;
	_x = _to_x - _from_x;
	_y = _to_y - _from_y;
	_z = _to_z - _from_z;
	_steps = 0;
	if (((abs _x) > (abs _y)) && ((abs _x) > (abs _z))) then
	{
		_steps = round ((abs _x) / 2);
	}
	else
	{
		if ((abs _y) > (abs _z)) then
		{
			_steps = round ((abs _y) / 2);
		}
		else
		{
			_steps = round ((abs _z) / 2);
		};
	};
	[_steps,_from_x,_from_y,_from_z,_to_x,_to_y,_to_z,_obj,_vehicle] spawn {
		Blue_Move_Done = false;
		_steps = _this select 0;
		_from_x = _this select 1;
		_from_y = _this select 2;
		_from_z = _this select 3;
		_to_x = _this select 4;
		_to_y = _this select 5;
		_to_z = _this select 6;
		_obj = _this select 7;
		_vehicle = _this select 8;
		_x = _to_x - _from_x;
		_y = _to_y - _from_y;
		_z = _to_z - _from_z;
		_i = 0;
		_load = _obj;
		_obj AttachTo [_vehicle, [_from_x,_from_y,_from_z]];
		systemChat format["From: %1,%2,%3 | To: %4,%5,%6 | Steps: %7 | I:%8",_from_x,_from_y,_from_z,_to_x,_to_y,_to_z,_steps,_i];
		while {_i < _steps } do
		{
			_i = _i + 0.1;
			_pos = [(((_x / _steps) * _i) + _from_x), (((_y / _steps) * _i) + _from_y), (((_z / _steps) * _i) + _from_z)];
			_obj AttachTo [_vehicle, _pos];
			if(typeof(_load) in Blue_Boxes_Small || typeof(_load) in Blue_Boxes_Mid || typeof(_load) in Blue_Boxes_Large) then {
				_obj setDir 90;
			};
			systemChat format["I: %1 | Pos: %2",_i,_pos];
			sleep 0.05;
		};
		Blue_Move_Done = true;
	};
};
////////////////////////////////////////////////////////////////////////////////////////
Blue_Load_HandleKeyDown = {
	switch (_this) do {
		case 19: {
			[player] call Blue_standUp;
		};
	};
};
Blue_Load_Init_Complete = true;