local CLICK_TO_WALK_ENABLED = GetModConfigData("CLICK_TO_WALK_ENABLED")
local CTW_TOGGLE_SHORTCUTKEY = GetModConfigData("CTW_TOGGLE_SHORTCUTKEY")

local ACTIONS = GLOBAL.ACTIONS
local BufferedAction = GLOBAL.BufferedAction
local TheInput = GLOBAL.TheInput

local PlayerControllerPostConstruct = function(self)
  local OriginalOnLeftClick = self.OnLeftClick

  self.OnLeftClick = function(self, down)
    -- Only intercept if "down" and also if nothing is being placed
    if down and (self.placer_recipe == nil or self.placer == nil) then
      local act = self:GetLeftMouseAction() or BufferedAction(self.inst, nil, ACTIONS.WALKTO, nil, TheInput:GetWorldPosition())
      if not CLICK_TO_WALK_ENABLED and act.action == ACTIONS.WALKTO and act.target == nil and TheInput:GetWorldEntityUnderMouse() == nil then
        return
      end
    end

    return OriginalOnLeftClick(self, down)
  end
end

if type(CTW_TOGGLE_SHORTCUTKEY) == "string" then
  local key = CTW_TOGGLE_SHORTCUTKEY:lower():byte()
  TheInput:AddKeyUpHandler(key, function()
    CLICK_TO_WALK_ENABLED = not CLICK_TO_WALK_ENABLED
  end)
end

AddClassPostConstruct('components/playercontroller', PlayerControllerPostConstruct)
