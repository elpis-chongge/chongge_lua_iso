require("Abyss_GuideBoardWindowByName")
local GuideBoardWindow = {}
local uis, contentPane, eventInfo

function GuideBoardWindow.ReInitData()
end

function GuideBoardWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.GuideBoardWindow.package, WinResConfig.GuideBoardWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    eventInfo = bridgeObj.argTable[1]
    uis = GetAbyss_GuideBoardWindowUis(contentPane)
    GuideBoardWindow.UpdateInfo()
    GuideBoardWindow.InitBtn()
  end)
end

function GuideBoardWindow.UpdateInfo()
  local eventId = eventInfo.eventId
  local config = TableData.GetConfig(eventId, "BaseManorEvent")
  local name, des
  if type(config.name) == "function" then
    name = config.name()
  else
    name = "未配置" .. tostring(eventId)
  end
  if "function" == type(config.des) then
    des = config.des()
  else
    des = "未配置" .. tostring(eventId)
  end
  uis.Main.GuideBoardTips.TitleTxt.text = name
  local list = uis.Main.GuideBoardTips.WordList
  list.defaultItem = "ui://rs1gte228s13go"
  
  function list.itemRenderer(i, item)
    item:GetChild("WordTxt").text = des
  end
  
  list.numItems = 1
  UIUtil.SetBtnText(uis.Main.GuideBoardTips.SureBtn, T(20060))
end

function GuideBoardWindow.InitBtn()
  uis.Main.GuideBoardTips.SureBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.GuideBoardWindow.name)
  end)
  uis.Main.PopupBg.root.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.GuideBoardWindow.name)
  end)
end

function GuideBoardWindow.OnClose()
  uis = nil
  contentPane = nil
end

return GuideBoardWindow
