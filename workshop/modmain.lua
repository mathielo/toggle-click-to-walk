local CLICK_TO_WALK_ENABLED = GetModConfigData("CLICK_TO_WALK_ENABLED")
local CTW_TOGGLE_SHORTCUTKEY = GetModConfigData("CTW_TOGGLE_SHORTCUTKEY")

local ACTIONS = GLOBAL.ACTIONS
local BufferedAction = GLOBAL.BufferedAction
local TheInput = GLOBAL.TheInput

local PlayerControllerPostConstruct = function(self)
  local OriginalOnLeftClick = self.OnLeftClick

  self.OnLeftClick = function(self, down)
    -- IsAOETargeting was implemented for The Forge and is only available in DST.
    -- Check if the method exists before calling if to add DS compatibility
    local LocalIsAOET = false
    if self.IsAOETargeting then
      LocalIsAOET = self:IsAOETargeting()
    end

    -- Only intercept if "down" and also if nothing is being placed
    if down and (self.placer_recipe == nil or self.placer == nil) and not LocalIsAOET then
      local act = self:GetLeftMouseAction() or BufferedAction(self.inst, nil, ACTIONS.WALKTO, nil, TheInput:GetWorldPosition())
      local mouseEntity = TheInput:GetWorldEntityUnderMouse()
      local mousePointsAtPlayerOrNil = mouseEntity == nil or mouseEntity == self.inst
      if not CLICK_TO_WALK_ENABLED and act.action == ACTIONS.WALKTO and act.target == nil and mousePointsAtPlayerOrNil then
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
