require("Lottery_ExchangeWindowByName")
local LotteryExchangeWindow = {}
local uis, contentPane, gachaId, tp, data, jumpTb

function LotteryExchangeWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.LotteryExchangeWindow.package, WinResConfig.LotteryExchangeWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetLottery_ExchangeWindowUis(contentPane)
    gachaId = bridgeObj.argTable[1]
    LotteryExchangeWindow.InitBtn()
    data = TableData.GetConfig(gachaId, "BaseGacha")
    LotteryExchangeWindow.UpdateText()
    LotteryExchangeWindow.InitList()
  end)
end

function LotteryExchangeWindow.GetItemName(exchange)
  local name = ""
  if string.isEmptyOrNil(exchange) then
    return name
  end
  for i, v in pairs(exchange) do
    local arr = Split(v, ":")
    if arr then
      local itemConfig = TableData.GetConfig(tonumber(arr[2]), "BaseItem")
      if itemConfig then
        if "" == name then
          name = itemConfig.name()
        else
          name = name .. " " .. itemConfig.name()
        end
      end
    end
  end
  return name
end

function LotteryExchangeWindow.UpdateText()
end

function LotteryExchangeWindow.RefreshTp()
  tp = LotteryData.GetTpById(gachaId)
  uis.Main.E_Title.TimeTxt.text = T(506, tp)
  uis.Main.E_Title.WordTxt.text = T(504, LotteryExchangeWindow.GetItemName(data.integral_exchange))
end

function LotteryExchangeWindow.GetAddAttrList(add_attr)
  local attrList = {}
  if add_attr then
    local oneAddAttr = {}
    for _, v in ipairs(add_attr) do
      local addAttr = Split(v, ":")
      if addAttr and #addAttr > 1 then
        if 5 == #addAttr then
          oneAddAttr.type = tonumber(addAttr[1])
          oneAddAttr.id = tonumber(addAttr[2])
          oneAddAttr.value = tonumber(addAttr[3])
          oneAddAttr.integral = tonumber(addAttr[4])
          oneAddAttr.max = tonumber(addAttr[5])
        end
        table.insert(attrList, oneAddAttr)
      end
    end
  end
  return attrList
end

function LotteryExchangeWindow.InitList()
  LotteryExchangeWindow.RefreshTp()
  local poolCard = LotteryExchangeWindow.GetAddAttrList(data.integral_convert)
  local tips, btn
  
  function uis.Main.ExchangeList.itemRenderer(i, item)
    local cardData = TableData.GetConfig(poolCard[i + 1].id, "BaseCard")
    if cardData then
      tips = item:GetChild("ResultTips")
      btn = item:GetChild("TpBtn")
      UIUtil.SetHeadByFaceId(cardData.fashion_id + 1, tips:GetChild("ResultTipsPic"):GetChild("PicLoader"), HEAD_ICON_TYPE_ENUM.BANNER)
      tips:GetChild("CardNameTxt").text = cardData.name()
      local quality = tips:GetChild("Quality")
      if quality then
        ChangeUIController(quality, nil, cardData.star - 1)
      end
      local occupation = tips:GetChild("Occupation")
      if occupation then
        ChangeUIController(occupation, nil, cardData.type - 1)
        ChangeUIController(occupation, "c2", 1)
      end
      local starList = tips:GetChild("StarList")
      
      function starList.itemRenderer()
      end
      
      starList.numItems = cardData.star
      local value = poolCard[i + 1].integral
      if value <= tp then
        ChangeUIController(btn, nil, 1)
        item.onClick:Set(function()
          local text = T(510, value, LotteryExchangeWindow.GetCardNameById(poolCard[i + 1].id))
          MessageBox.Show(text, {
            touchCallback = function()
              if -1 == poolCard[i + 1].max or LotteryExchangeWindow.IsExchangeMax(gachaId, poolCard[i + 1].id, poolCard[i + 1].max) then
                LotteryService.ExchangeGachaReq(poolCard[i + 1].id, gachaId)
              else
                FloatTipsUtil.ShowWarnTips(509)
              end
            end
          }, {})
        end)
      else
        item.onClick:Set(function()
          FloatTipsUtil.ShowWarnTips(T(512))
        end)
        ChangeUIController(btn, nil, 0)
      end
      UIUtil.SetBtnText(btn, T(506, value), T(507))
    end
  end
  
  uis.Main.ExchangeList.numItems = #poolCard
end

function LotteryExchangeWindow.GetCardNameById(id)
  local cardData = TableData.GetConfig(id, "BaseCard")
  if cardData then
    return cardData.name()
  end
  return ""
end

function LotteryExchangeWindow.IsExchangeMax(poolId, itemId, num)
  local n = LotteryData.GetExchangeNumById(poolId, itemId)
  return num > n
end

function LotteryExchangeWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.LotteryExchangeWindow.name, uis.Main.CurrencyReturn)
end

function LotteryExchangeWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.LotteryWindow.EXCHANGE then
    LotteryExchangeWindow.InitList()
  end
end

function LotteryExchangeWindow.OnClose()
  uis = nil
  contentPane = nil
  gachaId = nil
  data = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
end

return LotteryExchangeWindow
