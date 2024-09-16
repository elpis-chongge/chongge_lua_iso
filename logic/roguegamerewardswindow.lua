require("RogueBuild01_InsideCampWindowByName")
local RogueGameRewardsWindow = {}
local uis, contentPane, rogueNode, displayReturnBtn, rewards, gotRewards
local REWARD_CONTROLLER_LOOKUP = {
  [RogueGameRewardType.RECRUITING_TICKET] = 0,
  [RogueGameRewardType.TREAT] = 1,
  [RogueGameRewardType.REVIVE] = 2,
  [RogueGameRewardType.RANDOM_COIN] = 3,
  [RogueGameRewardType.RANDOM_ATTR] = 4,
  [RogueGameRewardType.SPECIAL_TREASURE] = 5,
  [RogueGameRewardType.RANDOM_TREASURE] = 6
}
local RefreshTipsText = function()
  local nodeConf = TableData.GetConfig(rogueNode.nodeId, "BaseRogueNode")
  if nodeConf.type == RogueGameNodeType.SUPPLY then
    local threshold = rogueNode.supplyRewardCount
    local cnt = threshold - (gotRewards and #gotRewards or 0)
    uis.Main.Number.root.visible = true
    uis.Main.Number.NumberTxt.text = T(20475, cnt, threshold)
  else
    uis.Main.Number.root.visible = false
  end
end
local EventItemRenderer = function(i, gcmp)
  local event = gcmp:GetChild("Event")
  local rewardId = rewards[i + 1]
  local conf = TableData.GetConfig(rewardId, "BaseRogueNodeReward")
  local got = false
  if gotRewards then
    local k = table.keyof(gotRewards, rewardId)
    got = type(k) == "number"
  end
  local nodeConf = TableData.GetConfig(rogueNode.nodeId, "BaseRogueNode")
  local supplyType = nodeConf.type == RogueGameNodeType.SUPPLY
  if conf then
    local name = conf.name()
    local des = conf.des()
    local r_type = conf.type
    local available = true
    if r_type == RogueGameRewardType.RECRUITING_TICKET then
      local cards = RogueGameMgr.GetRecruitableCards()
      UIUtil.SetText(event:GetChild("UnExecuteBtn"), T(20435), "WordTxt")
      available = cards and _G.next(cards)
    elseif r_type == RogueGameRewardType.REVIVE then
      local revivable = false
      for _, v in ipairs(RogueGameData.GetCardInfoList()) do
        if not RogueGameMgr.IsLiving(v.cardId) then
          revivable = true
          break
        end
      end
      UIUtil.SetText(event:GetChild("UnExecuteBtn"), T(20436), "WordTxt")
      available = revivable
    elseif r_type == RogueGameRewardType.RANDOM_COIN then
      local percent = rogueNode.tokenAddPercent / 10000
      local count = tonumber(conf.parameter)
      des = T(80275002, math.floor(count * (1 + percent)))
    elseif r_type == RogueGameRewardType.RANDOM_ATTR then
      local percent = rogueNode.attribPointAddPercent / 10000
      local count = tonumber(conf.parameter)
      des = T(80275003, math.floor(count * (1 + percent)))
    elseif r_type == RogueGameRewardType.SPECIAL_TREASURE then
      local loader = event:GetChild("PicLoader")
      local treasureId = tonumber(conf.parameter)
      local treasureConf = TableData.GetConfig(treasureId, "BaseRogueTreasure")
      loader.url = UIUtil.GetResUrl(treasureConf.icon)
    elseif r_type == RogueGameRewardType.TREAT then
      local cardInfoList = RogueGameData.GetCardInfoList()
      local treatable = false
      for _, v in pairs(cardInfoList) do
        local info = v.info
        local attrMap = info.attributes
        local hp = attrMap[CardAttribute.GetIdByName(ATTR_ENUM.hp)]
        local max_hp = attrMap[CardAttribute.GetIdByName(ATTR_ENUM.max_hp)]
        if hp < max_hp then
          treatable = true
          break
        end
      end
      UIUtil.SetText(event:GetChild("UnExecuteBtn"), T(20478), "WordTxt")
      available = treatable
    end
    UIUtil.SetText(event, name, "NameTxt")
    local wordlist = event:GetChild("WordList")
    
    function wordlist.itemRenderer(j, word_cmp)
      UIUtil.SetText(word_cmp, des, "WordTxt")
    end
    
    wordlist.numItems = 1
    ChangeUIController(event, "type", REWARD_CONTROLLER_LOOKUP[r_type])
    if got then
      ChangeUIController(event, "c1", 1)
    elseif supplyType then
      if #gotRewards >= rogueNode.supplyRewardCount then
        ChangeUIController(event, "c1", 2)
        UIUtil.SetText(event:GetChild("UnExecuteBtn"), T(20460), "WordTxt")
      else
        ChangeUIController(event, "c1", available and 0 or 2)
      end
    else
      ChangeUIController(event, "c1", available and 0 or 2)
    end
    local executeBtn = event:GetChild("ExecuteBtn")
    local getBtnText = T(20320)
    local gotTipsText = T(20253)
    if r_type == RogueGameRewardType.RECRUITING_TICKET then
      getBtnText = T(3)
    elseif r_type == RogueGameRewardType.TREAT then
      getBtnText = T(20457)
    elseif r_type == RogueGameRewardType.REVIVE then
      getBtnText = T(20459)
    end
    UIUtil.SetText(executeBtn, getBtnText, "WordTxt")
    UIUtil.SetText(event:GetChild("ExecuteEnd"), gotTipsText, "WordTxt")
    executeBtn.onClick:Set(function()
      RogueGameMgr.Gain(rewardId)
    end)
    event.onClick:Set(function()
      uis.Main.OutBtn:GetController("c1").selectedIndex = 0
    end)
  else
    UIUtil.SetText(event, "未配置的奖励" .. tostring(rewardId), "NameTxt")
  end
end

function RogueGameRewardsWindow.ReInitData()
end

function RogueGameRewardsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RogueGameRewardsWindow.package, WinResConfig.RogueGameRewardsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetRogueBuild01_InsideCampWindowUis(contentPane)
    rogueNode = bridgeObj.argTable[1]
    displayReturnBtn = bridgeObj.argTable[2]
    RogueGameRewardsWindow.UpdateInfo()
    RogueGameRewardsWindow.InitBtn()
  end)
