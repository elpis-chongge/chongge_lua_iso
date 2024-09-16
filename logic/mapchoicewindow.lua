require("Formation_MapChoiceWindowByName")
local MapChoiceWindow = {}
local uis, contentPane, lastMapId, curMapId, ownMaps

function MapChoiceWindow.ReInitData()
end

function MapChoiceWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.MapChoiceWindow.package, WinResConfig.MapChoiceWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    curMapId = bridgeObj.argTable[1]
    lastMapId = curMapId
    uis = GetFormation_MapChoiceWindowUis(contentPane)
    MapChoiceWindow.UpdateInfo()
    MapChoiceWindow.InitBtn()
    MapChoiceWindow.UpdateCurSelectMap()
  end)
end

function MapChoiceWindow.UpdateInfo()
  local list = uis.Main.MapChoice1.MapIconRegion.IconList
  list:SetVirtual()
  ownMaps = FormationData.GetArenaMap()
  table.sort(ownMaps, function(a, b)
    return a.id < b.id
  end)
  list.itemRenderer = MapChoiceWindow.RenderItem
  list.numItems = #ownMaps
end

function MapChoiceWindow.UpdateCurSelectMap()
  local curConfig = TableData.GetConfig(curMapId, "BaseArenaMap")
  local loaderBg = uis.Main.MapChoice1.MapLoader
  loaderBg.url = UIUtil.GetResUrl(curConfig.icon_bg)
  local buff_list = curConfig.buff_list
  if buff_list then
    local buffWordList = uis.Main.MapChoice1.MapDetails.BuffWordList
    
    function buffWordList.itemRenderer(index, item)
      local preBuffId = buff_list[index + 1]
      local preConfig = TableData.GetConfig(tonumber(preBuffId), "BaseSkillBuffPre")
      if nil == preConfig then
        return
      end
      item:GetChild("IconLoader").url = UIUtil.GetResUrl(preConfig.icon)
      item:GetChild("WordTxt").text = preConfig.des()
    end
    
    buffWordList.numItems = #buff_list
  end
end

function MapChoiceWindow.RenderItem(index, item)
  local mapConfig = ownMaps[index + 1]
  local list = uis.Main.MapChoice1.MapIconRegion.IconList
  if nil == mapConfig then
    return
  end
  local id = mapConfig.id
  item:GetChild("NameTxt").text = mapConfig.name()
  item.onClick:Set(function()
    if id ~= curMapId then
      curMapId = id
      MapChoiceWindow.UpdateCurSelectMap()
    end
    list.selectedIndex = index
  end)
  if id == curMapId then
    item.onClick:Call()
  end
  local loader = item:GetChild("IconLoader")
  loader.url = UIUtil.GetResUrl(mapConfig.icon)
  local buff_list = mapConfig.buff_list
  if buff_list then
    local mapBuffList = item:GetChild("MapBuffList")
    if mapBuffList then
      function mapBuffList.itemRenderer(index, item)
        local preBuffId = buff_list[index + 1]
        
        local preConfig = TableData.GetConfig(tonumber(preBuffId), "BaseSkillBuffPre")
        if nil == preConfig then
          return
        end
        item:GetChild("IconLoader").url = UIUtil.GetResUrl(preConfig.icon)
      end
      
      mapBuffList.numItems = #buff_list
    end
  end
end

function MapChoiceWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.MapChoiceWindow.name)
  end)
  UIUtil.SetPopupBtnGroup(uis.Main.Popup_Info.BtnGroup.root, {
    touchCallback = function()
      if curMapId ~= lastMapId then
        UIMgr:SendWindowMessage(WinResConfig.FormationWindow.name, WindowMsgEnum.FormationWindow.CHANGE_MAP, curMapId)
      end
      UIMgr:CloseWindow(WinResConfig.MapChoiceWindow.name)
    end
  }, {
    touchCallback = function()
      UIMgr:CloseWindow(WinResConfig.MapChoiceWindow.name)
    end
  })
end

function MapChoiceWindow.OnShown()
end

function MapChoiceWindow.OnHide()
end

function MapChoiceWindow.OnClose()
  uis = nil
  contentPane = nil
  ownMaps = nil
  curMapId = nil
  lastMapId = nil
end

function MapChoiceWindow.HandleMessage(msgId, para)
end

return MapChoiceWindow
