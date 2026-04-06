-- Decompiled with Velocity Script Decompiler
local getfenv = getfenv
local debug = debug
local table = table
local string = string
local tick = tick
local tostring = tostring
local newproxy = newproxy
local script = script
local game = game
local math = math
local warn = warn
local Instance = Instance
local coroutine = coroutine
local task = task
local type = type
local typeof = typeof
local select = select
local pcall = pcall
local xpcall = xpcall
local getmetatable = getmetatable
local collectgarbage = collectgarbage
local gcinfo = gcinfo

GlobalString = "Akinator: You are either using getsenv() or a decompiler you did not make"
GlobalFrozenTable = table.freeze({})
UselessTablexD = {}
local function DevMessage(p23)
	-- upvalues: (copy) table
	local v24 = UselessTablexD
	table.insert(v24, p23)
end
DevMessage("Hi, we meet again! Remember decompiling scripts doesn\'t make you special.")
DevMessage("Still looking?")
DevMessage("There\'s a whole entire world waiting out there for you.")
script.Name = "LocalScript"
script:Destroy()
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local LogService = game:GetService("LogService")
local ScriptContext = game:GetService("ScriptContext")
local ContentProvider = game:GetService("ContentProvider")
--game:GetService("MarketplaceService")
local ServerScriptService = game:GetService("ServerScriptService")
local ServerStorage = game:GetService("ServerStorage")
local UserInputService = game:GetService("UserInputService")
local Chat = game:GetService("Chat")
local StarterGui = game:GetService("StarterGui")
local TextChatService = game:GetService("TextChatService")
local GuiService = game:GetService("GuiService")
local CollectionService = game:GetService("CollectionService")
--game:GetService("SoundService")
local LocalPlayer = Players.LocalPlayer
local IsStudio = RunService:IsStudio() or game.JobId == "00000000-0000-0000-0000-000000000000"
local TableFreeze = table.freeze
local BastionRawConfiguration = {
	["RemoteKey"] = "Please stop looking...",
	["DefaultKickReason"] = "Exploiting\nIf you believe this is a mistake, please contact a developer.",
	["ServiceObfuscation"] = table.freeze({
		["Enabled"] = false,
		["ServicesToIgnore"] = table.freeze({
			"Workspace",
			"Players",
			"Lighting",
			"ReplicatedFirst",
			"ReplicatedStorage",
			"StarterGui",
			"StarterPack",
			"StarterPlayer",
			"SoundService"
		})
	})
}

local What2DetectConfig = {
	["AWPExecutorDetection"] = table.freeze({
		["Enabled"] = false,
		["HeatLimit"] = 11,
		["Punishments"] = table.freeze({
			["DamageDisable"] = false,
			["Kick"] = false,
			["Ban"] = false
		})
	}),
	["AntiServerOnlyServiceTamper"] = table.freeze({
		["Enabled"] = true,
		["Punishments"] = table.freeze({
			["DamageDisable"] = false,
			["Kick"] = false,
			["Ban"] = true
		})
	}),
	["AntiBTools"] = table.freeze({
		["Enabled"] = true,
		["Punishments"] = table.freeze({
			["DamageDisable"] = false,
			["Kick"] = false,
			["Ban"] = true
		})
	}),
	["AntiProximityPromptTamper"] = table.freeze({
		["Enabled"] = true,
		["Punishments"] = table.freeze({
			["DamageDisable"] = false,
			["Kick"] = false,
			["Ban"] = true
		})
	}),
	["AntiInfiniteJump"] = table.freeze({
		["Enabled"] = false,
		["HeatLimit"] = 40,
		["Punishments"] = table.freeze({
			["DamageDisable"] = false,
			["Kick"] = false,
			["Ban"] = false
		})
	}),
	["InfiniteYieldDetection"] = table.freeze({
		["Enabled"] = true,
		["MainDetection"] = false,
		["FlyDetection"] = true,
		["AntiVoidDetection"] = false,
		["Punishments"] = table.freeze({
			["DamageDisable"] = false,
			["Kick"] = false,
			["Ban"] = true
		})
	}),
	["DexExplorerDetection"] = table.freeze({
		["Enabled"] = true,
		["Punishments"] = table.freeze({
			["DamageDisable"] = false,
			["Kick"] = true,
			["Ban"] = false
		}),
		["HeatLimit"] = 5
	}),
	["CMDXDetection"] = table.freeze({
		["Enabled"] = true,
		["Punishments"] = table.freeze({
			["DamageDisable"] = false,
			["Kick"] = false,
			["Ban"] = true
		})
	}),
	["PlayerGuiDetections"] = table.freeze({
		["Enabled"] = true,
		["Punishments"] = table.freeze({
			["DamageDisable"] = false,
			["Kick"] = false,
			["Ban"] = true
		})
	}),
	["OutputDetection"] = table.freeze({
		["Enabled"] = true,
		["TracelessErrorDetection"] = table.freeze({
			["Enabled"] = true,
			["Punishments"] = table.freeze({
				["DamageDisable"] = false,
				["Kick"] = false,
				["Ban"] = true
			})
		}),
		["Punishments"] = table.freeze({
			["DamageDisable"] = false,
			["Kick"] = false,
			["Ban"] = true
		}),
		["BlacklistedStrings"] = table.freeze({
			"saveinstance",
			"Save Json Error",
			"Overwriting Safe File",
			"getscriptbytecode",
			"decompile",
			"vulnerable function",
			"MessageBusService",
			"Backdoor",
			"string.dump",
			"loadfile",
			"Script \'load\'",
			"Message: icon is not a valid member of Frame \"1\"",
			"std::string",
			"load:0:",
			"%[exec%]",
			"Script \'load\', Line 0",
			"Script \"load\", Line 0",
			"Script \"%[string \"",
			"Script \'\'",
			"Script \"\"",
			"%[string \"",
			"Cannot require a non-RobloxScript module from a RobloxScript",
			"ModuleScript not supported",
			"Xeno Notification",
			"ThirdPartyUserService",
			"Nezur"
		})
	}),
	["AssetDetections"] = table.freeze({
		["Enabled"] = true,
		["Punishments"] = table.freeze({
			["DamageDisable"] = false,
			["Kick"] = false,
			["Ban"] = true
		}),
		["Detectors"] = table.freeze({
			["DeltaExecutor"] = table.freeze({
				["Disabled"] = false,
				["LogMessage"] = "Delta detected",
				["Assets"] = table.freeze({ "rbxassetid://13365156882", "rbxassetid://13363121645", "rbxassetid://13365407660" })
			}),
			["OrionLibrary"] = table.freeze({
				["Disabled"] = false,
				["LogMessage"] = "Orion Library detected",
				["Assets"] = table.freeze({ "rbxassetid://8834748103", "rbxassetid://3944703587" })
			}),
			["DexExplorerModels"] = table.freeze({
				["LogMessage"] = "Dex Explorer detected",
				["Assets"] = table.freeze({ "rbxassetid://492004769", "rbxassetid://418957341", "rbxassetid://3567096419" })
			}),
			["DexExplorerImages"] = table.freeze({
				["Disabled"] = false,
				["LogMessage"] = "Dex Explorer detected",
				["Assets"] = table.freeze({
					"rbxassetid://765660635",
					"rbxassetid://529659138",
					"rbxassetid://418957341",
					"rbxassetid://474172996",
					"rbxassetid://588745174",
					"rbxassetid://476354004",
					"rbxassetid://2764171053",
					"rbxassetid://5034718180",
					"rbxassetid://1427967925",
					"rbxassetid://5642310344",
					"rbxassetid://5642383285",
					"rbxassetid://5060023708",
					"rbxassetid://6511490623",
					"rbxassetid://6578871732",
					"rbxassetid://6578933307",
					"rbxassetid://6579106223"
				})
			}),
			["SimpleSpy"] = table.freeze({
				["Disabled"] = false,
				["LogMessage"] = "SimpleSpy detected",
				["Assets"] = table.freeze({
					"rbxassetid://6065821980",
					"rbxassetid://6065821086",
					"rbxassetid://6065821596",
					"rbxassetid://6065775281"
				})
			}),
			["InfiniteYield"] = table.freeze({
				["Disabled"] = false,
				["LogMessage"] = "Infinite Yield detected",
				["Assets"] = table.freeze({
					"rbxassetid://1204397029",
					"rbxassetid://3523243755",
					"rbxassetid://4911962991",
					"rbxassetid://5147488658",
					"rbxassetid://5147488592"
				})
			}),
			["Psyhub"] = table.freeze({
				["LogMessage"] = "Psyhub detected",
				["Assets"] = table.freeze({ "rbxassetid://3042778022" })
			}),
			["RoXploit"] = table.freeze({
				["LogMessage"] = "Ro-Xploit detected",
				["Assets"] = table.freeze({ "rbxassetid://175137115", "rbxassetid://288643567", "rbxassetid://364364477" })
			}),
			["RaptorHub"] = table.freeze({
				["LogMessage"] = "Raptor Hub detected",
				["Assets"] = table.freeze({ "rbxassetid://288646117" })
			}),
			["Hydroxide"] = table.freeze({
				["LogMessage"] = "Hydroxide detected",
				["Assets"] = table.freeze({ "rbxassetid://11389137937" })
			})
		})
	})
}
BastionRawConfiguration.MainDetectors = TableFreeze(What2DetectConfig)