end

function RogueGameRewardsWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(TableData.GetConfig(12017, "BaseFeature").back_ground)
  rewards = rogueNode.rewardOptions
  gotRewards = rogueNode.doneRewardOptions
  local eventlist = uis.Main.EventList
  local defaultItem = "ui://RogueBuild01/Camp_EventAni"
  local nodeConf = TableData.GetConfig(rogueNode.nodeId, "BaseRogueNode")
  local isBattleType = nodeConf.type <= RogueGameNodeType.BATTLE_BOSS
  if isBattleType then
    defaultItem = "ui://RogueBuild01/BattleReward_EventAni"
  end
  RefreshTipsText()
  eventlist.defaultItem = defaultItem
  eventlist.itemRenderer = EventItemRenderer
  eventlist:RemoveChildrenToPool()
  eventlist.numItems = #rewards
  eventlist.opaque = false
  for i = 1, eventlist.numChildren do
    local child = eventlist:GetChildAt(i - 1)
    local event = child:GetChild("Event")
    event.alpha = 0
    PlayUITrans(child, "up", nil, i * 0.03)
  end
  RogueGameMgr.UI_SetCommonBottomInfo(uis.Main.Botton.root)
  RogueGameMgr.UI_SetAssetList(uis.Main.AssetsList)
  UIUtil.SetText(uis.Main.OutBtn, T(20438), "WordTxt")
  local ctrl = uis.Main.OutBtn:GetController("c1")
  ctrl.onChanged:Set(function()
    local outBtn = uis.Main.OutBtn
    if 0 == ctrl.selectedIndex then
      UIUtil.SetText(outBtn, T(20438), "WordTxt")
    else
      UIUtil.SetText(outBtn, T(20452), "WordTxt")
    end
  end)
end

function RogueGameRewardsWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    uis.Main.OutBtn:GetController("c1").selectedIndex = 0
    UIMgr:SendWindowMessage(WinResConfig.RogueGameMapWindow.name, WindowMsgEnum.RogueGame.EXIT_REWARD_PANEL)
    UIMgr:CloseWindow(WinResConfig.RogueGameRewardsWindow.name)
  end)
  uis.Main.BackGround.root.onClick:Set(function()
    uis.Main.OutBtn:GetController("c1").selectedIndex = 0
  end)
  uis.Main.Botton.root.onClick:Set(function()
    uis.Main.OutBtn:GetController("c1").selectedIndex = 0
  end)
  uis.Main.AssetsList.onClick:Set(function()
    uis.Main.OutBtn:GetController("c1").selectedIndex = 0
  end)
  uis.Main.OutBtn.onClick:Set(function()
    local ctrl = uis.Main.OutBtn:GetController("c1")
    if 0 == ctrl.selectedIndex then
      ctrl.selectedIndex = (ctrl.selectedIndex + 1) % 2
    else
      RogueGameService.ExitRogueNodeReq(rogueNode.nodeId, function()
        UIMgr:SendWindowMessage(WinResConfig.RogueGameMapWindow.name, WindowMsgEnum.RogueGame.EXIT_REWARD_PANEL)
        UIMgr:CloseWindow(WinResConfig.RogueGameRewardsWindow.name)
      end)
    end
  end)
end

function RogueGameRewardsWindow.OnClose()
  uis = nil
  contentPane = nil
end

function RogueGameRewardsWindow.HandleMessage(msgId, para)
  if WindowMsgEnum.RogueGame.REFRESH_REWARD_LIST == msgId then
    rogueNode = para
    rewards = para.rewardOptions
    gotRewards = para.doneRewardOptions
    uis.Main.EventList.numItems = #rewards
    RefreshTipsText()
  elseif WindowMsgEnum.RogueGame.REFRESH_REWARD_PANEL_INFO == msgId then
    RogueGameMgr.UI_SetCommonBottomInfo(uis.Main.Botton.root)
  elseif WindowMsgEnum.Common.E_MSG_ITEM_CHANGE then
    uis.Main.AssetsList.numItems = 2
  end
end

return RogueGameRewardsWindow
