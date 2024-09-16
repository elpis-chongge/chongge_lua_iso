require("Abyss_QBSwitchWindowByName")
local QBSwitchWindow = {}
local uis, contentPane

function QBSwitchWindow.ReInitData()
end

function QBSwitchWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.QBSwitchWindow.package, WinResConfig.QBSwitchWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetAbyss_QBSwitchWindowUis(contentPane)
    QBSwitchWindow.UpdateInfo()
    QBSwitchWindow.InitBtn()
  end)
end

local GetCardIdWithFashionId = function(fashionId)
  local cardId = TableData.GetConfig(fashionId, "BaseFashion").card_id
  return cardId
end

function QBSwitchWindow.UpdateInfo()
  local headlist = uis.Main.HeadList
  headlist:SetVirtual()
  local cards = CardData.GetSortCardList()
  local selectedCardId = GetCardIdWithFashionId(AbyssExploreChrCtrl.GetFashionId())
  for i, v in ipairs(cards) do
    if selectedCardId == v.cardId then
      local removed = table.remove(cards, i)
      table.insert(cards, 1, removed)
      break
    end
  end
  
  function headlist.itemRenderer(i, item)
    local cardData = cards[i + 1]
    local id = cardData.cardId
    local configData, _ = CardData.GetBaseConfig(id)
    local btn = item:GetChild("CardHeadBtn")
    local cardPic = btn:GetChild("CardHeadPic")
    local nameTxt = btn:GetChild("CardNameTxt")
    nameTxt.text = TableData.GetConfig(id, "BaseCard").name()
    local fashionId = 0 == cardData.fashionId and configData.fashion_id or cardData.fashionId
    if cardPic then
      UIUtil.SetHeadByFaceId(fashionId, cardPic:GetChild("CardLoader"), HEAD_ICON_TYPE_ENUM.RECT)
    end
    ChangeUIController(btn, nil, configData.star - 1)
    ChangeUIController(btn, "button", id == GetCardIdWithFashionId(AbyssExploreChrCtrl.GetFashionId()) and 1 or 0)
    btn.onClick:Set(function()
      if GetCardIdWithFashionId(AbyssExploreChrCtrl.GetFashionId()) == id then
        return
      end
      PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.ABYSS_EXPLORE_DEFAULT_CHR, id)
      AbyssExploreChrCtrl.ChangeCharacter(fashionId)
      headlist:RefreshVirtualList()
    end)
  end
  
  headlist.defaultItem = UIUtil.GetResUrl("Abyss:QBHead")
  local cardsData = CardData.GetSortCardList()
  headlist.numItems = #cardsData
end

function QBSwitchWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.QBSwitchWindow.name)
  end)
end

function QBSwitchWindow.OnClose()
  uis = nil
  contentPane = nil
end

return QBSwitchWindow
