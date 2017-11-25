Blue Lift System by (C) BlueFire

/////////////////////////////////////////////////////////////////////

Needed for Blue_Lift:
	
	Blue_MainLibary

/////////////////////////////////////////////////////////////////////

Installation:
	
	add to init.sqf:

	0 = execVM "AddIns\Blue_Lift\pre_init.sqf";



	add to initServer.sqf:

	waitUntil { Blue_Lift_Init_Complete };
	[VEHICLENAME] execVM "AddIns\Blue_Lift\init.sqf";