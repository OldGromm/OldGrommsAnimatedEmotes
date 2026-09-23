function OGAE_Options_CreateOptionsEntries()

OGAE_Options_Category = Settings.RegisterVerticalLayoutCategory(OGAE_Text_Options_Category_Title)



local function OnSettingChanged(setting, value)
	if setting.variable == "OGAE_Options_Minimap_Button" then
	    OGAE_General_ToggleMinimapButton()
	elseif setting.variable == "OGAE_Options_Change_Emote_Icon_Border" then
		OGAE_Emotes_UpdateBorderTexture(value)
	end
end




do
    local name = OGAE_Text_Options_Language_Title
    local variable = "OGAE_Options_Change_Language"
	local variableKey = "Language"
    local tooltip = (OGAE_Text_Options_Language_Description.."\n\n"..OGAE_Text_RequiresReload)

    local function GetOptions()
        local container = Settings.CreateControlTextContainer()
		for i, v in ipairs(OGAE_Languages_Full) do
		    container:Add(i, v)
		end
        return container:GetData()
    end

	local setting = Settings.RegisterAddOnSetting(OGAE_Options_Category, variable, variableKey, OGAE_Settings, Settings.VarType.Number, name, OGAE_Languages_Default)
	setting:SetValueChangedCallback(OnSettingChanged)

    Settings.CreateDropdown(OGAE_Options_Category, setting, GetOptions, tooltip)
end




do
    local name = OGAE_Text_Options_MinimapButton_Title
    local variable = "OGAE_Options_Minimap_Button"
    local variableKey = "Minimap_Button"
    local tooltip = OGAE_Text_Options_MinimapButton_Description

    local setting = Settings.RegisterAddOnSetting(OGAE_Options_Category, variable, variableKey, OGAE_Settings, Settings.VarType.Boolean, name, Settings.Default.True)
    setting:SetValueChangedCallback(OnSettingChanged)

    Settings.CreateCheckbox(OGAE_Options_Category, setting, tooltip)
end




if OGAE_WoWVersion == "Mainline" then
    do
    	local name = OGAE_Text_Options_CompartmentButton_Title
    	local variable = "OGAE_Options_Compartment_Button"
    	local variableKey = "Compartment_Button"
    	local tooltip = (OGAE_Text_Options_CompartmentButton_Description.."\n\n"..OGAE_Text_RequiresReload)

    	local setting = Settings.RegisterAddOnSetting(OGAE_Options_Category, variable, variableKey, OGAE_Settings, Settings.VarType.Boolean, name, Settings.Default.True)
    	setting:SetValueChangedCallback(OnSettingChanged)

    	Settings.CreateCheckbox(OGAE_Options_Category, setting, tooltip)
    end
end




do
    local name = OGAE_Text_Options_EmoteIconBorder_Title
    local variable = "OGAE_Options_Change_Emote_Icon_Border"
	local variableKey = "Emote_Icon_Border"
    local tooltip = OGAE_Text_Options_EmoteIconBorder_Description

    local function GetOptions()
        local container = Settings.CreateControlTextContainer()
		for i=1, 3 do
		    local texture = ("Interface\\AddOns\\OldGrommsAnimatedEmotes\\images\\borders\\Border"..tostring(i))
		    container:Add(i, CreateSimpleTextureMarkup(texture, 16, 16))
		end
        return container:GetData()
    end

	local setting = Settings.RegisterAddOnSetting(OGAE_Options_Category, variable, variableKey, OGAE_Settings, Settings.VarType.Number, name, 1)
	setting:SetValueChangedCallback(OnSettingChanged)

    Settings.CreateDropdown(OGAE_Options_Category, setting, GetOptions, tooltip)
end




do
    local name = OGAE_Text_Options_EmoteDuration_Title
    local variable = "OGAE_Options_Change_Emote_Duration"
	local variableKey = "Emote_Duration"
    local tooltip = OGAE_Text_Options_EmoteDuration_Description
	local minValue = 1.0
	local maxValue = 10.0
	local step = 1.0

	local function GetValue()
		return OGAE_Settings["Emote_Duration"] or defaultValue
	end

	local function SetValue(value)
		OGAE_Settings["Emote_Duration"] = value
	end
    local setting = Settings.RegisterAddOnSetting(OGAE_Options_Category, variable, variableKey, OGAE_Settings, Settings.VarType.Number, name, 4.0)
	setting:SetValueChangedCallback(OnSettingChanged)

	local options = Settings.CreateSliderOptions(minValue, maxValue, step)
	options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right, OGAE_General_FormatSecondsText);
	Settings.CreateSlider(OGAE_Options_Category, setting, options, tooltip)
end




Settings.RegisterAddOnCategory(OGAE_Options_Category)
end