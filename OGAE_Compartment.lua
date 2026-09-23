function OGAE_Other_CreateCompartmentButton()
    if OGAE_WoWVersion == "Mainline" and OGAE_Settings["Compartment_Button"] == true then
        AddonCompartmentFrame:RegisterAddon({
            text = OGAE_Text_Options_Category_Title,
            icon = 2056011,
            notCheckable = true,
            func = function(button, menuInputData, menu)
                local MouseButtonType = menuInputData.buttonName
				if MouseButtonType == "LeftButton" then
                    OGAE_General_OpenSettingsMenu()
                elseif MouseButtonType == "MiddleButton" then
                    OGAE_General_OpenSettingsMenu()
				elseif MouseButtonType == "RightButton" then
				    OGAE_General_OpenSettingsMenu()
                else
                end
            end,
            funcOnEnter = function(button)
                MenuUtil.ShowTooltip(button, function(tooltip)
                    tooltip:SetText(OGAE_Text_Compartment_Description)
                end)
            end,
            funcOnLeave = function(button)
                MenuUtil.HideTooltip(button)
            end,
        })
   	end
end