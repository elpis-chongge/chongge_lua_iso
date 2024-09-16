require("Explore_DispatchWindowByName")
local ExploreDispatchWindow = {}
local uis, contentPane, groupId, type_cardlist
local RefreshPanelInfo = function()
  local config = TableData.GetConfig(groupId, "BaseDispatchTeam")
  local job_num = config.job_num
  local cardlist = uis.Main.DispatchTips.CardList
  cardlist.numItems = #job_num
end
local CardItemRenderer = function(i, gcmp)
  local config = TableData.GetConfig(groupId, "BaseDispatchTeam")
  local index = i + 1
  local occupationType = config.job_num[index]
  ChangeUIController(gcmp, "c1", occupationType - 1)
  local cardId = ExploreAFKData.GetTempGroupCard(groupId, index)
  if type(cardId) == "number" then
    local card = gcmp:GetChild("Card")
    local cardInfo = CardData.GetCardDataById(cardId)
    UIUtil.SetHeadByFaceId(cardInfo.fashionId, card:GetChild("CardBg"):GetChild("PicLoader"), HEAD_ICON_TYPE_ENUM.RECT)
    ChangeUIController(gcmp, "c2", 1)
  else
    ChangeUIController(gcmp, "c2", 0)
  end
  local cardlist = gcmp:GetChild("CardList")
  local cardListByType = type_cardlist[index]
  
  function cardlist.itemRenderer(j, subgcmp)
    local cardInfo = cardListByType.list[j + 1]
    UIUtil.SetHeadByFaceId(cardInfo.fashionId, subgcmp:GetChild("CardBg"):GetChild("PicLoader"), HEAD_ICON_TYPE_ENUM.RECT)
    local selected = ExploreAFKMgr.IsCardSelected(groupId, cardInfo.cardId) or not ExploreAFKMgr.IsCardAvailable(cardInfo.cardId)
    ChangeUIController(subgcmp, "c1", selected and 1 or 0)
    subgcmp.onClick:Set(function()
      if ExploreAFKMgr.IsCardSelected(groupId, cardInfo.cardId) or not ExploreAFKMgr.IsCardAvailable(cardInfo.cardId) then
        return
      end
      ExploreAFKData.AddOrOverrideCardToTempGroup(groupId, cardInfo.cardId, index)
      RefreshPanelInfo()
    end)
  end
  
  cardlist.numItems = #cardListByType.list
end

function ExploreDispatchWindow.ReInitData()
end

function ExploreDispatchWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ExploreDispatchWindow.package, WinResConfig.ExploreDispatchWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    groupId = bridgeObj.argTable[1]
    uis = GetExplore_DispatchWindowUis(contentPane)
    ExploreDispatchWindow.UpdateInfo()
    ExploreDispatchWindow.InitBtn()
  end)
end

function ExploreDispatchWindow.UpdateInfo()
  local config = TableData.GetConfig(groupId, "BaseDispatchTeam")
  local job_num = config.job_num
  local cardlist = uis.Main.DispatchTips.CardList
  type_cardlist = {}
  local allCards = ActorData.GetCardList()
  for _, occupationType in ipairs(job_num) do
    local o = {
      list = {},
      occupationType = occupationType
    }
    for _, v in ipairs(allCards) do
      local cardConf = TableData.GetConfig(v.cardId, "BaseCard")
      if cardConf.type == occupationType and v.quality >= config.quality_level then
        table.insert(o.list, v)
      end
    end
    table.insert(type_cardlist, o)
  end
  cardlist.itemRenderer = CardItemRenderer
  cardlist.numItems = #job_num
  UIUtil.SetText(uis.Main.DispatchTips.ClearBtn, T(20563), "NameTxt")
  UIUtil.SetText(uis.Main.DispatchTips.SureBtn, T(20564), "NameTxt")
end

function ExploreDispatchWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.ExploreDispatchWindow.name)
  end)
  uis.Main.DispatchTips.CloseBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.ExploreDispatchWindow.name)
  end)
  uis.Main.DispatchTips.SureBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.ExploreDispatchWindow.name)
  end)
  uis.Main.DispatchTips.ClearBtn.onClick:Set(function()
    ExploreAFKData.ClearTempGroupCards(groupId)
    RefreshPanelInfo()
  end)
end

function ExploreDispatchWindow.OnClose()
  uis = nil
  contentPane = nil
  groupId = nil
end

return ExploreDispatchWindow