local DSBBDetectors = {
	["AntiGravityTamper"] = table.freeze({
		["Enabled"] = true,
		["Punishments"] = table.freeze({
			["DamageDisable"] = false,
			["Kick"] = false,
			["Ban"] = true
		})
	}),
	["AntiHumanoidTamper"] = table.freeze({
		["Enabled"] = true,
		["Punishments"] = table.freeze({
			["DamageDisable"] = false,
			["Kick"] = false,
			["Ban"] = true
		}),
		["CheckInterval"] = 2,
		["RestrictedProperties"] = table.freeze({
			["WalkSpeed"] = table.freeze({
				["AllowedValue"] = 16
			}),
			["JumpPower"] = table.freeze({
				["AllowedValue"] = 50
			}),
			["JumpHeight"] = table.freeze({
				["AllowedValue"] = 7.199999809265137
			}),
			["UseJumpPower"] = table.freeze({
				["AllowedValue"] = true
			}),
			["MaxHealth"] = table.freeze({
				["AllowedValue"] = 100
			})
		})
	}),
	["AntiFallenPartsDestroyHeightTamper"] = table.freeze({
		["Enabled"] = true,
		["Punishments"] = table.freeze({
			["DamageDisable"] = false,
			["Kick"] = false,
			["Ban"] = true
		}),
		["NormalHeight"] = -500
	}),
	["AntiBodyMover"] = table.freeze({
		["Enabled"] = true,
		["Punishments"] = table.freeze({
			["DamageDisable"] = false,
			["Kick"] = false,
			["Ban"] = true
		}),
		["CheckInterval"] = 0.25
	}),
	["HBEDetection"] = table.freeze({
		["Enabled"] = true,
		["Punishments"] = table.freeze({
			["DamageDisable"] = false,
			["Kick"] = true,
			["Ban"] = false
		})
	}),
	["AntiCrucialPartsTamper"] = table.freeze({
		["Enabled"] = true,
		["Punishments"] = table.freeze({
			["DamageDisable"] = false,
			["Kick"] = false,
			["Ban"] = true
		}),
		["CrucialInstanceInfo"] = table.freeze({
			["Baseplates"] = #workspace:WaitForChild("Baseplates", 120):GetChildren(),
			["KillParts"] = #workspace:WaitForChild("KillParts", 120):GetChildren()
		})
	}),
	["MismatchMovementDetector"] = table.freeze({
		["Enabled"] = true,
		["Punishments"] = table.freeze({
			["DamageDisable"] = true,
			["Kick"] = false,
			["Ban"] = false
		}),
		["MaxFlags"] = 6,
		["MaxCount"] = 20,
		["FlagResetInterval"] = 240,
		["HookAttemptInterval"] = 0.2,
		["SurveyInterval"] = 0.5,
		["PhysicsStep"] = 0.016666666666666666,
		["AccuracyTable"] = table.freeze({
			table.freeze({
				["Accuracy"] = 1.5,
				["Minimum"] = -11,
				["Maximum"] = 14.7,
				["Flaggable"] = true
			}),
			table.freeze({
				["Accuracy"] = 0.9,
				["Minimum"] = -16,
				["Maximum"] = 15.3,
				["Flaggable"] = true
			}),
			table.freeze({
				["Accuracy"] = 0.6,
				["Minimum"] = -25,
				["Maximum"] = 15.6,
				["Flaggable"] = true
			}),
			table.freeze({
				["Accuracy"] = 0.25,
				["Minimum"] = -37,
				["Maximum"] = 13.8,
				["Flaggable"] = false
			}),
			table.freeze({
				["Accuracy"] = 0.12,
				["Minimum"] = -46,
				["Maximum"] = 11.9,
				["Flaggable"] = false
			}),
			table.freeze({
				["Accuracy"] = 0,
				["Minimum"] = -68,
				["Maximum"] = 8,
				["Flaggable"] = false
			})
		})
	})
}
BastionRawConfiguration.DSBBDetectors = TableFreeze(DSBBDetectors)
local BastionConfiguration = TableFreeze(BastionRawConfiguration)
local RandomTableIdk = {}
local TicksubtractOsClock = tick() - os.clock()
local Token = tostring(newproxy(false))
local Is16Letters = #string.sub(Token, 13, 28) == 16
local rng = Random.new()
local function HexStringy()
	-- upvalues: (copy) rng, (copy) string
	local Nothing = ""
	for i = 1, rng:NextInteger(15, 36) do
		Nothing = Nothing .. string.format("%x", rng:NextInteger(0, 15))
	end
	return Nothing
end
local function SafeCall(Callback)
	-- upvalues: (copy) select, (copy) xpcall, (copy) debug
	return select(2, xpcall(Callback, function()
		-- upvalues: (ref) debug
		return debug.info(2, "f")
	end))
end
local GetCallerFunction = SafeCall(function() --GIVE THESE "CALLER" functions a better name :sobL:
	-- upvalues: (copy) game
	return game:____()
end)
local SetCallerFunction = SafeCall(function()
	-- upvalues: (copy) game
	game.____ = nil
end)
local ReturnCallerFunction = SafeCall(function()
	-- upvalues: (copy) game
	return game.____
end)
local function IsThereAHook(p62)
	-- upvalues: (copy) newproxy, (copy) getmetatable, (copy) HexStringy, (copy) GetCallerFunction, (copy) game, (copy) pcall
	local UserdataThing = newproxy(true)
	local Hooked = false
	getmetatable(UserdataThing).__tostring = function()
		-- upvalues: (ref) v_u_64, (ref) HexStringy
		Hooked = true
		return HexStringy()
	end
	getmetatable(UserdataThing).__metatable = HexStringy()
	if p62 == GetCallerFunction then
		game:GetFullName()
	end
	pcall(p62, UserdataThing, UserdataThing, UserdataThing, UserdataThing, UserdataThing, UserdataThing, UserdataThing, UserdataThing)
	return Hooked
end
local function CanGetFullName(instance)
	-- upvalues: (copy) pcall
	return not pcall(function()
		-- upvalues: (copy) instance
		return instance.GetFullName(instance)
	end)
end
local function newproxy5(p68, p69)
	-- upvalues: (copy) string
	local v70 = #p69
	local v71 = ""
	for v72 = 1, #p68 do
		local v73 = v72 % v70 + 1
		local v74 = (string.byte(p68, v72, v72) + string.byte(p69, v73, v73)) % 126 + 1
		v71 = v71 .. string.char(v74)
	end
	return v71
end
local function newproxy8(p76)
	-- upvalues: (copy) math
	local v77 = p76 * 100
	return math.floor(v77) / 100
end
local function v_u_81(p79)
	local v80
	if p79.P == 90000 then
		v80 = p79.MaxTorque == vector.one * 9000000000
	else
		v80 = false
	end
	return v80
end
local function Crash()
	-- upvalues: (copy) IsStudio, (copy) warn, (copy) debug, (copy) DevMessage, (copy) string
	if IsStudio then
		warn("Client Crash attempted in Roblox Studio", debug.traceback())
		return
	else
		DevMessage("Noooooo")
		while true do
			debug.setmemorycategory(string.rep("\n", 1073741824))
		end
	end
