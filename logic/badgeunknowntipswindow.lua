require("Message_BadgeUnknownTipsWindowByName")
local BadgeUnknownTipsWindow = {}
local uis, contentPane, badgeData, wayData, jumpData

function BadgeUnknownTipsWindow.ReInitData()
end

function BadgeUnknownTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.BadgeUnknownTipsWindow.package, WinResConfig.BadgeUnknownTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetMessage_BadgeUnknownTipsWindowUis(contentPane)
    local badgeId = bridgeObj.argTable[1]
    badgeData = TableData.GetConfig(badgeId, "BaseBadge")
    if badgeData then
      BadgeUnknownTipsWindow.UpdateInfo()
    end
    BadgeUnknownTipsWindow.InitBtn()
  end)
end

function BadgeUnknownTipsWindow.UpdateInfo()
  uis.Main.NameTxt.text = badgeData.name()
  uis.Main.NumberTxt.text = BadgeData.GetBadgePartName(badgeData.type)
  uis.Main.PicLoaderr.url = UIUtil.GetResUrl(badgeData.icon)
  BadgeMgr.ShowStar(uis.Main.StarList, badgeData.star)
  local suitGroupData = TableData.GetConfig(badgeData.suit_group_id, "BaseBadgeSuitGroup")
  if suitGroupData then
    local suitItem = UIMgr:CreateComponent("Message", "BadgeDetailsInfo2")
    UIUtil.SetText(suitItem, suitGroupData.name(), "NameTxt")
    local suitList = suitItem:GetChild("SuitList")
    
    function suitList.itemRenderer(i, suit)
      local suitData = TableData.GetConfig(suitGroupData.suit_id[i + 1], "BaseBadgeSuit")
      if suitData then
        UIUtil.SetText(suit, suitData.des(), "WordTxt")
      end
    end
    
    suitList.numItems = #suitGroupData.suit_id
    uis.Main.WordList:AddChild(suitItem)
  end
  uis.Main.Way.NameTxt.text = T(841)
  if badgeData.go_to_type and 1 == badgeData.go_to_type then
    ChangeController(uis.Main.c1Ctr, 1)
  elseif badgeData.go_to_id then
    BadgeUnknownTipsWindow.GetGoToData()
    ChangeController(uis.Main.c1Ctr, 0)
  else
    uis.Main.Way.WordTxt.text = T(711)
    uis.Main.Way.SubtitleTxt.text = T(842)
    ChangeController(uis.Main.c1Ctr, 1)
  end
end

local SortFun = function(a, b)
  return a.sort > b.sort
end
local SortClientGoTo = function()
  if #wayData > 1 then
    table.sort(wayData, SortFun)
  end
end

function BadgeUnknownTipsWindow.GetGoToData()
  local tb = {}
  if badgeData.go_to_id then
    for i, v in pairs(badgeData.go_to_id) do
      local data = TableData.GetConfig(v, "BaseClientGoTo")
      if data then
        table.insert(tb, data)
      end
    end
  end
  BadgeUnknownTipsWindow.StageIsUnlock(tb)
end

function BadgeUnknownTipsWindow.StageIsUnlock(goToData)
  jumpData = goToData
  local stageIds = {}
  local lockIds = {}
  wayData = {}
  for i, v in pairs(goToData) do
    if v.go_to_stage then
      local stageData = TableData.GetConfig(v.go_to_stage, "BaseStage")
      if stageData and AdventureData.GetStageOpen(stageData.chapter_id, v.go_to_stage) then
        table.insert(wayData, v)
      else
        lockIds[v.go_to_stage] = v
        table.insert(stageIds, v.go_to_stage)
      end
    elseif v.go_to_feature and EnterClampUtil.WhetherToEnter(v.go_to_feature, false) then
      table.insert(wayData, v)
    end
  end
  if #stageIds > 0 then
    ld("Adventure", function()
      AdventureService.GetOpenStagesReq(stageIds, function(param)
        local ids = param.openStageIds
        if ids then
          for i, v in pairs(ids) do
            table.insert(wayData, lockIds[v])
          end
        end
        if 2 == badgeData.go_to_type then
          BadgeUnknownTipsWindow.ShowAllGoTo()
        else
          SortClientGoTo()
          BadgeUnknownTipsWindow.ShowGoTo()
        end
      end)
    end)
  elseif 2 == badgeData.go_to_type then
    BadgeUnknownTipsWindow.ShowAllGoTo()
  else
    SortClientGoTo()
    BadgeUnknownTipsWindow.ShowGoTo()
  end
