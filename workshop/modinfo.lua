--The name of the mod displayed in the 'mods' screen.
name = "Toggle Click to Walk"

--A description of the mod.
description = "Toggle the ability of walk by clicking while playing!\n\nWhat you save in the mod settings screen will be the \"default\" option whenever you join a game. You may choose to have the ability on or off by default.\n\nWhichever you choose, you can always toggle it while in-game by pressing the selected hotkey :)"

--Who wrote this awesome mod?
author = "dread3ddie"

--A version number so you can ask people if they are running an old version of your mod.
version = "0.2.2"

--This lets other players know if your mod is out of date. This typically needs to be updated every time there's a new game update.
api_version = 6
api_version_dst = 10
priority = 0

--Compatible with both the base game and Reign of Giants
dont_starve_compatible = true
reign_of_giants_compatible = true
shipwrecked_compatible = true
dst_compatible = true

--This lets clients know if they need to get the mod from the Steam Workshop to join the game
all_clients_require_mod = false

--This determines whether it causes a server to be marked as modded (and shows in the mod list)
client_only_mod = true

--This lets people search for servers with this mod by these tags
server_filter_tags = {}

icon_atlas = "toggle-c2w.xml"
icon = "toggle-c2w.tex"

forumthread = "/files/file/1788-toggle-click-to-walk/"

configuration_options =
{
  {
    name = "CLICK_TO_WALK_ENABLED",
    label = "Click to Walk",
    hover = "Should your char move (walk) when you click on the ground?",
    options = {
      {description = "No", data = false},
      {description = "Yes", data = true},
    },
    default = false,
  },
  {
    name = "CTW_TOGGLE_SHORTCUTKEY",
    label = "Toggle Key",
    hover = "Press this key to toggle on/off",
    options = {
      {description = "K", data = "K"},
      {description = "L", data = "L"},
      {description = ";", data = ";"},
      {description = "[", data = "["},
      {description = "]", data = "]"},
      {description = "Disabled", data = false},
    },
    default = "K",
  },
}