end
local function Kick(p83, p84)
	-- upvalues: (copy) LocalPlayer, (copy) BastionConfiguration, (copy) task, (copy) Crash
	LocalPlayer:Kick(p84 == true and p83 and p83 or BastionConfiguration.DefaultKickReason)
	task.delay(10, Crash)
end
local function v_u_87()
	-- upvalues: (copy) LocalPlayer, (copy) Kick
	local v86 = LocalPlayer:WaitForChild("Backpack", 60)
	if v86 then
		if v86.ClassName == "Backpack" then
			return v86
		end
		Kick("BP (0x2)")
	else
		Kick("BP (0x1)")
	end
end
local function v_u_89()
	-- upvalues: (copy) LocalPlayer, (copy) Kick
	local PlayerGui = LocalPlayer:WaitForChild("PlayerGui", 60)
	if PlayerGui then
		if PlayerGui.ClassName == "PlayerGui" then
			return PlayerGui
		end
		Kick("PGUI (0x2)")
	else
		Kick("PGUI (0x1)")
	end
end
local BastionHandshake = nil
local BastionRemote = nil
local function Bastion()
	-- upvalues: (ref) BastionRemote, (copy) ReplicatedStorage, (copy) string, (copy) Kick, (copy) coroutine, (copy) task
	if BastionRemote then
		return BastionRemote
	end
	BastionRemote = ReplicatedStorage:WaitForChild("Bastion" .. string.rep("\t", 20) .. "Still here?", 120)
	if BastionRemote and BastionRemote:IsA("RemoteEvent") then
		coroutine.wrap(function()
			-- upvalues: (ref) BastionRemote, (ref) task, (ref) Kick
			local Name0 = BastionRemote.Name
			local Parent0 = BastionRemote.Parent
			while task.wait(1) do
				local Name1 = BastionRemote.Name
				local Parent1 = BastionRemote.Parent
				if Name1 ~= Name0 then
					Kick("Remote (0x1)")
					return
				end
				if Parent1 ~= Parent0 or Parent1 == nil then
					Kick("Remote (0x2)")
					return
				end
				if #BastionRemote:GetChildren() ~= 0 then
					Kick("Remote (0x3)")
					return
				end
			end
		end)()
		return BastionRemote
	end
	Kick("Unstable connection!\nTry checking your connection and/or rejoining! (1)", true)
end
local function BastionFireServer(...)
	-- upvalues: (copy) Bastion
	return Bastion():FireServer(...)
end
local function v_u_99(p98, ...)
	-- upvalues: (ref) BastionHandshake, (copy) BastionFireServer, (copy) newproxy5
	if BastionHandshake then
		return BastionFireServer(newproxy5(p98, BastionHandshake), ...)
	end
end
local function v_u_104(p100)
	-- upvalues: (copy) typeof, (copy) string
	if typeof(p100) ~= "table" then
		return ""
	end
	if not p100.Punishments then
		return ""
	end
	local v101 = "log"
	for v102, v103 in pairs(p100.Punishments) do
		if v103 == true then
			return string.lower(v102) == "damagedisable" and "disable-damage" or string.lower(v102)
		end
	end
	return v101
end
local function v_u_107(p105, p106)
	-- upvalues: (copy) typeof, (ref) BastionHandshake, (copy) type, (copy) task, (copy) Crash, (copy) v_u_99, (copy) newproxy5, (copy) string
	if typeof(p105) == "string" and typeof(p106) == "string" then
		if p105 ~= "" then
			if BastionHandshake and type(BastionHandshake) == "string" then
				if p105 ~= "disable-damage" and p105 ~= "log" then
					task.delay(10, Crash)
				end
				return v_u_99("Log", p105, newproxy5(string.sub(p106, 1, 1000), BastionHandshake))
			end
		end
	else
		return
	end
end
local function BanAndCrash(p108, p109)
	-- upvalues: (copy) v_u_107, (copy) Crash
	v_u_107("ban", (("BASTION TAMPER PROTECTION %*\n%*"):format(p108 and "(" .. p108 .. ")" or "", p109 or "No additional information provided")))
	Crash()
end
local function ReportTamperingAndCrash(p111, p112)
	-- upvalues: (copy) v_u_107, (copy) Crash
	v_u_107("ban", (("BASTION TAMPER PROTECTION: CLIENT BYPASS ATTEMPTED BY PLAYER %*\n%*"):format(p111 and "(" .. p111 .. ")" or "", p112 or "No additional information provided")))
	Crash()
end
local function v120(p114, p115, p116)
	-- upvalues: (copy) type, (copy) RandomTableIdk, (copy) table
	if not p116 or (type(p116) ~= "function" or p116()) then
		local v117 = RandomTableIdk
		local v118 = table.freeze
		local v119 = {
			["Settings"] = table.freeze(table.clone(p114)),
			["Function"] = p115
		}
		table.insert(v117, v118(v119))
	end
end
DevMessage("It\'s time to lock in my friend.")
v120({
	["Interval"] = 5
}, function()
	-- upvalues: (copy) gcinfo, (copy) collectgarbage, (copy) v_u_107, (copy) task
	if gcinfo() ~= collectgarbage("count") then
		v_u_107("ban", "GC Spoofing detected")
		task.wait(9000000000)
	end
end)
v120({
	["Interval"] = 5
}, function()
	-- upvalues: (copy) pcall, (copy) HttpService, (copy) string, (copy) v_u_107, (copy) task
	local v121, v122 = pcall(HttpService.RequestInternal, HttpService)
	if not v121 and string.match(v122, "blocked") then
		v_u_107("ban", "Wave Executor detected")
		task.wait(9000000000)
	end
end)
v120({
	["Interval"] = 0.5
}, function()
	-- upvalues: (copy) UserInputService, (copy) pcall, (copy) StarterGui, (copy) TextChatService, (copy) Chat, (copy) CanGetFullName, (copy) GuiService, (copy) v_u_107, (copy) task
	local v123 = UserInputService:GetFocusedTextBox()
	if v123 then
		local v124, v125 = pcall(StarterGui.GetCore, StarterGui, "DeveloperConsoleVisible")
		local ChatInputBarConfiguration = TextChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
		local LoadDefaultChat = Chat.LoadDefaultChat
		if LoadDefaultChat then
			LoadDefaultChat = TextChatService.ChatVersion == Enum.ChatVersion.TextChatService
		end
		if ChatInputBarConfiguration then
			ChatInputBarConfiguration = ChatInputBarConfiguration.Enabled
		end
		if CanGetFullName(v123) and not (v124 and v125) and not (GuiService.MenuIsOpen or LoadDefaultChat and ChatInputBarConfiguration) then
			v_u_107("ban", "Exploit GUI Presence detected")
			task.wait(9000000000)
		end
	end
end)
v120({
	["Interval"] = 1
}, function()
	-- upvalues: (copy) GetCallerFunction, (copy) SafeCall, (copy) game, (copy) SetCallerFunction, (copy) ReturnCallerFunction, (copy) v_u_107, (copy) task
	if GetCallerFunction ~= SafeCall(function()
			-- upvalues: (ref) game
			return game:____()
		end) or (SetCallerFunction ~= SafeCall(function()
			-- upvalues: (ref) game
			game.____ = nil
		end) or ReturnCallerFunction ~= SafeCall(function()
			-- upvalues: (ref) game
			return game.____
		end)) then
		v_u_107("ban", "Executor Presence detected: getrawmetatable hook detected")
		task.wait(9000000000)
	end
end)
v120({
	["Interval"] = 5
}, function()
	-- upvalues: (copy) table, (copy) v_u_107, (copy) task
	if table.isfrozen({}) or not table.isfrozen(table.freeze({ buffer.create(0) })) then
		v_u_107("ban", "Executor Presence detected: table.isfrozen hook detected (0x1)")
		task.wait(9000000000)
	end
end)
v120({
	["Interval"] = 5
}, function()
	-- upvalues: (copy) ContentProvider, (ref) BastionRemote, (copy) IsThereAHook, (copy) v_u_107, (copy) task, (copy) pcall
	local GetAssetFetchStatus = ContentProvider.GetAssetFetchStatus
	local FireServer = BastionRemote.FireServer
	if IsThereAHook(GetAssetFetchStatus) then
		v_u_107("ban", "GetAssetFetchStatus hook detected (0x1)")
		task.wait(9000000000)
	end
	if IsThereAHook(FireServer) then
		pcall(v_u_107, "ban", "FireServer hook detected (0x1)")
		task.wait(9000000000)
	end
end)
v120({
	["Interval"] = 5
}, function()
	-- upvalues: (copy) ContentProvider, (copy) newproxy, (copy) pcall, (copy) v_u_107, (copy) task, (copy) HexStringy, (copy) type, (copy) typeof, (copy) tostring
	local v130 = ContentProvider.GetAssetFetchStatus
	local v131 = newproxy(false)
	if pcall(v130, ContentProvider, v131) or pcall(v130, v131) then
		v_u_107("ban", "GetAssetFetchStatus hook detected (0x2)")
		task.wait(9000000000)
	end
	local v132 = v130(ContentProvider, HexStringy())
	if type(v132) ~= "userdata" or (typeof(v132) ~= "EnumItem" or tostring(v132.EnumType) ~= "AssetFetchStatus") then
		v_u_107("ban", "GetAssetFetchStatus hook detected (0x3)")
		task.wait(9000000000)
	end
	if v132.Value > 4 then
		v_u_107("ban", "GetAssetFetchStatus hook detected (0x4)")
		task.wait(9000000000)
	end
end)
local v133 = BastionConfiguration.MainDetectors
if v133.AWPExecutorDetection.Enabled then
	local v_u_134 = v133.AWPExecutorDetection
	local v_u_135 = 0
	v120({
		["Interval"] = 0
	}, function()
		-- upvalues: (copy) tick, (copy) getfenv, (ref) v_u_135, (copy) v_u_134, (copy) v_u_107, (copy) v_u_104, (copy) newproxy8, (copy) task
		local v136 = tick()
		for _ = 1, 10000 do
			getfenv()
		end
		local v137 = tick()
		for _ = 1, 10000 do

		end
		local v138 = tick()
		local v139 = (v137 - v136) / (v138 - v137)
		if v139 > 25 then
			v_u_135 = v_u_135 + 1
			if v_u_135 > v_u_134.HeatLimit then
				v_u_107(v_u_104(v_u_134), (("AWP executor detected (Lag ratio: %*)"):format((newproxy8(v139)))))
				task.wait(9000000000)
				return
			end
		else
			v_u_135 = 0
		end
	end)
