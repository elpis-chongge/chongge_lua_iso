require("GuildTrain_GuildTrainWindowByName")
local GuildTrainWindow = {}
local uis, contentPane, jumpTb, curType, curStageId, curPage, stagePage, isPlay, first, animTran

function GuildTrainWindow.ReInitData()
end

function GuildTrainWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.GuildTrainWindow.package, WinResConfig.GuildTrainWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    curPage = bridgeObj.argTable[1] or 0
    stagePage = bridgeObj.argTable[2] or 0
    uis = GetGuildTrain_GuildTrainWindowUis(contentPane)
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.GUILD_TRAIN)
    first = true
    GuildTrainWindow.UpdateInfo()
    GuildTrainWindow.InitBtn()
  end)
end

function GuildTrainWindow.UpdateInfo()
  local rankInfo = uis.Main.RankRegion
  local lock = TableData.GetConfig(70010317, "BaseFixed").array_value
  local arr = Split(lock, "|")
  local openType = {}
  for i = 1, #arr do
    table.insert(openType, tonumber(arr[i]))
  end
  local elementData = {
    {
      name = T(1283),
      type = ProtoEnum.SCENE_TYPE.GUILD_PRACTICE_NONE
    },
    {
      name = T(1284),
      type = ProtoEnum.SCENE_TYPE.GUILD_PRACTICE_WATER
    },
    {
      name = T(1285),
      type = ProtoEnum.SCENE_TYPE.GUILD_PRACTICE_FIRE
    },
    {
      name = T(1286),
      type = ProtoEnum.SCENE_TYPE.GUILD_PRACTICE_WOOD
    },
    {
      name = T(1287),
      type = ProtoEnum.SCENE_TYPE.GUILD_PRACTICE_LIGHT
    },
    {
      name = T(1288),
      type = ProtoEnum.SCENE_TYPE.GUILD_PRACTICE_DARK
    }
  }
  local showTb = {}
  for i = 1, #elementData do
    if table.contain(openType, elementData[i].type) then
      table.insert(showTb, elementData[i])
    end
  end
  elementData = showTb
  
  function rankInfo.ElementList.itemRenderer(i, element)
    UIUtil.SetText(element, elementData[i + 1].name, "NameTxt")
    ChangeUIController(element, "c1", i)
    element.onClick:Set(function()
      if rankInfo.ElementList.selectedIndex ~= i then
        curType = elementData[i + 1].type
        rankInfo.ElementList.selectedIndex = i
        curPage = i
        local chapterData = GuildTrainWindow.GetChapterData(curType)
        isPlay = true
        GuildTrainWindow.ShowStage(chapterData)
      end
    end)
    if i == curPage then
      element.onClick:Call()
    end
  end
  
  rankInfo.ElementList.numItems = #elementData
end

function GuildTrainWindow.ShowStage(chapterData)
  if chapterData and chapterData.stages then
    local rankInfo = uis.Main.RankRegion
    local page = -1
    local TimeClick = function(i)
      if page ~= i then
        page = i
        curStageId = chapterData.stages[i + 1]
        local data = GuildData.GetTrainRankData(curStageId)
        if nil == data or 0 == table.getLen(data) then
          GuildService.GetGuildPracticeRankReq(chapterData.stages[i + 1])
        else
          GuildTrainWindow.UpdateRankList()
        end
        UIMgr:SetWindowArgs(WinResConfig.GuildTrainWindow.name, {curPage, i})
      end
    end
    UIUtil.SetText(rankInfo.Time90Btn:GetChild("Down"), T(1313), "NameTxt")
    UIUtil.SetText(rankInfo.Time180Btn:GetChild("Down"), T(1313), "NameTxt")
    rankInfo.Time90Btn.onClick:Set(function()
      isPlay = true
      TimeClick(0)
    end)
    rankInfo.Time180Btn.onClick:Set(function()
      isPlay = true
      TimeClick(1)
    end)
    TimeClick(uis.Main.RankRegion.c2Ctr.selectedIndex)
  end
end

