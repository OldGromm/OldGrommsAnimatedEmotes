function OGAE_Emotes_CreateMainFrame()
    -- the core frame
    local MainFrame = CreateFrame("Frame", "OGAE_Frame_Main", UIParent)
    MainFrame:SetPoint("LEFT", 110, 64)
    MainFrame:SetSize(105, 32)
	MainFrame:SetIgnoreParentScale(true)
    MainFrame:Hide()

	OGAE_Frames["MainFrame"] = MainFrame
	
    -- collection frame where all the emote entries will be stored. It will me moved up or down depending on the visibility status of each emote.	    
	local CollectionFrame = CreateFrame("Frame", "OGAE_Frame_Collection", OGAE_Frame_Main)
    CollectionFrame:SetPoint("BOTTOM", 0, 0)
    CollectionFrame:SetSize(105, 32)
	
	OGAE_Frames["CollectionFrame"] = CollectionFrame
	
	
	-- frames for edit mode
	local EditModeFrame = CreateFrame("Frame", "OGAE_Frame_EditMode", OGAE_Frame_Main)
    EditModeFrame:SetPoint("CENTER", 0, 0)
    EditModeFrame:SetSize(105, 32)	
	
	OGAE_Frames["EditModeFrame"] = EditModeFrame
end




function OGAE_Emotes_CreateSubFrames()
    for i=1, 10 do
        local position_y = (-40*i)

		local VariableName_Origin_Frame = OGAE_General_GenerateVariableString("OriginFrame", i)
		local VariableName_Origin_Texture = OGAE_General_GenerateVariableString("OriginTexture", i)
		local VariableName_Origin_Border = OGAE_General_GenerateVariableString("OriginBorder", i)

		local VariableName_Emote_Frame = OGAE_General_GenerateVariableString("EmoteFrame", i)
		local VariableName_Emote_Texture = OGAE_General_GenerateVariableString("EmoteTexture", i)
		local VariableName_Emote_Border = OGAE_General_GenerateVariableString("EmoteBorder", i)

		local VariableName_Target_Frame = OGAE_General_GenerateVariableString("TargetFrame", i)
		local VariableName_Target_Texture = OGAE_General_GenerateVariableString("TargetTexture", i)
		local VariableName_Target_Border = OGAE_General_GenerateVariableString("TargetBorder", i)

		local FrameName_SubFrame_Origin = OGAE_General_GenerateVariableString("SubframeOrigin", i)
		local FrameName_SubFrame_Emote = OGAE_General_GenerateVariableString("SubframeEmote", i)
		local FrameName_SubFrame_Target = OGAE_General_GenerateVariableString("SubframeTarget", i)





        -- create sub frames to hold both the portrait/emote texture as well as the border texture on top.      
		local SubFrame_Origin = CreateFrame("Frame", FrameName_SubFrame_Origin, OGAE_Frame_Collection)
        SubFrame_Origin:SetPoint("LEFT", OGAE_Frame_Collection, "LEFT", 0, position_y)
        SubFrame_Origin:SetSize(32, 32)
		local SubFrame_Emote = CreateFrame("Frame", FrameName_SubFrame_Emote, OGAE_Frame_Collection)
        SubFrame_Emote:SetPoint("LEFT", OGAE_Frame_Collection, "LEFT", 37, position_y)
        SubFrame_Emote:SetSize(32, 32)
		local SubFrame_Target = CreateFrame("Frame", FrameName_SubFrame_Target, OGAE_Frame_Collection)
        SubFrame_Target:SetPoint("LEFT", OGAE_Frame_Collection, "LEFT", 74, position_y)
        SubFrame_Target:SetSize(32, 32)


        -- create origin portrait texture and border		
        local OriginFramePortrait = SubFrame_Origin:CreateTexture(FrameName_SubFrame_Origin, "ARTWORK")
        OriginFramePortrait:SetPoint("LEFT", SubFrame_Origin, "LEFT", 0, 0)
        OriginFramePortrait:SetSize(32, 32)
        SetPortraitTexture(OriginFramePortrait, "player")

        local OriginFrameBorder = SubFrame_Origin:CreateTexture(FrameName_SubFrame_Origin, "OVERLAY")
        OriginFrameBorder:SetPoint("LEFT", SubFrame_Origin, "LEFT", 0, 0)
        OriginFrameBorder:SetSize(32, 32)
        OriginFrameBorder:SetTexture("Interface\\AddOns\\OldGrommsAnimatedEmotes\\images\\borders\\Border1")
		
        local OriginFramePortraitMask = SubFrame_Origin:CreateMaskTexture()
        OriginFramePortraitMask:SetTexture("Interface\\AddOns\\OldGrommsAnimatedEmotes\\images\\borders\\mask", "CLAMPTOBLACKADDITIVE", "CLAMPTOBLACKADDITIVE")
        OriginFramePortraitMask:SetPoint("LEFT", SubFrame_Origin, "LEFT", 0, 0)
        OriginFramePortraitMask:SetSize(32, 32)
        OriginFramePortrait:AddMaskTexture(OriginFramePortraitMask)



        -- create emote texture and border		
        local EmoteFrameTexture = SubFrame_Emote:CreateTexture(FrameName_SubFrame_Emote, "ARTWORK")
        EmoteFrameTexture:SetPoint("LEFT", SubFrame_Emote, "LEFT", 00, 0)
        EmoteFrameTexture:SetSize(32, 32)
        EmoteFrameTexture:SetTexture(133836)

        local EmoteFrameBorder = SubFrame_Emote:CreateTexture(FrameName_SubFrame_Emote, "OVERLAY")
        EmoteFrameBorder:SetPoint("LEFT", SubFrame_Emote, "LEFT", 00, 0)
        EmoteFrameBorder:SetSize(32, 32)
        EmoteFrameBorder:SetTexture("Interface\\AddOns\\OldGrommsAnimatedEmotes\\images\\borders\\Border1")
		
        local EmoteFrameTextureMask = SubFrame_Emote:CreateMaskTexture()
        EmoteFrameTextureMask:SetTexture("Interface\\AddOns\\OldGrommsAnimatedEmotes\\images\\borders\\mask", "CLAMPTOBLACKADDITIVE", "CLAMPTOBLACKADDITIVE")
        EmoteFrameTextureMask:SetPoint("LEFT", SubFrame_Emote, "LEFT", 0, 0)
        EmoteFrameTextureMask:SetSize(32, 32)
        EmoteFrameTexture:AddMaskTexture(EmoteFrameTextureMask)



        -- create target portrait texture and border		
        local TargetFramePortrait = SubFrame_Target:CreateTexture(FrameName_SubFrame_Target, "ARTWORK")
        TargetFramePortrait:SetPoint("LEFT", SubFrame_Target, "LEFT", 0, 0)
        TargetFramePortrait:SetSize(32, 32)
        SetPortraitTexture(TargetFramePortrait, "player")

        local TargetFrameBorder = SubFrame_Target:CreateTexture(FrameName_SubFrame_Target, "OVERLAY")
        TargetFrameBorder:SetPoint("LEFT", SubFrame_Target, "LEFT", 0, 0)
        TargetFrameBorder:SetSize(32, 32)
        TargetFrameBorder:SetTexture("Interface\\AddOns\\OldGrommsAnimatedEmotes\\images\\borders\\Border1")
		
        local TargetFramePortraitMask = SubFrame_Target:CreateMaskTexture()
        TargetFramePortraitMask:SetTexture("Interface\\AddOns\\OldGrommsAnimatedEmotes\\images\\borders\\mask", "CLAMPTOBLACKADDITIVE", "CLAMPTOBLACKADDITIVE")
        TargetFramePortraitMask:SetPoint("LEFT", SubFrame_Target, "LEFT", 0, 0)
        TargetFramePortraitMask:SetSize(32, 32)
        TargetFramePortrait:AddMaskTexture(TargetFramePortraitMask)


        UIFrameFadeOut(SubFrame_Origin, 0.0, 1, 0)
        UIFrameFadeOut(SubFrame_Emote, 0.0, 1, 0)
        UIFrameFadeOut(SubFrame_Target, 0.0, 1, 0)


        -- assign most of the created frames to a global variable, so the textures can be changed later.	    
		OGAE_Frames[VariableName_Origin_Frame] = SubFrame_Origin
		OGAE_Frames[VariableName_Origin_Texture] = OriginFramePortrait
		OGAE_Frames[VariableName_Origin_Border] = OriginFrameBorder
		OGAE_Frames[VariableName_Emote_Frame] = SubFrame_Emote
		OGAE_Frames[VariableName_Emote_Texture] = EmoteFrameTexture
		OGAE_Frames[VariableName_Emote_Border] = EmoteFrameBorder
		OGAE_Frames[VariableName_Target_Frame] = SubFrame_Target
		OGAE_Frames[VariableName_Target_Texture] = TargetFramePortrait
		OGAE_Frames[VariableName_Target_Border] = TargetFrameBorder
		
		
		OGAE_Frames["MainFrame"]:Show()
	end
