#include "..\script_component.hpp"

private _civClass = [QGVAR(civClass)] call CBA_settings_fnc_get;

private _carryOnAction = [
    QGVAR(carryOnAction),
    "carry on with your business",
    "", // icon
    FUNC(interact_carryOnAction),
    FUNC(interact_carryOnCondition)
] call ace_interact_menu_fnc_createAction;
[
    _civClass,
    0,
    ["ACE_MainActions"],
    _carryOnAction,
    true
] call ace_interact_menu_fnc_addActionToClass;

private _backUpAction = [
    QGVAR(carryOnAction),
    "back up your vehicle!",
    "", // icon
    FUNC(interact_backUpAction),
    FUNC(interact_backUpCondition)
] call ace_interact_menu_fnc_createAction;
[
    _civClass,
    0,
    ["ACE_MainActions"],
    _backUpAction,
    true
] call ace_interact_menu_fnc_addActionToClass;