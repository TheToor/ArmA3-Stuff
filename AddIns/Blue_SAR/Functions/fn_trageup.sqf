private["_heli","_ropehelper","_trage"];
_heli = _this select 3;
_trage = _heli getVariable "Trage";
deleteVehicle _trage;
_heli setVariable ["Trage",nil,true];
_heli setVariable ["TrageStatus",false,true];