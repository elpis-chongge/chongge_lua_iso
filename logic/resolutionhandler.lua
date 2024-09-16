local ResolutionHandler = {}
local _screenWidth = CS.UnityEngine.Screen.width
local _screenHeight = CS.UnityEngine.Screen.height
local _designScreenWidth = DesignScreen.width
local _designScreenHeight = DesignScreen.height
ResolutionHandler.Width = _designScreenWidth
ResolutionHandler.Height = _designScreenHeight
ResolutionHandler.AdaptOffset = {X = 0, Y = 0}
ResolutionHandler.ScreenScale = {X = 1, Y = 1}
ResolutionHandler.UIScale = 0.01333333

function ResolutionHandler.Init()
  local dx = _screenWidth / _designScreenWidth
  local dy = _screenHeight / _designScreenHeight
  if dx < dy then
    dy = _screenWidth / _screenHeight
    dx = _designScreenWidth / dy
    ResolutionHandler.AdaptOffset.Y = (dx - _designScreenHeight) * 0.5
    ResolutionHandler.Height = dx
  else
    dy = _screenWidth / _screenHeight
    dx = _designScreenHeight * dy
    ResolutionHandler.AdaptOffset.X = (dx - _designScreenWidth) * 0.5
    ResolutionHandler.Width = dx
  end
  ResolutionHandler.ScreenScale.X = ResolutionHandler.Width / _screenWidth
  ResolutionHandler.ScreenScale.Y = ResolutionHandler.Height / _screenHeight
  ResolutionHandler.UIScale = CS.FairyGUI.Stage.inst.gameObject.transform:Find("GRoot/UILayer").lossyScale.x
end

ResolutionHandler.Init()
return ResolutionHandler
