Blue_Libary_Init_Complete = false;

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
Blue_ropeUnwind = {
	private ["_rope","_speed","_m"];
	_rope = _this select 0;
	_speed = _this select 1;
	_m = _this select 2;
	ropeUnwind [_rope, _speed, _m];
};
Blue_globalChat = {
	private ["_message","_player"];
	_player = _this select 0;
	_message = _this select 1;
	_player globalChat _message;
};
Blue_sideChat = {
	private ["_message","_player"];
	_player = _this select 0;
	_message = _this select 1;
	_player sideChat _message;
};
Blue_globalChat = {
	private ["_message"];
	_message = _this select 0;
	systemChat _message;
};
Blue_Hint = {
	private ["_message"];
	hint _message;
};
Blue_fnc_WeaponOnBack = {
	private ["_playa"];
	_playa = _this select 0;
	_playa action ["SwitchWeapon", _playa, _playa, 100];
};
Blue_SwitchMove = {
    private["_object","_anim"];
    _object = _this select 0;
    _anim = _this select 1;
    _object switchMove _anim;
    
};
Blue_Libary_Init_Complete = true;