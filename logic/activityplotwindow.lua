require("ActivityDungeon1_PlotWindowByName")
local ActivityPlotWindow = {}
local uis, contentPane

function ActivityPlotWindow.ReInitData()
end

function ActivityPlotWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ActivityPlotWindow.package, WinResConfig.ActivityPlotWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1_PlotWindowUis(contentPane)
    local storyId = bridgeObj.argTable[1]
    ActivityPlotWindow.UpdateInfo(storyId)
    ActivityPlotWindow.InitBtn()
  end)
end

function ActivityPlotWindow.UpdateInfo(storyId)
  uis.Main.Word.WordTxt.text = T(1531)
  local data = ActivityDungeonData.GetActivityData()
  if data and storyId then
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(data.bg_story)
    local list = uis.Main.PlotList
    
    function list.itemRenderer(i, item)
      local tips = item:GetChild("Tips")
      local data = TableData.GetConfig(storyId[i + 1], "BaseStory")
      if data then
        UIUtil.SetText(tips, data.name(), "TitleTxt")
        UIUtil.SetText(tips, data.name_detail(), "WordTxt")
        tips.onClick:Set(function()
          ld("PlotPlay", function()
            LoginData.SetTimeScale(1)
            PlotPlayMgr.PlayFixedPlots(data.story_ids)
          end)
        end)
        ChangeUIController(tips, "c1", 0)
      end
    end
    
    list.numItems = #storyId
  end
end

function ActivityPlotWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(ActivityPlotWindow.CloseWindow)
  uis.Main.ProspectBtn.onClick:Set(function()
    local data = ActivityDungeonData.GetActivityData()
    if data and data.event_id then
      AbyssExploreMgr.OpenRolePlotEventWindowExternal(data.event_id)
    end
  end)
  UIUtil.SetText(uis.Main.ProspectBtn, T(1619), "WordTxt")
  ChangeUIController(uis.Main.ProspectBtn, "lock", 1)
end

function ActivityPlotWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.ActivityPlotWindow.name)
end

function ActivityPlotWindow.OnClose()
  uis = nil
  contentPane = nil
end

return ActivityPlotWindow