end
if v133.AntiServerOnlyServiceTamper.Enabled then
	local v_u_140 = v133.AntiServerOnlyServiceTamper
	v120({
		["Interval"] = 5
	}, function()
		-- upvalues: (copy) ServerStorage, (copy) v_u_107, (copy) v_u_104, (copy) v_u_140, (copy) task, (copy) ServerScriptService
		if #ServerStorage:GetChildren() > 0 then
			ServerStorage:ClearAllChildren()
			v_u_107(v_u_104(v_u_140), "Detected tampering of ServerStorage")
			task.wait(9000000000)
		end
		if #ServerScriptService:GetChildren() > 0 then
			ServerScriptService:ClearAllChildren()
			v_u_107(v_u_104(v_u_140), "Detected tampering of ServerScriptService")
			task.wait(9000000000)
		end
	end)
end
if v133.AntiBTools.Enabled then
	local v_u_141 = v133.AntiBTools
	v120({
		["RunOn"] = LocalPlayer.CharacterAdded
	}, function()
		-- upvalues: (copy) v_u_107, (copy) v_u_104, (copy) v_u_141, (copy) v_u_87
		local function Check4Btools(AddedTool)
			-- upvalues: (ref) v_u_107, (ref) v_u_104, (ref) v_u_141
			if AddedTool:IsA("HopperBin") and (AddedTool.BinType == Enum.BinType.Grab or (AddedTool.BinType == Enum.BinType.Clone or (AddedTool.BinType == Enum.BinType.Hammer or AddedTool.BinType == Enum.BinType.GameTool))) then
				AddedTool:Destroy()
				v_u_107(v_u_104(v_u_141), "BTools Detected")
			end
		end
		local v144 = v_u_87()
		v144.ChildAdded:Connect(Check4Btools)
		for _, v145 in v144:GetChildren() do
			Check4Btools(v145)
		end
	end)
end
if v133.DexExplorerDetection.Enabled then
	local v_u_146 = v133.DexExplorerDetection
	local v_u_147 = 0
	local v_u_148 = setmetatable({}, {
		["__mode"] = "v"
	})
	local v_u_149 = tostring(math.random())
	Instance.new("BoolValue", Chat).Name = v_u_149
	v120({
		["Interval"] = 0
	}, function()
		if not game:IsLoaded() then
			game.Loaded:Wait()
		end
		task.wait(3)
		v_u_148[1] = {}
		v_u_148[2] = Chat:FindFirstChild(v_u_149)
		while v_u_148[1] ~= nil do
			v_u_148[3] = string.rep("ab", 2048)
			v_u_148[3] = nil
			task.wait()
		end
		if v_u_148[2] == nil then
			v_u_147 = 0
		else
			v_u_147 = v_u_147 + 1
			if v_u_147 >= v_u_146.HeatLimit then
				task.wait(3)
				v_u_107(v_u_104(v_u_146), (("Dex Explorer detected: Objects found in game:GetService(\"Chat\") %* times in a row"):format(v_u_146.HeatLimit)))
				task.wait(9000000000)
				return
			end
		end
	end)
end
if v133.InfiniteYieldDetection.Enabled then
	local v_u_150 = v133.InfiniteYieldDetection
	if v_u_150.MainDetection then
		local v_u_151 = setmetatable({}, {
			["__mode"] = "v"
		})
		v120({
			["Interval"] = 0
		}, function()
			-- upvalues: (copy) game, (copy) task, (copy) v_u_151, (copy) string, (copy) v_u_107, (copy) v_u_104, (copy) v_u_150
			if not game:IsLoaded() then
				game.Loaded:Wait()
			end
			task.wait(3)
			v_u_151[1] = {}
			v_u_151[2] = game:GetService("NetworkClient")
			while v_u_151[1] ~= nil do
				v_u_151[3] = string.rep("ab", 2048)
				v_u_151[3] = nil
				task.wait()
			end
			print(v_u_151[2])
			if v_u_151[2] ~= nil then
				v_u_107(v_u_104(v_u_150), "Infinite Yield detected")
				task.wait(9000000000)
			end
		end)
	end
	if v_u_150.FlyDetection then
		v120({
			["Interval"] = 1
		}, function()
			-- upvalues: (copy) LocalPlayer, (copy) v_u_81, (copy) v_u_107, (copy) v_u_104, (copy) v_u_150, (copy) task
			local v152 = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
			if v152 then
				v152 = v152:FindFirstChild("HumanoidRootPart")
			end
			if v152 then
				for _, v153 in v152:GetChildren() do
					if v153:IsA("BodyGyro") and v_u_81(v153) then
						v_u_107(v_u_104(v_u_150), "Infinite Yield detected: Fly/VehicleFly detected")
						task.wait(9000000000)
					end
				end
			end
		end)
	end
	if v_u_150.AntiVoidDetection then
		v120({
			["RunOn"] = LocalPlayer.CharacterAdded
		}, function(p_u_154)
			-- upvalues: (copy) pcall, (copy) task, (copy) v_u_107, (copy) v_u_104, (copy) v_u_150
			local v_u_155 = nil
			local v_u_156 = nil
			while not (v_u_155 and v_u_156) do
				pcall(function()
					-- upvalues: (ref) v_u_155, (copy) p_u_154, (ref) v_u_156
					v_u_155 = p_u_154.Humanoid
					v_u_156 = p_u_154.HumanoidRootPart
				end)
				task.wait(0.1)
			end
			local v157 = false
			while task.wait(0.016666666666666666) do
				local v158 = v_u_156.Position.Y < workspace.FallenPartsDestroyHeight + 25
				if v157 and (not v158 and (v_u_156.AssemblyLinearVelocity.Y > 100 and v_u_155:GetState() == Enum.HumanoidStateType.Freefall)) then
					v_u_107(v_u_104(v_u_150), "Infinite Yield detected: Anti-Void detected")
					break
				end
				v157 = v158
			end
		end)
	end
