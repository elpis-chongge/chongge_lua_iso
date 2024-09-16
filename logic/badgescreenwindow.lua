require("Badge_BadgeScreenWindowByName")
local BadgeScreenWindow = {}
local uis, contentPane, screen, suitList, starList, mainAttributeList, viceAttributeList

function BadgeScreenWindow.ReInitData()
end

function BadgeScreenWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.BadgeScreenWindow.package, WinResConfig.BadgeScreenWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetBadge_BadgeScreenWindowUis(contentPane)
    screen = uis.Main.BadgeScreen1
    BadgeScreenWindow.UpdateInfo()
    BadgeScreenWindow.InitBtn()
  end)
end

function BadgeScreenWindow.UpdateInfo()
  local tips1 = UIMgr:CreateComponent("Badge", "ScreenTitleTips1")
  UIUtil.SetText(tips1:GetChild("ScreenTitle"), T(1216), "TitleTxt")
  local addBtn = tips1:GetChild("ScreenTitleBtn")
  UIUtil.SetText(addBtn, T(1220), "WordTxt")
  addBtn.onClick:Set(function()
    OpenWindow(WinResConfig.BadgeSuitScreenWindow.name)
  end)
  suitList = tips1:GetChild("TipsList")
  BadgeScreenWindow.UpdateSuitList()
  screen.ScreenList:AddChild(tips1)
  local tips2 = UIMgr:CreateComponent("Badge", "ScreenTitleTips2")
  UIUtil.SetText(tips2:GetChild("ScreenTitle"), T(1217), "TitleTxt")
  starList = tips2:GetChild("TipsList")
  BadgeScreenWindow.UpdateStarList()
  screen.ScreenList:AddChild(tips2)
  local tips3 = UIMgr:CreateComponent("Badge", "ScreenTitleTips3")
  UIUtil.SetText(tips3:GetChild("ScreenTitle"), T(1218), "TitleTxt")
  local addBtn3 = tips3:GetChild("ScreenTitleBtn")
  UIUtil.SetText(addBtn3, T(1220), "WordTxt")
  addBtn3.onClick:Set(function()
    OpenWindow(WinResConfig.BadgePrimaryAttributeWindow.name)
  end)
  mainAttributeList = tips3:GetChild("TipsList")
  BadgeScreenWindow.UpdateMainAttributeList()
  screen.ScreenList:AddChild(tips3)
  local tips4 = UIMgr:CreateComponent("Badge", "ScreenTitleTips4")
  UIUtil.SetText(tips4:GetChild("ScreenTitle"), T(1219), "TitleTxt")
  local addBtn4 = tips4:GetChild("ScreenTitleBtn")
  UIUtil.SetText(addBtn4, T(1220), "WordTxt")
  addBtn4.onClick:Set(function()
    OpenWindow(WinResConfig.BadgeSecondaryAttributeWindow.name)
  end)
  viceAttributeList = tips4:GetChild("TipsList")
  BadgeScreenWindow.UpdateViceAttributeList()
  screen.ScreenList:AddChild(tips4)
end

function BadgeScreenWindow.UpdateSuitList()
  if suitList then
    function suitList.itemRenderer(i, item)
      local suitData = TableData.GetConfig(BadgeData.SuitId[i + 1], "BaseBadgeSuitGroup")
      
      if suitData then
        UIUtil.SetText(item, suitData.name(), "NameTxt")
        item:GetChild("ItemLoader").url = UIUtil.GetResUrl(suitData.icon)
        item.onClick:Set(function()
          BadgeData.DeleteOneSuitId(suitData.id)
          suitList.numItems = #BadgeData.SuitId
          BadgeScreenWindow.UpdateResult()
        end)
      end
    end
    
    suitList.numItems = #BadgeData.SuitId
    suitList:ResizeToFit()
  end
end

function BadgeScreenWindow.UpdateStarList()
  if starList then
    function starList.itemRenderer(i, item)
      UIUtil.SetText(item, i + 1, "WordTxt")
      
      item.onClick:Set(function()
        item.selected = not item.selected
        BadgeData.StarNum[i + 1] = item.selected
        BadgeScreenWindow.UpdateResult()
      end)
      item.selected = BadgeData.StarNum[i + 1] and true or false
    end
    
    starList.numItems = 4
  end
