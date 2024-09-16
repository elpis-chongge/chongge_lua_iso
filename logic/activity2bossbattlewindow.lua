require("ActivityDungeon1001_BossBattleWindowByName")
local Activity2BossBattleWindow = {}
local uis, contentPane, activityInfo

function Activity2BossBattleWindow.ReInitData()
end

function Activity2BossBattleWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity2BossBattleWindow.package, WinResConfig.Activity2BossBattleWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1001_BossBattleWindowUis(contentPane)
    Activity2BossBattleWindow.UpdateInfo()
    Activity2BossBattleWindow.InitBtn()
  end)
end

function Activity2BossBattleWindow.UpdateInfo()
  activityInfo = ActivityDungeonData.GetActivityInfo()
  if activityInfo then
    uis.Main.Info.WordTxt.WordTxt.text = T(1527)
    uis.Main.Info.WordTxt.TimeTxt.text = TimeUtil.FormatEnTime(activityInfo.baseInfo.endStamp - LoginData.GetCurServerTime())
    uis.Main.Info.NameTxt.text = T(1537)
    local chapterId = Activity2BossBattleWindow.GetChapter()
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
            UIUtil.SetText(tips, T(1538), "NumberWordTxt")
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
                  UIUtil.SetText(tips, lockShow and Activity2BossBattleWindow.FormatRemainTime(time) or "", "LockTxt")
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

function Activity2BossBattleWindow.FormatRemainTime(time)
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

function Activity2BossBattleWindow.GetChapter()
  for i, v in pairs(activityInfo.bossChapter) do
    return i
  end
end

function Activity2BossBattleWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(Activity2BossBattleWindow.CloseWindow)
end

function Activity2BossBattleWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.Activity2BossBattleWindow.name)
end

function Activity2BossBattleWindow.OnClose()
  uis = nil
  contentPane = nil
end

return Activity2BossBattleWindow
