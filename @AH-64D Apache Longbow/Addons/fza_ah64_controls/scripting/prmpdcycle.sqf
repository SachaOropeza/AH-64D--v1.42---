_heli = _this select 0;

if ([_heli, 1] call fza_fnc_mpdGetCurrentDisplay == "tsd") exitwith {
    [_heli, 1, "fcr"] call fza_ah64_mpdSetDisplay;
};
if ([_heli, 1] call fza_fnc_mpdGetCurrentDisplay == "fcr") exitwith {
    [_heli, 1, "wca"] call fza_ah64_mpdSetDisplay;
};
if ([_heli, 1] call fza_fnc_mpdGetCurrentDisplay == "wca") exitwith {
    [_heli, 1, "ase"] call fza_ah64_mpdSetDisplay;
};
if ([_heli, 1] call fza_fnc_mpdGetCurrentDisplay == "ase") exitwith {
    [_heli, 1, "eng"] call fza_ah64_mpdSetDisplay;
};
if ([_heli, 1] call fza_fnc_mpdGetCurrentDisplay == "eng") exitwith {
    [_heli, 1, "tsd"] call fza_ah64_mpdSetDisplay;
};