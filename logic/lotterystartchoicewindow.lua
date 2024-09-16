require("Lottery_StartChoiceWindowByName")
local LotteryStartChoiceWindow = {}
local uis, contentPane, data, curIndex, tween
local cardTran = {}
local cardBtn = {}
local deatailsButton = {}
local deatailsTran = {}
local w, h = 288, 448
local dw = 48

function LotteryStartChoiceWindow.ReInitData()
end

function LotteryStartChoiceWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.LotteryStartChoiceWindow.package, WinResConfig.LotteryStartChoiceWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetLottery_StartChoiceWindowUis(contentPane)
    data = bridgeObj.argTable[1]
    LotteryStartChoiceWindow.UpdateInfo()
    LotteryStartChoiceWindow.InitBtn()
  end)
end

function LotteryStartChoiceWindow.UpdateInfo()
  if data then
    curIndex = nil
    uis.Main.Word.WordTxt.text = T(1456, data.max)
    uis.Main.Lock.WordTxt.text = T(1457, data.count, data.max)
    if data.count >= data.max then
      ChangeController(uis.Main.c1Ctr, 1)
      UIUtil.SetText(uis.Main.SureBtn, T(1458))
      uis.Main.SureBtn.onClick:Set(function()
        if nil == curIndex or nil == data.cardIds[curIndex] then
          return
        end
        LotteryService.GetGachaExtraReq(data.cardIds[curIndex], data.id)
      end)
    else
      ChangeController(uis.Main.c1Ctr, 0)
    end
    local effect = UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Startrecruiting/FX_ui_startrecruiting.prefab", uis.Main.EffectHolder)
    cardTran = {}
    cardBtn = {}
    deatailsButton = {}
    deatailsTran = {}
    for i = 1, 4 do
      cardBtn[i] = LotteryStartChoiceWindow.CreateBtn(w, h)
      deatailsButton[i] = LotteryStartChoiceWindow.CreateBtn(dw, dw)
    end
    LotteryStartChoiceWindow.UpdateBtnPos(effect)
  end
end

function LotteryStartChoiceWindow.UpdateBtnPos(effect)
  for i = 1, 4 do
    cardTran[i] = LuaUtil.FindChild(effect.transform, string.format("card%d_c", i), true)
    cardBtn[i].displayObject.cachedTransform.position = cardTran[i].position
    local pos = cardBtn[i].displayObject.cachedTransform.localPosition
    cardBtn[i].displayObject.cachedTransform.localPosition = Vector3(pos.x - w / 2, pos.y + h / 2, pos.z)
    cardBtn[i].onClick:Set(function()
      if 0 == uis.Main.c1Ctr.selectedIndex then
        FloatTipsUtil.ShowWarnTips(T(1464, data.max - data.count))
        return
      end
      LuaUtil.PlayAnimator(cardTran[i].gameObject, string.format("FX_ui_startrecruiting_card%d_choose", i))
      if curIndex then
        LuaUtil.PlayAnimator(cardTran[curIndex].gameObject, string.format("FX_ui_startrecruiting_card%d_back", curIndex))
      end
      curIndex = i
      if tween then
        LeanTween.cancel(tween.uniqueId)
        tween = nil
      end
      tween = LeanTween.delayedCall(0.2, function()
        if uis then
          LotteryStartChoiceWindow.UpdateBtnPos(effect)
        end
        tween = nil
      end)
    end)
    deatailsTran[i] = LuaUtil.FindChild(cardTran[i], "DeatailsButton", true)
    deatailsButton[i].displayObject.cachedTransform.position = deatailsTran[i].position
    local pos = deatailsButton[i].displayObject.cachedTransform.localPosition
    deatailsButton[i].displayObject.cachedTransform.localPosition = Vector3(pos.x - dw / 2, pos.y + dw / 2, pos.z)
    deatailsButton[i].onClick:Set(function()
      print(data.cardIds[i], ">>>>>>>>>>>>>>>")
      if curIndex and curIndex ~= i then
        cardBtn[i].onClick:Call()
      else
        UIUtil.OpenPreviewTips(data.cardIds[i], ProtoEnum.TUPLE_TYPE.CARD)
      end
    end)
  end
end

function LotteryStartChoiceWindow.CreateBtn(wv, hv)
  local cardBtn = UIMgr:CreateObject("CommonResource", "TouchScreenBtn")
  cardBtn:SetPivot(0.5, 0.5)
  cardBtn:SetSize(wv, hv)
  uis.Main.root:AddChild(cardBtn)
  return cardBtn
end

function LotteryStartChoiceWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.LotteryStartChoiceWindow.name)
end

function LotteryStartChoiceWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(LotteryStartChoiceWindow.CloseWindow)
  uis.Main.ReturnBtn.onClick:Set(LotteryStartChoiceWindow.CloseWindow)
end

function LotteryStartChoiceWindow.OnShown()
  if uis then
    curIndex = nil
  end
end

function LotteryStartChoiceWindow.OnClose()
  uis = nil
  contentPane = nil
  data = nil
  curIndex = nil
  cardTran = nil
  cardBtn = nil
  deatailsButton = nil
  deatailsTran = nil
end

return LotteryStartChoiceWindow
