require("RogueBuild01_BookTreasureWindowByName")
local RogueBookTreasureWindow = {}
local uis, contentPane, jumpTb, treasureData, allTreasureData, holyData, animTime, isPlayAnim, holyPlayAnim, picInfo, lastTreasureId, cacheHoly
local timeIndex = 0
local treasureGroupId

function RogueBookTreasureWindow.ReInitData()
end

function RogueBookTreasureWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RogueBookTreasureWindow.package, WinResConfig.RogueBookTreasureWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    cacheHoly = false
    uis = GetRogueBuild01_BookTreasureWindowUis(contentPane)
    treasureGroupId = bridgeObj.argTable[1]
    local holyGroupId = bridgeObj.argTable[2]
    allTreasureData = RogueBookTreasureWindow.GetTreasureData(treasureGroupId)
    treasureData = allTreasureData
    holyData = RogueBookTreasureWindow.GetHolyData(holyGroupId)
    RogueBookTreasureWindow.UpdateInfo()
    RogueBookTreasureWindow.InitBtn()
  end)
end

function RogueBookTreasureWindow.UpdateInfo()
  picInfo = RogueData.GetPicInfoBuyType(ProtoEnum.ROGUE_PIC_TYPE.TREASURE)
  RogueBookTreasureWindow.InitTreasure()
  RogueMgr.ClearNewByType(ProtoEnum.ROGUE_PIC_TYPE.TREASURE)
  uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.ROGUE_PIC_TREASURE)
end

function RogueBookTreasureWindow.InitSacred()
  local tips = uis.Main.BookSacredTips
  tips.ItemList:SetVirtual()
  local lastHolyBtn
  local holyPicInfo = RogueData.GetPicInfoBuyType(ProtoEnum.ROGUE_PIC_TYPE.HOLY)
  
  function tips.ItemList.itemRenderer(i, item)
    local data = holyData[i + 1]
    local itemBtn = item:GetChild("ItemBtn")
    itemBtn.selected = false
    itemBtn:GetChild("PicLoader").url = UIUtil.GetResUrl(data.icon)
    UIUtil.SetText(itemBtn, data.number(), "IDTxt")
    if holyPicInfo and holyPicInfo.picId2States[data.id] ~= nil then
      ChangeUIController(itemBtn, "c1", 0)
    elseif data.trends_condition or data.difficulty_condition then
      ChangeUIController(itemBtn, "c1", 2)
    else
      ChangeUIController(itemBtn, "c1", 1)
    end
    ChangeUIController(itemBtn, "new", holyPicInfo and holyPicInfo.picId2States[data.id] and 1 or 0)
    item.onClick:Set(function()
      if lastHolyBtn and lastHolyBtn == itemBtn then
        return
      end
      if lastHolyBtn then
        lastHolyBtn.selected = false
      end
      local lock = holyPicInfo and holyPicInfo.picId2States[data.id] ~= nil
      RogueBookTreasureWindow.ShowSacredInfo(data, lock)
      lastHolyBtn = itemBtn
      ChangeUIController(itemBtn, "new", 0)
    end)
    if 0 == i then
      item.onClick:Call()
      itemBtn.selected = true
    end
    if holyPlayAnim then
      itemBtn.alpha = 0
      animTime[item] = PlayUITrans(item, "up", function()
        animTime[item] = nil
        itemBtn.alpha = 1
      end, 0.03 * i)
    else
      itemBtn.alpha = 1
    end
  end
  
  holyPlayAnim = true
  tips.ItemList.numItems = #holyData
  holyPlayAnim = nil
  local newNum = 0
  if holyPicInfo then
    for i, v in pairs(holyPicInfo.picId2States) do
      if v then
        newNum = newNum + 1
      end
    end
  end
  if newNum > 0 then
    tips.Title.GetTips.WordTxt.text = T(1473, newNum)
    ChangeController(tips.Title.c1Ctr, 1)
  else
    ChangeController(tips.Title.c1Ctr, 0)
  end
end

function RogueBookTreasureWindow.GetTipsName(data)
  if data.trends_condition then
    local trendData = TableData.GetConfig(data.trends_condition, "BaseRogueTrends")
    if trendData and trendData.name then
      return T(1494, trendData.name())
    end
  end
  if data.difficulty_condition then
    return T(1499, data.difficulty_condition)
  end
  return ""
end

