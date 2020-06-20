#include "\fza_ah64_controls\headers\script_common.hpp"
params ["_heli", "_system", "_control"];

switch (_control) do {
	case "floodlight": {

		if (fza_ah64_backlights == 0 && _heli animationphase "plt_batt" > 0.5) then {

			_heli setobjecttexture[1190, "\fza_ah64_us\tex\in\dlt.paa"];
			_heli setobjecttexture[1191, "\fza_ah64_us\tex\in\pushbut.paa"];

			_floodplt = "#lightpoint"
			createVehicle position _heli;
			_floodplt setLightIntensity 60;
			_floodplt setLightColor[0.306, 0.878, 0.349];
			_floodplt setLightAttenuation[0, 1, 1, 2, 0.50, 1];
			_floodplt attachTo[_heli, [0, 0, 0], "plt_memflood"];

			_floodcpg = "#lightpoint"
			createVehicle position _heli;
			_floodcpg setLightIntensity 60;
			_floodcpg setLightColor[0.306, 0.878, 0.349];
			_floodcpg setLightAttenuation[0, 1, 1, 2, 0.50, 1];
			_floodcpg attachTo[_heli, [0, 0, 0], "cpg_memflood"];

			_heli setVariable["fza_ah64_floodlight_plt", _floodplt, true];
			_heli setVariable["fza_ah64_floodlight_cpg", _floodcpg, true];

			fza_ah64_backlights = 1;

		} else {
			_heli setobjecttexture[1190, ""];
			_heli setobjecttexture[1191, ""];

			deleteVehicle(_heli getVariable["fza_ah64_floodlight_plt", objnull]);
			deleteVehicle(_heli getVariable["fza_ah64_floodlight_cpg", objnull]);

			fza_ah64_backlights = 0;

		};

		fza_ah64_l1clicked = 1;
		_clicksound = ["fza_ah64_button_rotary", 0.5];
	};
	case "anticollision": {
		if (_heli animationphase "plt_anticollision" < 1 && _heli animationphase "plt_batt" > 0.5) then {
			_heli animate["plt_anticollision", 1];
			_heli setCollisionLight true;
		} else {
			_heli animate["plt_anticollision", 0];
			_heli setCollisionLight false;
		};
        ["fza_ah64_switch_flip4", 0.1] execvm "\fza_ah64_controls\scripting\damage\dam_bt_audio.sqf";
	};
}