require("PlotDungeon_PlotRewardWindowByName")
local PlotRewardWindow = {}
local uis, contentPane

function PlotRewardWindow.ReInitData()
end

function PlotRewardWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.PlotRewardWindow.package, WinResConfig.PlotRewardWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetPlotDungeon_PlotRewardWindowUis(contentPane)
    PlotRewardWindow.InitBtn()
    PlotRewardWindow.Init()
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.REWARD_TIPS_ON)
  end)
end

function PlotRewardWindow.Init()
  local screenInfo = AdventureData.GetSceneData(ProtoEnum.SCENE_TYPE.MAIN_LINE)
  if screenInfo then
    local nextChapterId = AdventureMgr.GetNextRewardedChapter(screenInfo.rewardedChapter)
    nextChapterId = nextChapterId >= screenInfo.currentChapter and screenInfo.currentChapter or nextChapterId
    PlotRewardWindow.UpdateInfo(nextChapterId)
  end
end

function PlotRewardWindow.UpdateInfo(chapterId)
  if chapterId then
    local data = TableData.GetConfig(chapterId, "BaseChapter")
    local tips = uis.Main.PlotRewardTips
    tips.NumberTxt.text = data.name()
    tips.NameTxt.text = data.name_detail()
    tips.WordTxt.text = data.des()
    tips.RewardTxt.text = T(1176)
    tips.Lock.WordTxt.text = T(1177)
    UIUtil.SetText(tips.GetBtn, T(1174))
    tips.Complete.WordTxt.text = T(1175)
    local arr = GetConfigItemList(data.chapter_reward, true)
    
    function tips.ItemList.itemRenderer(i, item)
      UIUtil.ShowItemFrame(arr[i + 1].id, item, arr[i + 1].value, nil, function()
        UIUtil.CommonItemClickCallback(arr[i + 1].id, arr[i + 1].type)
      end)
    end
    
    tips.ItemList.numItems = #arr
    local screenInfo = AdventureData.GetSceneData(ProtoEnum.SCENE_TYPE.MAIN_LINE)
    if screenInfo then
      if chapterId > screenInfo.rewardedChapter then
        if AdventureData.IsStagePassed(data.chapter_reward_stage) then
          ChangeController(tips.c1Ctr, 1)
        else
          ChangeController(tips.c1Ctr, 0)
        end
      else
        ChangeController(tips.c1Ctr, 2)
      end
    end
    tips.GetBtn.onClick:Set(function()
      AdventureService.FetchSceneChapterRewardReq(chapterId, data.type, function()
        UIMgr:SendWindowMessage(WinResConfig.PlotDungeonWindow.name, WindowMsgEnum.Adventure.UPADTE_CHAPTER_ICON)
        PlotRewardWindow.Init()
        RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ADVENTURE)
      end)
    end)
  end
end

function PlotRewardWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.REWARD_TIPS_OFF)
    UIMgr:CloseWindow(WinResConfig.PlotRewardWindow.name)
  end)
end

function PlotRewardWindow.OnClose()
  uis = nil
  contentPane = nil
end

return PlotRewardWindow
