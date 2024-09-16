require("RogueBuild01_InsideItemLookWindowByName")
local RogueGameBackpackWindow = {}
local uis, contentPane, allHalidom, allTreasures, maskedTreasures, LEVEL_MASK, TYPE_MASK, selectedTreasureId
local TREASURE_TYPE_NAME_LOOKUP = {
  [RogueTreasureType.ATTR_GOT] = T(1404),
  [RogueTreasureType.COIN_GOT] = T(1405),
  [RogueTreasureType.ATK] = T(1406),
  [RogueTreasureType.DEF] = T(1407),
  [RogueTreasureType.HP] = T(1408),
  [RogueTreasureType.ATK_SPD] = T(1409),
  [RogueTreasureType.TREAT] = T(1410),
  [RogueTreasureType.OTHER] = T(1411)
}
local TREASURE_LEVEL_NAME_LOOKUP = {
  [1] = T(1412),
  [2] = T(1413),
  [3] = T(1414)
}
local TREASURE_LEVEL_LIST = {
  1,
  2,
  3
}
local TREASURE_TYPE_LIST = {
  RogueTreasureType.ATTR_GOT,
  RogueTreasureType.COIN_GOT,
  RogueTreasureType.ATK,
  RogueTreasureType.DEF,
  RogueTreasureType.HP,
  RogueTreasureType.ATK_SPD,
  RogueTreasureType.TREAT,
  RogueTreasureType.OTHER
}
local firstFilterLevel, firstFilterType
local RefreshSelectedTreasureInfo = function()
  local panel = uis.Main.TreasureTips.Info
  if selectedTreasureId then
    local conf = TableData.GetConfig(selectedTreasureId, "BaseRogueTreasure")
    panel.PicLoader.url = UIUtil.GetResUrl(conf.icon)
    panel.IDTxt.text = conf.number()
    panel.NameTxt.text = conf.name()
    local t_type, t_level = conf.type, conf.level
    local wordlist = panel.WordList
    
    function wordlist.itemRenderer(i, gcmp)
      UIUtil.SetText(gcmp, conf.des(), "EffectTxt")
      UIUtil.SetText(gcmp, conf.des_detail(), "WordTxt")
    end
    
    wordlist.numItems = 1
    panel.TypeTxt.text = TREASURE_TYPE_NAME_LOOKUP[t_type]
    panel.LevelTxt.text = TREASURE_LEVEL_NAME_LOOKUP[t_level]
    panel.c1Ctr.selectedIndex = RogueGameMgr.HasTreasure(selectedTreasureId) and 0 or 1
  end
end
local TreasureItemRenderer = function(i, gcmp)
  local item = gcmp:GetChild("ItemBtn")
  local conf = maskedTreasures[i + 1]
  local treasureId = conf.id
  item:GetChild("PicLoader").url = UIUtil.GetResUrl(conf.icon)
  UIUtil.SetText(item, conf.number(), "IDTxt")
  UIUtil.SetText(item, conf.name(), "NameTxt")
  UIUtil.SetText(item, conf.des(), "EffectTxt")
  ChangeUIController(item:GetChild("Type"), "c1", conf.type - 1)
  ChangeUIController(item:GetChild("Level"), "c1", conf.level - 1)
  ChangeUIController(item, "c1", conf.level - 1)
  ChangeUIController(item, "c2", 1)
  ChangeUIController(item, "button", selectedTreasureId == treasureId and 1 or 0)
  item.onClick:Set(function()
    selectedTreasureId = treasureId
    local treasurelist = uis.Main.TreasureTips.ItemList
    for j = 0, treasurelist.numChildren - 1 do
      local itemIndex = treasurelist:ChildIndexToItemIndex(j)
      local child = treasurelist:GetChildAt(j)
      local subchild = child:GetChild("ItemBtn")
      ChangeUIController(subchild, "button", itemIndex == i and 1 or 0)
    end
    RefreshSelectedTreasureInfo()
  end)
end
local MaskTreasures = function(treasures)
  maskedTreasures = maskedTreasures or {}
  table.clear(maskedTreasures)
  for i, v in ipairs(treasures) do
    if 0 ~= TYPE_MASK & 1 << v.type - 1 and 0 ~= LEVEL_MASK & 1 << v.level - 1 then
      table.insert(maskedTreasures, v)
    end
  end
