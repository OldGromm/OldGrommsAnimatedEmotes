function OGAE_General_GenerateVariableString(input_frametype, input_number)
	local VariableString = (input_frametype..tostring(input_number))
	return VariableString
end




function OGAE_General_LoadLanguage()
    local ClientLocale = GetLocale()

    if OGAE_Settings["Language"] == nil then
        for i, v in ipairs(OGAE_Languages_Short) do
            if ClientLocale == v then
				OGAE_Languages_Default = i
	        end
        end
	else
	    OGAE_Languages_Default = OGAE_Settings["Language"]
	end


	if OGAE_Languages_Default == 1 then
        OGAE_LanguageData_enUS()
    elseif OGAE_Languages_Default == 2 then
        OGAE_LanguageData_deDE()
    else
    end
	
end




function OGAE_General_CombatCheck()
    local RestrictionType = false
    for i=0, 3 do
	    if C_RestrictedActions.IsAddOnRestrictionActive(i) == true then
		    RestrictionType = true
		end
	end
	return RestrictionType
end




function OGAE_General_ToggleMinimapButton()
    if OGAE_Settings["Minimap_Button"] == true then
	    OGAE_LibDBIcon:Show("OGAE_Minimap")
    elseif OGAE_Settings["Minimap_Button"] == false then
	    OGAE_LibDBIcon:Hide("OGAE_Minimap")
    else
    end
end




function OGAE_General_OpenSettingsMenu()
    if OGAE_General_CombatCheck() == false then
	    local SettingsLink = OGAE_Options_Category:GetID()
        Settings.OpenToCategory(SettingsLink)
	end
end




function OGAE_General_DetectGameVersion()
    if WOW_PROJECT_ID == 1 and LE_EXPANSION_LEVEL_CURRENT == 0 then -- Forever
        OGAE_WoWVersion = "Mainline"
    elseif WOW_PROJECT_ID == 1 and LE_EXPANSION_LEVEL_CURRENT == 12 then -- The Last Titan
        OGAE_WoWVersion = "Mainline"
    elseif WOW_PROJECT_ID == 1 and LE_EXPANSION_LEVEL_CURRENT == 11 then -- Midnight
        OGAE_WoWVersion = "Mainline"
    elseif WOW_PROJECT_ID == 19 and LE_EXPANSION_LEVEL_CURRENT == 4 then -- Mists of Pandaria
        OGAE_WoWVersion = "Classic"
    elseif WOW_PROJECT_ID == 11 and LE_EXPANSION_LEVEL_CURRENT == 2 then -- Wrath of the Lich King (Titan Reforged)
        OGAE_WoWVersion = "Classic"
    elseif WOW_PROJECT_ID == 5 and LE_EXPANSION_LEVEL_CURRENT == 1 then -- The Burning Crusade
        OGAE_WoWVersion = "Classic"
    elseif WOW_PROJECT_ID == 2 and LE_EXPANSION_LEVEL_CURRENT == 0 then -- Classic Era
        OGAE_WoWVersion = "Classic"
    else

    end
end




function OGAE_General_FormatSecondsText(input_value)
    local textstring = string.format(OGAE_Formatting_Seconds, input_value)
	return textstring 
end