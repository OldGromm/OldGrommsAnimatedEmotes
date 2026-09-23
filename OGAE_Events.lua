OGAE_Event_ChatMessageEmote = CreateFrame("Frame")
OGAE_Event_ChatMessageEmote:RegisterEvent("CHAT_MSG_EMOTE")
OGAE_Event_ChatMessageEmote:RegisterEvent("CHAT_MSG_TEXT_EMOTE")
OGAE_Event_ChatMessageEmote:SetScript("OnEvent", function(_, event, EmoteText, SenderName, _, _, TargetName, _, _, _, _, _, _, SenderGUID)
    -- check if any information is secret, otherwise proceed.
	if hasanysecretvalues(EmoteText, SenderName, TargetName, SenderGUID) == true then

	else
        OGAE_Emotes_AddNewEntry(EmoteText, SenderName, TargetName, SenderGUID)
	end
end)




OGAE_Event_Setup_PlayerLogin = CreateFrame("Frame")
OGAE_Event_Setup_PlayerLogin:RegisterEvent("PLAYER_LOGIN")
OGAE_Event_Setup_PlayerLogin:SetScript("OnEvent", function(_, event)
    OGAE_General_LoadLanguage()
	OGAE_General_DetectGameVersion()
	OGAE_Database_LoadEmoteList()
	OGAE_Options_CreateOptionsEntries()
    OGAE_Emotes_CreateMainFrame()
	OGAE_Emotes_CreateSubFrames()
	OGAE_EditMode_RegisterFrame()
	OGAE_Other_CreateMinimapButton()
	OGAE_General_ToggleMinimapButton()
    OGAE_Other_CreateCompartmentButton()
end)