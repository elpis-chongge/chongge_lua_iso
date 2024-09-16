require("Story_CGShowWindowByName")
local CGShowWindow = {}
local uis, contentPane, cgId, show

function CGShowWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.CGShowWindow.package, WinResConfig.CGShowWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetStory_CGShowWindowUis(contentPane)
    cgId = bridgeObj.argTable[1]
    CGShowWindow.Init()
  end)
end

function CGShowWindow.Init()
  local itemData = TableData.GetConfig(cgId, "BaseStoryCg")
  if itemData then
    if itemData.path_dynamic then
      UIUtil.SetHolderCenter(uis.Main.BackGround.BackGroundHolder)
      UIUtil.SetEffectToUI(RES_PATH_PREFIX.CG_PREFAB .. itemData.path_dynamic, uis.Main.BackGround.BackGroundHolder)
    elseif itemData.path then
      local texture = ResourceManager.LoadTexture(RES_PATH_PREFIX.CG .. itemData.path)
      UIUtil.SetLoaderTexture(uis.Main.BackGround.BackGroundLoader, texture)
    end
    CGShowWindow.ShowUI(true)
    uis.Main.HideWordBtn.onClick:Set(function()
      if show then
        CGShowWindow.ShowUI(false)
      end
    end)
    uis.Main.BackGround.root.onClick:Set(function()
      if false == show then
        CGShowWindow.ShowUI(true)
      end
    end)
  end
  uis.Main.CGShowCloseBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.CGShowWindow.name)
  end)
end

function CGShowWindow.ShowUI(bol)
  show = bol
  ChangeController(uis.Main.c1Ctr, show and 0 or 1)
end

function CGShowWindow.HandleMessage(msgId, para)
end

function CGShowWindow.OnClose()
  uis = nil
  contentPane = nil
  cgId = nil
end

return CGShowWindow
