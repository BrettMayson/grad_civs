#include "..\script_component.hpp"

INFO("initConfig running...");

private _settingsGroup = ["GRAD Civs", "2) basics"];

[
    QGVAR(civClasses),
    "EDITBOX",
    "Unit classes to use for spawning civilians",
    _settingsGroup,
    "C_Man_1",
    true,
    {},
    false
] call CBA_fnc_addSetting;