local OGAE_DefaultEditModeData = {
	    point = "LEFT",
        x = 40,
        y = 0,
		scale = 1.0
	    }


function OGAE_EditMode_RegisterFrame()
    local MainFrame = OGAE_Frames["MainFrame"]
	local EditModeFrame = OGAE_Frames["EditModeFrame"]


    local function onPositionChanged(frame, layoutName, point, x, y)
        OGAE_EditMode[layoutName].point = point
        OGAE_EditMode[layoutName].x = x
        OGAE_EditMode[layoutName].y = y
    end


    OGAE_LibEditMode:RegisterCallback("enter", function()
        EditModeFrame:Show()
    end)


    OGAE_LibEditMode:RegisterCallback("exit", function()
        EditModeFrame:Hide()
    end)


    OGAE_LibEditMode:RegisterCallback("layout", function(layoutName)
        if not OGAE_EditMode[layoutName] then
            OGAE_EditMode[layoutName] = CopyTable(OGAE_DefaultEditModeData)
        end

        MainFrame:ClearAllPoints()
        MainFrame:SetPoint(OGAE_EditMode[layoutName].point, OGAE_EditMode[layoutName].x, OGAE_EditMode[layoutName].y)
		MainFrame:SetScale(OGAE_EditMode[layoutName].scale)
    end)


    OGAE_LibEditMode:AddFrame(MainFrame, onPositionChanged, OGAE_DefaultEditModeData)


    OGAE_LibEditMode:AddFrameSettings(MainFrame, {
        {
        name = OGAE_Text_EditMode_EmoteScale,
        kind = OGAE_LibEditMode.SettingType.Slider,
        default = 1,
        get = function(layoutName)
            return OGAE_EditMode[layoutName].scale
        end,
        set = function(layoutName, value)
            OGAE_EditMode[layoutName].scale = value
            MainFrame:SetScale(value)
        end,
        minValue = 0.1,
        maxValue = 5,
        valueStep = 0.1,
        formatter = function(value)
            return FormatPercentage(value, true)
        end,
        }
    })

end