require("Expedition_ExpeditionEndWindowByName")
local ExpeditionEndWindow = {}
local uis, contentPane
local DISPLAY_TYPE = {DEFAULT = 0, DETAILED = 1}
local curDisplayType, stateSnapshot
local RefreshSummeryPanel = function(displayType, playTrans)
  local numPerRow = 8
  local lists = {
    [1] = uis.Main.Card1List,
    [2] = uis.Main.Card2List,
    [3] = uis.Main.Card3List
  }
  local cardStates = stateSnapshot.cardStates
  local num = cardStates and #cardStates or 0
  for i = 1, #lists do
    local list = lists[i]
    list.defaultItem = "ui://Expedition/CardInfoAni"
    
    function list.itemRenderer(j, gcmp)
      local index = (i - 1) * numPerRow + (j + 1)
      local subItem = gcmp:GetChild("CardInfo")
      if index <= num then
        local state = cardStates[index]
        if playTrans then
          subItem.alpha = 0
          PlayUITrans(gcmp, "in", nil, index * 0.03)
        end
        local cardInfo = CardData.GetCardDataByUid(state.uid)
        UIUtil.ShowCardTips(cardInfo, subItem, nil, nil, HEAD_ICON_TYPE_ENUM.SQUARE)
        ChangeUIController(subItem, "c1", 0)
        ChangeUIController(subItem, "c2", displayType)
      else
        ChangeUIController(subItem, "c1", 1)
      end
    end
    
    list.numItems = numPerRow
  end
end

function ExpeditionEndWindow.ReInitData()
end

function ExpeditionEndWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ExpeditionEndWindow.package, WinResConfig.ExpeditionEndWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    stateSnapshot = bridgeObj.argTable[1]
    uis = GetExpedition_ExpeditionEndWindowUis(contentPane)
    ExpeditionEndWindow.UpdateInfo()
    ExpeditionEndWindow.InitBtn()
  end)
end

function ExpeditionEndWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(TableData.GetConfig(11702, "BaseFeature").back_ground)
  local chapterIndex, stageIndex = stateSnapshot.chapterIndex or -1, stateSnapshot.stageIndex or -1
  local title = T(20058)
  local chapterTitle = T(20046, chapterIndex)
  local stageTitle = T(20047, stageIndex)
  local returnBtnTitle = T(20209)
  uis.Main.CommonTitle.WordTxt.text = title
  uis.Main.EndTitle.Number1Txt.text = chapterTitle
  uis.Main.EndTitle.Number2Txt.text = stageTitle
  UIUtil.SetBtnText(uis.Main.ReturnBtn, returnBtnTitle)
  curDisplayType = DISPLAY_TYPE.DEFAULT
  RefreshSummeryPanel(curDisplayType, true)
end

function ExpeditionEndWindow.InitBtn()
  uis.Main.SwitchBtn.onClick:Set(function()
    curDisplayType = (curDisplayType + 1) % 2
    RefreshSummeryPanel(curDisplayType)
  end)
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseToWindow(WinResConfig.ExpeditionWindow.name)
  end)
end

function ExpeditionEndWindow.OnClose()
  uis = nil
  contentPane = nil
  stateSnapshot = nil
end

return ExpeditionEndWindow
