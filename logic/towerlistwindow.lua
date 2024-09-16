require("Tower_TowerListWindowByName")
local TowerListWindow = {}
local uis, contentPane, jumpTb, info, mapState

function TowerListWindow.ReInitData()
end

function TowerListWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.TowerListWindow.package, WinResConfig.TowerListWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetTower_TowerListWindowUis(contentPane)
    info = AdventureData.GetSceneData(ProtoEnum.SCENE_TYPE.CLIMB_TOWER)
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.ADVENTURE_TOWER)
    TowerListWindow.UpdateInfo()
    TowerListWindow.InitBtn()
    SoundUtil.PlayMusic(30003)
  end)
end

function TowerListWindow.UpdateInfo()
  UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/pata/FX_pata_choose_back.prefab", uis.Main.Effect1Holder)
  local data = TowerListWindow.GetListData()
  local pos
  local len = #data
  local index = 0
  local listPage = math.ceil(uis.Main.TipsList.width / 358)
  
  function uis.Main.TipsList.itemRenderer(i, item)
    local tips = item:GetChild("LayersTips")
    local mapData = data[i + 1]
    if mapData.id then
      item.name = mapData.id
      item.gameObjectName = mapData.id
      tips:GetChild("PicLoader").url = UIUtil.GetResUrl(mapData.icon)
      UIUtil.SetText(tips, mapData.name(), "NameTxt")
      UIUtil.SetText(tips, mapData.name_english(), "SubtitleTxt")
      ChangeUIController(tips, "c1", mapState[mapData.id] or 0)
      if mapState[mapData.id] then
        if 1 == mapState[mapData.id] then
          if 0 == info.currentStage then
            ChangeUIController(tips, "c1", 0)
          end
          UIUtil.SetText(tips:GetChild("LayersNow"), T(1047))
          TowerListWindow.SetCurPage(mapData.chapter_id, tips:GetChild("ProgressStrip"))
          UIUtil.SetText(tips, mapData.des(), "NumberTxt")
        elseif 2 == mapState[mapData.id] then
          UIUtil.SetText(tips:GetChild("LayersLock"), T(1044))
          UIUtil.SetText(tips, T(1053), "NumberTxt")
        elseif 3 == mapState[mapData.id] then
          UIUtil.SetText(tips, T(1053), "NumberTxt")
          UIUtil.SetBtnText(tips:GetChild("LayersFuture"), T(1045), T(1046))
          pos = i
        end
      else
        UIUtil.SetText(tips, mapData.des(), "NumberTxt")
      end
      tips.onClick:Set(function()
        if 2 == mapState[mapData.id] then
          local startId = mapData.chapter_id[1]
          if startId then
            local chapterData = TableData.GetConfig(startId, "BaseChapter")
            if chapterData and chapterData.pre and info and chapterData.pre == info.currentChapter and 0 == info.currentStage and chapterData.open_condition then
              local condition = Split(chapterData.open_condition, "|")
              for i = 1, #condition do
                local arr = Split(condition[i], ":")
                if 2 == #arr and tonumber(arr[1]) == CONDITION_ENUM.LV and tonumber(arr[2]) > ActorData.GetLevel() then
                  FloatTipsUtil.ShowWarnTips(T(933, arr[2]))
                  return
                end
              end
            end
          end
          FloatTipsUtil.ShowWarnTips(T(1054))
          return
        end
        if 3 == mapState[mapData.id] then
          FloatTipsUtil.ShowWarnTips(T(1055))
          return
        end
        OpenWindow(WinResConfig.TowerWindow.name, nil, mapData.id)
      end)
    else
      ChangeUIController(tips, "c1", 3)
      UIUtil.SetBtnText(tips:GetChild("LayersFuture"), T(1048), T(1049))
      tips.onClick:Set(function()
        FloatTipsUtil.ShowWarnTips(T(1056))
      end)
      pos = i
    end
    if i >= len - listPage then
      index = index + 1
      tips.alpha = 0
      PlayUITrans(item, "up", function()
        tips.alpha = 1
      end, index * 0.08)
    end
  end
  
  uis.Main.TipsList.numItems = len
  uis.Main.TipsList:ScrollToView(len - 1)
end

function TowerListWindow.SetCurPage(chapterId, strip)
  if chapterId and strip then
    local pageCom
    for i = 1, #chapterId do
      pageCom = strip:GetChild(string.format("Dot%d", i))
      if pageCom then
        if chapterId[i] < info.currentChapter then
          ChangeUIController(pageCom, "c1", 0)
        elseif chapterId[i] == info.currentChapter then
          ChangeUIController(pageCom, "c1", 1)
        else
          ChangeUIController(pageCom, "c1", 2)
        end
      end
    end
  end
end

function TowerListWindow.GetListData()
  local map = TableData.GetTable("BaseTowerMap")
  local index
  local newMap = {}
  for i, v in pairs(map) do
    table.insert(newMap, v)
  end
  table.sort(newMap, function(a, b)
    return a.sort < b.sort
  end)
  mapState = {}
  for i = 1, #newMap do
    if table.contain(newMap[i].chapter_id, info.currentChapter) then
      index = 1
    end
    mapState[newMap[i].id] = index
    index = index and index + 1
    if index and index > 4 then
      newMap[i] = nil
    end
  end
  if table.getLen(mapState) < 3 then
    table.insert(newMap, {})
  end
  return newMap
end

function TowerListWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.TowerListWindow.name, uis.Main.CurrencyReturn, FEATURE_ENUM.ADVENTURE_TOWER)
  TowerListWindow.InitChapterReward()
end

function TowerListWindow.InitChapterReward()
  local screenInfo = AdventureData.GetSceneData(ProtoEnum.SCENE_TYPE.CLIMB_TOWER)
  if screenInfo then
    local chapterId = screenInfo.rewardedChapter
    local nextChapterId = AdventureMgr.GetTowerNextChapterId(chapterId)
    nextChapterId = nextChapterId >= screenInfo.currentChapter and screenInfo.currentChapter or nextChapterId
    local data = TableData.GetConfig(nextChapterId, "BaseChapter")
    local rewardId = data.chapter_reward_stage
    if data and rewardId then
      uis.Main.RewardBtn.onClick:Set(function()
        OpenWindow(WinResConfig.TowerRewardWindow.name)
      end)
      local red = uis.Main.RewardBtn:GetChild("Red")
      if red then
        if nextChapterId > screenInfo.rewardedChapter then
          if rewardId < screenInfo.currentStage or 0 == screenInfo.currentStage then
            red.visible = true
          else
            red.visible = false
          end
        else
          red.visible = false
        end
      end
    end
  end
end

function TowerListWindow.OnShown()
  if uis then
    TowerListWindow.InitChapterReward()
  end
end

function TowerListWindow.OnClose()
  uis = nil
  contentPane = nil
  info = nil
  mapState = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
end

return TowerListWindow