end




function OGAE_Emotes_UpdateBorderTexture(input_number)
    local BorderTexture = ("Interface\\AddOns\\OldGrommsAnimatedEmotes\\images\\borders\\Border"..tostring(input_number))

    for i=1, 10 do
        local VariableName_Origin_Border = OGAE_General_GenerateVariableString("OriginBorder", i)
        local VariableName_Emote_Border = OGAE_General_GenerateVariableString("EmoteBorder", i)
        local VariableName_Target_Border = OGAE_General_GenerateVariableString("TargetBorder", i)

        OGAE_Frames[VariableName_Origin_Border]:SetTexture(BorderTexture)
	    OGAE_Frames[VariableName_Emote_Border]:SetTexture(BorderTexture)
	    OGAE_Frames[VariableName_Target_Border]:SetTexture(BorderTexture)
    end
end




function OGAE_Emotes_MoveEntireMenu(input_direction)
    local direction = 0
    local listcount = 0
    if input_direction == "up" then
        direction = 40
        listcount = 1
	elseif input_direction == "down" then
        direction = -40
        listcount = -1
	end
    OGAE_CurrentListUpCount = OGAE_CurrentListUpCount + listcount


    local _, _, _, _, positionold_y = OGAE_Frames["CollectionFrame"]:GetPoint()
    local positionnew_y = (positionold_y + direction)

    if input_direction == "up" then
	    OGAE_Frames["CollectionFrame"]:SetPoint("BOTTOM", 0, positionnew_y)
	elseif input_direction == "down" then
        if OGAE_CurrentListUpCount == 0 then
            OGAE_Frames["CollectionFrame"]:SetPoint("BOTTOM", 0, 0)
		end
    else
	end

