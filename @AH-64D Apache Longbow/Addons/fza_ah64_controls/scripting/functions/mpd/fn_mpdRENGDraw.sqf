#include "\fza_ah64_controls\headers\selections.h"
params ["_heli"];

_tgtTapeScaler = [
    [0, 0],
    [400, 0.10],
    [810, 0.60],
    [811, 0.70],
    [999, 1.00]
];
_npTapeScaler = [
    [0, 0],
    [96, 0.43],
    [99, 0.50],
    [100, 0.55],
    [102, 0.61],
    [105, 0.89],
    [120, 1.00]
];

// #region ROTORS
 
_rotorRpm = if (!(isObjectRTD _heli) || (_heli getVariable "fza_ah64_engineStates")# 0# 0 in ["OFF", "OFFSTARTED", "STARTEDOFF", "STARTED", "STARTEDIDLE", "IDLEOFF"] || (_heli getVariable "fza_ah64_engineStates")# 1# 0 in ["OFF", "OFFSTARTED", "STARTEDOFF", "STARTED", "STARTEDIDLE", "IDLEOFF"]) then {
	_rotorRpm = _e1percent max _e2percent;
} else {
	_rotorRpm = (rotorsRpmRTD _heli # 0) / 2.89;
};

private _rotorRpmChar = "\fza_ah64_us\tex\char\g";
private _rotorRpmTape = "\fza_ah64_us\tex\mpd\Gtape.paa";

if (_rotorRpm >= 106 && _rotorRpm < 110) then {
	_rotorRpmChar = "\fza_ah64_us\tex\char\Y";
	_rotorRpmTape = "\fza_ah64_us\tex\mpd\Ytape.paa";
};
if (_rotorRpm < 94 || _rotorRpm >= 110) then {
	_rotorRpmChar = "\fza_ah64_us\tex\char\g";
	_rotorRpmTape = "\fza_ah64_us\tex\mpd\Rtape.paa";
};

[_heli, _rotorRpm, SEL_DIGITS_MPD_PR_ENG_RRPM, _rotorRpmChar] call fza_fnc_drawNumberSelections;
_heli setObjectTexture [SEL_MPD_PR_ENG_RTRRPMB, _rotorRpmTape];

// #endregion

// #region ENGINE 1
_e1data = [_heli, 0] call fza_fnc_engineGetData;
_e1percent = (_e1data select 0) / 209.0;
_e1ng = (_e1data select 1) * 10;
_e1tgt = _e1data select 2;
_e1opsi = _e1data select 3;
_e1trq = (_e1data select 4) / 4.81;

// #region TORQUE
private _e1trqChar = "\fza_ah64_us\tex\char\g";
private _e1trqTape = "\fza_ah64_us\tex\mpd\Gtape.paa";

if (_e1trq > 101 && _e1trq <= 115) then {
	_e1trqChar = "\fza_ah64_us\tex\char\y";
	_e1trqTape = "\fza_ah64_us\tex\mpd\Ytape.paa";
};
if (_e1trq > 115) then {
	_e1trqChar = "\fza_ah64_us\tex\char\r";
	_e1trqTape = "\fza_ah64_us\tex\mpd\Rtape.paa";
};
[_heli, _e1trq, SEL_DIGITS_MPD_PR_ENG_1TRQ, _rotorRpmChar] call fza_fnc_drawNumberSelections;
_heli setObjectTexture [SEL_MPD_PR_ENG_1TRQB, _e1trqTape];
// #endregion

// #region RPM
private _e1percentChar = "\fza_ah64_us\tex\char\g";
private _e1percentTape = "\fza_ah64_us\tex\mpd\Gtape.paa";

if (_e1percent >= 106 && _e1percent < 110) then {
	_e1percentChar = "\fza_ah64_us\tex\char\y";
	_e1percentTape = "\fza_ah64_us\tex\mpd\Ytape.paa";
};
if (_e1percent < 94 || _e1percent >= 110) then {
	_e1percentChar = "\fza_ah64_us\tex\char\g";
	_e1percentTape = "\fza_ah64_us\tex\mpd\Rtape.paa";
};
[_heli, _e1percent, SEL_DIGITS_MPD_PR_ENG_1NP, _e1percentChar] call fza_fnc_drawNumberSelections;
_heli setObjectTexture [SEL_MPD_PR_ENG_1NPB, _e1percentTape];
// #endregion

// #region TGT
private _e1tgtChar = "\fza_ah64_us\tex\char\g";
private _e1tgtTape = "\fza_ah64_us\tex\mpd\Gtape.paa";

if (_e1tgt > 811 && _e1tgt < 949) then {
	_e1tgtChar = "\fza_ah64_us\tex\char\y";
    _e1tgtTape = "\fza_ah64_us\tex\mpd\Ytape.paa";
};
if (_e1tgt >= 940) then {
	_e1tgtChar = "\fza_ah64_us\tex\char\r";
    _e1tgtTape = "\fza_ah64_us\tex\mpd\Rtape.paa";
};

[_heli, _e1tgt, SEL_DIGITS_MPD_PR_ENG_1TGT, _e1tgtChar] call fza_fnc_drawNumberSelections;
_heli setObjectTexture [SEL_MPD_PR_ENG_1TGTB, _e1tgtTape];
// #endregion

// #region NG
private _e1ngchar = "\fza_ah64_us\tex\char\g";
if (_e1ng > 1023 && _e1ng < 1051) then {
	_e1ngchar = "\fza_ah64_us\tex\char\y";
};
if (_e1ng < 630 || _e1ng > 1051) then {
	_e1ngchar = "\fza_ah64_us\tex\char\r";
};

[_heli, _e1ng, SEL_DIGITS_MPD_PR_ENG_E1NG, _e1ngchar] call fza_fnc_drawNumberSelections;
// #endregion

// #endregion

// #region ENGINE 2
_e2data = [_heli, 1] call fza_fnc_engineGetData;
_e2percent = (_e2data select 0) / 209.0;
_e2ng = (_e2data select 1) * 10;
_e2tgt = _e2data select 2;
_e2opsi = _e2data select 3;
_e2trq = (_e2data select 4) / 4.81;

// #region TORQUE
private _e2trqChar = "\fza_ah64_us\tex\char\g";
private _e2trqTape = "\fza_ah64_us\tex\mpd\Gtape.paa";

if (_e2trq > 101 && _e2trq <= 115) then {
	_e2trqChar = "\fza_ah64_us\tex\char\y";
	_e2trqTape = "\fza_ah64_us\tex\mpd\Ytape.paa";
};
if (_e2trq > 115) then {
	_e2trqChar = "\fza_ah64_us\tex\char\r";
	_e2trqTape = "\fza_ah64_us\tex\mpd\Rtape.paa";
};
[_heli, _e2trq, SEL_DIGITS_MPD_PR_ENG_2TRQ, _rotorRpmChar] call fza_fnc_drawNumberSelections;
_heli setObjectTexture [SEL_MPD_PR_ENG_2TRQB, _e2trqTape];
// #endregion

// #region RPM
private _e2percentChar = "\fza_ah64_us\tex\char\g";
private _e2percentTape = "\fza_ah64_us\tex\mpd\Gtape.paa";

if (_e2percent >= 106 && _e2percent < 110) then {
	_e2percentChar = "\fza_ah64_us\tex\char\y";
	_e2percentTape = "\fza_ah64_us\tex\mpd\Ytape.paa";
};
if (_e2percent < 94 || _e2percent >= 110) then {
	_e2percentChar = "\fza_ah64_us\tex\char\g";
	_e2percentTape = "\fza_ah64_us\tex\mpd\Rtape.paa";
};
[_heli, _e2percent, SEL_DIGITS_MPD_PR_ENG_2NP, _e2percentChar] call fza_fnc_drawNumberSelections;
_heli setObjectTexture [SEL_MPD_PR_ENG_2NPB, _e2percentTape];
// #endregion

// #region TGT
private _e2tgtChar = "\fza_ah64_us\tex\char\g";
private _e2tgtTape = "\fza_ah64_us\tex\mpd\Gtape.paa";

if (_e2tgt > 811 && _e2tgt < 949) then {
	_e2tgtChar = "\fza_ah64_us\tex\char\y";
    _e2tgtTape = "\fza_ah64_us\tex\mpd\Ytape.paa";
};
if (_e2tgt >= 940) then {
	_e2tgtChar = "\fza_ah64_us\tex\char\r";
    _e2tgtTape = "\fza_ah64_us\tex\mpd\Rtape.paa";
};

[_heli, _e2tgt, SEL_DIGITS_MPD_PR_ENG_2TGT, _e2tgtChar] call fza_fnc_drawNumberSelections;
_heli setObjectTexture [SEL_MPD_PR_ENG_2TGTB, _e2tgtTape];
// #endregion

// #region NG
private _e2ngchar = "\fza_ah64_us\tex\char\g";
if (_e2ng > 1023 && _e2ng < 1051) then {
	_e2ngchar = "\fza_ah64_us\tex\char\y";
};
if (_e2ng < 630 || _e2ng > 1051) then {
	_e2ngchar = "\fza_ah64_us\tex\char\r";
};

[_heli, _e2ng, SEL_DIGITS_MPD_PR_ENG_E2NG, _e2ngchar] call fza_fnc_drawNumberSelections;
// #endregion

// #endregion

if (getpos _heli select 2 > 1) then {
	_heli setObjectTexture [SEL_MPD_PR_ENG_OIL1PSI1, ""];
	_heli setObjectTexture [SEL_MPD_PR_ENG_OIL1PSI2, ""];
	_heli setObjectTexture [SEL_MPD_PR_ENG_OIL1PSI3, ""];
	_heli setObjectTexture [SEL_MPD_PR_ENG_OIL2PSI1, ""];
	_heli setObjectTexture [SEL_MPD_PR_ENG_OIL2PSI2, ""];
	_heli setObjectTexture [SEL_MPD_PR_ENG_OIL2PSI3, ""];

	[_heli, 2970, SEL_DIGITS_MPD_PR_ENG_1PRIPSI, "\fza_ah64_us\tex\char\g"] call fza_fnc_drawNumberSelections;
	[_heli, 2970, SEL_DIGITS_MPD_PR_ENG_1UTIPSI, "\fza_ah64_us\tex\char\g"] call fza_fnc_drawNumberSelections;
	[_heli, 3000, SEL_DIGITS_MPD_PR_ENG_1ACCPSI, "\fza_ah64_us\tex\char\g"] call fza_fnc_drawNumberSelections;
	_heli setObjectTexture [SEL_MPD_PR_ENG_PRIPSI1, ""];
	_heli setObjectTexture [SEL_MPD_PR_ENG_PRIPSI2, ""];
	_heli setObjectTexture [SEL_MPD_PR_ENG_PRIPSI3, ""];
	_heli setObjectTexture [SEL_MPD_PR_ENG_UTIPSI1, ""];
	_heli setObjectTexture [SEL_MPD_PR_ENG_UTIPSI2, ""];
	_heli setObjectTexture [SEL_MPD_PR_ENG_UTIPSI3, ""];
	_heli setObjectTexture [SEL_MPD_PR_ENG_ACCPSI1, ""];
	_heli setObjectTexture [SEL_MPD_PR_ENG_ACCPSI2, ""];
	_heli setObjectTexture [SEL_MPD_PR_ENG_ACCPSI3, ""];
} else {
	// #region ENGINE 1 OIL PSI
	private _e1opsiChar = "\fza_ah64_us\tex\char\g";
	if (_e1opsi < 20 || _e1opsi > 95) then {
		_e1opsiChar = "\fza_ah64_us\tex\char\r";
	};
	[_heli, _e1opsi, SEL_DIGITS_MPD_PR_ENG_OIL1PSI, _e1opsiChar] call fza_fnc_drawNumberSelections;
	// #endregion

	// #region ENGINE 1 OIL PSI
	private _e2opsiChar = "\fza_ah64_us\tex\char\g";
	if (_e2opsi < 20 || _e2opsi > 95) then {
		_e2opsiChar = "\fza_ah64_us\tex\char\r";
	};
	[_heli, _e2opsi, SEL_DIGITS_MPD_PR_ENG_OIL2PSI, _e2opsiChar] call fza_fnc_drawNumberSelections;
	// #endregion

	[_heli, 2970, SEL_DIGITS_MPD_PR_ENG_PRIPSI, "\fza_ah64_us\tex\char\g"] call fza_fnc_drawNumberSelections;
	[_heli, 2970, SEL_DIGITS_MPD_PR_ENG_UTIPSI, "\fza_ah64_us\tex\char\g"] call fza_fnc_drawNumberSelections;
	[_heli, 3000, SEL_DIGITS_MPD_PR_ENG_ACCPSI, "\fza_ah64_us\tex\char\g"] call fza_fnc_drawNumberSelections;
	_heli setObjectTexture [SEL_MPD_PR_ENG_1PRIPSI1, ""];
	_heli setObjectTexture [SEL_MPD_PR_ENG_1PRIPSI2, ""];
	_heli setObjectTexture [SEL_MPD_PR_ENG_1PRIPSI3, ""];
	_heli setObjectTexture [SEL_MPD_PR_ENG_1UTIPSI1, ""];
	_heli setObjectTexture [SEL_MPD_PR_ENG_1UTIPSI2, ""];
	_heli setObjectTexture [SEL_MPD_PR_ENG_1UTIPSI3, ""];
	_heli setObjectTexture [SEL_MPD_PR_ENG_1ACCPSI1, ""];
	_heli setObjectTexture [SEL_MPD_PR_ENG_1ACCPSI2, ""];
	_heli setObjectTexture [SEL_MPD_PR_ENG_1ACCPSI3, ""];
};

if (local _heli) then {
	_heli animate["mpd_pr_eng_e1trq", _e1trq / 130.0];
	_heli animate["mpd_pr_eng_e2trq", _e2trq / 130.0];
	_heli animate["mpd_pr_eng_1tgt", ([_tgtTapeScaler, _e1tgt] call fza_fnc_linearInterp)# 1];
	_heli animate["mpd_pr_eng_2tgt", ([_tgtTapeScaler, _e2tgt] call fza_fnc_linearInterp)# 1];
	_heli animate["mpd_pr_eng_e1np", ([_npTapeScaler, _e1percent] call fza_fnc_linearInterp)# 1];
	_heli animate["mpd_pr_eng_e2np", ([_npTapeScaler, _e2percent] call fza_fnc_linearInterp)# 1];

	_heli animate["mpd_pr_eng_rtrrpm", ([_npTapeScaler, _rotorrpm] call fza_fnc_linearInterp)# 1];
};