#include "\fza_ah64_controls\headers\script_common.hpp"
#include "\fza_ah64_controls\headers\selections.h"
params ["_heli", "_system", "_control"];

switch(_control) do {
	case "t1": {
		fza_ah64_fcrcscope = fza_ah64_fcrcscope + 1;
		if (fza_ah64_fcrcscope > 1) then {
			fza_ah64_fcrcscope = 0;
		};
	};
	case "tsd": {
		[_heli, 1, "tsd"] call fza_ah64_mpdSetDisplay;
	};
	case "m": {
		[_heli, 1, "dms"] call fza_ah64_mpdSetDisplay;
	};
};