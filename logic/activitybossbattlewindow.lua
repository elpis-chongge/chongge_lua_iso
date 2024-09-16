require("ActivityDungeon1_BossBattleWindowByName")
local ActivityBossBattleWindow = {}
local uis, contentPane, activityInfo

function ActivityBossBattleWindow.ReInitData()
end

function ActivityBossBattleWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ActivityBossBattleWindow.package, WinResConfig.ActivityBossBattleWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1_BossBattleWindowUis(contentPane)
    ActivityBossBattleWindow.UpdateInfo()
    ActivityBossBattleWindow.InitBtn()
  end)
end

function ActivityBossBattleWindow.UpdateInfo()
  activityInfo = ActivityDungeonData.GetActivityInfo()
  if activityInfo then
    uis.Main.Info.WordTxt.WordTxt.text = T(1527)
    uis.Main.Info.WordTxt.TimeTxt.text = TimeUtil.FormatEnTime(activityInfo.baseInfo.endStamp - LoginData.GetCurServerTime())
    uis.Main.Info.NameTxt.text = T(1537)
    local chapterId = ActivityBossBattleWindow.GetChapter()
    if chapterId then
      local chapterData = TableData.GetConfig(chapterId, "BaseChapter")
      if chapterData then
        uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(chapterData.back_ground)
        local curTime = LoginData.GetCurServerTime()
        local lockShow = true
        local toIndex = 0
        
        function uis.Main.BattleList.itemRenderer(i, item)
          local tips = item:GetChild("Tips")
          local stageData = TableData.GetConfig(chapterData.stages[i + 1], "BaseStage")
          if stageData then
            UIUtil.SetText(tips, stageData.name_detail and stageData.name_detail() or "", "NameTxt")
            UIUtil.SetText(tips, stageData.name(), "NumberTxt")
            local reward = tips:GetChild("Reward")
            if stageData.reward_show and stageData.reward_show[1] then
              local arr = Split(stageData.reward_show[1], ":")
              UIUtil.SetIconById(reward:GetChild("PicLoader"), tonumber(arr[3]))
            end
            local showTipsWord
            if stageData.unlock_time == nil or stageData.unlock_time then
              if stageData.unlock_time == nil or curTime >= activityInfo.baseInfo.startStamp + stageData.unlock_time then
                if nil == stageData.pre or 0 == stageData.pre or table.contain(activityInfo.finishStages, stageData.pre) then
                  if table.contain(activityInfo.finishStages, stageData.id) then
                    ChangeUIController(tips, "c1", 2)
                    showTipsWord = T(1540)
                    toIndex = i
                  else
                    ChangeUIController(tips, "c1", 1)
                  end
                else
                  local preData = TableData.GetConfig(stageData.pre, "BaseStage")
                  if preData then
                    showTipsWord = T(1542, preData.name())
                    UIUtil.SetText(tips, lockShow and showTipsWord or "", "LockTxt")
                  end
                  showTipsWord = lockShow and showTipsWord or T(1539)
                  ChangeUIController(tips, "c1", 0)
                  lockShow = nil
                end
              else
                showTipsWord = lockShow and T(1541) or T(1539)
                if stageData.unlock_time then
                  local time = activityInfo.baseInfo.startStamp + stageData.unlock_time - curTime
                  UIUtil.SetText(tips, lockShow and ActivityBossBattleWindow.FormatRemainTime(time) or "", "LockTxt")
                end
                ChangeUIController(tips, "c1", 0)
                lockShow = nil
              end
            end
            item.onClick:Set(function()
              if showTipsWord then
                FloatTipsUtil.ShowWarnTips(showTipsWord)
                return
              end
              if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.STAGE_INFO_WINDOW, false) == true then
                OpenWindow(WinResConfig.DungeonInfoWindow.name, nil, {
                  stageId = stageData.id
                })
              else
                ld("Formation", function()
                  local params = {
                    sceneType = ProtoEnum.SCENE_TYPE.ACTIVITY_BOSS,
                    stageId = stageData.id
                  }
                  FormationMgr.TryOpenFormationWindow(params)
                end)
              end
            end)
          end
        end
        
        uis.Main.BattleList.numItems = #chapterData.stages
        uis.Main.BattleList:ScrollToView(math.min(toIndex + 1, uis.Main.BattleList.numItems - 1))
      end
    end
  end
end

function ActivityBossBattleWindow.FormatRemainTime(time)
  time = math.floor(time)
  if time <= 60 then
    return T(1610, 1)
  end
  local hours, minutes
  hours = math.floor(time / 3600)
  time = time % 3600
  minutes = math.floor(time / 60)
  if hours > 0 then
    local day = math.floor(hours / 24)
    hours = hours % 24
    if 0 == day then
      return T(1609, hours)
    else
      return T(1608, day)
    end
  else
    return T(1610, math.max(minutes, 1))
  end
end

function ActivityBossBattleWindow.GetChapter()
  for i, v in pairs(activityInfo.bossChapter) do
    return i
  end
end

function ActivityBossBattleWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(ActivityBossBattleWindow.CloseWindow)
end

function ActivityBossBattleWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.ActivityBossBattleWindow.name)
end

function ActivityBossBattleWindow.OnClose()
  uis = nil
  contentPane = nil
end

return ActivityBossBattleWindow
