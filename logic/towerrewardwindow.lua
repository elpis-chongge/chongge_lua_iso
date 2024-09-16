require("Tower_TowerRewardWindowByName")
local TowerRewardWindow = {}
local uis, contentPane

function TowerRewardWindow.ReInitData()
end

function TowerRewardWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.TowerRewardWindow.package, WinResConfig.TowerRewardWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetTower_TowerRewardWindowUis(contentPane)
    TowerRewardWindow.InitBtn()
    TowerRewardWindow.Init()
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.REWARD_TIPS_ON)
  end)
end

function TowerRewardWindow.Init()
  local screenInfo = AdventureData.GetSceneData(ProtoEnum.SCENE_TYPE.CLIMB_TOWER)
  if screenInfo then
    local nextChapterId = AdventureMgr.GetTowerNextChapterId(screenInfo.rewardedChapter)
    nextChapterId = nextChapterId >= screenInfo.currentChapter and screenInfo.currentChapter or nextChapterId
    TowerRewardWindow.UpdateInfo(nextChapterId)
  end
end

function TowerRewardWindow.GetName(chapterId)
  local map = TableData.GetTable("BaseTowerMap")
  for i, v in pairs(map) do
    if table.contain(v.chapter_id, chapterId) then
      return v.name1()
    end
  end
  return ""
end

function TowerRewardWindow.UpdateInfo(chapterId)
  local chapterData = TableData.GetConfig(chapterId, "BaseChapter")
  if chapterData then
    local tips = uis.Main.RewardTips
    tips.NameTxt.text = TowerRewardWindow.GetName(chapterId)
    if chapterData.rate_name then
      tips.Name1Txt.text = T(1328, chapterData.rate_name())
      tips.WordTxt.text = T(1329, chapterData.rate_name())
      tips.Lock.WordTxt.text = T(1331, chapterData.rate_name())
    end
    tips.RewardTxt.text = T(1330)
    UIUtil.SetText(tips.GetBtn, T(1174))
    tips.Complete.WordTxt.text = T(1175)
    local arr = GetConfigItemList(chapterData.chapter_reward, true)
    
    function tips.ItemList.itemRenderer(i, item)
      UIUtil.ShowItemFrame(arr[i + 1].id, item, arr[i + 1].value, nil, function()
        UIUtil.CommonItemClickCallback(arr[i + 1].id, arr[i + 1].type)
      end)
    end
    
    tips.ItemList.numItems = #arr
    local screenInfo = AdventureData.GetSceneData(ProtoEnum.SCENE_TYPE.CLIMB_TOWER)
    if screenInfo then
      if chapterId > screenInfo.rewardedChapter then
        local rewardId = chapterData.chapter_reward_stage
        if rewardId < screenInfo.currentStage or 0 == screenInfo.currentStage then
          ChangeController(tips.c1Ctr, 1)
        else
          ChangeController(tips.c1Ctr, 0)
        end
      else
        ChangeController(tips.c1Ctr, 2)
      end
    end
    tips.GetBtn.onClick:Set(function()
      AdventureService.FetchSceneChapterRewardReq(chapterId, chapterData.type, function()
        TowerRewardWindow.Init()
        RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ADVENTURE)
      end)
    end)
  end
end

function TowerRewardWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.REWARD_TIPS_OFF)
    UIMgr:CloseWindow(WinResConfig.TowerRewardWindow.name)
  end)
end

function TowerRewardWindow.OnClose()
  uis = nil
  contentPane = nil
end

return TowerRewardWindow
