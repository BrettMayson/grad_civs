params [
    ["_plain", ""],
    ["_structured", ""]
];

if (_structured == "") then {
    _structured = _plain;
};

[_structured] call ace_common_fnc_displayTextStructured;
systemChat _plain; // TODO create a separate channel for grad-civs