function GuildTrainWindow.UpdateRankList()
  local rankInfo = uis.Main.RankRegion
  local data = GuildData.GetTrainRankData(curStageId)
  GuildTrainWindow.StopAnim()
  local ownPlayer = rankInfo.RankOwnPlayer
  if data and table.getLen(data) > 0 then
    local selfRankData = GuildTrainWindow.GetSelfRankData(data)
    if selfRankData then
      ownPlayer.c1Ctr.selectedIndex = 0
      UIUtil.ShowPlayerHead(ActorData.GetActorInfo(), ownPlayer.Head.root)
      ChangeController(ownPlayer.RankNumber.c1Ctr, selfRankData.rank < 4 and selfRankData.rank - 1 or 3)
      ownPlayer.RankNumber.NumberTxt.text = selfRankData.rank
      ownPlayer.NameTxt.text = ActorData.GetName()
      ownPlayer.NumberTxt.text = NumberByCommaStyle(selfRankData.totalDamage)
      ownPlayer.LookBtn.onClick:Set(function()
        if curStageId then
          OpenWindow(WinResConfig.TeamDetailsWindow.name, nil, curStageId, selfRankData.uin)
        end
      end)
    else
      ChangeController(ownPlayer.c1Ctr, 1)
      ownPlayer.NameTxt.text = ""
      ownPlayer.NumberTxt.text = ""
    end
    table.sort(data, function(a, b)
      return a.rank < b.rank
    end)
    if first then
      isPlay = false
      first = nil
    end
    local selfUid = ActorData.GetUin()
    
    function rankInfo.RankList.itemRenderer(i, rankItem)
      local index = i + 1
      local rankActor = data[index]
      local item = rankItem:GetChild("RankPlayer")
      ChangeUIController(item, "c1", selfUid == rankActor.uin and 1 or 0)
      UIUtil.ShowPlayerHead(rankActor, item:GetChild("Head"))
      UIUtil.SetText(item, rankActor.name, "NameTxt")
      UIUtil.SetText(item, NumberByCommaStyle(rankActor.totalDamage), "NumberTxt")
      local rank = item:GetChild("RankNumber")
      UIUtil.SetText(rank, rankActor.rank, "NumberTxt")
      ChangeUIController(rank, "c1", rankActor.rank < 4 and rankActor.rank - 1 or 3)
      item.onClick:Set(function()
        if curStageId then
          OpenWindow(WinResConfig.TeamDetailsWindow.name, nil, curStageId, rankActor.uin)
        end
      end)
      if isPlay then
        item.alpha = 0
        animTran[rankItem] = PlayUITrans(rankItem, "up", function()
          item.alpha = 1
          animTran[rankItem] = nil
        end, i * 0.08)
      end
    end
    
    rankInfo.RankList.numItems = #data
    ChangeController(rankInfo.c1Ctr, 0)
  else
    ChangeController(rankInfo.c1Ctr, 1)
    ownPlayer.c1Ctr.selectedIndex = 1
    ownPlayer.NameTxt.text = ""
    ownPlayer.NumberTxt.text = ""
  end
  isPlay = nil
end

function GuildTrainWindow.StopAnim()
  if animTran then
    for i, v in pairs(animTran) do
      v:Stop(true, true)
    end
  end
  animTran = {}
end

function GuildTrainWindow.GetChapterData(type)
  local chapter = TableData.GetTable("BaseChapter")
  for i, v in pairs(chapter) do
    if v.type and v.type == type then
      return v
    end
  end
end

function GuildTrainWindow.GetSelfRankData(data)
  local uin = ActorData.GetUin()
  for i, v in pairs(data) do
    if v.uin == uin then
      return v
    end
  end
end

function GuildTrainWindow.SufficientQuantity(stageId)
  local stageData = TableData.GetConfig(stageId, "BaseStage")
  if stageData and stageData.cost then
    local tb = GetConfigItemList(stageData.cost)
    local energy
    for i, v in pairs(tb) do
      energy = ActorData.GetItemCount(v.id)
      if energy < v.value then
        return false, v.id
      end
    end
  end
  return true
end

function GuildTrainWindow.InitBtn()
  UIUtil.SetText(uis.Main.TrainStartBtn, T(1282), "WordTxt")
  uis.Main.TrainStartBtn.onClick:Set(function()
    if curStageId then
      local bol, id = GuildTrainWindow.SufficientQuantity(curStageId)
      if bol then
        ld("Formation", function()
          local params = {sceneType = curType, stageId = curStageId}
          FormationMgr.TryOpenFormationWindow(params)
        end)
      elseif id then
        local itemData = TableData.GetConfig(id, "BaseItem")
        if itemData then
          FloatTipsUtil.ShowWarnTips(T(230, itemData.name()))
        end
      end
    end
  end)
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.GuildTrainWindow.name, uis.Main.CurrencyReturn, FEATURE_ENUM.GUILD_TRAIN)
  uis.Main.TitleTxt.text = T(1289)
  uis.Main.RankRegion.WordTxt.text = T(1293)
end

function GuildTrainWindow.OnClose()
  uis = nil
  contentPane = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
  curType = nil
  curStageId = nil
  curPage = nil
  stagePage = nil
  animTran = nil
  GuildData.ClearTrainData()
end

function GuildTrainWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.GuildWindow.GET_TRAIN_RANK then
    GuildTrainWindow.UpdateRankList()
  end
end

return GuildTrainWindow
