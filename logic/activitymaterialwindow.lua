require("ActivityDungeon1_MaterialWindowByName")
local ActivityMaterialWindow = {}
local uis, contentPane, activityInfo, maxCount, posX

function ActivityMaterialWindow.ReInitData()
end

function ActivityMaterialWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ActivityMaterialWindow.package, WinResConfig.ActivityMaterialWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1_MaterialWindowUis(contentPane)
    posX = bridgeObj.argTable[1]
    ActivityMaterialWindow.UpdateInfo()
    ActivityMaterialWindow.InitBtn()
    ActivityDungeonMgr.SaveDay()
  end)
end

function ActivityMaterialWindow.UpdateInfo()
  activityInfo = ActivityDungeonData.GetActivityInfo()
  maxCount = ActivityMaterialWindow.GetMaxCount()
  if activityInfo then
    local id = ActivityMaterialWindow.GetChapter()
    if id then
      local chapterData = TableData.GetConfig(id, "BaseChapter")
      if chapterData then
        uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(chapterData.back_ground)
        
        function uis.Main.BattleList.itemRenderer(i, item)
          local battle = item:GetChild("Battle")
          local stageData = TableData.GetConfig(chapterData.stages[i + 1], "BaseStage")
          if stageData then
            UIUtil.SetText(battle, stageData.name(), "WordTxt")
            battle:GetChild("PicLoader").url = UIUtil.GetResUrl(stageData.icon)
            item.onClick:Set(function()
              if activityInfo.creamCount < 1 then
                FloatTipsUtil.ShowWarnTips(T(1536))
                return
              end
              UIMgr:SetWindowArgs(WinResConfig.ActivityMaterialWindow.name, {
                uis.Main.BattleList.scrollPane.posX
              })
              if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.STAGE_INFO_WINDOW, false) == true then
                OpenWindow(WinResConfig.DungeonInfoWindow.name, nil, {
                  stageId = stageData.id
                })
              else
                ld("Formation", function()
                  local params = {
                    sceneType = ProtoEnum.SCENE_TYPE.ACTIVITY_CREAM,
                    stageId = stageData.id
                  }
                  FormationMgr.TryOpenFormationWindow(params)
                end)
              end
            end)
          end
        end
        
        uis.Main.BattleList.numItems = #chapterData.stages
        uis.Main.BattleNumber.NumberTxt.text = T(1534, activityInfo.creamCount, maxCount)
        if posX then
          uis.Main.BattleList.scrollPane.posX = posX
          posX = nil
        end
      end
    end
  end
end

function ActivityMaterialWindow.GetChapter()
  for i, v in pairs(activityInfo.creamChapter) do
    return i
  end
end

function ActivityMaterialWindow.GetMaxCount()
  local configData = ActivityDungeonData.GetActivityData()
  if configData and configData.cream_chapter_ids then
    local arr = Split(configData.cream_chapter_ids, ":")
    if 3 == #arr then
      return tonumber(arr[3])
    end
  end
  return 0
end

function ActivityMaterialWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(ActivityMaterialWindow.CloseWindow)
end

function ActivityMaterialWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.ActivityMaterialWindow.name)
end

function ActivityMaterialWindow.OnShown()
  if uis then
    ActivityMaterialWindow.UpdateInfo()
  end
end

function ActivityMaterialWindow.OnClose()
  uis = nil
  contentPane = nil
  activityInfo = nil
end

return ActivityMaterialWindow
