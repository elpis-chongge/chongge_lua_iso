require("ActivityDungeon1002_MaterialWindowByName")
local Activity3MaterialWindow = {}
local uis, contentPane, activityInfo, maxCount, posX

function Activity3MaterialWindow.ReInitData()
end

function Activity3MaterialWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity3MaterialWindow.package, WinResConfig.Activity3MaterialWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1002_MaterialWindowUis(contentPane)
    posX = bridgeObj.argTable[1]
    Activity3MaterialWindow.UpdateInfo()
    Activity3MaterialWindow.InitBtn()
    ActivityDungeonMgr.SaveDay()
  end)
end

function Activity3MaterialWindow.UpdateInfo()
  activityInfo = ActivityDungeonData.GetActivityInfo()
  maxCount = Activity3MaterialWindow.GetMaxCount()
  if activityInfo then
    local id = Activity3MaterialWindow.GetChapter()
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
        uis.Main.BattleNumber.NumberTxt.text = T(1642, activityInfo.creamCount, maxCount)
        if posX then
          uis.Main.BattleList.scrollPane.posX = posX
          posX = nil
        end
      end
    end
  end
end

function Activity3MaterialWindow.GetChapter()
  for i, v in pairs(activityInfo.creamChapter) do
    return i
  end
end

function Activity3MaterialWindow.GetMaxCount()
  local configData = ActivityDungeonData.GetActivityData()
  if configData and configData.cream_chapter_ids then
    local arr = Split(configData.cream_chapter_ids, ":")
    if 3 == #arr then
      return tonumber(arr[3])
    end
  end
  return 0
end

function Activity3MaterialWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(Activity3MaterialWindow.CloseWindow)
end

function Activity3MaterialWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.Activity3MaterialWindow.name)
end

function Activity3MaterialWindow.OnShown()
  if uis then
    Activity3MaterialWindow.UpdateInfo()
  end
end

function Activity3MaterialWindow.OnClose()
  uis = nil
  contentPane = nil
  activityInfo = nil
end

return Activity3MaterialWindow
