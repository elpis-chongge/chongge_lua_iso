require("Abyss_CardPlotMainWindowByName")
local CardPlotMainWindow = {}
local uis, contentPane

function CardPlotMainWindow.ReInitData()
end

function CardPlotMainWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.CardPlotMainWindow.package, WinResConfig.CardPlotMainWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetAbyss_CardPlotMainWindowUis(contentPane)
    CardPlotMainWindow.UpdateInfo()
    CardPlotMainWindow.InitBtn()
  end)
end

local tipsTimer

function CardPlotMainWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(TableData.GetConfig(11301, "BaseFeature").back_ground)
  CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.CardPlotMainWindow.name, uis.Main.CurrencyReturn)
  UIUtil.SetBtnText(uis.Main.Entry1Btn, T(20065))
  UIUtil.SetBtnText(uis.Main.Entry2Btn, T(20207))
  local cnt = ActorData.GetItemCount(COMMON_ITEM_ID.ABYSS_PLOT_POINT)
  local max = TableData.GetConfig(70010807, "BaseFixed").int_value
  uis.Main.AssetsTips.NumberTxt.text = string.format("[color=#e6ff51]%s[/color]/%s", cnt, max)
  local ctr = uis.Main.AssetsTips.c2Ctr
  uis.Main.AssetsTips.Explain.WordTxt.text = T(20347)
  uis.Main.AssetsTips.root.onClick:Set(function()
    ctr.selectedIndex = 1
  end)
  ctr.onChanged:Set(function()
    if 1 == ctr.selectedIndex then
      if tipsTimer then
        tipsTimer:stop()
      end
      tipsTimer = TimerUtil.setTimeout(3, function()
        ctr.selectedIndex = 0
      end)
      tipsTimer:start()
    else
      if tipsTimer then
        tipsTimer:stop()
      end
      tipsTimer = nil
    end
  end)
  uis.Main.BackGround.root.onClick:Set(function()
    ctr.selectedIndex = 0
  end)
end

function CardPlotMainWindow.InitBtn()
  uis.Main.Entry1Btn.onClick:Set(function()
    OpenWindow(WinResConfig.CardPlotListWindow.name)
  end)
  local unlock = EnterClampUtil.WhetherToEnter(11314, false)
  local hasActivityBranches = false
  ChangeUIController(uis.Main.Entry2Btn, "lock", unlock and hasActivityBranches and 0 or 1)
  uis.Main.Entry2Btn.onClick:Set(function()
    if not EnterClampUtil.WhetherToEnter(11314, true) or hasActivityBranches then
    else
      FloatTipsUtil.ShowWarnTips(T(20056))
    end
  end)
end

function CardPlotMainWindow.OnClose()
  uis = nil
  contentPane = nil
  if tipsTimer then
    tipsTimer:stop()
  end
  tipsTimer = nil
end

return CardPlotMainWindow