function RogueBookTreasureWindow.ShowSacredInfo(data, lock)
  local tips = uis.Main.BookSacredTips.Info
  tips.IDTxt.text = data.number()
  ChangeController(tips.c3Ctr, lock and 0 or 1)
  tips.NameTxt.text = lock and data.name() or T(732)
  if lock then
    ChangeController(tips.c3Ctr, 0)
  elseif data.trends_condition or data.difficulty_condition then
    ChangeController(tips.c3Ctr, 2)
    UIUtil.SetText(tips.LockBtn, RogueBookTreasureWindow.GetTipsName(data), "WordTxt")
  else
    ChangeController(tips.c3Ctr, 1)
  end
  tips.PicLoader.url = UIUtil.GetResUrl(data.icon)
  tips.Condition.WordTxt.text = T(1415)
  if data.unlock_condition then
    function tips.Condition.ItemList.itemRenderer(i, item)
      item.selected = false
      
      local arr = Split(data.unlock_condition[i + 1], ":")
      if 4 == #arr then
        local tempTreasureInfo = RogueBookTreasureWindow.GetSacredUnlockData(tonumber(arr[2]), tonumber(arr[3]))
        if tempTreasureInfo then
          item:GetChild("PicLoader").url = UIUtil.GetResUrl(tempTreasureInfo.icon)
        end
        UIUtil.SetText(item, tonumber(arr[4]), "NumberTxt")
        ChangeUIController(item, "c1", 1)
        ChangeUIController(item, "c2", 0)
        item.onClick:Set(function()
          if tips.Condition.ItemList.selectedIndex ~= i then
            tips.Condition.ItemList.selectedIndex = i
          end
        end)
      elseif 2 == #arr then
        local tempTreasureInfo = TableData.GetConfig(tonumber(arr[2]), "BaseRogueTreasure")
        if tempTreasureInfo then
          item:GetChild("PicLoader").url = UIUtil.GetResUrl(tempTreasureInfo.icon)
          UIUtil.SetText(item, tempTreasureInfo.number(), "IDTxt")
          ChangeUIController(item, "c1", 0)
          ChangeUIController(item, "c2", 1)
          item.onClick:Set(function()
            if tips.Condition.ItemList.selectedIndex ~= i then
              RogueBookTreasureWindow.ShowTips(tempTreasureInfo)
              ChangeController(tips.c2Ctr, 1)
              tips.Condition.ItemList.selectedIndex = i
            end
          end)
        end
      end
    end
    
    tips.Condition.ItemList.numItems = #data.unlock_condition
    tips.CloseBtn.onClick:Set(function()
      ChangeController(tips.c2Ctr, 0)
    end)
  end
  if data.card_id then
    local data = TableData.GetConfig(data.card_id, "BaseCard")
    if data then
      tips.WordTxt.text = T(1417, data.name())
      UIUtil.SetHeadByFaceId(data.fashion_id, tips.Head.HeadBg.PicLoader, HEAD_ICON_TYPE_ENUM.RECT)
    end
    ChangeController(tips.c1Ctr, 1)
  else
    tips.WordTxt.text = T(1442)
    ChangeController(tips.c1Ctr, 0)
  end
  
  function tips.WordList.itemRenderer(i, item)
    UIUtil.SetText(item, data.des(), "EffectTxt")
    UIUtil.SetText(item, data.des_detail(), "WordTxt")
  end
  
  tips.WordList.numItems = 1
end

function RogueBookTreasureWindow.GetSacredUnlockData(type, level)
  local data = TableData.GetTable("BaseRogueTreasureType")
  for i, v in pairs(data) do
    if v.level == level and v.type == type then
      return v
    end
  end
end

function RogueBookTreasureWindow.ShowTips(data)
  local tips = uis.Main.BookSacredTips.Info.ConditionInfo
  local lock = picInfo and picInfo.picId2States[data.id] ~= nil
  if lock then
    ChangeController(tips.c1Ctr, 0)
  elseif data.trends_condition or data.difficulty_condition then
    ChangeController(tips.c1Ctr, 2)
    UIUtil.SetText(tips.LockBtn, RogueBookTreasureWindow.GetTipsName(data), "WordTxt")
  else
    ChangeController(tips.c1Ctr, 1)
  end
  tips.NameTxt.text = lock and data.name() or T(732)
  tips.IDTxt.text = data.number()
  tips.LevelTxt.text = lock and RogueMgr.GetTreasureLevel(data.level) or T(732)
  tips.TypeTxt.text = lock and RogueMgr.GetTreasureType(data.type) or T(732)
  tips.PicLoader.url = UIUtil.GetResUrl(data.icon)
  
  function tips.WordList.itemRenderer(i, item)
    UIUtil.SetText(item, data.des(), "EffectTxt")
    UIUtil.SetText(item, data.des_detail(), "WordTxt")
  end
  
  tips.WordList.numItems = 1
