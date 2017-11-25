private["_heli","_patient","_trage"];
_heli = _this select 3;
_trage = _heli getVariable "Trage";
_patient = player getVariable "SelectedPatient";
if(!(isNil "_patient")) then {
	_patient playMoveNow "Unconscious";
	_patient attachTo [_trage,[0,0,0]];
	sleep 0.5;
	_patient setDir (getDir _heli);
};