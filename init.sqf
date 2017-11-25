Blue_Library_Init_Complete = false;
Blue_Load_Init_Complete = false;

execVM "AddIns\Blue_MainLibrary\init.sqf";
waitUntil { Blue_Library_Init_Complete };
execVM "AddIns\Blue_Load\init.sqf";
waitUntil { Blue_Load_Init_Complete };

hint "Loaded";