-- Minimap button setup
function OGAE_Other_CreateMinimapButton()
    local OGAE_LDB = LibStub("LibDataBroker-1.1"):NewDataObject("OGAE_Minimap", {  
    	type = "data source",
    	icon = 2056011,
    	OnClick = function(clickedframe, button)
            if button == "LeftButton" then
                OGAE_General_OpenSettingsMenu()
            elseif button == "MiddleButton" then
			    OGAE_General_OpenSettingsMenu()
			elseif button == "RightButton" then
			    OGAE_General_OpenSettingsMenu()
            else
            end
        end,
        OnTooltipShow = function(tip)
        tip:AddLine(OGAE_Text_Options_Category_Title, 1, 1, 1)
        tip:AddLine(OGAE_Text_Compartment_Description)
		tip:Show()
        end 
    })

    OGAE_LibDBIcon:Register("OGAE_Minimap", OGAE_LDB, OGAE_Minimap)
end