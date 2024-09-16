require("RogueBuild01_ScoreRewardWindowByName")
local RogueScoreRewardWindow = {}
local uis, contentPane, jumpTb, rewardData, themeInfo

function RogueScoreRewardWindow.ReInitData()
end

function RogueScoreRewardWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RogueScoreRewardWindow.package, WinResConfig.RogueScoreRewardWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetRogueBuild01_ScoreRewardWindowUis(contentPane)
    local rogueThemeId = bridgeObj.argTable[1]
    rewardData = RogueScoreRewardWindow.GetData(rogueThemeId)
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.ROGUE_LEVEL)
    themeInfo = RogueData.GetRogueTheme()
    RogueScoreRewardWindow.UpdateInfo()
    RogueScoreRewardWindow.InitBtn()
  end)
end

function RogueScoreRewardWindow.UpdateInfo()
  local list = uis.Main.RewardList.RewardList
  local rogueInfo = RogueData.GetRogueInfo()
  if rogueInfo then
    PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.ROGUE_LOCK_LEVEL, rogueInfo.themeUnlockLevel)
  end
  
  function list.itemRenderer(i, item)
    local data = rewardData[i + 1]
    local tips = item:GetChild("ScoreRewardTips")
    local stateIndex
    local special = tips:GetChild("RewardSpecial")
    if data then
      if rogueInfo then
        local lastLv = data[#data].level
        if lastLv <= rogueInfo.themeUnlockLevel then
          if lastLv <= themeInfo.rewardedLevel then
            stateIndex = 1
          else
            stateIndex = 0
          end
        else
          stateIndex = 2
        end
      end
      ChangeUIController(tips, "c1", stateIndex)
      RogueScoreRewardWindow.ShowOneItem(data, tips, stateIndex)
      local len = #data
      if data[len] and data[len].phase_show then
        special:GetChild("PicLoader").url = UIUtil.GetResUrl(data[len].phase_show)
        UIUtil.SetText(special, T(1374, data[len].level), "LevelTxt")
      end
    else
      ChangeUIController(tips, "c1", 3)
      UIUtil.SetText(tips, T(1470), "WordTxt")
    end
  end
  
  list.numItems = #rewardData + 1
  RogueScoreRewardWindow.ShowLeftInfo()
end

function RogueScoreRewardWindow.ShowOneItem(phaseData, tips, stateIndex)
  local len = #phaseData
  if phaseData[1] and phaseData[1].title then
    UIUtil.SetText(tips, phaseData[1].title(), "TitleTxt")
  end
  local InitListItem = function(item, itemArr, itemData)
    if 2 == stateIndex then
      ChangeUIController(item, "c2", 3)
    elseif 1 == stateIndex then
      ChangeUIController(item, "c2", 2)
    elseif itemData.level <= themeInfo.level then
      if itemData.level <= themeInfo.rewardedLevel then
        ChangeUIController(item, "c2", 1)
      else
        UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Rugel/FX_ui_rogue_itemget_singel.prefab", item:GetChild("EffectHolder"))
        ChangeUIController(item, "c2", 4)
      end
    else
      ChangeUIController(item, "c2", 0)
    end
    item.onClick:Set(function()
      local controller = item:GetController("c2")
      if controller and 4 == controller.selectedIndex then
        RogueService.FetchRogueThemeLevelRewardReq(themeInfo.level)
      elseif itemArr[1] then
        UIUtil.CommonItemClickCallback(itemArr[1].id, itemArr[1].type)
      end
    end)
  end
  UIUtil.SetText(tips, T(1373), "WordTxt")
  local list = tips:GetChild("RewardList"):GetChild("RewardList")
  local pecX = 0
  
  function list.itemRenderer(ii, rewardCom)
    local rewardList = rewardCom:GetChild("ItemList")
    local bar = rewardCom:GetChild("DotProgressBar")
    
    function rewardList.itemRenderer(i, item)
      local data = phaseData[i + 1]
      local addArr = GetConfigItemList(data.reward, true)
      if addArr[1] then
        UIUtil.ShowItemFrame(addArr[1].id, item, addArr[1].value)
      end
      local dot = UIMgr:CreateComponent("RogueBuild01", "ScoreRewardItemDot")
      rewardCom:AddChild(dot)
      dot:SetXY(bar.x + i * 130, bar.y)
      UIUtil.SetText(dot, T(1472, data.level), "NumberTxt")
      ChangeUIController(dot, "c1", themeInfo.level >= data.level and 1 or 0)
      InitListItem(item, addArr, data)
    end
    
    rewardList.numItems = len
    rewardList:ResizeToFit()
    bar.max = bar.width
    bar.min = 0
    local curLv = themeInfo.level > phaseData[1].level and themeInfo.level - phaseData[1].level or 0
    bar.value = math.min(curLv * 130, bar.width)
    pecX = bar.value / bar.max
  end
  
  list.numItems = 1
  list.scrollPane.percX = pecX
end

function RogueScoreRewardWindow.ShowLeftInfo()
  local show = uis.Main.Show
  show.WordTxt.text = T(1359)
  local data = RogueScoreRewardWindow.GetRogueLevelData()
  if data then
    show.LevelTxt.text = T(1471, themeInfo.level)
    show.ExpTxt.text = T(1423, themeInfo.exp, data.next_exp)
    show.ExpProgressBar.max = data.next_exp
    show.ExpProgressBar.value = themeInfo.exp
    show.MaxTxt.text = T(1491)
    ChangeController(show.c1Ctr, data.max_tag and 1 or 0)
    show.TipsTxt.text = T(1498, RogueScoreRewardWindow.GetPhaseTitle(data.unlock_phase))
    local rogueInfo = RogueData.GetRogueInfo()
    if rogueInfo then
      if data.max_tag == nil and rogueInfo.themeInfo.level >= rogueInfo.themeUnlockLevel then
        ChangeController(show.c2Ctr, 1)
      else
        ChangeController(show.c2Ctr, 0)
      end
    end
  end
end

function RogueScoreRewardWindow.GetPhaseTitle(phase)
  local data = TableData.GetTable("BaseRogueLevel")
  for i, v in pairs(data) do
    if v.unlock_phase == phase and v.title then
      return v.title()
    end
  end
  return ""
end

function RogueScoreRewardWindow.GetRogueLevelData()
  local id = themeInfo.themeId * 1000 + themeInfo.level
  return TableData.GetConfig(id, "BaseRogueLevel")
end

function RogueScoreRewardWindow.GetData(rogueThemeId)
  local rogueInfo = RogueData.GetRogueInfo()
  local data = TableData.GetTable("BaseRogueLevel")
  local newTb = {}
  for i, v in pairs(data) do
    local tempId = (v.id - v.level) / 1000
    if tempId == rogueThemeId then
      if newTb[v.unlock_phase + 1] == nil then
        newTb[v.unlock_phase + 1] = {}
      end
      table.insert(newTb[v.unlock_phase + 1], v)
    end
  end
  local sortFun = function(a, b)
    return a.level < b.level
  end
  for i = 1, #newTb do
    if #newTb[i] > 1 then
      table.sort(newTb[i], sortFun)
    end
  end
  return newTb
end

function RogueScoreRewardWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.RogueScoreRewardWindow.name, uis.Main.CurrencyReturn, FEATURE_ENUM.ROGUE_LEVEL)
end

function RogueScoreRewardWindow.OnClose()
  uis = nil
  contentPane = nil
  themeInfo = nil
  rewardData = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
end

function RogueScoreRewardWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Rogue.REFRESH_LEVEL_REWARD then
    themeInfo = RogueData.GetRogueTheme()
    RogueScoreRewardWindow.UpdateInfo()
  end
end

return RogueScoreRewardWindow
