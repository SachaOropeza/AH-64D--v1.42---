if (fza_ah64_nohelpers == 1) exitwith {
    fza_ah64_nohelpers = 0;
    player vehiclechat "Crosshair Helpers OFF";
};
if (fza_ah64_nohelpers == 0) exitwith {
    fza_ah64_nohelpers = 1;
    player vehiclechat "Crosshair Helpers ON";
};