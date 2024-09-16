require("Abyss_CardPlotEndWindowByName")
local CardPlotEndWindow = {}
local uis, contentPane, nodeConfig

function CardPlotEndWindow.ReInitData()
end

function CardPlotEndWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.CardPlotEndWindow.package, WinResConfig.CardPlotEndWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetAbyss_CardPlotEndWindowUis(contentPane)
    nodeConfig = bridgeObj.argTable[1]
    CardPlotEndWindow.UpdateInfo()
    CardPlotEndWindow.InitBtn()
  end)
end

function CardPlotEndWindow.UpdateInfo()
  if nodeConfig then
    uis.Main.TitleTxt.text = tostring(nodeConfig.name())
    local cardId = nodeConfig.card_id()
    local cardData = CardData.GetCardDataById(cardId)
    UIUtil.SetCardShowSpineAutoAlpha(cardData.fashionId, uis.Main.CardShow.CardShowLoader, uis.Main.CardShow.CardShowHolder, true)
    local config = TableData.GetConfig(cardId, "BaseCard")
    uis.Main.CardName.NameTxt.text = config.name()
    uis.Main.CardName.SubtitleTxt.text = config.name_english()
  end
end

function CardPlotEndWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.CardPlotEndWindow.name)
  end)
end

function CardPlotEndWindow.OnClose()
  uis = nil
  contentPane = nil
end

return CardPlotEndWindow