end
if v133.AntiProximityPromptTamper.Enabled then
	local v_u_159 = v133.AntiProximityPromptTamper
	v120({
		["RunOnStart"] = true
	}, function()
		-- upvalues: (copy) Instance, (copy) HttpService, (copy) Crash, (copy) v_u_107, (copy) v_u_104, (copy) v_u_159
		local v160 = Instance.new("ProximityPrompt")
		v160.Name = "Look at the moon!\t"
		v160.HoldDuration = 1.5
		v160.Parent = HttpService
		v160.Destroying:Connect(Crash)
		v160.Changed:Once(function(p161)
			-- upvalues: (ref) v_u_107, (ref) v_u_104, (ref) v_u_159
			if p161 == "HoldDuration" then
				v_u_107(v_u_104(v_u_159), "Detected proximity prompt exploit (hold duration modifier script)")
			else
				v_u_107(v_u_104(v_u_159), "Detected proximity prompt exploit (prompt was tampered with)")
			end
		end)
	end)
end
if v133.OutputDetection.Enabled then
	local v_u_162 = v133.OutputDetection
	v120({
		["RunOn"] = LogService.MessageOut
	}, function(p163, p164)
		-- upvalues: (copy) type, (copy) typeof, (copy) v_u_107, (copy) v_u_104, (copy) v_u_162, (copy) string
		if type(p163) == "string" and typeof(p164) == "EnumItem" then
			if p164 == Enum.MessageType.MessageError then
				return
			else
				local v165 = string.lower(p163)
				if not string.match(v165, "expchat/mountclientapp") then
					for _, v166 in v_u_162.BlacklistedStrings do
						if string.match(v165, string.lower(v166)) then
							v_u_107(v_u_104(v_u_162), (("Suspicious output detected ```lua\n%*```"):format(p163)))
							return
						end
					end
				end
			end
		else
			v_u_107(v_u_104(v_u_162), (("Exploit Presence detected: Log Output was not a string ```lua\n%*```"):format(p163)))
			return
		end
	end)
	if v_u_162.TracelessErrorDetection then
		v120({
			["RunOn"] = ScriptContext.Error
		}, function(p167, p168, p169)
			-- upvalues: (copy) string, (copy) v_u_107, (copy) v_u_104, (copy) v_u_162
			if p169 and string.match(p169.Name, "tpircsnaisyle") then
				v_u_107(v_u_104(v_u_162.TracelessErrorDetection), "Executor error detected")
			end
			if not p169 or not p169.Parent and p169.ClassName == "LocalScript" then
				if string.find(p168, "CoreGui") or (string.find(p168, "PlayerScripts") or (string.find(p168, "Animation_Scripts") or string.find(p168, "^(%S*)%.(%S*)"))) then
					return
				end
				v_u_107(v_u_104(v_u_162.TracelessErrorDetection), (("Traceless error detected ```lua\n%*```"):format(p167)))
			end
		end)
	end
end
if v133.AntiInfiniteJump.Enabled then
	local v_u_170 = v133.AntiInfiniteJump
	local v_u_171 = os.clock()
	local v_u_172 = 0
	local v_u_173 = false
	local v_u_174 = nil
	local v_u_175 = LocalPlayer.Character
	v120({
		["RunOn"] = UserInputService.JumpRequest
	}, function()
		-- upvalues: (ref) v_u_172, (ref) v_u_173, (ref) v_u_175, (copy) LocalPlayer, (copy) DevMessage, (ref) v_u_174, (ref) v_u_171, (copy) v_u_170, (copy) v_u_107, (copy) v_u_104
		if v_u_172 < 0 or v_u_173 == true then
			return
		else
			local v176 = os.clock()
			v_u_175 = v_u_175 or LocalPlayer.Character
			if v_u_175 then
				local v177 = nil
				local v178 = v_u_175:FindFirstChild("HumanoidRootPart")
				local v179 = v178 and v178:IsA("BasePart")
				if v179 then
					v179 = v178:FindFirstChildWhichIsA("AlignPosition")
				end
				if v179 then
					if v179.Name ~= "ADONIS_FLIGHT_POSITION" then
						v179 = false
					end
				else
					v179 = v177
				end
				if v179 then
					DevMessage("OMG!!1! OMG!11! I FOUND A BYPASSZZ!!!@@!!")
				else
					local v180 = v_u_175:FindFirstChildOfClass("Humanoid")
					if v180 then
						local v181 = v180:GetState()
						if v181 == Enum.HumanoidStateType.Jumping and (v_u_174 ~= Enum.HumanoidStateType.Climbing and v180.FloorMaterial == Enum.Material.Air) then
							if v176 - v_u_171 < 0.25 then
								v_u_172 = v_u_172 + 1
								if v_u_172 > v_u_170.HeatLimit then
									v_u_173 = true
									v_u_107(v_u_104(v_u_170), (("Infinite jump exploit detected (achieved %* suspicious jumps)"):format(v_u_172)))
									v_u_172 = -9000000000
								end
							else
								v_u_172 = 0
							end
						end
						v_u_174 = v181
					end
					v_u_171 = v176
				end
			else
				return
			end
		end
	end)
end
if v133.AssetDetections.Enabled then
	local v_u_182 = v133.AssetDetections
	for _, v_u_183 in v_u_182.Detectors do
		if not v_u_183.Disabled then
			v120({
				["Interval"] = 1
			}, function()
				-- upvalues: (copy) v_u_183, (copy) ContentProvider, (copy) v_u_107, (copy) v_u_104, (copy) v_u_182, (copy) task
				for _, v184 in v_u_183.Assets do
					if ContentProvider:GetAssetFetchStatus(v184).Value == 0 then
						v_u_107(v_u_104(v_u_182), "Exploit-Assets Detector: " .. v_u_183.LogMessage)
						task.wait(9000000000)
					end
				end
			end)
		end
	end
end
if v133.PlayerGuiDetections.Enabled then
	DevMessage("Now, what made you think parenting to PlayerGui was a good idea?")
	local v_u_185 = v133.PlayerGuiDetections
	v120({
		["Interval"] = 1
	}, function()
		-- upvalues: (copy) v_u_89, (copy) v_u_107, (copy) v_u_104, (copy) v_u_185, (copy) task
		local v186 = v_u_89()
		if v186 then
			if v186:FindFirstChild("SuperRingPartsGUI") then
				v_u_107(v_u_104(v_u_185), "SuperRingPartsGUI detected")
				task.wait(9000000000)
			end
			if v186:FindFirstChild("Dex") then
				v_u_107(v_u_104(v_u_185), "Dex Explorer detected (PlayerGui detection)")
				task.wait(9000000000)
			end
			local v187 = v186:FindFirstChild("4.0")
			if v187 and v187:FindFirstChild("Main") then
				v_u_107(v_u_104(v_u_185), "TOPK3K 4.0 detected")
				task.wait(9000000000)
			end
			local v188 = v186:FindFirstChildOfClass("ScreenGui")
			if v188 and v188:FindFirstChild("Base") then
				v188:Destroy()
				v_u_107(v_u_104(v_u_185), "TOPK3K 3.0 detected")
				task.wait(9000000000)
			end
		end
	end)
end
local v189 = BastionConfiguration.DSBBDetectors
if v189.AntiGravityTamper.Enabled then
	local v_u_190 = v189.AntiGravityTamper
	v120({
		["RunOnStart"] = true
	}, function()
		-- upvalues: (copy) task, (copy) ReplicatedStorage, (copy) v_u_107, (copy) v_u_104, (copy) v_u_190
		local v_u_191 = nil
		v_u_191 = workspace:GetPropertyChangedSignal("Gravity"):Connect(function()
			-- upvalues: (ref) task, (ref) ReplicatedStorage, (ref) v_u_191, (ref) v_u_107, (ref) v_u_104, (ref) v_u_190
			task.wait(1)
			local v192 = ReplicatedStorage:FindFirstChild("Remotes") 
			if v192 then
				v192 = ReplicatedStorage:FindFirstChild("Remotes"):FindFirstChild("GetOwnership")
			end
			if v192 then
				if v192:InvokeServer("GetServerGravity") ~= workspace.Gravity then
					v_u_191:Disconnect()
					task.wait(3)
					v_u_107(v_u_104(v_u_190), "DSBB AntiGravityTamper: Player detected tampering with gravity locally")
					task.wait(9000000000)
					return
				end
			else
				task.wait(3)
				v_u_107(v_u_104(v_u_190), "DSBB AntiGravityTamper: Gravity Remote was not found on player\'s client (most likely intentionally destroyed)")
				task.wait(9000000000)
			end
		end)
	end)