end

function BadgeUnknownTipsWindow.ShowAllGoTo()
  local IsUnlock = function(id)
    for i, v in pairs(wayData) do
      if v.id == id then
        return true
      end
    end
  end
  if #jumpData > 2 then
    local newTb = {}
    local tempIndex
    for i = 1, #jumpData do
      if IsUnlock(jumpData[i].id) then
        tempIndex = i
      elseif tempIndex then
        table.insert(newTb, jumpData[tempIndex])
        table.insert(newTb, jumpData[i])
        jumpData = newTb
        break
      end
    end
    if tempIndex then
      table.insert(newTb, jumpData[#jumpData - 1])
      table.insert(newTb, jumpData[#jumpData])
      jumpData = newTb
    else
      table.insert(newTb, jumpData[1])
      table.insert(newTb, jumpData[2])
      jumpData = newTb
    end
  end
  local proShow = {
    T(704),
    T(703),
    T(848)
  }
  
  function uis.Main.Way.GetStripList.itemRenderer(i, item)
    UIUtil.SetText(item, jumpData[i + 1].name(), "NameTxt")
    UIUtil.SetText(item:GetChild("GetStripLock"), T(954), "WordTxt")
    if jumpData[i + 1].pro_show then
      ChangeUIController(item, "c1", 1)
      UIUtil.SetText(item:GetChild("ItemLabelWord"), proShow[jumpData[i + 1].pro_show], "NameTxt")
    elseif type(jumpData[i + 1].remark) == "function" then
      ChangeUIController(item, "c1", 2)
      UIUtil.SetText(item, jumpData[i + 1].remark(), "WordTxt")
    else
      ChangeUIController(item, "c1", 0)
    end
    if jumpData[i + 1].type then
      ChangeUIController(item, "c2", jumpData[i + 1].type)
    end
    local featureLock = EnterClampUtil.WhetherToEnter(jumpData[i + 1].go_to_feature, false)
    if IsUnlock(jumpData[i + 1].id) and featureLock then
      ChangeUIController(item, "lock", 0)
    else
      ChangeUIController(item, "lock", 1)
    end
    local featureData = TableData.GetConfig(jumpData[i + 1].go_to_feature, "BaseFeature")
    if featureLock then
      local closeFun = function()
        BadgeUnknownTipsWindow.CloseWindow()
      end
      if featureData and jumpData[i + 1] then
        CurrencyReturnWindow.SetJumpFun(item, featureData, jumpData[i + 1], nil, closeFun)
      end
    else
      item.onClick:Set(function()
        if featureData and featureData.unlock_des then
          FloatTipsUtil.ShowWarnTips(featureData.unlock_des())
        end
      end)
    end
  end
  
  uis.Main.Way.GetStripList.numItems = #jumpData > 2 and 2 or #jumpData
end

function BadgeUnknownTipsWindow.ShowGoTo()
  local proShow = {
    T(704),
    T(703),
    T(848)
  }
  
  function uis.Main.Way.GetStripList.itemRenderer(i, item)
    UIUtil.SetText(item, wayData[i + 1].name(), "NameTxt")
    if wayData[i + 1].pro_show then
      ChangeUIController(item, "c1", 1)
      UIUtil.SetText(item:GetChild("ItemLabelWord"), proShow[wayData[i + 1].pro_show], "NameTxt")
    else
      ChangeUIController(item, "c1", 0)
    end
    if wayData[i + 1].type then
      ChangeUIController(item, "c2", wayData[i + 1].type)
    end
    local featureData = TableData.GetConfig(wayData[i + 1].go_to_feature, "BaseFeature")
    local closeFun = function()
      BadgeUnknownTipsWindow.CloseWindow()
    end
    if featureData and jumpData[i + 1] then
      CurrencyReturnWindow.SetJumpFun(item, featureData, jumpData[i + 1], nil, closeFun)
    end
  end
  
  uis.Main.Way.GetStripList.numItems = #wayData > 2 and 2 or #wayData
  uis.Main.c1Ctr.selectedIndex = #wayData > 0 and 0 or 1
end

function BadgeUnknownTipsWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.BadgeUnknownTipsWindow.name)
end

function BadgeUnknownTipsWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(BadgeUnknownTipsWindow.CloseWindow)
end

function BadgeUnknownTipsWindow.OnClose()
  uis = nil
  contentPane = nil
  wayData = nil
  jumpData = nil
  badgeData = nil
end

return BadgeUnknownTipsWindow
