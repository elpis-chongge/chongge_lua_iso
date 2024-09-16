require("Message_MapTipsWindowByName")
local MapTipsWindow = {}
local uis, contentPane

function MapTipsWindow.ReInitData()
end

function MapTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.MapTipsWindow.package, WinResConfig.MapTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetMessage_MapTipsWindowUis(contentPane)
    local id = bridgeObj.argTable[1]
    local mapData = TableData.GetConfig(id, "BaseArenaMap")
    if mapData then
      MapTipsWindow.UpdateInfo(mapData)
    end
    MapTipsWindow.InitBtn()
  end)
end

function MapTipsWindow.UpdateInfo(mapData)
  uis.Main.MapContent.NameTxt.text = mapData.name()
  local list = uis.Main.MapContent.InfoList
  
  function list.itemRenderer(index, item)
    UIUtil.SetText(item, mapData.des(), "WordTxt")
    UIUtil.SetText(item, T(1341), "EfectTxt")
    UIUtil.SetText(item, T(1342), "NoBuffTxt")
    ChangeUIController(item, "c1", mapData.buff_list and 0 or 1)
    local buffList = item:GetChild("Info1List")
    if buffList and mapData.buff_list then
      function buffList.itemRenderer(i, buff)
        local buffData = TableData.GetConfig(mapData.buff_list[i + 1], "BaseSkillBuffPre")
        
        if buffData then
          UIUtil.SetText(buff, buffData.des(), "WordTxt")
          UIUtil.SetText(buff, buffData.name(), "NameTxt")
        end
      end
      
      buffList.numItems = #mapData.buff_list
      buffList:ResizeToFit()
    end
  end
  
  list.numItems = 1
end

function MapTipsWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.MapTipsWindow.name)
  end)
end

function MapTipsWindow.OnClose()
  uis = nil
  contentPane = nil
end

return MapTipsWindow