end
if v189.AntiHumanoidTamper.Enabled and LocalPlayer:GetAttribute("Trampoline") == false then
	local v_u_193 = v189.AntiHumanoidTamper
	for v_u_194, v_u_195 in pairs(v_u_193.RestrictedProperties) do
		v120({
			["RunOn"] = LocalPlayer.CharacterAdded
		}, function(p_u_196)
			-- upvalues: (copy) pcall, (copy) task, (copy) v_u_193, (copy) v_u_194, (copy) v_u_195, (copy) v_u_107, (copy) v_u_104
			local v_u_197 = nil
			while not v_u_197 do
				pcall(function()
					-- upvalues: (ref) v_u_197, (copy) p_u_196
					v_u_197 = p_u_196.Humanoid
				end)
				task.wait(0.1)
			end
			while task.wait(v_u_193.CheckInterval) do
				if v_u_197[v_u_194] ~= v_u_195.AllowedValue then
					task.wait(2)
					v_u_107(v_u_104(v_u_193), (("DSBB AntiHumanoidTamper: %* exploits detected"):format(v_u_194)))
					task.wait(9000000000)
				end
			end
		end)
	end
end
if v189.AntiFallenPartsDestroyHeightTamper.Enabled then
	local v_u_198 = v189.AntiFallenPartsDestroyHeightTamper
	v120({
		["RunOnStart"] = true
	}, function()
		-- upvalues: (copy) task, (copy) v_u_198, (copy) v_u_107, (copy) v_u_104
		local v_u_199 = nil
		v_u_199 = workspace:GetPropertyChangedSignal("FallenPartsDestroyHeight"):Connect(function()
			-- upvalues: (ref) task, (ref) v_u_198, (ref) v_u_199, (ref) v_u_107, (ref) v_u_104
			task.wait(0.5)
			if workspace.FallenPartsDestroyHeight ~= v_u_198.NormalHeight then
				v_u_199:Disconnect()
				task.wait(3)
				v_u_107(v_u_104(v_u_198), "DSBB AntiFallenPartsDestroyHeightTamper: Player detected tampering with FallenPartsDestroyHeight locally")
				task.wait(9000000000)
			end
		end)
	end)
end
if v189.AntiBodyMover.Enabled then
	local v_u_200 = v189.AntiBodyMover
	local function v_u_202(p201)
		-- upvalues: (copy) CollectionService
		return CollectionService:HasTag(p201, "BodyMoverServer") or CollectionService:HasTag(p201, "BodyMoverClient") or (CollectionService:HasTag(p201, "SwordObject") or CollectionService:HasTag(p201, "FloatBodyMover")) or (CollectionService:HasTag(p201, "RocketVelBodyMover") or CollectionService:HasTag(p201, "FunCommandBodyMover") or (CollectionService:HasTag(p201, "SlipperyCommandBodyMover") or CollectionService:HasTag(p201, "SFOTHBodyMover")))
	end
	v120({
		["Interval"] = v_u_200.CheckInterval
	}, function()
		-- upvalues: (copy) LocalPlayer, (copy) task, (copy) v_u_202, (copy) v_u_107, (copy) v_u_104, (copy) v_u_200
		if LocalPlayer.Character then
			for _, v203 in pairs(LocalPlayer.Character:GetDescendants()) do
				if v203:IsA("BodyMover") then
					if v203:IsA("BodyVelocity") or v203:IsA("BodyAngularVelocity") then
						task.wait(0.1)
						if not v_u_202(v203) then
							task.wait(2)
							v_u_107(v_u_104(v_u_200), (("DSBB AntiBodyMover: A BodyMover that does not come from DSBB tools (%*) was found in player\'s character"):format(v203.Name)))
							task.wait(9000000000)
						end
					elseif not v_u_202(v203) then
						task.wait(2)
						v_u_107(v_u_104(v_u_200), (("DSBB AntiBodyMover: Forbidden BodyMover (%*) was found in player\'s character"):format(v203.Name)))
						task.wait(9000000000)
					end
				end
			end
		end
	end)
end
if v189.HBEDetection.Enabled then
	local v_u_204 = v189.HBEDetection
	local v_u_205 = false
	local function v_u_207(p206)
		-- upvalues: (copy) Players
		return Players:FindFirstChild(p206)
	end
	local function v_u_212(p_u_208)
		-- upvalues: (copy) pcall, (copy) task, (ref) v_u_205, (copy) v_u_107, (copy) v_u_104, (copy) v_u_204
		local v_u_209 = nil
		local v_u_210 = nil
		while not (v_u_209 and v_u_210) do
			pcall(function()
				-- upvalues: (ref) v_u_209, (copy) p_u_208, (ref) v_u_210
				v_u_209 = p_u_208.HumanoidRootPart
				v_u_210 = p_u_208.Humanoid
			end)
			task.wait(0.1)
		end
		if v_u_209 and v_u_210 then
			for _, v_u_211 in pairs(p_u_208:GetChildren()) do
				if v_u_211:IsA("BasePart") then
					v_u_211:GetPropertyChangedSignal("Size"):Once(function()
						-- upvalues: (ref) v_u_205, (ref) task, (ref) v_u_107, (ref) v_u_104, (ref) v_u_204, (copy) p_u_208, (copy) v_u_211
						if not v_u_205 then
							v_u_205 = true
							task.wait(3)
							v_u_107(v_u_104(v_u_204), (("HBE detected: %*\'s %*\'s Size has been changed on player\'s client (Current size: %*, %*, %*)"):format(p_u_208.Name, v_u_211.Name, v_u_211.Size.X, v_u_211.Size.Y, v_u_211.Size.Z)))
							task.wait(9000000000)
						end
					end)
				end
			end
		end
	end
	v120({
		["RunOnStart"] = true
	}, function()
		-- upvalues: (copy) LocalPlayer, (ref) v_u_205, (copy) v_u_207, (copy) task, (copy) v_u_212
		LocalPlayer.CharacterAdded:Wait()
		for _, v213 in pairs(workspace:GetChildren()) do
			if not v_u_205 and (v213:IsA("Model") and v_u_207(v213.Name)) then
				task.wait(0.5)
				if v213:FindFirstChildWhichIsA("Humanoid") then
					v_u_212(v213)
				end
			end
		end
		workspace.ChildAdded:Connect(function(p214)
			-- upvalues: (ref) v_u_205, (ref) v_u_207, (ref) task, (ref) v_u_212
			if not v_u_205 and (p214:IsA("Model") and v_u_207(p214.Name)) then
				task.wait(0.5)
				if p214:FindFirstChildWhichIsA("Humanoid") then
					v_u_212(p214)
				end
			end
		end)
	end)
