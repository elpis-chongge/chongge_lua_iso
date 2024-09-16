require("PlayerInfo_PlayerWindowByName")
local PlayerWindow = {}
local uis, contentPane, playerInfo

function PlayerWindow.ReInitData()
end

function PlayerWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.PlayerWindow.package, WinResConfig.PlayerWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetPlayerInfo_PlayerWindowUis(contentPane)
    playerInfo = bridgeObj.argTable[1]
    if playerInfo.info == nil then
      local curBgm = SoundUtil.GetCurMusic()
      if curBgm then
        SoundManager:SetEventParameter(curBgm, "music_menu_main", 1)
      end
    end
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.HOME_PLAYER_INFO)
    PlayerWindow.InitBtn()
    PlayerWindow.UpdateAccount()
    ChangeUIController(uis.Main.root, "c1", playerInfo.info and 1 or 0)
  end)
end

function PlayerWindow.UpdatePlayerInformation()
  local left = uis.Main.Left
  if playerInfo.info then
    UIUtil.ShowPlayerHead(playerInfo.info, left.Head.root)
  else
    UIUtil.ShowPlayerHead(ActorData.GetActorInfo(), left.Head.root, function()
      OpenWindow(WinResConfig.ChoiceHeadWindow.name)
    end)
  end
  left.Level.IDTxt.text = T(768, playerInfo.info and playerInfo.info.uin or ActorData.GetUin())
  local lv = playerInfo.info and playerInfo.info.level or ActorData.GetLevel()
  left.Level.LevelTxt.text = T(759, lv)
  UIUtil.SetBtnText(left.NameBtn, playerInfo.info and playerInfo.info.name or ActorData.GetName())
end

function PlayerWindow.UpdateAccount()
  print("账号信息")
  local cardShow = uis.Main.CardShow
  local left = uis.Main.Left
  local fashionId = playerInfo.info and playerInfo.info.faceId or ActorData.GetFaceId()
  UIUtil.SetCardShowSpineAutoAlpha(fashionId, cardShow.CardShowLoader, cardShow.CardShowHolder)
  if playerInfo.city ~= "" then
    left.Guild.AddressTxt.text = FormatStrByLen(playerInfo.city, 5)
  else
    left.Guild.AddressTxt.text = T(766)
  end
  PlayerWindow.UpdatePlayerInformation()
  left.Time.RegisterTxt.text = T(10182)
  if playerInfo.info then
    uis.Main.Left.Time.DayTxt.text = T(758, playerInfo.loginDays)
  else
    uis.Main.Left.Time.DayTxt.text = T(758, ActorData.GetLoginDays())
  end
  left.Time.RegisterTimeTxt.text = TimeUtil.FormatDate("%Y-%m-%d", playerInfo.info and playerInfo.info.createTime or ActorData.GetCreateStamp())
  if playerInfo.info == nil then
    left.NameBtn.onClick:Add(PlayerWindow.TouchRenameBtn)
  end
  left.CardNumber.WordTxt.text = T(10184)
  if playerInfo.info then
    left.CardNumber.CardNumberTxt.text = T(767, playerInfo.info.cardCount)
  else
    left.CardNumber.CardNumberTxt.text = T(767, playerInfo.totalCardCount)
  end
  PlayerWindow.UpdateGuildInfo()
  local right = uis.Main.Right
  local BattleBtn = right.root:GetChild("BattleBtn")
  if BattleBtn then
    UIUtil.SetText(BattleBtn, T(762), "Name1Txt")
    UIUtil.SetText(BattleBtn, T(763), "Name2Txt")
    BattleBtn.onClick:Set(function()
      UIUtil.SetText(BattleBtn, BattleBtn.selected and playerInfo.killMobCount or UIUtil.GetFormatCount(playerInfo.killMobCount), "Number2Txt")
      UIUtil.SetText(BattleBtn, BattleBtn.selected and playerInfo.winCount or UIUtil.GetFormatCount(playerInfo.winCount), "Number1Txt")
    end)
    BattleBtn.onClick:Call()
  end
  right.Title1.WordTxt.text = T(760)
  if playerInfo.currentStage then
    local stageData = TableData.GetConfig(playerInfo.currentStage, "BaseStage")
    if stageData then
      if stageData.name and stageData.name_detail then
        right.Plot.NumberTxt.text = T(2, stageData.name(), stageData.name_detail())
      end
      local chapterData = TableData.GetConfig(stageData.chapter_id, "BaseChapter")
      if chapterData and chapterData.name_detail then
        right.Plot.NameTxt.text = chapterData.name_detail()
      end
    end
  else
    right.Plot.NumberTxt.text = ""
    right.Plot.NameTxt.text = ""
  end
  right.Title2.WordTxt.text = T(761)
  PlayerWindow.UpdateCardList()
  if playerInfo.info then
    if playerInfo.hideResource then
      right.OtherMaterial.NameTxt.text = T(764)
      right.OtherMaterial.SubtitleTxt.text = T(765)
      right.c1Ctr.selectedIndex = 1
    else
      right.c1Ctr.selectedIndex = 0
    end
  else
    right.c1Ctr.selectedIndex = 0
  end
  PlayerWindow.UpdateResourceState()
  if 0 == right.c1Ctr.selectedIndex then
    PlayerWindow.UpdateResources()
    right.Title2.HideBtn.onClick:Set(function()
      if playerInfo.info == nil then
        ActorService.SetProfileShowResourceReq(not playerInfo.hideResource)
      end
    end)
    right.Title2.HideBtn.selected = not playerInfo.hideResource
  end
