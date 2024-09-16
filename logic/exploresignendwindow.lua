require("ExploreSign_EndWindowByName")
local ExploreSignEndWindow = {}
local uis, contentPane, param

function ExploreSignEndWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ExploreSignEndWindow.package, WinResConfig.ExploreSignEndWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetExploreSign_EndWindowUis(contentPane)
    param = bridgeObj.argTable[1]
    ExploreSignEndWindow.UpdateTextDisplay()
    ExploreSignEndWindow.InitBtn()
    ExploreSignEndWindow.InitList()
  end)
end

function ExploreSignEndWindow.InitList()
  if param and param.reward then
    local reward = param.reward
    
    function uis.Main.ItemList.itemRenderer(i, item)
      UIUtil.ShowItemFrame(reward[i + 1].itemId, item, reward[i + 1].count)
      SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.GET_ITEM)
    end
    
    uis.Main.ItemList.numItems = #reward
  end
end

function ExploreSignEndWindow.UpdateTextDisplay()
  uis.Main.NameTxt.text = T(740)
  uis.Main.SubtitleTxt.text = T(741)
end

function ExploreSignEndWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.ExploreSignEndWindow.name)
  end)
end

function ExploreSignEndWindow.HandleMessage(msgId, para)
end

function ExploreSignEndWindow.OnClose()
  uis = nil
  contentPane = nil
  param = nil
end

return ExploreSignEndWindow