end
local PlayTreasuresTransition = function()
  local treasurelist = uis.Main.TreasureTips.ItemList
  for i = 0, treasurelist.numChildren - 1 do
    local child = treasurelist:GetChildAt(i)
    child:GetChild("ItemBtn").alpha = 0
    PlayUITrans(child, "up", nil, i * 0.03)
  end
end
local PlayHalidomsTransition = function()
  local sacredlist = uis.Main.SacredTips.ItemList
  for i = 0, sacredlist.numChildren - 1 do
    local child = sacredlist:GetChildAt(i)
    child:GetChild("Item").alpha = 0
    PlayUITrans(child, "up", nil, i * 0.03)
  end
end
local SacredItemRenderer = function(i, gcmp)
  local item = gcmp:GetChild("Item")
  local conf = allHalidom[i + 1]
  UIUtil.SetText(item, conf.number(), "IDTxt")
  UIUtil.SetText(item, conf.name(), "NameTxt")
  item:GetChild("PicLoader").url = UIUtil.GetResUrl(conf.icon)
  local exclusive = "number" == type(conf.card_id)
  local activated = RogueGameMgr.IsHalidomActivated(conf.id)
  ChangeUIController(item, "c1", exclusive and 1 or 0)
  ChangeUIController(item, "c2", activated and 0 or 1)
  local activatedText = activated and T(20396) or T(20397)
  local activatedConditionText = T(1415)
  if exclusive then
    local loader = item:GetChild("Head"):GetChild("HeadBg"):GetChild("PicLoader")
    local cardId = conf.card_id
    local cardConf = TableData.GetConfig(cardId, "BaseCard")
    UIUtil.SetHeadByFaceId(cardConf.fashion_id, loader, HEAD_ICON_TYPE_ENUM.RECT)
    UIUtil.SetText(item, T(1417, cardConf.name()), "WordTxt")
  else
    UIUtil.SetText(item, T(1400), "WordTxt")
  end
  local condition = item:GetChild("Condition")
  UIUtil.SetText(condition, activatedConditionText, "WordTxt")
  UIUtil.SetText(item:GetChild("State"), activatedText, "WordTxt")
  local list = condition:GetChild("ItemList")
  local unlock_condition = conf.unlock_condition
  
  function list.itemRenderer(j, ggcmp)
    local loader = ggcmp:GetChild("PicLoader")
    local numberTxt = ggcmp:GetChild("NumberTxt")
    local str = unlock_condition[j + 1]
    local splits = Split(str, ":")
    local num = tonumber(splits[1])
    local ownCnt, needCnt = 0, 0
    if 1 == num then
      local t_type = tonumber(splits[2])
      local t_level = tonumber(splits[3])
      local cnt = tonumber(splits[4])
      ownCnt = #RogueGameMgr.GetTreasureByType_Level(t_type, t_level)
      needCnt = cnt
      local tbl = TableData.GetTable("BaseRogueTreasureType")
      for _, v in pairs(tbl) do
        if v.type == t_type and v.level == t_level then
          loader.url = UIUtil.GetResUrl(v.icon)
          break
        end
      end
    elseif 2 == num then
      local treasureId = tonumber(splits[2])
      local treasureConf = TableData.GetConfig(treasureId, "BaseRogueTreasure")
      ownCnt = RogueGameMgr.HasTreasure(treasureId) and 1 or 0
      needCnt = 1
      loader.url = UIUtil.GetResUrl(treasureConf.icon)
    end
    local text
    if ownCnt < needCnt then
      text = string.format("[color=#ff6678]%s[/color]/%s", ownCnt, needCnt)
    else
      text = string.format("%s/%s", ownCnt, needCnt)
    end
    numberTxt.text = text
  end
  
  list.numItems = #unlock_condition
  list = item:GetChild("WordList")
  
  function list.itemRenderer(j, ggcmp)
    UIUtil.SetText(ggcmp, conf.des(), "EffectTxt")
    UIUtil.SetText(ggcmp, conf.des_detail(), "WordTxt")
  end
  
  list.numItems = 1
end
local FilterAndRefreshTreasures = function()
  MaskTreasures(allTreasures)
  local treasurelist = uis.Main.TreasureTips.ItemList
  treasurelist.numItems = #maskedTreasures
  treasurelist:RefreshVirtualList()