end

function PlayerWindow.UpdateResources()
  local right = uis.Main.Right
  if playerInfo.resources then
    local sort = {}
    sort[COMMON_ITEM_ID.RECHARGE_DIAMOND] = 1
    sort[COMMON_ITEM_ID.BIND_DIAMOND] = 2
    sort[COMMON_ITEM_ID.GAME_COIN] = 3
    sort[COMMON_ITEM_ID.ENERGY] = 4
    table.sort(playerInfo.resources, function(a, b)
      return sort[a.itemId] < sort[b.itemId]
    end)
    
    function right.MaterialList.itemRenderer(i, item)
      UIUtil.SetIconById(item:GetChild("ItemLoader"), playerInfo.resources[i + 1].itemId)
      if playerInfo.resources[i + 1].itemId == COMMON_ITEM_ID.ENERGY then
        local maxEnergy = ActorData.GetEnergyMax()
        UIUtil.SetText(item, T(352, playerInfo.resources[i + 1].count), maxEnergy, "NumberTxt")
      else
        UIUtil.SetText(item, playerInfo.resources[i + 1].count, "NumberTxt")
      end
    end
    
    right.MaterialList.numItems = #playerInfo.resources
  else
    local res = {
      COMMON_ITEM_ID.RECHARGE_DIAMOND,
      COMMON_ITEM_ID.BIND_DIAMOND,
      COMMON_ITEM_ID.GAME_COIN,
      COMMON_ITEM_ID.ENERGY
    }
    
    function right.MaterialList.itemRenderer(i, item)
      UIUtil.SetIconById(item:GetChild("ItemLoader"), res[i + 1])
      if res[i + 1] == COMMON_ITEM_ID.ENERGY then
        local maxEnergy = ActorData.GetEnergyMax()
        UIUtil.SetText(item, T(352, ActorData.GetItemCount(res[i + 1]), maxEnergy), "NumberTxt")
      else
        UIUtil.SetText(item, ActorData.GetItemCount(res[i + 1]), "NumberTxt")
      end
    end
    
    right.MaterialList.numItems = #res
  end
end

function PlayerWindow.UpdateResourceState()
  if playerInfo.info == nil then
    uis.Main.Right.Title2.c1Ctr.selectedIndex = 1
  else
    uis.Main.Right.Title2.c1Ctr.selectedIndex = 0
  end
end