end




function OGAE_Emotes_AddNewEntry(EmoteText, SenderName, TargetName, SenderGUID)
    local emote_icon = 134400 -- default icon if no data for the current emote exists.
    for _, v in pairs(OGAE_EmoteList) do
	    local emote_icon_new = v[OGAE_WoWVersion]
		local keywords_list = v["SearchWords"]
		for _, k in ipairs(keywords_list) do
			if string.find(EmoteText, k) then
		        emote_icon = emote_icon_new
			break
		end
		end
	end

    if OGAE_CurrentListEntry < 10 then

        -- advance list order
    	OGAE_CurrentListEntry = (OGAE_CurrentListEntry + 1)



        -- origin player portrait
    	local VariableName_Origin_Texture = OGAE_General_GenerateVariableString("OriginTexture", OGAE_CurrentListEntry)
    	local origin = OGAE_Frames[VariableName_Origin_Texture]
    	
		---- check if player name is availabe. If the value is empty, use the GUID as a backup instead.
        local Sender = UnitTokenFromGUID(SenderGUID)	
		SetPortraitTexture(origin, Sender)



        -- emote icon
    	local VariableName_Emote_Texture = OGAE_General_GenerateVariableString("EmoteTexture", OGAE_CurrentListEntry)
    	OGAE_Frames[VariableName_Emote_Texture]:SetTexture(emote_icon)


	
    	-- target portrait
		local TargetExists = false
		local TargetUnit
        if Sender == "player" and UnitExists("target") == true then
    	        TargetExists = true
                TargetUnit = "target"
		else
		    if TargetName == (nil or "") then
			
			else
		        TargetExists = true
			    TargetUnit = TargetName
		    end
		end

		
		if TargetExists == true then
            local VariableName_Target_Texture = OGAE_General_GenerateVariableString("TargetTexture", OGAE_CurrentListEntry)
            local target = OGAE_Frames[VariableName_Target_Texture]
            SetPortraitTexture(target, TargetUnit)
		end


        local VariableName_Origin_Frame = OGAE_General_GenerateVariableString("OriginFrame", OGAE_CurrentListEntry)
        local VariableName_Emote_Frame = OGAE_General_GenerateVariableString("EmoteFrame", OGAE_CurrentListEntry)
        local VariableName_Target_Frame = OGAE_General_GenerateVariableString("TargetFrame", OGAE_CurrentListEntry)
        local SubFrame_Origin = OGAE_Frames[VariableName_Origin_Frame]
    	local SubFrame_Emote = OGAE_Frames[VariableName_Emote_Frame]
    	local SubFrame_Target = OGAE_Frames[VariableName_Target_Frame]
    
    
        OGAE_Emotes_MoveEntireMenu("up")
    
        UIFrameFadeIn(SubFrame_Origin, 0.2, 0, 1)
        UIFrameFadeIn(SubFrame_Emote, 0.2, 0, 1)
    	if TargetExists == true then
            UIFrameFadeIn(SubFrame_Target, 0.2, 0, 1)
    	end
    
    
    	local duration = OGAE_Settings["Emote_Duration"]
    	local duration2 = (duration+0.2)
        C_Timer.After(duration, function()
            UIFrameFadeOut(SubFrame_Origin, 0.2, 1, 0)
            UIFrameFadeOut(SubFrame_Emote, 0.2, 1, 0)
            if TargetExists == true then
                UIFrameFadeOut(SubFrame_Target, 0.2, 1, 0)
            end
    	end)
    	C_Timer.After(duration2, function()
    	    OGAE_CurrentListEntry = (OGAE_CurrentListEntry - 1)
    		OGAE_Emotes_MoveEntireMenu("down")
    	end)

	end
end