end
if v189.AntiCrucialPartsTamper.Enabled then
	local v_u_215 = v189.AntiCrucialPartsTamper
	v120({
		["Interval"] = 7
	}, function()
		-- upvalues: (copy) v_u_215, (copy) v_u_107, (copy) v_u_104
		for v216, v217 in pairs(v_u_215.CrucialInstanceInfo) do
			if workspace:FindFirstChild(v216) then
				if #workspace[v216]:GetChildren() ~= v217 then
					v_u_107(v_u_104(v_u_215), (("DSBB AntiCrucialPartsTamper: Crucial parts are missing on player\'s client in %* Folder (Found: %*, Expected: %*)"):format(v216, #workspace[v216]:GetChildren(), v217)))
				end
			else
				v_u_107(v_u_104(v_u_215), (("DSBB AntiCrucialPartsTamper: %* Folder is missing in workspace on player\'s client"):format(v216)))
			end
		end
	end)
end
if v189.MismatchMovementDetector.Enabled then
	local v_u_218 = v189.MismatchMovementDetector
	local v_u_219 = 0
	local v_u_220 = 0
	local v_u_221 = 0
	local v_u_222 = 0
	local v_u_223 = v_u_218.SurveyInterval * 100
	local v_u_224 = {}
	local v_u_225 = nil
	local v_u_226 = nil
	local v_u_227 = nil
	local v_u_228 = Vector3.zero
	local v_u_229 = Vector3.zero
	local v_u_230 = Vector3.zero
	local v_u_231 = Vector3.zero
	local v_u_232 = 0
	local v_u_233 = 0
	local v_u_234 = 0
	local v_u_235 = Vector3.new(1, 0, 1)
	local function v_u_245(p236, p237, p238, p239)
		-- upvalues: (copy) v_u_235, (copy) math, (ref) v_u_220, (ref) v_u_221, (ref) v_u_222
		local v240 = (p237 - p238) / p236
		local v241 = v240 * v_u_235
		local v242 = p239 * v_u_235
		local v243 = v241.Magnitude - v242.Magnitude
		if math.abs(v243) > 60 then
			v_u_220 = v_u_220 + 1
		else
			v_u_220 = 0
		end
		local v244 = v240.Y - p239.Y
		if math.abs(v244) > 60 then
			v_u_221 = v_u_221 + 1
		else
			v_u_221 = 0
		end
		if v241.Magnitude > 700 then
			v_u_222 = v_u_222 + 1
		else
			v_u_222 = 0
		end
	end
	local function v_u_249(_, p246, p247, p248)
		-- upvalues: (copy) v_u_245, (ref) v_u_234
		if p246 ~= p247 then
			v_u_245(v_u_234, p246, p247, p248)
		end
		v_u_234 = 0
	end
	local function DevMessage3(p250)
		local v251 = Vector3.zero
		for _, v252 in ipairs(p250) do
			v251 = v251 + v252
		end
		return v251 / #p250
	end
	local function DevMessage9(p254, p255, p256)
		-- upvalues: (ref) v_u_227, (copy) v_u_218, (ref) v_u_219, (copy) v_u_107, (copy) v_u_104, (copy) task
		if v_u_227 and v_u_227.Health > 0 then
			for _, v257 in pairs(v_u_218.AccuracyTable) do
				if v257.Accuracy and v257.Accuracy < p254 then
					local v258 = v257.Maximum < p255 or p255 <= v257.Minimum
					if ((v257.Maximum < p256 or p256 <= v257.Minimum) and true or v258) and (v257.Flaggable and v257.Flaggable == true) then
						v_u_219 = v_u_219 + 1
						if v_u_219 >= v_u_218.MaxFlags then
							v_u_107(v_u_104(v_u_218), (("Potential TP Exploit detected: Player was detected %* times having unusual movement"):format(v_u_218.MaxFlags)))
							v_u_219 = 0
							task.wait(0.5)
						end
					end
					return
				end
			end
		end
	end
	local function ReplicatedStorage2()
		-- upvalues: (copy) Players, (ref) v_u_225, (ref) v_u_226, (ref) v_u_227, (copy) pcall, (copy) task, (copy) ReplicatedStorage2, (ref) v_u_229, (ref) v_u_231, (ref) v_u_230, (ref) v_u_224, (ref) v_u_232, (ref) v_u_233, (ref) v_u_234, (copy) v_u_218, (copy) v_u_249, (ref) v_u_228, (copy) DevMessage3, (copy) v_u_223, (copy) v_u_235, (copy) math, (copy) DevMessage9
		local function v261()
			-- upvalues: (ref) Players, (ref) v_u_225, (ref) v_u_226, (ref) v_u_227, (ref) pcall, (ref) task, (ref) ReplicatedStorage2
			while true do
				while true do
					local Players0 = Players.LocalPlayer.Character
					v_u_225 = Players0
					if not Players0 then
						break
					end
					v_u_226 = nil
					v_u_227 = nil
					pcall(function()
						-- upvalues: (ref) v_u_226, (copy) Players0, (ref) v_u_227
						v_u_226 = Players0.HumanoidRootPart
						v_u_227 = Players0.Humanoid
					end)
					if v_u_226 and v_u_227 then
						task.spawn(ReplicatedStorage2)
						return
					end
					task.wait(0.2)
				end
				task.wait(0.2)
			end
		end
		v_u_229 = v_u_226.Position
		v_u_231 = v_u_226.Position
		v_u_230 = v_u_226.Position
		v_u_224 = {}
		v_u_232 = 0
		v_u_233 = 0
		v_u_234 = 0
		while true do
			local v262 = task.wait()
			if not v_u_225 or (not v_u_225.Parent or v_u_227.Health == 0) then
				break
			end
			v_u_233 = v_u_233 + v262
			v_u_232 = v_u_232 + v262
			v_u_234 = v_u_234 + v262
			local v263 = v_u_226.Position
			local v264 = v_u_226.AssemblyLinearVelocity
			if v_u_232 >= v_u_218.PhysicsStep then
				v_u_249(v_u_232, v263, v_u_231, v264)
				v_u_231 = v263
				v_u_228 = v263 - v_u_231
				v_u_232 = 0
			end
			if v_u_226.Anchored or v263.Y <= workspace.FallenPartsDestroyHeight + 8 then
				v_u_224[#v_u_224 + 1] = Vector3.zero
			else
				v_u_224[#v_u_224 + 1] = v264
			end
			if v_u_233 > v_u_218.SurveyInterval then
				local v265 = v263 - v_u_230
				local v266 = DevMessage3(v_u_224) * v_u_233
				local v267 = #v_u_224 / v_u_223
				local v268 = (v265 * v_u_235).Magnitude - (v266 * v_u_235).Magnitude
				local v269 = v265.Y
				local v270 = math.abs(v269)
				local v271 = v266.Y
				DevMessage9(v267, v268, v270 - math.abs(v271))
				v_u_224 = {}
				v_u_230 = v263
				v_u_233 = 0
			end
			v_u_229 = v263
		end
		v_u_225 = nil
		task.spawn(v261)
	end
	local function ReplicatedStorage4()
		-- upvalues: (copy) LocalPlayer, (ref) v_u_225, (ref) v_u_226, (ref) v_u_227, (copy) pcall, (copy) task, (copy) ReplicatedStorage2
		while true do
			while true do
				local ReplicatedStorage3 = LocalPlayer.Character
				v_u_225 = ReplicatedStorage3
				if not ReplicatedStorage3 then
					break
				end
				v_u_226 = nil
				v_u_227 = nil
				pcall(function()
					-- upvalues: (ref) v_u_226, (copy) ReplicatedStorage3, (ref) v_u_227
					v_u_226 = ReplicatedStorage3.HumanoidRootPart
					v_u_227 = ReplicatedStorage3.Humanoid
				end)
				if v_u_226 and v_u_227 then
					task.spawn(ReplicatedStorage2)
					return
				end
				task.wait(0.2)
			end
			task.wait(0.2)
		end
	end
	v120({
		["RunOnStart"] = true
	}, function()
		-- upvalues: (copy) task, (copy) v_u_218, (ref) v_u_219, (ref) v_u_220, (ref) v_u_221, (ref) v_u_222, (copy) ReplicatedStorage4
		task.spawn(function()
			-- upvalues: (ref) task, (ref) v_u_218, (ref) v_u_219, (ref) v_u_220, (ref) v_u_221, (ref) v_u_222
			while task.wait(v_u_218.FlagResetInterval) do
				v_u_219 = 0
				v_u_220 = 0
				v_u_221 = 0
				v_u_222 = 0
			end
		end)
		ReplicatedStorage4()
	end)
end
v120({
	["RunOnStart"] = true
}, function()
	-- upvalues: (copy) task, (copy) v_u_107
	local v275 = 0
	while task.wait(7) do
		v275 = v275 + 1
		local v276 = workspace:FindFirstChild("Lobby")
		if v276 then
			v276 = workspace:FindFirstChild("Lobby"):FindFirstChild("Spawns/Teleporters")
		end
		if v276 then
			task.wait(3)
			if #v276:GetChildren() < 5 then
				v_u_107("kick", "At least one teleporter is missing on player\'s client")
				task.wait(9000000000)
			end
			for _, v277 in pairs(v276:GetChildren()) do
				if v277:IsA("Model") then
					task.wait(2)
					local v278 = v277:FindFirstChild("Teleporter")
					if v278 then
						task.wait(2)
						if not v278:FindFirstChildWhichIsA("TouchTransmitter") then
							v_u_107("kick", "At least one TouchTransmitter is missing from a teleporter on player\'s client")
							task.wait(9000000000)
						end
					else
						v_u_107("kick", "At least one TeleporterPart is missing from a teleporter on player\'s client")
						task.wait(9000000000)
					end
				end
			end
		elseif v275 >= 3 then
			v_u_107("log", (("Teleporters Model missing after %* seconds of play time"):format(7 * v275)))
			task.wait(9000000000)
		end
	end
end)
v120({
	["RunOn"] = LocalPlayer.CharacterAdded
}, function(p_u_279)
	-- upvalues: (copy) pcall, (copy) task, (copy) v_u_107
	local HttpService0 = nil
	local HttpService1 = nil
	while not (HttpService0 and HttpService1) do
		pcall(function()
			-- upvalues: (ref) HttpService0, (copy) p_u_279, (ref) HttpService1
			HttpService0 = p_u_279.Humanoid
			HttpService1 = p_u_279.HumanoidRootPart
		end)
		task.wait(0.1)
	end
	local HttpService2 = nil
	HttpService2 = HttpService1.DescendantAdded:Connect(function(p283)
		-- upvalues: (ref) task, (ref) HttpService2, (ref) v_u_107
		if p283:IsA("BodyVelocity") and (p283.MaxForce == vector.create(0, 1000000, 0) and p283.Velocity == p283.Velocity * vector.create(0, 1, 0)) then
			task.wait(3)
			HttpService2:Disconnect()
			v_u_107("kick", "DSBB AntiVoidFailsafe: Anti-void exploit (HighSkyY8X Edition) detected")
			task.wait(9000000000)
		end
	end)
end)
table.freeze(RandomTableIdk)
coroutine.wrap(function()
	-- upvalues: (copy) RandomTableIdk, (copy) type, (copy) BanAndCrash, (copy) table, (copy) debug, (copy) tostring, (copy) BastionConfiguration, (copy) task, (copy) getmetatable
	local v284 = {}
	for v285, v286 in RandomTableIdk do
		if type(v286.Function) ~= "function" then
			BanAndCrash("0x3", "At least one Client Detector\'s function is not a function while it should be")
		end
		v284[v285] = table.freeze({ debug.info(v286.Function, "slnaf") })
	end
	table.freeze(v284)
	local v287 = tostring(GlobalFrozenTable)
	local v288 = tostring(BastionConfiguration)
	local v289 = tostring(RandomTableIdk)
	local RunService0 = tostring(v284)
	while task.wait(0.5) do
		if GlobalString ~= "Akinator: You are either using getsenv() or a decompiler you did not make" then
			BanAndCrash("0x4", "Presence of getsenv() or a decompiler detected") --You can't detect decompilers, dumbass.
			return
		end
		if not table.isfrozen(GlobalFrozenTable) or (#GlobalFrozenTable ~= 0 or (getmetatable(GlobalFrozenTable) or tostring(GlobalFrozenTable) ~= v287)) then
			BanAndCrash("0x5", "Global Variable Tamper detected")
			return
		end
		if not table.isfrozen(BastionConfiguration) or (getmetatable(BastionConfiguration) or tostring(BastionConfiguration) ~= v288) then
			BanAndCrash("0x6", "ClientSettings Tamper detected")
			return
		end
		if not table.isfrozen(RandomTableIdk) or (#RandomTableIdk == 0 or (getmetatable(RandomTableIdk) or tostring(RandomTableIdk) ~= v289)) then
			BanAndCrash("0x7", "Detectors Tamper detected")
			return
		end
		if not table.isfrozen(v284) or (#v284 == 0 or (getmetatable(v284) or tostring(v284) ~= RunService0)) then
			BanAndCrash("0x8", "Protos Tamper detected")
			return
		end
		for RunService1, RunService2 in RandomTableIdk do
			local RunService3 = v284[RunService1]
			if not table.isfrozen(RunService3) or getmetatable(RunService2.Settings) then
				BanAndCrash("0x9", "Proto/Detector\'s Settings Tamper detected")
				return
			end
			local RunService4 = table.freeze({ debug.info(RunService2.Function, "slnaf") })
			if #RunService4 ~= 6 or #RunService3 ~= 6 then
				BanAndCrash("0xA", "Detector\'s Function Tamper detected (1)")
				return
			end
			for RunService5, RunService6 in RunService3 do
				if RunService4[RunService5] ~= RunService6 then
					BanAndCrash("0xB", "Detectors\'s Function Tamper detected (2)")
					return
				end
			end
		end
	end
end)()
if BastionConfiguration.ServiceObfuscation.Enabled then
	local ServiceObfuscation = BastionConfiguration.ServiceObfuscation
	for _, Service in game:GetChildren() do
		if not table.find(ServiceObfuscation.ServicesToIgnore, Service.Name) then
			Service.Name = HexStringy()
		end
	end
end
local GetRobloxClientChannel, IsChannelOk = pcall(RunService.GetRobloxClientChannel, RunService)
BastionFireServer("Bastion-READY", TicksubtractOsClock, Is16Letters, GetRobloxClientChannel, IsChannelOk)
coroutine.wrap(function()
	-- upvalues: (copy) coroutine, (ref) BastionHandshake, (copy) Bastion, (copy) task, (copy) Kick, (copy) type, (copy) BanAndCrash
	coroutine.wrap(function()
		-- upvalues: (ref) BastionHandshake, (ref) Bastion
		BastionHandshake = Bastion().OnClientEvent:Wait()
	end)()
	local NoResponseCount = 0
	while not BastionHandshake do
		NoResponseCount = NoResponseCount + task.wait(1)
		if NoResponseCount > 120 then
			return Kick("Your client is struggling to communicate with the server.\nTry rejoining! (2)", true)
		end
	end
	if type(BastionHandshake) ~= "string" then
		BanAndCrash("Remote ClientEvent Key Tampering detected")
	end
end)()
coroutine.wrap(function()
	-- upvalues: (copy) script, (copy) ReportTamperingAndCrash
	script.Destroying:Wait()
	ReportTamperingAndCrash("0x1", "Local Script was destroyed on player\'s client")
end)()
coroutine.wrap(function()
	-- upvalues: (copy) task, (copy) CanGetFullName, (copy) script, (copy) ReportTamperingAndCrash
	while task.wait(0.1) do
		if CanGetFullName(script) then
			ReportTamperingAndCrash("0x2", "Local Script is Roblox-Locked while it shouldn\'t be")
			return
		end
		if script.Enabled == false then
			ReportTamperingAndCrash("0x3", "Local Script was disabled (script.Enabled == false) on player\'s client")
			return
		end
		if script.Parent ~= nil then
			ReportTamperingAndCrash("0x4", "Local Script\'s Parent Property isn\'t nil (script.Parent ~= nil)")
			return
		end
	end
end)()
for _, LogService2 in RandomTableIdk do
	local LogService2Settings = LogService2.Settings
	local LogService2Function = LogService2.Function
	
	if LogService2Settings and (type(LogService2Settings) == "table" and (table.isfrozen(LogService2Settings) and not getmetatable(LogService2.Settings))) then
		if LogService2Function and type(LogService2Function) == "function" then
			if LogService2Settings.RunOnStart then
				coroutine.wrap(LogService2Function)()
			end
			local LogService5 = LogService2Settings.RunOn
			if LogService5 then
				LogService5:Connect(function(...)
					-- upvalues: (copy) coroutine, (copy) LogService2Function
					coroutine.wrap(LogService2Function)(...)
				end)
			end
			local Interval1 = LogService2Settings.Interval
			if Interval1 and type(Interval1) == "number" then
				coroutine.wrap(function()
					-- upvalues: (copy) LogService2Function, (copy) task, (copy) v_u_306
					while true do
						LogService2Function(task.wait(Interval1))
					end
				end)()
			end
		else
			BanAndCrash("0x2", "The function of one of the detectors received unauthorized modifications")
		end
	else
		BanAndCrash("0x1", "The settings table of one of the detectors received unauthorized modifications")
	end
end
DevMessage("Ruh roh raggy!")
DevMessage("This is definitely the end of the script... right?")