end

function RogueBookTreasureWindow.InitTreasure()
  RogueBookTreasureWindow.StopAnim()
  local treasureTips = uis.Main.BookTreasureTips
  treasureTips.ItemList:SetVirtual()
  lastTreasureId = 0
  local tempNewPicIds = picInfo and SimpleCopy(picInfo.picId2States) or {}
  timeIndex = 0
  
  function treasureTips.ItemList.itemRenderer(i, item)
    local data = treasureData[i + 1]
    local itemBtn = item:GetChild("ItemBtn")
    itemBtn:GetChild("PicLoader").url = UIUtil.GetResUrl(data.icon)
    UIUtil.SetText(itemBtn, data.number(), "IDTxt")
    ChangeUIController(itemBtn, "new", tempNewPicIds[data.id] and 1 or 0)
    if picInfo and picInfo.picId2States[data.id] ~= nil then
      ChangeUIController(itemBtn, "c1", 0)
    elseif data.trends_condition or data.difficulty_condition then
      ChangeUIController(itemBtn, "c1", 2)
    else
      ChangeUIController(itemBtn, "c1", 1)
    end
    item.onClick:Set(function()
      ChangeUIController(itemBtn, "new", 0)
      tempNewPicIds[data.id] = nil
      RogueBookTreasureWindow.ShowTreasureInfo(data)
      lastTreasureId = data.id
      treasureTips.ItemList:RefreshVirtualList()
    end)
    if 0 == i and 0 == lastTreasureId then
      ChangeUIController(itemBtn, "new", 0)
      RogueBookTreasureWindow.ShowTreasureInfo(data)
      lastTreasureId = data.id
    end
    itemBtn.selected = lastTreasureId == data.id
    if isPlayAnim then
      itemBtn.alpha = 0
      animTime[item] = PlayUITrans(item, "up", function()
        animTime[item] = nil
        itemBtn.alpha = 1
      end, 0.02 * timeIndex)
    else
      itemBtn.alpha = 1
    end
    timeIndex = timeIndex + 1
  end
  
  isPlayAnim = true
  treasureTips.ItemList.numItems = #treasureData
  isPlayAnim = nil
  RogueBookTreasureWindow.InitScreen()
  treasureTips.Choice.NumberTxt.text = T(956, RogueBookTreasureWindow.GetUnLockNum(), treasureTips.ItemList.numItems)
  local newNum = 0
  local number = 0
  if picInfo then
    for i, v in pairs(picInfo.picId2States) do
      if v then
        newNum = newNum + 1
      end
      number = number + 1
    end
  end
  if newNum > 0 then
    treasureTips.Title.GetTips.WordTxt.text = T(1473, newNum)
    ChangeController(treasureTips.Title.c1Ctr, 1)
  else
    ChangeController(treasureTips.Title.c1Ctr, 0)
  end
  treasureTips.Title.NumberTxt.text = T(1492, number, #treasureData)
end

function RogueBookTreasureWindow.GetUnLockNum()
  local number = 0
  for i, v in pairs(treasureData) do
    if picInfo and picInfo.picId2States[v.id] ~= nil then
      number = number + 1
    end
  end
  return number
end

function RogueBookTreasureWindow.ShowTreasureInfo(data)
  local tips = uis.Main.BookTreasureTips.Info
  local lock = picInfo and picInfo.picId2States[data.id] ~= nil
  if lock then
    ChangeController(tips.c1Ctr, 0)
  elseif data.trends_condition or data.difficulty_condition then
    ChangeController(tips.c1Ctr, 2)
    UIUtil.SetText(tips.LockBtn, RogueBookTreasureWindow.GetTipsName(data), "WordTxt")
  else
    ChangeController(tips.c1Ctr, 1)
  end
  tips.NameTxt.text = lock and data.name() or T(732)
  tips.IDTxt.text = data.number()
  tips.LevelTxt.text = lock and RogueMgr.GetTreasureLevel(data.level) or T(732)
  tips.TypeTxt.text = lock and RogueMgr.GetTreasureType(data.type) or T(732)
  tips.PicLoader.url = UIUtil.GetResUrl(data.icon)
  
  function tips.WordList.itemRenderer(i, item)
    UIUtil.SetText(item, lock and data.des() or T(1440), "EffectTxt")
    UIUtil.SetText(item, lock and data.des_detail() or T(1441), "WordTxt")
  end
  
  tips.WordList.numItems = 1
end

function RogueBookTreasureWindow.StopAnim()
  if animTime then
    for i, v in pairs(animTime) do
      v:Stop(true, true)
    end
  end
  animTime = {}
end

function RogueBookTreasureWindow.InitScreen()
  local choice = uis.Main.BookTreasureTips.Choice
  UIUtil.SetText(uis.Main.BookTreasureTips.Screen1Btn, T(1496), "Word1Txt")
  UIUtil.SetText(uis.Main.BookTreasureTips.Screen1Btn, T(1497), "Word2Txt")
  UIUtil.SetText(uis.Main.BookTreasureTips.ScreenBtn, T(1403))
  uis.Main.BookTreasureTips.ScreenBtn.onClick:Set(function()
    if uis.Main.BookTreasureTips.Screen1Btn.selected == true then
      uis.Main.BookTreasureTips.Screen1Btn.selected = false
      choice.ResetBtn.onClick:Call()
    end
    ChangeController(uis.Main.BookTreasureTips.c1Ctr, 1)
    PlayUITrans(uis.Main.BookTreasureTips.root, "choicein")
  end)
  choice.WordTxt.text = T(1422)
  local tb = {
    [1] = {
      nameTxt = T(1419),
      listWordId = {1416, 1418}
    },
    [2] = {
      nameTxt = T(1420),
      listWordId = {
        1412,
        1413,
        1414
      }
    },
    [3] = {
      nameTxt = T(1421),
      listWordId = {
        1404,
        1405,
        1406,
        1407,
        1408,
        1409,
        1410,
        1411
      }
    }
  }
  for i = 1, 3 do
    local oneChoiceTab = choice["Choice" .. i]
    oneChoiceTab.NameTxt.text = tb[i].nameTxt
    local list = oneChoiceTab.TabList
    local listWordId = tb[i].listWordId
    
    function list.itemRenderer(ind, item)
      local index = ind + 1
      UIUtil.SetText(item, T(listWordId[index]))
      ChangeUIController(item, "c1", ind)
      item.changeStateOnClick = false
      item.onClick:Set(function()
        item.selected = not item.selected
        local state, isChoice = RogueBookTreasureWindow.GetScreenState()
        RogueBookTreasureWindow.UpdateTreasureList(state, isChoice)
      end)
    end
    
    list.numItems = #listWordId
  end
  choice.CloseBtn.onClick:Set(function()
    ChangeController(uis.Main.BookTreasureTips.c1Ctr, 0)
    PlayUITrans(uis.Main.BookTreasureTips.root, "choiceout")
  end)
  choice.ResetBtn.onClick:Set(function()
    local state, isChoice = RogueBookTreasureWindow.ResetScreenState()
    RogueBookTreasureWindow.UpdateTreasureList(state, isChoice)
  end)
  uis.Main.BookTreasureTips.Screen1Btn.onClick:Set(function()
    if uis.Main.BookTreasureTips.Screen1Btn.selected then
      local isChoice = {}
      local state = {}
      for i = 1, 3 do
        local oneChoiceTab = choice["Choice" .. i]
        local list = oneChoiceTab.TabList
        state[i] = {}
        for index = 1, list.numChildren do
          state[i][index] = false
          if state[i][index] then
            isChoice[i] = true
          end
        end
      end
      state[1][1] = true
      isChoice[1] = true
      RogueBookTreasureWindow.UpdateTreasureList(state, isChoice)
    else
      local state, isChoice = RogueBookTreasureWindow.ResetScreenState()
      RogueBookTreasureWindow.UpdateTreasureList(state, isChoice)
    end
  end)
end

function RogueBookTreasureWindow.GetScreenState()
  local choice = uis.Main.BookTreasureTips.Choice
  local state = {}
  local isChoice = {}
  for i = 1, 3 do
    local oneChoiceTab = choice["Choice" .. i]
    local list = oneChoiceTab.TabList
    state[i] = {}
    for index = 1, list.numChildren do
      state[i][index] = list:GetChildAt(index - 1).selected
      if state[i][index] then
        isChoice[i] = true
      end
    end
  end
  return state, isChoice
end

function RogueBookTreasureWindow.ResetScreenState()
  local choice = uis.Main.BookTreasureTips.Choice
  local state = {}
  local screenBtn
  for i = 1, 3 do
    local oneChoiceTab = choice["Choice" .. i]
    local list = oneChoiceTab.TabList
    state[i] = {}
    for index = 1, list.numChildren do
      list:GetChildAt(index - 1).selected = false
      state[i][index] = false
    end
  end
  return state, {}
end

local CheckType = function(configData, choiceInfo, choice)
  if not choice then
    return true
  end
  if configData and configData.type and choiceInfo[configData.type] then
    return true
  end
end
local CheckLevel = function(configData, choiceInfo, choice)
  if not choice then
    return true
  end
  if configData and configData.level and choiceInfo[configData.level] then
    return true
  end
end
local CheckContain = function(id, choiceInfo, choice)
  if not choice or choiceInfo[1] and choiceInfo[2] then
    return true
  end
  if choiceInfo[1] and picInfo and picInfo.picId2States[id] ~= nil then
    return true
  elseif choiceInfo[2] and (nil == picInfo or picInfo and picInfo.picId2States[id] == nil) then
    return true
  end
end

function RogueBookTreasureWindow.UpdateTreasureList(state, isChoice)
  RogueBookTreasureWindow.StopAnim()
  local newTb = {}
  if allTreasureData then
    for i, v in pairs(allTreasureData) do
      if CheckContain(v.id, state[1], isChoice[1]) and CheckLevel(v, state[2], isChoice[2]) and CheckType(v, state[3], isChoice[3]) then
        table.insert(newTb, v)
      end
    end
  end
  table.sort(newTb, function(a, b)
    return a.sort < b.sort
  end)
  isPlayAnim = true
  timeIndex = 0
  treasureData = newTb
  uis.Main.BookTreasureTips.ItemList.numItems = #treasureData
  isPlayAnim = nil
end

function RogueBookTreasureWindow.GetTreasureData(groupId)
  local data = TableData.GetTable("BaseRogueTreasure")
  local newTb = {}
  for i, v in pairs(data) do
    if v.group_id == groupId then
      table.insert(newTb, v)
    end
  end
  table.sort(newTb, function(a, b)
    return a.sort < b.sort
  end)
  return newTb
end

function RogueBookTreasureWindow.GetHolyData(groupId)
  local data = TableData.GetTable("BaseRogueHoly")
  local newTb = {}
  for i, v in pairs(data) do
    if v.group_id == groupId then
      table.insert(newTb, v)
    end
  end
  table.sort(newTb, function(a, b)
    return a.sort < b.sort
  end)
  return newTb
end

function RogueBookTreasureWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.RogueBookTreasureWindow.name, uis.Main.CurrencyReturn, FEATURE_ENUM.ROGUE_PIC_TREASURE)
  UIUtil.SetText(uis.Main.BookTabRegion.Tab01Btn, T(1399))
  UIUtil.SetText(uis.Main.BookTabRegion.Tab02Btn, T(1340))
  uis.Main.BookTabRegion.Tab01Btn.onClick:Set(function()
    if 0 == uis.Main.c1Ctr.selectedIndex then
      return
    end
    ChangeController(uis.Main.c1Ctr, 0)
    RogueBookTreasureWindow.UpdateInfo()
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.ROGUE_PIC_TREASURE)
  end)
  uis.Main.BookTabRegion.Tab02Btn.onClick:Set(function()
    if 1 == uis.Main.c1Ctr.selectedIndex then
      return
    end
    if cacheHoly then
      RogueBookTreasureWindow.InitSacred()
      ChangeController(uis.Main.c1Ctr, 1)
    else
      RogueService.GetRogueAllPicReq(ProtoEnum.ROGUE_PIC_TYPE.HOLY, function()
        RogueBookTreasureWindow.InitSacred()
        ChangeController(uis.Main.c1Ctr, 1)
        RogueMgr.ClearNewByType(ProtoEnum.ROGUE_PIC_TYPE.HOLY)
      end)
    end
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.ROGUE_PIC_HOLY)
  end)
  uis.Main.BookSacredTips.Title.WordTxt.text = T(1402)
  uis.Main.BookTreasureTips.Title.WordTxt.text = T(1401)
end

function RogueBookTreasureWindow.OnClose()
  uis = nil
  contentPane = nil
  treasureData = nil
  allTreasureData = nil
  holyData = nil
  animTime = nil
  isPlayAnim = nil
  holyPlayAnim = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
  picInfo = nil
  cacheHoly = nil
  timeIndex = nil
end

return RogueBookTreasureWindow
