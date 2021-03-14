//MASTER INIT FOR AH-64D PROJECT
#include "\fza_ah64_controls\headers\selections.h"
_heli = _this select 0;

if (!(isNil "fza_ah64_noinit")) exitwith {};

if !(_heli getVariable ["fza_ah64_aircraftInitialised", false]) then {
    _heli setVariable ["fza_ah64_aircraftInitialised", true, true];
    _heli selectweapon "fza_ma_safe";
    _heli animate["pdoor", 1];
    _heli animate["gdoor", 1];
    _heli animate["plt_rtrbrake", 1];
    _heli animate["plt_firesw", 0.5];
    _heli animate["cpg_firesw", 0.5];
    _heli animate["tads_stow", 1];
    _heli setVariable ["fza_ah64_estarted", false, true];
    _heli setVariable ["fza_ah64_agmode", 0, true];
    _heli setVariable ["fza_ah64_pfzs", [[],[],[],[],[],[],[],[]], true];
    _heli setVariable ["fza_ah64_pfz_count", 0, true];
    _heli setVariable ["fza_ah64_curwpnum", 0, true];
    _heli setVariable ["fza_ah64_waypointdata", [getPos _heli], true];
    _heli setVariable ["fza_ah64_acq_plt", 3, true];
    _heli setVariable ["fza_ah64_acq_cpg", 3, true];
    _heli setVariable ["fza_ah64_hmdfsmode", "trans", true];
    _heli setVariable ["fza_ah64_ltype", "TopDown", true];
    _heli setVariable ["fza_ah64_shotat_list", [], true];
    _heli setVariable ["fza_ah64_shotmissile_list", [], true];
    _heli setVariable ["fza_ah64_tsdsort", 0, true];
    _heli setVariable ["fza_ah64_currentLase", objNull, true];
    _heli setVariable ["fza_ah64_currentSkippedLases", [], true];
    _heli setVariable ["fza_ah64_irjamfail", false, true];
    _heli setVariable ["fza_ah64_rfjamfail", false, true];
    _heli setVariable ["fza_ah64_apu_fire", false, true];
    _heli setVariable ["fza_ah64_e1_fire", false, true];
    _heli setVariable ["fza_ah64_e2_fire", false, true];
    _heli setVariable ["fza_ah64_firepdisch", false, true];
    _heli setVariable ["fza_ah64_firerdisch", false, true];
};
_heli setVariable ["fza_ah64_aseautopage", 0];
_heli setVariable ["fza_ah64_mpdPage", ["OFF", "OFF"]];
_heli setVariable ["fza_ah64_mpdCurrPage", ["OFF", "OFF"]];
_heli setVariable ["fza_ah64_burst_limit", 10];
_heli setVariable ["fza_ah64_fcrcscope", false];
_heli setVariable ["fza_ah64_ihadssoff", 1];
_heli setVariable ["fza_ah64_ihadss_pnvs_cam", false];
_heli setVariable ["fza_ah64_ihadss_pnvs_day", true];
_heli setVariable ["fza_ah64_monocleinbox", true];
_heli setVariable ["fza_ah64_mpdbrightness", 1];
_heli setVariable ["fza_ah64_rangesetting", 0.001]; //1km
_heli setVariable ["fza_ah64_rocketsalvo", 1];
_heli setVariable ["fza_ah64_tsdmode", "nav"];
_heli setVariable ["fza_ah64_fire1arm", 0];
_heli setVariable ["fza_ah64_fire2arm", 0];
_heli setVariable ["fza_ah64_fireapuarm", 0];

[_heli] call fza_fnc_engineInit;

//DEFAULT WEIGHT 

if ((weightRTD _heli select 3) == 0) then {
    if (typeof _heli == "fza_ah64d_b2e") then {
        _heli setCustomWeightRTD 295;
    };
};
_heli enableVehicleSensor ["ActiveRadarSensorComponent", _heli animationPhase "fcr_enable" == 1];
_heli setCustomWeightRTD ([0, 295] select (_heli animationPhase "fcr_enable" == 1));

_aiturrets = [_heli] execvm "\fza_ah64_controls\scripting\turrets.sqf";
_blades = [_heli] execvm "\fza_ah64_controls\scripting\bladerot.sqf";

while {
    alive _heli
}
do {
    if ((!isNull (_heli getVariable["fza_ah64_floodlight_cpg", objNull]) || (!isNull (_heli getVariable["fza_ah64_floodlight_plt", objNull]))) && _heli animationphase "plt_batt" < 0.5) then {

        _heli setobjecttexture [SEL_IN_BACKLIGHT, ""];
        _heli setobjecttexture [SEL_IN_BACKLIGHT2, ""];

        deleteVehicle(_heli getVariable["fza_ah64_floodlight_plt", objnull]);
        deleteVehicle(_heli getVariable["fza_ah64_floodlight_cpg", objnull]);
    };
    _magsp = _heli magazinesturret[-1];

    if (local _heli) then {
        _tadsShouldBeStowed = _heli animationphase "plt_apu" < 1 && !isEngineOn _heli;
        
        if (_tadsShouldBeStowed && _heli animationPhase "tads_stow" == 0) then {
            _heli animate ["tads_stow", 1];
        };
        if (!_tadsShouldBeStowed && _heli animationPhase "tads_stow" == 1) then {
            _heli animate ["tads_stow", 0];
        };
    };
};