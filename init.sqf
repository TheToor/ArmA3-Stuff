Blue_Libary_Init_Complete = false;
Blue_Load_Init_Complete = false;

execVM "AddIns\Blue_MainLibary\init.sqf";
waitUntil { Blue_Libary_Init_Complete };
execVM "AddIns\Blue_Load\init.sqf";
waitUntil { Blue_Load_Init_Complete };

hint "Loaded";