end

function BadgeScreenWindow.UpdateMainAttributeList()
  if mainAttributeList then
    local sort = BadgeMgr.mainAttributeCtr
    if #BadgeData.MainAttribute > 1 then
      table.sort(BadgeData.MainAttribute, function(a, b)
        return sort[a] < sort[b]
      end)
    end
    
    function mainAttributeList.itemRenderer(i, item)
      local type = BadgeData.MainAttribute[i + 1]
      ChangeUIController(item, "c1", sort[type])
      UIUtil.SetText(item, BadgeData.GetBadgeAttributeName(type), "NameTxt")
      item.onClick:Set(function()
        BadgeData.DeleteOneMainAttribute(type)
        mainAttributeList.numItems = #BadgeData.MainAttribute
        BadgeScreenWindow.UpdateResult()
      end)
    end
    
    mainAttributeList.numItems = #BadgeData.MainAttribute
    mainAttributeList:ResizeToFit()
  end
end

function BadgeScreenWindow.UpdateViceAttributeList()
  if viceAttributeList then
    local sort = BadgeMgr.viceAttributeCtr
    if #BadgeData.ViceAttribute > 1 then
      table.sort(BadgeData.ViceAttribute, function(a, b)
        return sort[a] < sort[b]
      end)
    end
    
    function viceAttributeList.itemRenderer(i, item)
      local type = BadgeData.ViceAttribute[i + 1]
      ChangeUIController(item, "c1", sort[type])
      UIUtil.SetText(item, BadgeData.GetBadgeAttributeName(type), "NameTxt")
      item.onClick:Set(function()
        BadgeData.DeleteOneViceAttribute(type)
        viceAttributeList.numItems = #BadgeData.ViceAttribute
        BadgeScreenWindow.UpdateResult()
      end)
    end
    
    viceAttributeList.numItems = #BadgeData.ViceAttribute
    viceAttributeList:ResizeToFit()
  end
end

function BadgeScreenWindow.UpdateResult()
  if UIMgr:IsWindowOpen(WinResConfig.BadgeWindow.name) then
    UIMgr:SendWindowMessage(WinResConfig.BadgeWindow.name, WindowMsgEnum.BadgeWindow.SCREENING_SHOW)
  end
  if UIMgr:IsWindowOpen(WinResConfig.BadgeDecomposeWindow.name) then
    UIMgr:SendWindowMessage(WinResConfig.BadgeDecomposeWindow.name, WindowMsgEnum.BadgeWindow.SCREENING_SHOW)
  end
end

function BadgeScreenWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(BadgeScreenWindow.CloseWindow)
  UIUtil.SetText(screen.ScreenSureBtn, T(1215), "NameTxt")
  screen.ScreenSureBtn.onClick:Set(BadgeScreenWindow.CloseWindow)
  UIUtil.SetText(screen.ResettingBtn, T(1214), "NameTxt")
  screen.ResettingBtn.onClick:Set(function()
    BadgeData.InitScreeningData()
    BadgeScreenWindow.UpdateSuitList()
    BadgeScreenWindow.UpdateStarList()
    BadgeScreenWindow.UpdateMainAttributeList()
    BadgeScreenWindow.UpdateViceAttributeList()
    BadgeScreenWindow.UpdateResult()
  end)
end

function BadgeScreenWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.BadgeScreenWindow.name)
end

function BadgeScreenWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.BadgeWindow.SCREENING then
    BadgeScreenWindow.UpdateSuitList()
    BadgeScreenWindow.UpdateMainAttributeList()
    BadgeScreenWindow.UpdateViceAttributeList()
    BadgeScreenWindow.UpdateResult()
  end
end

function BadgeScreenWindow.OnClose()
  uis = nil
  contentPane = nil
  screen = nil
  screen = nil
  suitList = nil
  starList = nil
  mainAttributeList = nil
  viceAttributeList = nil
end

return BadgeScreenWindow