end
local ResetMASK = function()
  TYPE_MASK = -1
  LEVEL_MASK = -1
  firstFilterType = true
  firstFilterLevel = true
end
local LevelFilterItemRenderer = function(i, gcmp)
  local level = TREASURE_LEVEL_LIST[i + 1]
  local title = TREASURE_LEVEL_NAME_LOOKUP[level]
  UIUtil.SetText(gcmp, title, "WordTxt")
  ChangeUIController(gcmp, "c1", level - 1)
  gcmp.onClick:Set(function()
    local ctrl = gcmp:GetController("button")
    ctrl.selectedIndex = (ctrl.selectedIndex + 1) % 2
    if 1 == ctrl.selectedIndex then
      if firstFilterLevel then
        LEVEL_MASK = 1 << level - 1
        firstFilterLevel = false
      else
        LEVEL_MASK = LEVEL_MASK | 1 << level - 1
      end
    else
      LEVEL_MASK = LEVEL_MASK & ~(1 << level - 1)
      if 0 == LEVEL_MASK then
        LEVEL_MASK = -1
        firstFilterLevel = true
      end
    end
    FilterAndRefreshTreasures()
  end)
end
local TypeFilterItemRenderer = function(i, gcmp)
  local t_type = TREASURE_TYPE_LIST[i + 1]
  local title = TREASURE_TYPE_NAME_LOOKUP[t_type]
  UIUtil.SetText(gcmp, title, "WordTxt")
  ChangeUIController(gcmp, "c1", t_type - 1)
  gcmp.onClick:Set(function()
    local ctrl = gcmp:GetController("button")
    ctrl.selectedIndex = (ctrl.selectedIndex + 1) % 2
    if 1 == ctrl.selectedIndex then
      if firstFilterType then
        TYPE_MASK = 1 << t_type - 1
        firstFilterType = false
      else
        TYPE_MASK = TYPE_MASK | 1 << t_type - 1
      end
    else
      TYPE_MASK = TYPE_MASK & ~(1 << t_type - 1)
      if 0 == TYPE_MASK then
        TYPE_MASK = -1
        firstFilterType = true
      end
    end
    FilterAndRefreshTreasures()
  end)
end

function RogueGameBackpackWindow.ReInitData()
end

function RogueGameBackpackWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RogueGameBackpackWindow.package, WinResConfig.RogueGameBackpackWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetRogueBuild01_InsideItemLookWindowUis(contentPane)
    RogueGameBackpackWindow.UpdateInfo()
    RogueGameBackpackWindow.InitBtn()
  end)
end

function RogueGameBackpackWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(TableData.GetConfig(12015, "BaseFeature").back_ground)
  local tbl = TableData.GetTable("BaseRogueHoly")
  allHalidom = {}
  local trends = RogueData.GetRogueTrend()
  local themeInfo = RogueGameData.GetThemeInfo()
  for _, v in pairs(tbl) do
    local unlock = true
    if type(v.difficulty_condition) == "number" and themeInfo.unlockedDifficultyLevel < v.difficulty_condition then
      unlock = false
    end
    if v.trends_condition then
      local k = table.keyof(trends, v.trends_condition, "trendId")
      unlock = unlock and type(k) == "number" and trends[k].finished
    end
    if unlock then
      table.insert(allHalidom, v)
    end
  end
  allTreasures = {}
  local treasureIdList = RogueGameData.GetTreasureIdList()
  for i = #treasureIdList, 1, -1 do
    local treasureId = treasureIdList[i]
    table.insert(allTreasures, TableData.GetConfig(treasureId, "BaseRogueTreasure"))
  end
  table.sort(allHalidom, function(x, y)
    return x.sort < y.sort
  end)
  for i = 1, 2 do
    local btn = uis.Main.TabRegion[string.format("Tab%02dBtn", i)]
    local numberTxt = btn:GetChild("NumberTxt")
    if 2 == i then
      local halidomIdList = RogueGameData.GetHalidomIdList()
      numberTxt.text = string.format("%s/%s", #halidomIdList, #allHalidom)
    else
      local treasureIdList = RogueGameData.GetTreasureIdList()
      numberTxt.text = #treasureIdList
    end
    btn.onClick:Set(function()
      uis.Main.TabRegion.c1Ctr.selectedIndex = i - 1
      uis.Main.c1Ctr.selectedIndex = i - 1
      if 1 == i then
        RedDotMgr.UpdateNodeByWindowName(WinResConfig.RogueGameBackpackWindow.name)
        RedDotRogue.SaveTreasureIdList()
        PlayTreasuresTransition()
      elseif 2 == i then
        RedDotRogue.SaveHalidomIdList()
        RedDotMgr.UpdateNodeByWindowName(WinResConfig.RogueGameBackpackWindow.name)
        PlayHalidomsTransition()
      end
    end)
    if 1 == i then
      RedDotMgr.AddNode({
        windowName = WinResConfig.RogueGameBackpackWindow.name,
        com = btn,
        dataType = RED_DOT_DATA_TYPE.ROGUE,
        newFlagName = "new",
        onlyNew = true,
        newFlagVisibleFunc = function()
          return RedDotRogue.HasNesTreasure()
        end
      })
    else
      RedDotMgr.AddNode({
        windowName = WinResConfig.RogueGameBackpackWindow.name,
        com = btn,
        dataType = RED_DOT_DATA_TYPE.ROGUE,
        newFlagName = "new",
        onlyNew = true,
        newFlagVisibleFunc = function()
          return RedDotRogue.HasNewHalidom()
        end
      })
    end
  end
  local treasurelist = uis.Main.TreasureTips.ItemList
  local sacredlist = uis.Main.SacredTips.ItemList
  treasurelist.itemRenderer = TreasureItemRenderer
  treasurelist:SetVirtual()
  sacredlist.itemRenderer = SacredItemRenderer
  sacredlist:SetVirtual()
  sacredlist.numItems = #allHalidom
  ResetMASK()
  FilterAndRefreshTreasures()
  PlayTreasuresTransition()
  selectedTreasureId = allTreasures[1].id
  RefreshSelectedTreasureInfo()
  local levelFilterlist = uis.Main.TreasureTips.Choice.Choice2.TabList
  local typeFilterlist = uis.Main.TreasureTips.Choice.Choice3.TabList
  levelFilterlist.itemRenderer = LevelFilterItemRenderer
  typeFilterlist.itemRenderer = TypeFilterItemRenderer
  levelFilterlist.numItems = #TREASURE_LEVEL_LIST
  typeFilterlist.numItems = #TREASURE_TYPE_LIST
  uis.Main.TreasureTips.Choice.Choice2.NameTxt.text = T(1420)
  uis.Main.TreasureTips.Choice.Choice3.NameTxt.text = T(1421)
  local filterBtnText = T(1403)
  UIUtil.SetText(uis.Main.TreasureTips.ScreenBtn, filterBtnText, "WordTxt")
  uis.Main.TabRegion.Tab01Btn.onClick:Call()
  RogueGameMgr.UI_SetFunctionDetailsBtn(FEATURE_ENUM.ROGUE_GAME_BACKPACK, uis.Main.FunctionDetailsBtn, uis.Main.root)
end

function RogueGameBackpackWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.RogueGameBackpackWindow.name)
  end)
  uis.Main.TreasureTips.ScreenBtn.onClick:Set(function()
    uis.Main.TreasureTips.c1Ctr.selectedIndex = 1
  end)
  uis.Main.TreasureTips.Choice.CloseBtn.onClick:Set(function()
    uis.Main.TreasureTips.c1Ctr.selectedIndex = 0
  end)
  uis.Main.TreasureTips.Choice.ResetBtn.onClick:Set(function()
    ResetMASK()
    FilterAndRefreshTreasures()
    local levelFilterlist = uis.Main.TreasureTips.Choice.Choice2.TabList
    local typeFilterlist = uis.Main.TreasureTips.Choice.Choice3.TabList
    for i = 0, levelFilterlist.numItems - 1 do
      ChangeUIController(levelFilterlist:GetChildAt(i), "button", 0)
    end
    for i = 0, typeFilterlist.numItems - 1 do
      ChangeUIController(typeFilterlist:GetChildAt(i), "button", 0)
    end
  end)
end

function RogueGameBackpackWindow.OnClose()
  uis = nil
  contentPane = nil
  selectedTreasureId = nil
  RedDotMgr.RemoveNode(WinResConfig.RogueGameBackpackWindow.name)
end

return RogueGameBackpackWindow
