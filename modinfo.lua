--The name of the mod displayed in the 'mods' screen.
name = "Toggle Click to Walk"

--A description of the mod.
description = "Makes it possible to disable the walk by clicking action in the game."

--Who wrote this awesome mod?
author = "machete_kills"

--A version number so you can ask people if they are running an old version of your mod.
version = "0.1.0"

--This lets other players know if your mod is out of date. This typically needs to be updated every time there's a new game update.
api_version = 6
api_version_dst = 10
priority = 0

--Compatible with both the base game and Reign of Giants
dont_starve_compatible = false
reign_of_giants_compatible = false
shipwrecked_compatible = false
dst_compatible = true

--This lets clients know if they need to get the mod from the Steam Workshop to join the game
all_clients_require_mod = false

--This determines whether it causes a server to be marked as modded (and shows in the mod list)
client_only_mod = true

--This lets people search for servers with this mod by these tags
server_filter_tags = {}

icon_atlas = "toggle-c2w.tex"
icon = "toggle-c2w.tex"

forumthread = ""

configuration_options =
{
  {
    name = "CLICK_TO_WALK_ENABLED",
    label = "Click to Walk",
    hover = "Should your char move (walk) when you click on the ground?",
    options = {
      {description = "Yes", data = true},
      {description = "No", data = false},
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
