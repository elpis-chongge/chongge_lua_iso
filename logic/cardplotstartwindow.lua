require("Abyss_CardPlotStartWindowByName")
local CardPlotStartWindow = {}
local uis, contentPane, branch, tweenId
local CloseWindow = function()
  if tweenId then
    LeanTween.cancel(tweenId)
  end
  tweenId = nil
  if branch then
    AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.BRANCH_START_ACK, branch.eventId)
  end
  branch = nil
  UIMgr:CloseWindow(WinResConfig.CardPlotStartWindow.name)
end

function CardPlotStartWindow.ReInitData()
end

function CardPlotStartWindow.OnInit(bridgeObj)
  bridgeObj:SetView(WinResConfig.CardPlotStartWindow.package, WinResConfig.CardPlotStartWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetAbyss_CardPlotStartWindowUis(contentPane)
    branch = bridgeObj.argTable[1]
    CardPlotStartWindow.UpdateInfo()
    CardPlotStartWindow.InitBtn()
  end)
end

function CardPlotStartWindow.UpdateInfo()
  if tweenId then
    LeanTween.cancel(tweenId)
  end
  if branch then
    local conf = TableData.GetConfig(branch.nextPlotNodeId, "BaseManorNode")
    local path = conf.title_effect
    local eff = ResourceManager.Instantiate(path)
    local duration = EffectUtil.PlayTimeLineByName(eff, "timeline")
    tweenId = LeanTween.delayedCall(duration, CloseWindow).id
    UIUtil.SetObjectToUI(eff, uis.Main.CardTitleShow.TitleHolder)
  end
end

function CardPlotStartWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(CloseWindow)
end

function CardPlotStartWindow.OnClose()
  uis = nil
  contentPane = nil
  branch = nil
  if tweenId then
    LeanTween.cancel(tweenId)
  end
  tweenId = nil
end

return CardPlotStartWindow
