#include "\fza_ah64_controls\headers\script_common.hpp"
#include "\fza_ah64_controls\headers\selections.h"
params ["_heli", "_system", "_control"];

switch(_control) do {
	case "m": {
		[_heli, 0, "wca"] call fza_ah64_mpdSetDisplay;
	};
};