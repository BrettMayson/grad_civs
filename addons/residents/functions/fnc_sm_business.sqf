#include "..\script_component.hpp"

params [
    ["_business", locationNull, [locationNull]]
];
assert(!(isNull _business));

private _bus_rally = "bus_rally";

/*
 * residence-cycle: housework, meetNeighbor, chat
 *
 *
 */
private _bus_housework = [
    _business,
    {},
    { _this call FUNC(sm_business_state_housework_enter) },
    { _this call FUNC(sm_business_state_housework_exit) },
    "bus_housework"
] call EFUNC(cba_statemachine,addState);

private _bus_meetNeighbor = [
    _business,
     { _this call FUNC(sm_business_state_meetNeighbor_loop) },
     { _this call FUNC(sm_business_state_meetNeighbor_enter) },
     { _this call FUNC(sm_business_state_meetNeighbor_exit) },
     "bus_meetNeighbor"
] call EFUNC(cba_statemachine,addState);

private _bus_chat = [
    _business,
    { _this call FUNC(sm_business_state_chat_loop) },
    { _this call FUNC(sm_business_state_chat_enter) },
    { _this call FUNC(sm_business_state_chat_exit) },
    "bus_chat"
] call EFUNC(cba_statemachine,addState);

    // TRANSITIONS housework:

assert ([
    _business,
    _bus_rally, _bus_housework,
    { _this call FUNC(sm_business_trans_rally_housework_condition) },
    {},
    _bus_rally + _bus_housework
] call EFUNC(cba_statemachine,addTransition));

assert ([
    _business,
    _bus_housework, _bus_meetNeighbor,
    { _this call FUNC(sm_business_trans_housework_meetNeighbor_condition) },
    {},
    _bus_housework + _bus_meetNeighbor
] call EFUNC(cba_statemachine,addTransition));

assert ([
    _business,
    _bus_meetNeighbor, _bus_chat,
    { _this call FUNC(sm_business_trans_meetNeighbor_chat_condition) },
    {},
    _bus_meetNeighbor + _bus_chat
] call EFUNC(cba_statemachine,addTransition));

assert ([
    _business,
    _bus_chat, _bus_housework,
    { _this call FUNC(sm_business_trans_chat_housework_condition) },
    {},
    _bus_chat + _bus_housework
] call EFUNC(cba_statemachine,addTransition));

assert ([
    _business,
    _bus_housework, _bus_housework,
    { _this call FUNC(sm_business_trans_housework_housework_condition) },
    {},
    _bus_housework + _bus_housework
] call EFUNC(cba_statemachine,addTransition));

_business