function PlayerWindow.UpdateCardList()
  local cardList = playerInfo.displayCards
  
  function uis.Main.Left.CardNumber.HeadList.itemRenderer(i, item)
    if cardList[i + 1] then
      local fashionId
      if playerInfo.info == nil and type(cardList[i + 1]) == "number" then
        local info = CardData.GetCardDataById(cardList[i + 1])
        if info then
          fashionId = info.fashionId
        end
      elseif type(cardList[i + 1]) == "table" then
        fashionId = cardList[i + 1].fashionId
      end
      if fashionId then
        UIUtil.SetHeadByFaceId(fashionId, item:GetChild("CardHeadPic"):GetChild("HeadLoader"), HEAD_ICON_TYPE_ENUM.RECT)
        ChangeUIController(item, "c1", 0)
      end
    elseif playerInfo.info then
      ChangeUIController(item, "c1", 2)
    else
      ChangeUIController(item, "c1", 1)
    end
  end
  
  uis.Main.Left.CardNumber.HeadList.onClick:Set(function()
    if playerInfo.info == nil then
      OpenWindow(WinResConfig.ChoiceWindow.name, nil, cardList)
    end
  end)
  uis.Main.Left.CardNumber.HeadList.numItems = 3
end

function PlayerWindow.UpdateGuildInfo()
  local Left = uis.Main.Left
  if playerInfo.inGuild then
    Left.Guild.GuildTxt.text = playerInfo.guildName
  else
    Left.Guild.GuildTxt.text = T(10186)
  end
end

function PlayerWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.PlayerWindow.name)
  end)
  uis.Main.Left.Level.CopyBtn.onClick:Set(function()
    LuaUtil.CopyToSystem(playerInfo.info and playerInfo.info.uin or ActorData.GetUin())
    FloatTipsUtil.ShowWarnTips(T(1354))
  end)
  if CheckUpdateManager.Singleton.isIosReview == true then
    uis.Main.CodeBtn.visible = false
  else
    uis.Main.CodeBtn.onClick:Add(PlayerWindow.OpenCodeWindow)
  end
end

function PlayerWindow.OpenCodeWindow()
  OpenWindow(WinResConfig.CodeWindow.name)
end

function PlayerWindow.GetRenameCost()
  local value = TableData.GetConfig(70010010, "BaseFixed").array_value
  value = Split(value, ":")
  if #value >= 3 then
    return {
      type = tonumber(value[1]),
      id = tonumber(value[2]),
      value = tonumber(value[3])
    }
  end
end

function PlayerWindow.TouchRenameBtn()
  local cost = PlayerWindow.GetRenameCost()
  local free = 0 == ActorData.GetChangNameCount()
  OpenWindow(WinResConfig.RenameWindow.name, nil, {
    titleTxt = T(10212),
    subTitleTxt = T(10213),
    text = "",
    cost = cost,
    promptText = T(10214),
    free = free,
    sureFunc = function(text, costEnough)
      text = string.gsub(text, " ", "")
      text = string.gsub(text, "　", "")
      local count = string.getByteCount(text)
      if count < 2 then
        FloatTipsUtil.ShowWarnTips(T(10215))
        return
      end
      if false == costEnough then
        local config = TableData.GetConfigByType(cost.type, cost.id)
        FloatTipsUtil.ShowWarnTips(T(10216, config.name()))
        return
      end
      if SensitiveWordsUtil.IsContainBlockedWord(text) == true then
        FloatTipsUtil.ShowWarnTips(T(11160))
        return
      end
      ActorService.ChangeNameReq(text, function()
        UIMgr:SendWindowMessage(WinResConfig.RenameWindow.name, WindowMsgEnum.RenameWindow.CLOSE_WINDOW)
        if 0 == uis.Main.Right.c1Ctr.selectedIndex then
          PlayerWindow.UpdateResources()
        end
      end)
    end
  })
end

function PlayerWindow.OnShown()
end

function PlayerWindow.OnHide()
end

function PlayerWindow.OnClose()
  local curBgm = SoundUtil.GetCurMusic()
  if curBgm then
    SoundManager:SetEventParameter(curBgm, "music_menu_main", 0)
  end
  uis = nil
  contentPane = nil
  playerInfo = nil
end

function PlayerWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.PlayerWindow.BAG_ITEM_SHOW then
    playerInfo.hideResource = not playerInfo.hideResource
    PlayerWindow.UpdateResourceState()
  elseif msgId == WindowMsgEnum.PlayerWindow.SET_CARD then
    PlayerWindow.UpdateCardList()
  elseif msgId == WindowMsgEnum.Common.E_MSG_ACTOR_INFO_CHANGE then
    PlayerWindow.UpdatePlayerInformation()
  end
end

return PlayerWindow
