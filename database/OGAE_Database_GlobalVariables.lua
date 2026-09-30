OGAE_Settings = OGAE_Settings or {}
OGAE_Minimap = OGAE_Minimap or {}
OGAE_EditMode = OGAE_EditMode or {}
OGAE_Text = {}
OGAE_Frames = {}


OGAE_EmoteList = {}
OGAE_SearchWordsList = {}
OGAE_WoWVersion = ""


OGAE_CurrentListEntry = 0
OGAE_CurrentListUpCount = 0


OGAE_Languages_Short = { "enUS", "deDE" }
OGAE_Languages_Full = { "English", "German (Deutsch)" }
OGAE_Languages_Default = 1


OGAE_Options_Category = {}
OGAE_Options_Layout = {}

OGAE_LibDBIcon = LibStub("LibDBIcon-1.0")
local _, ns = ...
OGAE_LibEditMode = ns.LibEditMode




-- define default values for the border colors.
OGAE_ColorDefaults = {}
OGAE_ColorDefaults[1] = {1.0, 0.8078432083129883, 0.0}
OGAE_ColorDefaults[2] = {1.0, 0.5843137502670288, 0.0}
OGAE_ColorDefaults[3] = {1.0, 1.0, 0.0}

for i=1, 3 do
	local textstring_red = ("Ring_Color_Red_"..tostring(i))
    local textstring_green = ("Ring_Color_Green_"..tostring(i))
    local textstring_blue = ("Ring_Color_Blue_"..tostring(i))
	local default_red = OGAE_ColorDefaults[i][1]
	local default_green = OGAE_ColorDefaults[i][2]
	local default_blue = OGAE_ColorDefaults[i][3]
	
	if OGAE_Settings[textstring_red] == nil then
	    OGAE_Settings[textstring_red] = default_red
	end
    if OGAE_Settings[textstring_green] == nil then
	    OGAE_Settings[textstring_green] = default_green
	end
    if OGAE_Settings[textstring_blue] == nil then
	    OGAE_Settings[textstring_blue] = default_blue
	end
end