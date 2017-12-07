local CLICK_TO_WALK_ENABLED = GetModConfigData("CLICK_TO_WALK_ENABLED")

local PlayerControllerPostConstruct = function(self)
  local OriginalOnLeftClick = self.OnLeftClick
  local BufferedAction = GLOBAL.BufferedAction
  local ACTIONS = GLOBAL.ACTIONS
  local TheInput = GLOBAL.TheInput

  self.OnLeftClick = function(down)
    local act = self:GetLeftMouseAction() or BufferedAction(self.inst, nil, ACTIONS.WALKTO, nil, TheInput:GetWorldPosition())
    if act.action == ACTIONS.WALKTO and act.target == nil and TheInput:GetWorldEntityUnderMouse() == nil then
      return
    end

    return OriginalOnLeftClick(self, down)
  end
end

if not CLICK_TO_WALK_ENABLED then
  AddClassPostConstruct('components/playercontroller', PlayerControllerPostConstruct)
end
