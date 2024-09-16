require("ActivityDungeon1001_PlotWindowByName")
local Activity2PlotWindow = {}
local uis, contentPane

function Activity2PlotWindow.ReInitData()
end

function Activity2PlotWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity2PlotWindow.package, WinResConfig.Activity2PlotWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1001_PlotWindowUis(contentPane)
    local storyId = bridgeObj.argTable[1]
    Activity2PlotWindow.UpdateInfo(storyId)
    Activity2PlotWindow.InitBtn()
  end)
end

function Activity2PlotWindow.UpdateInfo(storyId)
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

function Activity2PlotWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(Activity2PlotWindow.CloseWindow)
  uis.Main.ProspectBtn.onClick:Set(function()
    local data = ActivityDungeonData.GetActivityData()
    if data and data.event_id then
      AbyssExploreMgr.OpenRolePlotEventWindowExternal(data.event_id)
    end
  end)
  UIUtil.SetText(uis.Main.ProspectBtn, T(1619), "WordTxt")
  ChangeUIController(uis.Main.ProspectBtn, "lock", 1)
end

function Activity2PlotWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.Activity2PlotWindow.name)
end

function Activity2PlotWindow.OnClose()
  uis = nil
  contentPane = nil
end

return Activity2PlotWindow
