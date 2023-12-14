local Addon = {}
Addon.Name = "AGS_UnknownGear"
Addon.DisplayName = "AGS_UnknownGear"
Addon.Author = "tomstock"
Addon.Version = "1.0"


AGS_UG.savedVars = {}



function AGS_UG.onLoad(eventCode, name)

	if name ~= Addon.Name then return end
	AGS_UG.savedVars = ZO_SavedVars:NewAccountWide("AGS_UGVars", 1, nil, nil, GetWorldName(), nil)
	AwesomeGuildStore:RegisterCallback( AwesomeGuildStore.callback.AFTER_FILTER_SETUP, function() AGS_UG.initAGS() end)
	EVENT_MANAGER:UnregisterForEvent(Addon.Name, EVENT_ADD_ON_LOADED)
end


EVENT_MANAGER:RegisterForEvent(Addon.Name, EVENT_ADD_ON_LOADED, AGS_UG.onLoad)