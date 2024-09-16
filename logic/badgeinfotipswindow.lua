require("Message_BadgeInfoTipsWindowByName")
local BadgeInfoTipsWindow = {}
local uis, contentPane, badgeData, badgeInfo, wayData, jumpData, notShowWay

function BadgeInfoTipsWindow.ReInitData()
end

function BadgeInfoTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.BadgeInfoTipsWindow.package, WinResConfig.BadgeInfoTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetMessage_BadgeInfoTipsWindowUis(contentPane)
    BadgeInfoTipsWindow.InitBtn()
    local uid = bridgeObj.argTable[1]
    notShowWay = bridgeObj.argTable[2]
    badgeInfo = ActorData.GetBadgeInfoByUid(uid)
    if badgeInfo then
      badgeData = TableData.GetConfig(badgeInfo.badgeId, "BaseBadge")
      BadgeInfoTipsWindow.UpdateInfo()
    end
  end)
end

function BadgeInfoTipsWindow.UpdateInfo()
  uis.Main.NameTxt.text = badgeData.name()
  uis.Main.NumberTxt.text = BadgeData.GetBadgePartName(badgeData.type)
  uis.Main.PicLoaderr.url = UIUtil.GetResUrl(badgeData.icon)
  BadgeMgr.ShowStar(uis.Main.StarList, badgeData.star)
  ChangeController(uis.Main.Lock.c1Ctr, badgeInfo.locked and 1 or 0)
  uis.Main.Lock.root.onClick:Set(function()
    BadgeService.SetBadgeLockStateReq(not badgeInfo.locked, badgeInfo.badgeUid, function(msg)
      badgeInfo.locked = msg.locked
      ChangeController(uis.Main.Lock.c1Ctr, badgeInfo.locked and 1 or 0)
    end)
  end)
  local info = UIMgr:CreateComponent("Message", "BadgeDetailsInfo1")
  local mainData = TableData.GetConfig(badgeInfo.mainAttribute, "BaseBadgeAttribute")
  local mainCom = info:GetChild("BadgeDetailsInfo1_1")
  if mainData and mainCom then
    ChangeUIController(mainCom, "c1", BadgeMgr.mainAttributeCtr[mainData.type])
    UIUtil.SetText(mainCom, BadgeData.GetAttributeNameByInfo(mainData.type), "NameTxt")
    UIUtil.SetText(mainCom, BadgeData.GetAttribute(badgeInfo.attributeLevels[badgeInfo.mainAttribute], badgeInfo.mainAttribute, false), "NumberTxt")
  end
  local sort = BadgeMgr.viceAttributeCtr
  local newViceAttribute = {}
  for i, v in pairs(badgeInfo.viceAttributes) do
    local data = TableData.GetConfig(v, "BaseBadgeAttribute")
    if data then
      table.insert(newViceAttribute, data)
    end
  end
  if #newViceAttribute > 1 then
    table.sort(newViceAttribute, function(a, b)
      return sort[a.type] < sort[b.type]
    end)
  end
  local viceList = info:GetChild("AttributeList")
  
  function viceList.itemRenderer(i, item)
    local data = newViceAttribute[i + 1]
    ChangeUIController(item, "c1", sort[data.type])
    UIUtil.SetText(item, BadgeData.GetAttributeNameByInfo(data.type), "NameTxt")
    UIUtil.SetText(item, BadgeData.GetAttribute(badgeInfo.attributeLevels[data.id], data.id, false), "NumberTxt")
  end
  
  viceList.numItems = #newViceAttribute
  viceList:ResizeToFit()
  uis.Main.WordList:AddChild(info)
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
  ChangeController(uis.Main.c1Ctr, 1)
  uis.Main.Way.NameTxt.text = T(841)
  if badgeData.go_to_type and 1 == badgeData.go_to_type or true == notShowWay then
    ChangeController(uis.Main.c1Ctr, 1)
  elseif badgeData.go_to_id then
    BadgeInfoTipsWindow.GetGoToData()
    ChangeController(uis.Main.c1Ctr, 0)
  else
    uis.Main.Way.WordTxt.text = T(711)
    uis.Main.Way.SubtitleTxt.text = T(842)
    ChangeController(uis.Main.c1Ctr, 1)
  end
end

function BadgeInfoTipsWindow.GetGoToData()
  local tb = {}
  if badgeData.go_to_id then
    for i, v in pairs(badgeData.go_to_id) do
      local data = TableData.GetConfig(v, "BaseClientGoTo")
      if data then
        table.insert(tb, data)
      end
    end
  end
  BadgeInfoTipsWindow.StageIsUnlock(tb)
end

function BadgeInfoTipsWindow.StageIsUnlock(goToData)
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
          BadgeInfoTipsWindow.ShowAllGoTo()
        else
          SortClientGoTo()
          BadgeInfoTipsWindow.ShowGoTo()
        end
      end)
    end)
  elseif 2 == badgeData.go_to_type then
    BadgeInfoTipsWindow.ShowAllGoTo()
  else
    SortClientGoTo()
    BadgeInfoTipsWindow.ShowGoTo()
  end
end

function BadgeInfoTipsWindow.ShowAllGoTo()
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
        BadgeInfoTipsWindow.CloseWindow()
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

function BadgeInfoTipsWindow.ShowGoTo()
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
      BadgeInfoTipsWindow.CloseWindow()
    end
    if featureData and jumpData[i + 1] then
      CurrencyReturnWindow.SetJumpFun(item, featureData, jumpData[i + 1], nil, closeFun)
    end
  end
  
  uis.Main.Way.GetStripList.numItems = #wayData > 2 and 2 or #wayData
  uis.Main.c1Ctr.selectedIndex = #wayData > 0 and 0 or 1
end

function BadgeInfoTipsWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.BadgeInfoTipsWindow.name)
end

function BadgeInfoTipsWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(BadgeInfoTipsWindow.CloseWindow)
end

function BadgeInfoTipsWindow.OnClose()
  uis = nil
  contentPane = nil
  badgeData = nil
  badgeInfo = nil
  wayData = nil
  jumpData = nil
  notShowWay = nil
end

return BadgeInfoTipsWindow
